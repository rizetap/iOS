import Foundation
print("enter a sentence: ", terminator:" ")
if let input = readLine() {
    var text = input.lowercased()

    text = text.map { CharacterSet.punctuationCharacters.contains($0.unicodeScalars.first!) ? " " : String($0) }.joined()

    let words = text.split(separator: " ").map { String($0)}

    var frequency: [String: Int] = [:]

    for word in words{
        frequency[word, default: 0] += 1
    }

    print("\nWord frequencies:")
    for(word, count) in frequency {
        print("\(word): \(count)")
    }
}