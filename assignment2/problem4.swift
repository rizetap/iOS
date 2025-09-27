import Foundation
var shoppingList: [String] = []
while true {
    print ("Shopping List menu: 1. Add item; 2. Remove item 3. Show shopping list; 4. Exit/n Enter your choice (1-4):", terminator: "")
    guard let choice = readLine() else { continue }
    if choice == "1" {
        print( "Enter the item to add:", terminator: " ")
        if let item = readLine(), !item.isEmpty{
            shoppingList.append (item)
            print("Item was added to the list.")
        }
    }
    else if choice == "2" {
        print("Enter the item to remove:", terminator: " ")
        if let item = readLine(), !item.isEmpty {
            if let index = shoppingList.firstIndex(of: item) {
            shoppingList.remove(at: index)
            print ("Item has been removed from the list.")
            }
            else {
                print ("Item '\(item)' not found in the list")
            }
        }
    }
    else if choice == "3" {
        if shoppingList.isEmpty {
            print ("The list is empty.")
        }
        else {
            print( "Current shopping list:")
            for (index, item) in shoppingList.enumerated() {
                print ("\(index + 1). \(item)")
            }
        }
    } 
    else if choice == "4" {
        print("Exiting the shopping list manager. Goodbye!")
        break
    } 
    else {
        print("Invalid choice. Please enter 1, 2, 3, or 4.")
    }
}    