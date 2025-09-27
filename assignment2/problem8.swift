import Foundation

func isPalindrome(_ text: String) -> Bool {
    let cleaned = text.lowercased().filter { $0.isLetter || $0.isNumber }
    return cleaned == String(cleaned.reversed())
}
print("Enter a word:")
if let input = readLine() {
    if isPalindrome(input) {
        print("\(input) is a palindrome.")
    } else {
        print("\(input) is not a palindrome.")
    }
}