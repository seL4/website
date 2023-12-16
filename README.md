<!--
    Copyright 2020 seL4 Project a Series of LF Projects, LLC.
    SPDX-License-Identifier: CC-BY-SA-4.0
-->

# seL4 Website

The [seL4.systems](https://sel4.systems) website is built with the
static site generator [Jekyll](https://jekyllrb.com), which uses
the Liquid templating engine.

## Build

Running `make build` will generate the pages and put them into the
`_site/` directory. To preview the website locally, run `make serve`
for the production build and `make debug` for the development build.
See `make help` for all options.

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


## Licences
Files in this repository (with a few exceptions) are released under
standard open source licences, identified by [SPDX Licence
tags](https://spdx.org).  See individual file headers for details.

As a general rule, code files are under [GPL
v2](https://www.gnu.org/licenses/old-licenses/gpl-2.0.html), and
documents under the [Creative Commons Licence CC-BY-SA (4.0
International)](https://creativecommons.org/licenses/by-sa/4.0/)
licence.

This repository also contains a copy of the Bootstrap CSS, which is
licensed under the
[MIT](https://github.com/twbs/bootstrap/blob/master/LICENSE) Licence.

Some files contain representations of trademarks.  Irrespective of any
licence markings, logos and trademarks in this repository are owned by
their respective owners. No licenses or other rights in or to such
logos and/or trademarks are granted. The Trademark guidelines for the
seL4 Foundation can be found at <https://sel4.systems/Foundation/Trademark>

Permission to use pictures of people have been granted for display on
the seL4.systems website only.  Please do not use them for any other
purpose.