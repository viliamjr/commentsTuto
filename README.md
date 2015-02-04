#What?
This is the [React Tutorial](http://facebook.github.io/react/docs/tutorial.html) implemented with [Riot](https://muut.com/riotjs/) :thumbsup:

#It depends?
- [Riot compiler](https://muut.com/riotjs/compiler.html#pre-compilation)
- [Go tool](http://golang.org/doc/install) (just to run a simple webserver to handle HTTP requests)

#How?
Build the tags and run a server:
~~~
$ cd commentsTuto
$ riot tags/ public/tutorial.js
$ go run server.go
~~~
Now the app should be available at http://127.0.0.1:8080/