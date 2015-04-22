---
layout: default
title: Incoming HTTP requests
next_page: /response/
---


A script that always generates the same output isn't very interesting. Let's use
**request parameters** instead. The following script sends greetings to anyone
mentioned in the `whom` parameter.  If it's missing, greet the whole world.

{% include examples/hello.md %}

Each language implementation strives to represent an HTTP request
idiomatically.  See the [language specific documentation](/specific)
for details on how it's done in {% include language-name.html %}.
