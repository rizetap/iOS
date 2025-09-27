func fibonacci(_ n: Int) -> [Int] {
    if n <= 0 {
        return []
    }
    if n == 1 {
        return [0]
    }
    var sequence = [0, 1]
    for i in 2..<n {
        let next = sequence[i - 1] + sequence[i - 2]
        sequence.append(next)
    }
    return sequence
}

print("enter nubmer:", terminator: " ")
if let input = readLine(), let n = Int(input) {
    let result = fibonacci(n)
    print("Fibonacci sequence of first \(n) numbers: \(result)")
}