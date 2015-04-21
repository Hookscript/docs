```go
package main

import (
	"fmt"
	// no need to import "hookscript"
)

func Hook() {
	fmt.Println("Hello, world!")
}
```


```perl
use Hookscript; # implies use strict; use warnings; use feature ":5.20"

say "Hello, world!";
```


```prolog
:- use_module(library(hookscript)).

hook :-
    writeln("Hello, world!").
```


