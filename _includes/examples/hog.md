```go
{% raw %}
package main

import (
	"fmt"
	"net/http"
	"os"
)

func Hook(r *http.Request) {
	resource := r.FormValue("resource")
	switch resource {
	case "cpu":
		for {
			// do nothing
		}
	case "mem":
		xs := []int{0}
		for {
			xs = append(xs, xs...)
		}
	case "disk":
		f, err := os.Create("junk")
		MaybePanic(err)
		for {
			_, err = f.WriteString("junk\n")
			MaybePanic(err)
		}
	case "output":
		for i := 0; i < 1000000; i++ {
			_, err := fmt.Println("junk")
			MaybePanic(err)
		}
	}
}

func MaybePanic(err error) {
	if err != nil {
		panic(err)
	}
}
{% endraw %}
```


```perl
{% raw %}
use Hookscript;
use experimental qw( switch );
use autodie qw( open );

given ( $req->param('resource') ) {
    when ('cpu') {
        1 while 1;
    }
    when ('mem') {
        my $x = 'xxxxxxxxxxxxxxxxxx';
        $x .= $x while 1;
    }
    when ('disk') {
        open my $fh, '>', 'junk';
        while (1) {
            print $fh "junk\n"
              or die "write to disk failed";
        }
    }
    when ('output') {
        my $i = 1_000_000;
        while ( $i-- ) {
            print "junk\n";
        }
    }
}
{% endraw %}
```


```prolog
{% raw %}
:- use_module(library(hookscript)).

hook :-
    req:param(resource, Resource),
    hog(Resource).

hog(cpu) :-
    hog(cpu).
hog(mem) :-
    hog_mem([]).
hog(disk) :-
    open(junk,write,File),
    tell(File),
    forall(repeat,writeln(junk)).
hog(output) :-
    forall(between(1,1_000_000,_),writeln(junk)).


hog_mem(T) :-
    hog_mem([x|T]).
{% endraw %}
```


