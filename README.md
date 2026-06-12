# Simple HTTP Server in Zig


## Context

I've been working my way through the [Zigling exercises](https://codeberg.org/ziglings/exercises)

I watched [a cool interview with Zig's creator](https://youtu.be/iqddnwKF8HQ?si=s3h03rfvGMFxGZ2Q) and it inspired me to try out the language.

Ziglings are fun, but I wanted to do something concrete.


## Action
I attempted to write this from scratch using only the Zig docs. It was a bit hard to wrap my mind around the Zig's relatively new changes to Io.net. The documentation was further muddied by the fact that this interface is new and people are used to the old way. So there was little help online, I had to struggle through on my own.


## How to Run It

```sh
git clone https://github.com/Pandahead33/simple-http.git
cd simple-http
```

Clone the project, and ensure you have Zig installed. I suggest directly downloading it from [Zig releases](https://ziglang.org/download/). This was created with version `0.17.0-dev.667+0569f1f6a`.

In the simple-http directory, use the command  `zig build run`.

If it worked, you should see

```
Listening to 127.0.0.1:8080...
```

You can hit it by opening another terminal and running 

``` sh
curl localhost:8080
```

Which should output

```sh
Hello World!
```

If you look back at the server output, it should show the client ip:

```sh
Transmitting to client: 127.0.0.1:34324
Successful! Served client: 127.0.0.1:3424
```

## Making Changes
The code is in two files inside the `/src` folder. There is `main.zig` which is the typical entry point for Zig apps. I created the project using `zig init` which generated this file structure.

`main.zig` calls to the `simple-http` package which is the code inside of `root.zig`. Since the project is called simple-http, this is how you can reference it:

```zig
const simple_http = @import("simple_http");
```

`main.zig` set up the server and address, but the complexity of handling the connection is all done inside of `zoot.rig`. This is an arbitrary abstraction to make it slightly more complicated; putting it all in one file is possible.

However, this complexity helped with the learning process of Zig. Now we know how to fully setup a package, use it within another, and share functions with different level of scopes between them. It also makes it easier to expand later.

Now we can simply add new handling functions into the package or reuse it in other projects without needing the main code. In fact, we should likely stick all of the code within the package and abstract it further from the main.

## Limitations
This is not super fleshed out. It has a bit of error handling, but no custom messages or edge cases. 


For instance, it will error out if the port is already in use, but we could handle that gracefully by selecting a port that isn't used (i.e, 8081 or whatever is the first available).

## Future
I likely will play with this a bit more, but it is intended simply to be a basic overview of Zim and to help anyone who was either A) new to Zig or B) confused by the new API. I will be posting my ZIgling exercise solutions in another repo, so follow me on Github if you're interested in those.

Feel free to use this for your learning purposes! I will add serving HTML soon.
