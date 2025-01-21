const std = @import("std");

pub fn main() !void {
    const str1 = "Hello, ";
    const str2 = "Zig!";

    const result = str1 ++ str2;

    std.debug.print("The concatenated str: {s}", .{result});
}
