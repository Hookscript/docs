---
layout: default
title: Persistent state
---

HTTP is a [stateless protocol](http://stackoverflow.com/a/13200599/174463) so
your script doesn't retain state by default.  But what if you want to **remember
something between requests**?  You could configure an external database, but
that's kind of a pain for small scripts.  Fortunately, hookscript allows each
script to store [a small amount](https://www.hookscript.com/pricing) of data.

Each language has [its own way](/specific/) of using state, but here's a script
in {% include language-name.html %} that outputs the number of times that it
has been executed.

{% include examples/state-counter.md %}

In that example, the state value is a single integer, but it could have been
almost anything.  The following example implements a primitive key-value store.
The **state is a key-value map**.  Sending a POST request sets the value
associated with a key.  A GET request reads the value.

{% include examples/state-registers.md %}

For whatever reason, this app forbids writing to the `death` key.  If your
script happens to exit with a non-zero exit code, you can inspect your script's
request log to see what went wrong.  Anything sent to stderr is visible there
(along with the entire HTTP request and response). This can be very helpful when
debugging.

Remember to check the [language specific documentation](/specific/) to see
exactly how state is supported in {% include language-name.html %}.
