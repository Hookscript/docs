---
layout: default
title: Request log
---

Any good server environment needs request logs.  You may want to know when your
script was executed and whether it succeeded.  Hookscript provides a log of
every request made to your script. Requests that failed are highlighted in red
so that you don't miss them.

![Request log screenshot](http://storage.googleapis.com/hookscript/request-log.png)

These kinds of high-level logs often omit the details you need for debugging
real world problems.  Fortunately, by clicking on any request, you can see:

  * the exact HTTP request that triggered your script
  * the HTTP response that your script generated
  * any log data your script sent to *stderr*
  * the initial and final [state values](/state/) (if you use that feature)

Here's a screenshot of a single log entry for a simple GET request:

![Request screenshot](http://storage.googleapis.com/hookscript/request.png)
