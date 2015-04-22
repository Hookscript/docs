---
layout: default
title: HTTP responses
---

The [previous](/hello/) [examples](/request/) produce plain text responses. If
you want to generate an HTML or JSON response, you need to set the
`Content-Type` header. Each language has a [slightly different way](/specific/)
of **modifying the outgoing HTTP response**.

The following example shows a hello world app which presents an HTML form to the
visitor; setting the `Content-Type` header.  The user submits a form
to indicate who should be greeted. You can play with a
<a target="_blank" href="https://www.runhook.com/bc46edrrev2oz4pxkbjsu5vqum">working demo</a>
of this code.

{% include examples/hello-html.md %}

For real work, take care to avoid
[code injection](https://en.wikipedia.org/wiki/Code_injection).
