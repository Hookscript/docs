```go
package main

import "fmt"

type Counter int

func Hook(n *Counter) {
	*n++
	fmt.Print(*n)
}
```


```perl
use Hookscript;

$state //= 0;
$state++;
print $state;
```


```prolog
:- use_module(library(hookscript)).

hook(N0, N) :-
    ignore(N0=0),  % N0 unbound when no state has been stored
    succ(N0,N),
    write(N).
```


