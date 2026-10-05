---
layout: default
title: About
permalink: /about/
---
<div class="grid items-center gap-12 p-12 mt-10 bg-white md:grid-cols-2">
    <div>
        <h2 class="text-2xl font-bold text-cub-blue">Why We Exist</h2>
        <p class="mt-4 text-lg leading-7">
            Pack {{ site.pack.number }} exists to build character in young people. In a world of screens and structured activities, Cub
            Scouting offers something different: authentic adventures where children discover their capabilities,
            connect with nature, and develop the values that shape good citizens and future leaders.
        </p>
        <p class="mt-4 text-lg leading-7">
            Our mission is to prepare young people to make ethical and moral choices over their lifetimes by instilling
            in them the values of the Scout Oath and Law, fostering a sense of community and service, and creating
            opportunities for growth through age-appropriate challenges and achievements.
        </p>
    </div>

    <div>
        <img src="{{ '/assets/images/placeholders/about.svg' | relative_url }}" alt=""
            class="object-cover w-full h-80 rounded-xl" loading="lazy" decoding="async">
    </div>
</div>

<div class="max-w-4xl px-8 py-10 mx-auto mt-12 text-white shadow-lg rounded-3xl bg-scout-blue">
  <h2 class="m-0 text-3xl font-extrabold tracking-tight text-center text-cub-gold">
    About Pack {{ site.pack.number }}
  </h2>

  <div class="flex flex-wrap items-center gap-8 mt-6 md:flex-nowrap">
  <img src="{{ '/assets/images/brand/shield-white.png' | relative_url }}" alt="Pack {{ site.pack.number }} shield"
       class="w-auto h-56 mx-auto shrink-0" loading="lazy" decoding="async" />
  <div class="space-y-4 text-base leading-7 md:text-lg md:leading-8">
    <p>
      Pack {{ site.pack.number }} is chartered by {{ site.pack.chartered_org }} in {{ site.pack.neighborhood }} and belongs to the
      {{ site.pack.district }} of the {{ site.pack.council }}. We serve boys and girls from kindergarten
      through 5th grade in six dens: Lions, Tigers, Wolves, Bears, Webelos, and Arrow of Light.
    </p>
    <p>
      The pack is run entirely by parent volunteers. The committee meets on the first Sunday of the month at
      St. Mary's to plan the program, and every parent is welcome at the table.
    </p>
    <p>
      Cost should never keep a child out of Scouting. Financial assistance is available for dues, uniforms, and
      activities — just ask any leader.
    </p>
  </div>
  </div>
  <div class="flex">
    <a href="{{ '/join/' | relative_url }}"
        class="px-6 py-3 mx-auto mt-5 font-bold transition bg-yellow-400 rounded-xl text-cub-blue hover:bg-yellow-300">
        Join Pack {{ site.pack.number }}
    </a>
  </div>
</div>

<div class="mt-16">
    <h2 class="text-2xl font-bold text-cub-blue">Scout Law</h2>
    <p class="mt-4 text-lg">These are the principles we teach our scouts. We hope they all grow up to be:</p>

    <div class="grid gap-2 mt-6 text-center sm:grid-cols-2 lg:grid-cols-3">
        {% assign scout_law = "Trustworthy,Loyal,Helpful,Friendly,Courteous,Kind,Obedient,Cheerful,Thrifty,Brave,Clean,Reverent" | split: "," %}
        {% for point in scout_law %}
        <div class="bg-slate-50 rounded-xl">
            <h3 class="text-xl font-bold text-gray-800/70">{{ point }}</h3>
        </div>
        {% endfor %}
    </div>
</div>

<div class="mt-16">
    <div class="grid gap-12 px-8 bg-white md:grid-cols-2">
        <div>
            <h2 class="text-2xl font-bold text-cub-blue">Cub Scout Motto & Slogan</h2>
            <div class="p-6 mt-4 rounded-xl">
                <h3 class="text-xl font-bold text-cub-gold">Our Motto: "Do Your Best"</h3>
                <p class="mt-2">
                    These three simple words guide everything we do in Cub Scouting. We don't expect perfection—we
                    encourage each Scout to set their own personal goals and then give 100% effort toward achieving
                    them.
                </p>
            </div>

            <div class="p-6 mt-6 rounded-xl">
                <h3 class="text-xl font-bold text-cub-blue">Our Slogan: "Do a Good Turn Daily"</h3>
                <p class="mt-2">
                    This reminds Scouts to do at least one act of service each day, developing the habit of thinking
                    about others first and creating a lifetime pattern of service and citizenship.
                </p>
            </div>
        </div>

        <div>
            <h2 class="text-2xl font-bold text-cub-blue">The Outdoor Code</h2>
            <div class="p-6 mt-4 rounded-xl">
                <p class="italic">As an American, I will do my best to —</p>
                <ul class="mt-4 space-y-2">
                    <li><span class="font-semibold">Be clean in my outdoor manners.</span> A Cub Scout takes care of the
                        outdoors and keeps it clean.</li>
                    <li><span class="font-semibold">Be careful with fire.</span> A Cub Scout may enjoy a campfire only
                        with adult leaders and knows not to play with matches.</li>
                    <li><span class="font-semibold">Be considerate in the outdoors.</span> A Cub Scout shares outdoor
                        places and treats everything with respect.</li>
                    <li><span class="font-semibold">Be conservation-minded.</span> A Cub Scout works to restore the
                        health of the land for others to enjoy.</li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="px-16 py-4 pt-8 mt-16 bg-white">
    <h2 class="text-2xl font-bold text-cub-blue">Join Our Adventure</h2>
    <p class="mt-4 text-lg leading-7">
        Pack {{ site.pack.number }} welcomes all children in kindergarten through fifth grade. Our volunteer-led program provides
        age-appropriate activities that build character, foster citizenship, and develop physical and mental fitness—all
        while having fun and making memories that last a lifetime.
    </p>
    <div class="mt-6">
        <a href="{{ '/join/' | relative_url }}"
            class="inline-flex items-center px-6 py-3 font-bold transition bg-yellow-400 rounded-xl text-cub-blue hover:bg-yellow-300">
            Join Pack {{ site.pack.number }}
        </a>
        <a href="mailto:{{ site.email }}"
            class="inline-flex items-center px-6 py-3 ml-4 font-bold text-white transition rounded-xl bg-slate-900 hover:bg-slate-800">
            Contact Us
        </a>
    </div>
</div>
