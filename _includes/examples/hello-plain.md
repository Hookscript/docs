```go
{% raw %}
package main

import (
	"fmt"
	// no need to import "hookscript"
)

func Hook() {
	fmt.Println("Hello, world!")
}
{% endraw %}
```


```perl
{% raw %}
use Hookscript; # implies use strict; use warnings; use feature ":5.20"

say "Hello, world!";
{% endraw %}
```


```prolog
{% raw %}
:- use_module(library(hookscript)).

hook :-
    writeln("Hello, world!").
{% endraw %}
```


```python
{% raw %}
import hookscript

print("Hello, world!")
{% endraw %}
```


