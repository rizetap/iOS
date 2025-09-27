import Foundation

func hasUniqueCharacters(_ text: String) -> Bool {
    var seen: Set<Character> = []
    for char in text {
        if seen.contains(char) {
            return false
        }
        seen.insert(char)
    }
    return true
}
print("enter a string:", terminator: " ")
if let input = readLine() {
    if hasUniqueCharacters(input) {
        print("the string has all unique characters.")
    } else {
        print("the string does NOT have all unique characters.")
    }
}