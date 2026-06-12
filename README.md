# Simple HTTP Client in Zig


## Context

I've been working my way through the [Zigling exercises]()

I watched a cool interview with Zig's creator and it inspired me to try out the language.

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

## Limitations
This is not super fleshed out. It has a bit of error handling, but no custom messages or edge cases. 


For instance, it will error out if the port is already in use, but we could handle that gracefully by selecting a port that isn't used (i.e, 8081 or whatever is the first available).

## Future
I likely will play with this a bit more, but it is intended simply to be a basic overview of Zim and to help anyone who was either A) new to Zig or B) confused by the new API. I will be posting my ZIgling exercise solutions in another repo, so follow me on Github if you're interested in those.

Feel free to use this for your learning purposes! I will be add serving HTML soon.
