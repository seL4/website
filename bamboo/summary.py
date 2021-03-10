#!/usr/bin/env python3

# Copyright 2021 seL4 Project a Series of LF Projects, LLC.
# SPDX-License-Identifier: BSD-2-Clause

import argparse
import os

DESCRIPTION = 'Generate summary page for a single test run with multiple jobs.'


def read_property_file(file, suffix=""):
    """Read a file with lines of the form KEY=VALUE, and return as dict.
       Remove optional suffix from KEY and VALUE."""
    with open(file, 'r') as f:
        return dict(tuple(map(lambda s: s.strip().removesuffix(suffix), line.split('=')))
                    for line in f.readlines() if not line.startswith('#') and line.strip())


def repo_link(repo):
    return "https://github.com/seL4/"+repo


def link(repo, sha):
    return repo_link(repo)+"/commits/"+sha


def short(sha):
    return sha[0:7]


def log_path(plan_key, job, build_number):
    return plan_key + "-" + job + "-" + str(build_number) + ".log"


def page(shas, names, results, build_number, plan_key, output_file):
    with open(output_file, 'w') as f:
        def pr(line):
            f.write(line)
            f.write('\n')

        pr("<!DOCTYPE html>")
        pr("<html>")
        pr("<!--")
        pr("  Copyright 2020 seL4 Project a Series of LF Projects, LLC.")
        # cut up string so reuse tool doesn't get confused with SDPX keyword:
        pr("  SPDX-License"+"-Identifier: CC-BY-SA-4.0")
        pr("-->")
        pr("<head>")
        pr("  <title>{0}</title>".format(plan_key))
        pr('  <link href="https://sel4.systems/css/bootstrap.min.css" rel="stylesheet">')
        pr('  <link href="https://sel4.systems/css/sel4.css" rel="stylesheet">')
        pr('  <link href="https://sel4.systems/~bamboo/bamboo.css" rel="stylesheet">')

        pr('</head>')
        pr("<body>")
        pr('<div class="main">')
        pr('<h1>Test run {0} for {1}</h1>'.format(build_number, plan_key))

        repos = shas.keys()
        if repos:
            pr("<h2>Tested commits</h2>")
            pr("<table>")
            first = True
            for repo in repos:
                pr('<tr {4}> <td class="col1"><a href="{0}">{1}</a></td> <td class="col2"><a href="{2}"><code>{3}</code></a><td> </tr>'.format(
                    repo_link(names[repo]), names[repo], link(names[repo], shas[repo]), short(shas[repo]), "" if first else 'class="separate"'))
                first = False
            pr("</table>")

        if not results:
            pr("<p>No test jobs.</p>")
            return

        failed = []
        succeeded = []
        for job in results:
            if results[job] == 'SUCCESS':
                succeeded.append(job)
            else:
                failed.append(job)

        if failed:
            pr("<h2>Failed jobs</h2>")
            pr("<table><tbody>")
            first = True
            for job in failed:
                pr('<tr {2}> <td class="col1"><a href="{0}">{1}</a></td> <td class="col2"><a href="{0}"><svg class="svg-icon" viewBox="0 0 20 20"><path fill="none" d="M11.469,10l7.08-7.08c0.406-0.406,0.406-1.064,0-1.469c-0.406-0.406-1.063-0.406-1.469,0L10,8.53l-7.081-7.08 c-0.406-0.406-1.064-0.406-1.469,0c-0.406,0.406-0.406,1.063,0,1.469L8.531,10L1.45,17.081c-0.406,0.406-0.406,1.064,0,1.469 c0.203,0.203,0.469,0.304,0.735,0.304c0.266,0,0.531-0.101,0.735-0.304L10,11.469l7.08,7.081c0.203,0.203,0.469,0.304,0.735,0.304 c0.267,0,0.532-0.101,0.735-0.304c0.406-0.406,0.406-1.064,0-1.469L11.469,10z"></path></svg></a></td> </tr>'.format(
                    log_path(plan_key, job, build_number), job, "" if first else 'class="separate"'))
                first = False
            pr("</tbody></table>")
        else:
            pr("<h2>All builds successful!</h2>")

        if succeeded:
            pr("<h2>Successful jobs</h2>")
            pr("<table><tbody>")
            first = True
            for job in succeeded:
                pr('<tr {2}> <td class="col1"><a href="{0}">{1}</a></td> <td class="col2"><a href="{0}"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="#96CA50" width="2em"> <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" /></svg></a></td> </tr>'.format(
                    log_path(plan_key, job, build_number), job, "" if first else 'class="separate"'))
                first = False
            pr("</tbody></table>")
        else:
            pr("<p>All jobs failed :-(</p>")

        pr("</div>")
        pr("</body>")
        pr("</html>")


def main():
    """Command line parsing and tool invocation."""
    parser = argparse.ArgumentParser(description=DESCRIPTION)
    parser.add_argument('--commits',
                        dest='sha_file',
                        default='sha.properties',
                        help="File that lists repos and commits relevant for this test in REPO=SHA form.")
    parser.add_argument('--names',
                        dest='names_file',
                        default='name.properties',
                        help="File that lists repo names in REPO=NAME form.")
    parser.add_argument('-o',
                        dest='output_file',
                        default='index.html',
                        help="Output file.")
    parser.add_argument('build_number', type=int,
                        help="The build number of the test run.")
    parser.add_argument('plan_key',
                        help="The plan and stage key (=base path) the jobs are in.")
    parser.add_argument('summary_file',
                        help="Summary file with test results in KEY=[SUCCESS|FAILURE] form.")

    args = parser.parse_args()

    shas = read_property_file(args.sha_file, "_SHA")
    names = read_property_file(args.names_file, "_NAME")
    jobs = read_property_file(args.summary_file)

    page(shas, names, jobs, args.build_number, args.plan_key, args.output_file)


if __name__ == '__main__':
    main()
