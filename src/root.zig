//! By convention, root.zig is the root source file when making a package.
const std = @import("std");
const print = std.debug.print;

pub fn handleConnection(conn: std.Io.net.Stream, io: std.Io) !void {
    const clientIp = conn.socket.address.ip4;

    defer {
        // print("Client id {} served.\n", .{clientIp});
        printIp4Address("Success! Served", clientIp);
        conn.close(io);
    }

    printIp4Address("Transmitting to", clientIp);

    var buffer: [1024]u8 = undefined;
    var reader = conn.reader(io, &buffer);
    var writer = conn.writer(io, &.{});

    var http_server = std.http.Server.init(&reader.interface, &writer.interface);
    var req = try http_server.receiveHead();

    try req.respond("Hello World!\n", std.http.Server.Request.RespondOptions{});
}

pub fn printIp4Address(message: []const u8, a: std.Io.net.Ip4Address) void {
    const bytes = &a.bytes;
    //const printable = message[0..length];
    print("{s} client: {d}.{d}.{d}.{d}:{d}\n", .{ message, bytes[0], bytes[1], bytes[2], bytes[3], a.port });
}
