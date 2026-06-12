const std = @import("std");
const Io = std.Io;
const print = std.debug.print;

const simple_http = @import("simple_http");

pub fn main(init: std.process.Init) !void {
    const io = init.io; 

    const address = try Io.net.IpAddress.parseIp4("127.0.0.1", 8080);

    var server = try Io.net.IpAddress.listen(&address, io, Io.net.IpAddress.ListenOptions{});
    defer server.deinit(io); 

    print("Listening on port {}...\n", .{address.ip4.port});

    while (true) {
        try simple_http.handleConnection(try server.accept(io), io);
    }
}
