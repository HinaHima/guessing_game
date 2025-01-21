const std = @import("std");

pub fn main() !void {
    const stdOut = std.io.getStdOut().writer();
    const stdIn = std.io.getStdIn().reader();
    // const alloc = std.heap.page_allocator;

    // var typed_number = try alloc.alloc(u8, 1);
    var typed_number: [1]u32 = undefined;
    // defer alloc.free(typed_number);

    try stdOut.print("Введите число", .{});
    try stdIn.readAll(typed_number);
    try stdOut.print("Вы ввели число .{}", .{typed_number.*});
}
