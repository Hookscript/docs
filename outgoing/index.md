---
layout: default
title: Outgoing network requests
next_page: /request-log/
---

Unlike code playgrounds, Hookscript runs your code inside its own private
server.  That means you can make outbound network requests to external services.
Maybe you want to call a third-party API, connect to a database or post to an
IRC channel.  Be our guest.

The following script fetches network resources over HTTP.  All outgoing network
requests are made with standard {% include language-name.html %} libraries.
Try this example with parameters like `protocol=https` and `file=content.txt`.

{% include examples/http.md %}

To prevent email abuse, we block traffic on the following ports:

  * 25
  * 465
  * 587
