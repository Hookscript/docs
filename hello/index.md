---
layout: default
title: Hello world
next_page: /request/
---

Select your preferred language from the dropdown above.

Now it's time to say hello:

{% include examples/hello-plain.md %}

A program running on Hookscript is called a *script*.  Most scripts start by
importing the hookscript library.  This automates some low-level, repetitive
details.

A script's code is run each time an **incoming HTTP request arrives** at the
script's URL.  A script can access the request, but we'll
[get to that later](/request/).

Anything the script sends to its **stdout becomes the HTTP response body**. Most
programming languages have good defaults for generating output on stdout.  It
also means that a script which runs well on your local terminal should run, with
minimal modifications, on Hookscript.  Compare for a moment the program above
with the language's traditional hello world program.
