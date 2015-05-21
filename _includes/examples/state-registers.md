```go
{% raw %}
package main

import (
	"fmt"
	"net/http"
)

type State *map[string]string

func Hook(r *http.Request, state State) {
	value := ""
	register := r.FormValue("register")
	if *state == nil {
		*state = make(map[string]string)
	}
	registers := *state

	switch r.Method {
	case "GET":
		var ok bool
		value, ok = registers[register]
		if !ok {
			value = fmt.Sprintf("unknown register: %s", register)
		}
	case "POST":
		value = r.FormValue("value")
		if value == "" {
			value = "default value"
		}
		if register == "death" {
			panic("I am dead")
		}
		registers[register] = value
	}

	fmt.Print(value)
}
{% endraw %}
```


```perl
{% raw %}
use Hookscript;
use experimental qw( switch );

my $value;
my $register = $req->param('register') // '';
given ( $req->method ) {
    when ('POST') {
        $value = $req->param('value') // 'default value';
        die "I am dead" if $register eq 'death';
        $state->{$register} = $value;
    }
    default {
        $value = $state->{$register} // "unknown register: $register";
    }
}
print $value;
{% endraw %}
```


```prolog
{% raw %}
:- use_module(library(hookscript)).

:- dynamic state:register/2.

hook :-
    req:param(register,'',Register),
    req:method(Method),
    hook(Method,Register,Value),
    write(Value).

hook(post,Register,Value) :-
    req:param(value,'default value',Value),
    ( Register = death -> throw("I am dead"); true ),
    state:retractall(register(Register,_)),
    state:assert(register(Register,Value)).
hook(get,Register,Value) :-
    ( state:register(Register,Value)
    ; format(string(Value),'unknown register: ~w', [Register])
    ).
{% endraw %}
```


```python
{% raw %}
import hookscript
from hookscript import request

state = hookscript.state or {}

register = request.values.get('register', '')
if request.method == 'POST':
    value = request.values.get('value','default value')
    if register == 'death':
        raise Exception('I am dead')
    state[register] = value
else:
    value = state.get(register,'unknown register: %s' % register)

print(value, end='')
hookscript.state = state
{% endraw %}
```


