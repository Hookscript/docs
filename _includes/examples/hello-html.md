```go
package main

import (
	"html/template"
	"net/http"
	"os"
)

func Hook(res *http.Response, req *http.Request) {
	whom := req.FormValue("whom")
	if whom == "" {
		whom = "world"
	}
	res.Header.Set("Content-Type", "text/html")
	t, err := template.New("page").Parse(page)
	if err != nil {
		panic(err)
	}
	err = t.Execute(os.Stdout, whom)
	if err != nil {
		panic(err)
	}
}

const page = `
<html>
    <body>
        <h1>Hello, {{.}}!</h1>

        <form method=GET>
            <input type=submit value="Say Hello to" />
            <input type=text name=whom placeholder="world" />
        </form>
    </body>
</html>
`
```


```perl
use Hookscript;

my $whom = $req->param('whom') // "world";
$res->headers->content_type('text/html');

print <<"HTML";
<html>
    <body>
        <h1>Hello, $whom!</h1>

        <form method=GET>
            <input type=submit value="Say Hello to" />
            <input type=text name=whom placeholder="world" />
        </form>
    </body>
</html>
HTML
```


```prolog
:- use_module(library(hookscript)).

hook :-
    req:param(whom,world,Whom),
    assert(res:header(content_type,text/html)),
    template(Template),
    format(Template,[Whom]).

template("
<html>
<body>
    <h1>Hello, ~w!</h1>
    
    <form method=GET>
        <input type=submit value='Say Hello to' />
        <input type=text name=whom placeholder='world' />
    </form>
</body>
</html>
").```

