const std = @import("std");

pub fn main() !void {
    var seed: u64 = undefined;
    try std.posix.getrandom(std.mem.asBytes(&seed));

    var prng = std.Random.DefaultPrng.init(seed);
    const rand = prng.random();

    const target_number = rand.intRangeAtMost(u8, 1, 100);

    while (true) {
        const stdin = std.io.getStdIn().reader();
        const stdout = std.io.getStdOut().writer();

        const bare_line = try stdin.readUntilDelimiterAlloc(
            std.heap.page_allocator,
            '\n',
            8192,
        );
        defer std.heap.page_allocator.free(bare_line);

        const line = std.mem.trim(u8, bare_line, "\r");

        const guess = std.fmt.parseInt(u8, line, 10) catch |err| switch (err) {
            error.Overflow => {
                try stdout.writeAll("Введите число от 0 до 100");
                continue;
            },
            error.InvalidCharacter => {
                try stdout.writeAll("Введите число");
                continue;
            },
        };

        if (guess < target_number) try stdout.writeAll("Слишком маленькое число");
        if (guess > target_number) try stdout.writeAll("Слишком большое число");
        if (guess == target_number) {
            try stdout.writeAll("Число угадано");
            break;
        }
    }
}
