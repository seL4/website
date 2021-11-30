<%
#    Copyright 2021 seL4 Project a Series of LF Projects, LLC.
#    SPDX-License-Identifier: CC-BY-SA-4.0
#
# this has to happen before any content that
# might otherwise be sent to the client.
# Find the latest file in ./news/ and redirect to that.
psp.redirect('/news/')
%>
<!--<title>News about seL4 and the seL4 Foundation</title>-->
