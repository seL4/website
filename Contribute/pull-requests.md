---
SPDX-FileCopyrightText: 2020 seL4 Project a Series of LF Projects, LLC.
SPDX-License-Identifier: CC-BY-SA-4.0
title: Pull Request Conventions
pre: Coding Conventions
pre_link: conventions.html
sub: '
<p>This is a guide for conducting effective and efficient pull requests on any of
the seL4 GitHub repositories. Pull requests that do not follow it may not
receive attention or may be closed.
</p>
  '
---

In general, a pull request (PR) not should only communicate what the change is,
but more importantly why it is necessary. The guide below helps you to provide
the information that will make it likely that a change will be accepted.

## Creation

Pull requests should be created from personal forks. We follow a [fork-rebase
workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/forking-workflow).

### Title

The title should summarise the set of commits, and indicate *what* the PR is
about. For a single commit, the title can be subject line of the commit message.

### Description

- Must state the *why* and the *how* for the change.
  - Usually this is the body of your commit message.
  - Explain the motivation behind the change. Why is it necessary and should be
    accepted? As a brief calibration on what we consider necessary: Fixing bugs
    is necessary. Only cleaning up style is not necessary. Cleaning up code
    that is touched anyway in the PR is an improvement. Improving performance
    and reducing maintenance cost is generally beneficial, as is improving
    usability, provided it outweighs the cost of making the change. Adding a
    feature may require an [RFC].
  - Do not leave the description field empty, even if you think the change is
    obvious.

- If the PR is for feedback only, and not ready to merge, set it to "Draft"

- Explain any context:
  - is it part of a greater set of changes?
  - are any concurrent PRs (in other repositories) dependent on this PR?
  - provide links in the description

- State what testing has been performed. For the kernel, if a new major feature
  has been added, corresponding tests must be added to `sel4test`. Include a
  link to the corresponding `sel4test` PR in the description. For other
  projects, see their corresponding test suites.

- For the kernel: if the change breaks the formal verification, it must come
  with an update to the proofs (see below). Provide a link to the corresponding
  PR that updates the verification in the description or state where/how
  verification is being conducted. You can propose changes without verification,
  but they cannot be merged before verification is complete. Reviewers will add
  the label `verification` if a change to the proofs is necessary.


### Commits

- Commit history and messages are part of the review
  - A good commit history assists reviewers in understanding the change
  - Please see the [Git conventions](/GitConventions).

- Good reviews are small reviews. Large PRs should only be created if absolutely
  necessary and are unlikely to generate excitement from reviewers.

### Requesting Reviewers

You do not need to request specific reviewers, and anyone can help to review a
pull request.

- If you do want a particular person to review, please tag them.
- If there hasn't been any activity after a couple of days, feel free to bump the post.
- Pull requests require at least one approving review for merge,
  and usually should aim for 2 reviews on each non-trivial pull request.

## During Review

Always abide by the [seL4 Code of Conduct](/Conduct).

### For Reviewers

- Take into account the context stated by the author.
- Review commits and commit messages as well as code
- Request that the above guide be followed if it is not.
- Provide constructive feedback -- see the resources below.
- Remember to comment on good things.

### For Authors

- Apply changes due to feedback from reviewers as additional commits, and squash
  them once the PR is ready to merge.
- Please attempt to only push changes to the PR branch once it is ready for re-review.
- Please communicate any changes you make during the review process.
- Apart from editing history, fixing review feedback, or fixing trivial issues,
  do not push changes to a PR once it has been approved.

### Tests

- The foundation repositories require the following tests to pass
  before a pull request can be merged:
  - code style
    - these may vary per repository and language, but default should
      standardise on those in the repository
      [seL4/seL4_tools](https://github.com/seL4/seL4_tools/tree/master/misc)
  - developer certificate of origin ([DCO][dco])
  - checks for SPDX license tagging (using the [REUSE tool][reuse])
  - any applicable regression tests:
    - these vary per repository
    - for seL4 itself, they must include:
      - compile test
      - hardware and/or simulator runs. Reviewer can add the `hw-build`,
        `hw-test`, and `hw-bench` labels to run hardware builds and tests
        on pull requests.
      - the proofs
    - for verification target repositories (currently mainly seL4):
      - a pull request can only be merged on the master branch if either
        the corresponding proof is updated or if there is no proof impact.
      - there is no proof impact if:
        - the preprocessed source for verified code has not changed
          (this is tested by the "preprocess" check on GitHub), or
        - the proof still works unchanged despite the code change.
          Reviewers can add the `proof-test` label to run the current proofs
          on a pull request.
      - for proof updates:
        - submit a pull request to the [`l4v`](https://github.com/seL4/l4v)
          repository together with the
          pull request for the [`seL4`](https://github.com/seL4/seL4)
          repository, or
        - ping the `@verification` team on the GitHub seL4 org for help in
          updating the proofs, or
        - talk to the [seL4 Foundation][foundation] about finding funding
          and/or volunteers for the proofs updates if it is a bigger project.

- Exceptions are possible by approval of someone in the [Committer][Committers] role

## Merging

Anyone in the [Committer][Committers] role can merge pull requests after they
satisfy the required tests and approvals.

## Resources

- [The principle of charity](http://fishbowl.pastiche.org/2009/10/20/the_principle_of_charity_2/)
- Code review for humans [part 1](https://mtlynch.io/human-code-reviews-1/) and [part
  2](https://mtlynch.io/human-code-reviews-2/)


[Committers]: roles.html
[Reuse]: https://reuse.software
[DCO]: contributing.html
[foundation]: https://sel4.systems/Foundation/
[RFC]: rfc-process.html
