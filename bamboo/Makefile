# Copyright 2021 seL4 Project a Series of LF Projects, LLC.
# SPDX-License-Identifier: BSD-2-Clause

test-run: test/output.html test/output-good.html
	diff test/output.html test/output-good.html && \
	echo "Test succeeded!" || echo "Test failed."

test/output.html: test/sha.properties test/plan.success.txt \
	test/names.properties test/keys.properties summary.py
	./summary.py -o test/output.html --commits test/sha.properties \
	             --names test/names.properties --keys test/keys.properties \
				  20 TEST-PLAN test/plan.success.txt
