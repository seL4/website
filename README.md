<!--
    Copyright 2020 seL4 Project a Series of LF Projects, LLC.
    SPDX-License-Identifier: CC-BY-SA-4.0
-->

# seL4 Website

The [seL4.systems](https://sel4.systems) website is built with the
static site generator [Jekyll](https://jekyllrb.com), which uses
the Liquid templating engine.

## Setting up Ruby

### Installing rbenv

We recommend using [rbenv](https://github.com/rbenv/rbenv) to install the
correct Ruby version.

On Mac:

```sh
homebrew install ruby-build rbenv
```

On Linux:

```sh
apt install rbenv
```

### Setting up rbenv

```sh
# follow the instructions this command shows, and start a new shell afterwards
rbenv init
# in the docs directory (root of this repo):
rebenv install
```

After these, you should be able to forget about `rbenv`, the `Makefile` will now
see the correct Ruby version.

## Build

Running `make build` will generate the pages and put them into the
`_site/` directory. To preview the website locally, run

```sh
make serve
```

for the production build and `make debug` for the development build. See `make
help` for all options.

## Docker

The directory `docker/` provides a docker file and some scripts to host
the website inside a container. It is also used for GitHub pull request
checks and preview.

To use the docker container locally, install docker and run

```sh
cd docker
make
```

This will build the container (takes a while the first time), and then
run it such that you can preview the website on port 8080 on your local
machine.

## Making Changes

Contributions are welcome &mdash; if you find anything out of date, any typos or
inaccuracies, please raise a pull request on this repository.

### Links

For the preview functionality on pull requests to work, all links to internal
pages and images need to be relative to the file they are made from. That
means, please do not use links that start with a `/` such as
`/Foundation/page.html` even though Jekyll encourages that.

There are two ways to use relative links: either directly use the relative path
(usually nicer), or use the `relative_url` function in Jekyll/Liquid.

Examples:

```html
<a href="../Foundation/a-page.html">
<img src="../images/something.jpg">
```

With `relative_url`:

```html
<a href={{ "/Foundation/a-page.html" | relative_url }}>
```

Note: `relative_url` only produces a site-relative URL not a path-relative URL,
but Jekyll has enough setup to prepend the correct prefix for the GitHub
previews to work, so it is fine to use.

## Licences

Files in this repository (with a few exceptions) are released under standard
open source licences, identified by [SPDX Licence tags](https://spdx.org).  See
individual file headers for details.

As a general rule, new code files should be under
[BSD-2-Clause](LICENSES/BSD-2-Clause.txt), and documents under the [Creative
Commons Licence [CC-BY-SA 4.0 International](LICENSES/CC-BY-SA-4.0.txt) licence
in this repository.

This repository also contains a copy of the Bootstrap CSS, which is licensed
under the [MIT](LICENSES/MIT.txt) licence.

Some files contain representations of trademarks.  Irrespective of any
licence markings, logos and trademarks in this repository are owned by
their respective owners. No licenses or other rights in or to such
logos and/or trademarks are granted. The Trademark guidelines for the
seL4 Foundation can be found at <https://sel4.systems/Foundation/Trademark>

Permission to use pictures of people have been granted for display on
the seL4.systems website only.  Please do not use them for any other
purpose.
