```go
import (
    "fmt"
    // no need to import "hookscript"
)

func Hook() {
    fmt.Println("stuff")
}
```

```perl
use Hookscript;

say "Hello";
```

```prolog
:- use_module(library(hookscript)).

hook :-
    writeln("Hello").
```
