```go
{% raw %}
package main

import (
	"fmt"
	"net/http"
	"os"
)

func Hook(r *http.Request) {
	switch r.FormValue("try") {
	case "1":
		panic("Try 1")
	case "2":
		fmt.Fprintln(os.Stderr, "Try 2")
		os.Exit(1)
	}
}
{% endraw %}
```


```perl
{% raw %}
use Hookscript;
use experimental qw(switch);

given ( $req->param('try') ) {
    when (1) {
        die "Try $_";
    }
    when (2) {
        warn "Try $_";
        exit 1;
    }
}
{% endraw %}
```


```prolog
{% raw %}
:- use_module(library(hookscript)).

hook :-
    req:param(try,Try),
    format(string(Msg),"Try ~d~n", [Try]),
    hook(Try,Msg).

hook(1,Msg) :-
    throw(Msg).
hook(2,Msg) :-
    format(user_error,"~s",[Msg]),
    halt(1).
{% endraw %}
```


```python
{% raw %}
from hookscript import request
import sys

x = request.values['try']
if x == '1':
    raise Exception('Try %s' % x)
elif x == '2':
    print('Try %s' % x, file=sys.stderr)
    sys.exit(1)
{% endraw %}
```


