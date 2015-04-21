---
layout: default
title: Incoming HTTP requests
---

This script sends greetings to anyone mentioned in the request's `whom`
parameter.  If that parameter is missing, it greets the whole world.

{% include examples/hello.md %}

Each language implementation strives to represent an HTTP request
idiomatically.  See the [language specific documentation](/specific)
for details on how it's represented in {% include language-name.html %}.
