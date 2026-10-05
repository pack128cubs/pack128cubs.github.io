#!/usr/bin/env bash
# Shrinks the photos in a built site so originals can stay full-size in the repo.
# Usage: script/optimize-images.sh [_site/assets/images]
#
# - JPEGs: at most 1600px on the long side (1920px for hero*.jpg), recompressed
# - PNGs under leaders/: 256px avatars; other PNGs: at most 1024px
# - metadata (including GPS location) is stripped from everything

set -euo pipefail

IMAGE_DIR="${1:-_site/assets/images}"

if [[ ! -d "$IMAGE_DIR" ]]; then
  echo "Image directory not found: $IMAGE_DIR" >&2
  exit 1
fi

if command -v magick >/dev/null 2>&1; then
  MAGICK=(magick)
elif command -v convert >/dev/null 2>&1; then
  MAGICK=(convert)
else
  echo "ImageMagick is required to optimize images." >&2
  exit 1
fi

optimize_jpg() {
  local path="$1" max_dim=1600 tmp
  [[ "$(basename "$path")" == hero* ]] && max_dim=1920
  tmp="$(mktemp "${TMPDIR:-/tmp}/pack-image.XXXXXX").jpg"

  "${MAGICK[@]}" "$path" \
    -auto-orient \
    -strip \
    -resize "${max_dim}x${max_dim}>" \
    -sampling-factor 4:2:0 \
    -interlace Plane \
    -quality 78 \
    "$tmp"

  mv "$tmp" "$path"
}

optimize_png() {
  local path="$1" max_dim=1024 tmp
  [[ "$path" == */leaders/* ]] && max_dim=256
  tmp="$(mktemp "${TMPDIR:-/tmp}/pack-image.XXXXXX").png"

  "${MAGICK[@]}" "$path" \
    -auto-orient \
    -strip \
    -resize "${max_dim}x${max_dim}>" \
    -define png:compression-level=9 \
    "$tmp"

  mv "$tmp" "$path"
}

while IFS= read -r -d '' file; do
  case "${file##*.}" in
    jpg|jpeg|JPG|JPEG) optimize_jpg "$file" ;;
    png|PNG)           optimize_png "$file" ;;
  esac
done < <(find "$IMAGE_DIR" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' \) -print0)
