---
SPDX-License-Identifier: CC-BY-SA-4.0
SPDX-FileCopyrightText: 2020 seL4 Project a Series of LF Projects, LLC.
title: Git Conventions
pre: Coding Conventions
pre_link: conventions.html
sub: '<p>
  Good commit messages and history are important, and required for seL4 projects.
</p>
<p>
  Here is what you need to know.
</p>'
svg: /images/git-commits.svg
svg_class: "mx-auto mt-12 w-2/3"
---

This page outlines the conventions that should be used for git history in the
projects under the <a href="https://github.com/seL4">seL4 GitHub org</a>. Note
that this applies to pull requests where the content is ready to be merged. If you
are raising a pull request for feedback only, you do not need to follow the history
conventions, but please note this in the description of the pull request to
avoid confusion. Also read the <a href="pull-requests.html"> pull request guidelines</a>.

We will review the history in pull requests that are *ready to be merged*. If you
need help with git, or advice on how to structure your history, please reach
out.

Note that our work-flow is a [fork-rebase
workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/forking-workflow).

## Commit messages

Please follow the git commit [style guide](https://chris.beams.io/posts/git-commit/). Briefly:

* Use a subject line to summarise the commit.
{: .list-tick .my-0}
* Limit the subject line to 50 characters.
{: .list-tick .my-0}
* Capitalise the subject line.
{: .list-tick .my-0}
* Avoid ending the subject line in a full stop.
{: .list-cross .my-0}
* Use the imperative mood in the subject line.
{: .list-tick .my-0}
* Check the repository history if it uses any obvious tagging conventions.
  Follow them if it does.
{: .list-tick .my-0}
* Follow this with a blank line, then a summary of why the changes are required,
  and if non-trivial, how they achieve their purpose.
{: .list-tick .my-0}
* Wrap the body at 72 characters.
{: .list-tick .my-0}

Examples and counter-examples of the above rules can be found in the git commit
[style guide](https://chris.beams.io/posts/git-commit/).

## Whitespace and style

* Please keep whitespace and style changes in their own commits, not mixed with other changes.
{: .list-tick .my-0}
* If making a trivial commit, please prefix with `trivial:`
{: .list-tick .my-0}
* Avoid making PRs that are only changing style and not making other significant changes.
  This avoids spending reviewer and CI resources on a large number of small stylistic improvements.
{: .list-tick .my-0}

## History

* Merge commits are prohibited.
{: .list-cross .my-0}
* Revert commits which act on the contents of the PR are prohibited.
{: .list-cross .my-0}
* Commits should make the changes easier to follow: if you move a function and change it, please do
  so in separate commits.
{: .list-tick .my-0}
* Commits should be separated into functional, logical changes, unless those changes are dependant.
  if you find yourself writing a commit message which says 'Fix X and clean up Y', you should
      probably use two commits.
{: .list-tick .my-0}

## Further resources

* [LearnGitBranching](http://pcottle.github.io/learnGitBranching/)
* Interactive [Git cheat sheet](http://ndpsoftware.com/git-cheatsheet.html)
