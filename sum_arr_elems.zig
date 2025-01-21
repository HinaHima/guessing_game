const std = @import("std");

pub fn main() !void {
    const arr = [_]u8{ 1, 3, 4, 5, 5, 9 };

    var sum: u8 = 0;

    for (arr) |value| {
        sum += value;
    }

    std.debug.print("The sum of the arr elems is {}", .{sum});
}
