#!/usr/bin/env python3
"""Cut the pack's one-color apparel art into web-ready brand marks.

The source is a single image with two marks side by side on a white
background (shield on the left, chest/pocket mark on the right), as exported
from the shirt artwork. For each mark this writes a transparent PNG in the
art's own ink color and a white version for dark backgrounds, plus a favicon.

Usage:  script/make-brand-marks.py SOURCE.png [assets/images/brand]
Needs:  Pillow  (pip install pillow)
"""
import sys
from pathlib import Path

from PIL import Image, ImageChops

MAX_SIDE = 1000   # longest side of the exported marks, in pixels
PADDING = 12      # transparent margin kept around each mark
PAPER = 235       # lightness at or above this is background
INK = 70          # lightness at or below this is solid ink


def ink_alpha(img):
    """Alpha mask: opaque where the art is dark, clear where it is paper."""
    gray = img.convert("L")
    return gray.point(lambda v: 255 if v <= INK else 0 if v >= PAPER else round(255 * (PAPER - v) / (PAPER - INK)))


def ink_color(img, alpha):
    """Average color of the solidly inked pixels."""
    solid = alpha.point(lambda a: 255 if a == 255 else 0)
    r, g, b = (ImageChops.multiply(band, solid) for band in img.convert("RGB").split())
    count = sum(solid.histogram()[255:]) or 1
    return tuple(round(sum(i * n for i, n in enumerate(band.histogram())) / count) for band in (r, g, b))


def split_marks(alpha):
    """Bounding boxes of the left and right marks, split at the widest blank gap."""
    width, height = alpha.size
    columns = alpha.resize((width, 1), Image.BOX).load()
    inked = [columns[x, 0] > 0 for x in range(width)]
    first, last = inked.index(True), width - 1 - inked[::-1].index(True)
    best_start, best_len, run_start = first, 0, None
    for x in range(first, last + 1):
        if not inked[x]:
            run_start = x if run_start is None else run_start
            if x - run_start + 1 > best_len:
                best_start, best_len = run_start, x - run_start + 1
        else:
            run_start = None
    cut = best_start + best_len // 2
    boxes = []
    for left, right in ((0, cut), (cut, width)):
        x0, y0, x1, y1 = alpha.crop((left, 0, right, height)).getbbox()
        boxes.append((x0 + left, y0, x1 + left, y1))
    return boxes


def export(alpha, box, color, path):
    mark = alpha.crop(box)
    scale = min(1.0, MAX_SIDE / max(mark.size))
    if scale < 1.0:
        mark = mark.resize((round(mark.width * scale), round(mark.height * scale)), Image.LANCZOS)
    canvas = Image.new("RGBA", (mark.width + 2 * PADDING, mark.height + 2 * PADDING), color + (0,))
    canvas.paste(Image.new("RGBA", mark.size, color + (255,)), (PADDING, PADDING), mark)
    canvas.save(path, optimize=True)
    return canvas


def main():
    if len(sys.argv) < 2:
        sys.exit(__doc__)
    source = Image.open(sys.argv[1])
    out = Path(sys.argv[2] if len(sys.argv) > 2 else "assets/images/brand")
    out.mkdir(parents=True, exist_ok=True)

    alpha = ink_alpha(source)
    color = ink_color(source, alpha)
    shield_box, mark_box = split_marks(alpha)

    for name, box in (("shield", shield_box), ("mark", mark_box)):
        export(alpha, box, color, out / f"{name}.png")
        export(alpha, box, (255, 255, 255), out / f"{name}-white.png")

    icon = export(alpha, shield_box, color, out / "favicon.png")
    square = Image.new("RGBA", (max(icon.size),) * 2, (0, 0, 0, 0))
    square.paste(icon, ((square.width - icon.width) // 2, (square.height - icon.height) // 2))
    square.resize((192, 192), Image.LANCZOS).save(out / "favicon.png", optimize=True)

    print(f"ink color #{color[0]:02x}{color[1]:02x}{color[2]:02x}; shield {shield_box}; mark {mark_box}; wrote {out}/")


if __name__ == "__main__":
    main()
