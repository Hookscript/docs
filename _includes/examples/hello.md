```go
{% raw %}
package main

import (
	"fmt"
	"net/http"
)

func Hook(r *http.Request) {
	whom := r.FormValue("whom")
	if whom == "" {
		whom = "world"
	}
	fmt.Printf("Hello, %s!\n", whom)
}
{% endraw %}
```


```perl
{% raw %}
use Hookscript;

my $whom = $req->param('whom') // 'world';
say "Hello, $whom!";
{% endraw %}
```


```prolog
{% raw %}
:- use_module(library(hookscript)).

hook :-
    req:param(whom,world,Whom),
    format("Hello, ~s!~n", [Whom]).
{% endraw %}
```


