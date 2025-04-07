---
SPDX-License-Identifier: CC-BY-SA-4.0
SPDX-FileCopyrightText: 2020 seL4 Project a Series of LF Projects, LLC.
title: Developer Certificate of Origin (DCO)
sub: '
  <p>The seL4 Foundation does not require any contributor license
  agreements or other documents for contributions. It uses the the
  sign-off process as the Linux kernel, the so-called Developer
  Certificate of Origin.
  </p>'
pre: Coding Conventions
pre_link: conventions.html
---

## Signing off on commits

For every commit, use

    git commit -s

to add a sign-off line to your commit message, which should come out as:

    Signed-off-by: name <email>

Use a real, contactable email address. Using a real name is appreciated, but
pseudonyms are permitted.

By adding this line, you make the declaration that you have the right to make
this contribution under the open source license the files use that you changed
or contributed.

Generally, you usually have this right when you wrote the contribution yourself
and your employer allows you to make open-source contributions. You do not
always need to be the original author of the code, for instance making a
contribution to GPL code by copying and modifying other GPL code can be perfectly
fine. You can also sign off on somebody else's behalf.

The full text of the declaration is at <https://developercertificate.org>.

The seL4 GitHub repositories are configured to only accept pull requests
where all commits are signed off. There are no other signatures or legal
documents required.

## Some tips on using signed-off-by with git:

- signed-off-by is different from signing commits with a GPG key (commit -S)
- you can use `git commit --amend -s` to sign off a single existing commit if
  you’ve forgotten
- you can use `git rebase --signoff <base-branch> `for signing off multiple
  commits on a whole branch
- the DCO allows you to sign off commits for others -- see
  <https://developercertificate.org> for details
- you can add an alias for sign-off to your git config, so you don’t have to
  think about it. For instance:

            git config alias.ci “commit -s"

  now `git ci` will commit with sign-off. The config command above is local
  for the current repository.
