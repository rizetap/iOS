import Foundation

func add(_ a: Double, _ b: Double) -> Double {
    return a + b
}

func subtract(_ a: Double, _ b: Double) -> Double {
    return a - b
}

func multiply(_ a: Double, _ b: Double) -> Double {
    return a * b
}

func divide(_ a: Double, _ b: Double) -> Double? {
    if b == 0 {
        return nil
    }
    return a / b
}

while true {
    print("enter first number (or type 'exit' to quit):", terminator: " ")
    guard let firstInput = readLine() else { continue }
    if firstInput.lowercased() == "exit" {
        print("exiting calculator")
        break
    }
    
    guard let num1 = Double(firstInput) else {
        print("invalid input for first number.")
        continue
    }
    
    print("enter second number:", terminator: " ")
    guard let secondInput = readLine(), let num2 = Double(secondInput) else {
        print("invalid input for second number.")
        continue
    }
    
    print("choose operation (+, -, *, /):", terminator: " ")
    guard let op = readLine() else { continue }
    
    var result: Double?
    
    switch op {
    case "+":
        result = add(num1, num2)
    case "-":
        result = subtract(num1, num2)
    case "*":
        result = multiply(num1, num2)
    case "/":
        result = divide(num1, num2)
        if result == nil {
            print("error: division by zero is not allowed.")
            continue
        }
    default:
        print("invalid operation")
        continue
    }
    
    if let res = result {
        print("result: \(res)")
    }
}
