func celToFar(_ c: Double) -> Double {
    return (c * 9.0/5.0) + 32.0
}

func celToKel(_ c: Double) -> Double {
    return c + 273.15
}

func farToCel(_ f: Double) -> Double {
    return (f - 32.0) * 5.0/9.0
}

func farToKel(_ f: Double) -> Double {
    return (f - 32.0) * 5.0/9.0 + 273.15
}

func kelToCel(_ k: Double) -> Double {
    return k - 273.15
}

func kelToFar(_ k: Double) -> Double{
    return (k - 273.15) * 9.0/5.0 + 32.0
}

print("Enter the temperature value:")
guard let inputValue = readLine(), let temperature = Double(inputValue) else {
    print("Invalid input. Please enter a number.")
    exit(0)
}

print("enter the unit (c for celsius, f for fahrenheit, k for kelvin):")
guard let unit = readLine()?.uppercased() else {
    print("Invalid input.")
    exit(0)
}

switch unit {
case "C":
    print("\(temperature)°C is \(celToFar(temperature))°F")
    print("\(temperature)°C is \(celToKel(temperature)) K")
case "F":
    print("\(temperature)°F is \(farToCel(temperature))°C")
    print("\(temperature)°F is \(farToKel(temperature)) K")
case "K":
    print("\(temperature) K is \(kelToCel(temperature))°C")
    print("\(temperature) K is \(kelToFar(temperature))°F")
default:
    print("Unknown unit. Please enter C, F, or K.")
}