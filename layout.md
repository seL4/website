<!--
    Copyright 2025 Proofcraft Pty Ltd
    SPDX-License-Identifier: CC-BY-SA-4.0
-->

# Layout components

## Main layouts

- `default`: a text-based page (e.g. `.md` file), non-button links underlined
  and bold, no background pattern.

- `card`: default margins set, non-button links underlined, by default with a
  gradient pattern background (can be switched off). **Use this when you are
  styling a new page that is not mostly text-based.**

- `plain`: no styling applied. Use this only rarely, e.g. when you need to
  control all aspects of the page.

### Usage Example

Use name in the page front matter, e.g.

```html
---
title: The seL4 Microkernel
layout: plain
---
<!-- page content --!>
```

or

```html
---
title: What is seL4?
layout: card
background: false
---
<!-- page content --!>
```


## Buttons

The following classes are available for styling links as buttons:

- `button`: default, has dark mode
- `button-on-dark`: for buttons that are always on dark background
- `button-outline`: outline button with dark mode
- `button-outline-nodark`: dark mode always off for pages that don't support it

The following class is for highlighted links followed by a right-arrow →

- `arrow-link`

For navigating to the top of the page, there is also an arrow-up icon/button. By
default, the button is placed at the `absolute top-0 right-0` of the enclosing
`relative` or `flex` container. You can override placing with the `placing`
parameter.

- `{% include up-button.html %}`
- `{% include up-button.html placing="absolute bottom-0 right-0" %}`
- `{% include up-button.html placing="relative" %}` (next to the previous element)

TODO: should we have a separate explicit style for external links? Should it be
applied manually or automatically?

## Icons

To insert an icon, use e.g.

```liquid
{% svg _icons/name.svg class="w-8 h-8" %}
```

You need to provide some class that has size information, either explicitly with
something like `h-6 w-6` or as part of the `inline-icon` or `menu-icon` classes.
Colour and other styling is available as well:

```liquid
{% svg _icons/name.svg class="w-8 h-8 text-f_green-500" %}
```

The icons live in the `_includes/icons/` directory. All optimised 24x24
outline icons from <https://heroicons.com> are in there. Use these by default.
Smaller versions (20x20, solid) can be added where necessary and should be
named `...-mini.svg`.

Icons from other sources are in `_icons/other/`.

They are normal `.svg` files, so if you want to add a new inline svg, you
should be able to just add that to the `_icons/other` directory.

## Hero Headings

Most card layout pages (should) come with a heading section. The layout of that
heading section is defined in `_includes/heading.html`.

### Usage Example

This uses all available inputs of the component. `pre_link` and `h2` are
optional, `pre`, `h1`, and `sub` should always be used. `pre_link` should point
back to the main section page if that exists. For main section pages, `pre`
should/can be something question-like and `h1` something answer-like.

```html
{% include heading.html
   pre='What is seL4?'
   pre_link='../'
   h1="A high-assurance, high-performance operating system microkernel"
   sub='<p>seL4 is unique because of its comprehensive formal verification.</p>
        <p>seL4 is <a href="#">open source</a>, available on <a
            href="https://github.com/seL4/">GitHub</a>, and supported by the
            <a href="../Foundation/">seL4 Foundation</a>.
        </p>'
    h2="The foundation for trustworthy systems."
%}
```

## Cards

Cards with heading, icon, text, and link, usually arranged in a grid.
`card-grid-3` and `card-grid-4` are predefined in `sel4.css`, it's Ok to add
more versions of these by copy/paste.

You can leave out the link and/or the icon, and it will still produce a card,
but for consistency it is better to include at least an icon.

### Examples

```html
<div class="card-grid-4">
  {% include card.html
     icon="light-bulb"
     title="Whitepaper"
     body="More in-depth information about seL4, what the formal
           verification means, and how to use seL4."
     link="whitepaper.html"
  %}

  ...
</div>
```

You can provide explicit style input for the title and/or change the grid
layout, e.g.:

```html
{%- assign tc = "mb-3" -%}
<div class="card-grid-3 grid-cols-1 sm:grid-cols-2 md:grid-cols-3 mb-8 pb-8">
  {% include card.html
     title = "Premium"
     title_colour = "bg-[#385378] text-white"
     title_class = tc
     link_text = "Join"
     link = "Foundation/Join/membership-form"
     body = '
     <p class="mt-2">
      <strong>Guaranteed board seat</strong>
     </p>
     <div class="mt-4 border-t pt-4 text-sm">
       <p>USD 100k / year</p>
     </div>'
  %}
```

## Feature Sections

A feature section with heading, image, text next to the image, and a link. Image
can be on the left or right. Optionally includes an up-button to navigate to top
of page.

### Example

```html
{%
  include feature.html
  right=true
  up=true
  h2="Protecting critical systems around the globe"
  text="
      <p>
        seL4 protects critical systems from software failures and
        cyber-attacks. It allows non-critical functionality to run securely
        alongside critical payloads by enforcing strong isolation and controlled
        communication.
      </p>
      <p>
        seL4 is used in a wide range of critical sectors, from automotive,
        aerospace and IoT to data distribution, military and intelligence. It
        has been successfully retrofitted into complex critical systems and has
        demonstrably prevented cyber-attacks. Government organisations on
        several continents have funded further development of seL4 and its
        ecosystem.
      </p>"
  link="#"
  img="images/cpu.jpg"
  alt="Conceptualised image of a CPU on a motherboard"
%}
```

## Member scroll section

TODO: since we're using that more than once, this should also become a
component. Maybe generally a scroll section, since we

## Time line

Larger time line component with time point, heading, and text. Begins with a
`timeline-start` include, then a series of `timeline-item` includes,
concluded by `timeline-end`.

See Research/awards.html and Research/publications.html for examples.

## Add More!

Anything that is used more than once should ideally become a component (a
partial html file in `_includes`). So, if you find yourself copying something,
think about copying it into `_includes/` instead, and use that.

This should make things more consistent and easier to tweak.

Have a look at e.g. `_includes/heading.html` or `_includes/card.html` for
examples on how to do this.

Once you have done that, mention it in this file.
