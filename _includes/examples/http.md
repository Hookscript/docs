```go
{% raw %}
package main

import (
	"fmt"
	"io"
	"net/http"
	"os"
)

func Hook(req *http.Request, res *http.Response) {
	proto := req.FormValue("protocol")
	file := req.FormValue("file")
	url := fmt.Sprintf("%s://storage.googleapis.com/hookscript/%s", proto, file)

	got, err := http.Get(url)
	if err != nil {
		panic(err)
	}
	if got.StatusCode != 200 {
		res.StatusCode = got.StatusCode
		fmt.Printf("Request to %s failed", url)
		return
	}

	_, err = io.Copy(os.Stdout, got.Body)
	if err != nil {
		panic(err)
	}
	got.Body.Close()
}
{% endraw %}
```


```perl
{% raw %}
use Hookscript;
use HTTP::Tiny;

my $http     = $req->param('protocol');
my $file     = $req->param('file');
my $url      = "$http://storage.googleapis.com/hookscript/$file";
my $response = HTTP::Tiny->new->get($url);
if ( $response->{status} == 200 ) {
    print $response->{content};
}
else {
    $res->code( $response->{status} );
    print "Request to $url failed";
}
{% endraw %}
```


```prolog
{% raw %}
:- use_module(library(hookscript)).
:- use_module(library(web), []).

hook :-
    req:param(protocol, Http),
    req:param(file, File),
    format(atom(Url),"~s://storage.googleapis.com/hookscript/~w", [Http,File]),
    web:get(Url,[status_code(Status),codes(Codes)]),
    ( Status = 200 ->
        format("~s",[Codes])
    ; otherwise ->
        res:assert(status(Status, "")),
        format("Request to ~s failed", [Url])
    ).
{% endraw %}
```


```python
{% raw %}
from hookscript import request, response
import requests

http = request.values['protocol']
file = request.values['file']
url = '%s://storage.googleapis.com/hookscript/%s' % (http,file)

r = requests.get(url)
if r.status_code == 200:
    print(r.text, end='')
else:
    response.status_code = r.status_code
    print('Request to %s failed' % url, end='')
{% endraw %}
```


