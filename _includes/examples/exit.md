```go
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
```


```perl
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
```


```prolog
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
```


