```go
{% raw %}
package main

import "fmt"

func Hook(n *int) {
	*n++
	fmt.Print(*n)
}
{% endraw %}
```


```perl
{% raw %}
use Hookscript;

$state //= 0;
$state++;
print $state;
{% endraw %}
```


```prolog
{% raw %}
:- use_module(library(hookscript)).

hook(N0, N) :-
    ignore(N0=0),  % N0 unbound when no state has been stored
    succ(N0,N),
    write(N).
{% endraw %}
```


```python
{% raw %}
import hookscript

state = hookscript.state

if state == None:
    state = 0
state += 1
print(state, end='')

hookscript.state = state
{% endraw %}
```


