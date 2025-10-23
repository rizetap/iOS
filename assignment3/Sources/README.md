# E-Commerce System - Swift Assignment

## Project Overview
This project implements a simple e-commerce system in Swift, demonstrating the practical differences between value types (structs) and reference types (classes). The system includes products, shopping carts, orders, and user management.

## Design Decisions

### Why did you choose class for ShoppingCart?

I chose `class` for `ShoppingCart` because **shopping cart identity and shared state matter**. In a real e-commerce application, multiple parts of the system need to reference and modify the same cart instance. 

Key reasons:
- **Shared State**: When a cart is passed to different functions or views, they all need to work with the same cart, not copies
- **Mutability**: The cart needs to be modified frequently (adding/removing items, applying discounts) and these changes should be visible everywhere
- **Reference Semantics**: If a user adds an item in one part of the app, that change should immediately reflect in all other parts accessing the same cart

For example, in test scenario #7, when we pass the cart to the `modifyCart()` function, it modifies the original cart because classes are reference types. This is exactly what we want - one cart instance shared across the application.

### Why did you choose struct for Product and Order?

**Product as struct**: Products are **immutable data entities**. Once a product is created with its name, price, and category, these properties shouldn't change. Products represent fixed catalog items, and using a struct ensures they remain constant and can be safely copied without unexpected side effects.

**Order as struct**: Orders are **immutable snapshots** of a purchase at a specific moment in time. Once an order is placed, it should never change - it's a historical record. Using a struct with all `let` properties ensures:
- Orders cannot be accidentally modified after creation
- Each order is an independent copy of the cart state at checkout
- Order integrity is maintained even if the original cart is cleared

In test scenario #10, we demonstrate this: after creating an order from the cart, we clear the cart completely. The order still contains all its original items because it's an immutable value type copy, not a reference to the cart.

### Reference Semantics Example

**Test Scenario #7** demonstrates reference semantics perfectly:
```swift
func modifyCart(_ cart: ShoppingCart) {
    cart.addItem(product: headphones, quantity: 1)
}
modifyCart(cart)
```

When we pass the cart to this function, we're passing a **reference** to the same cart object. The function adds headphones, and when we check the original cart afterward, the headphones are there. This is because both the function parameter and our original variable point to the same cart instance in memory. This shared state is crucial for e-commerce apps where the cart needs to be consistently updated across different UI components.

### Value Semantics Example

**Test Scenario #8** demonstrates value semantics:
```swift
var item1 = CartItem(product: laptop, quantity: 1)
var item2 = item1
item2.updateQuantity(5)
// item1.quantity is still 1, item2.quantity is 5
```

When we assign `item1` to `item2`, Swift creates a **complete copy** because `CartItem` is a struct. Modifying `item2` doesn't affect `item1` at all - they're independent copies. This is important because it prevents unexpected bugs where changing one variable accidentally affects another. Each `CartItem` is independent, which makes the code more predictable and safer.

## Challenges and Solutions

### Challenge 1: Optional Unwrapping
**Problem**: Both `Product` and `CartItem` use failable initializers (`init?`) for validation, returning optionals that needed unwrapping.

**Solution**: Used `guard let` statements for safe unwrapping with clear error handling:
```swift
guard let laptop = Product(...) else {
    print("Failed to create product")
    exit(1)
}
```

This approach is safer than force unwrapping (`!`) and provides better error messages for debugging.

### Challenge 2: Mutating Struct Methods
**Problem**: Struct methods that modify properties need the `mutating` keyword, and you can only call mutating methods on `var` instances, not `let` instances.

**Solution**: Added `mutating` keyword to methods like `updateQuantity()` and `increaseQuantity()` in `CartItem`. Also ensured that when unwrapping CartItem optionals, I used `guard var` instead of `guard let` when mutation was needed.

### Challenge 3: Cart Item Duplication Logic
**Problem**: When adding a product that already exists in the cart, I needed to increase its quantity rather than creating a duplicate entry.

**Solution**: Implemented logic in `addItem()` to search for existing products using `firstIndex(where:)`:
```swift
if let index = items.firstIndex(where: { $0.product.id == product.id }) {
    items[index].increaseQuantity(by: quantity)
} else {
    // Add new item
}
```

### Challenge 4: Immutable Order Snapshot
**Problem**: Ensuring that orders remain unchanged even after the cart is modified or cleared.

**Solution**: Created deep copies of cart data during Order initialization. Since `CartItem` is a struct (value type), the array copy automatically creates independent copies of all items. This ensures the order preserves its state regardless of what happens to the original cart.

## Project Structure
```
├── Product.swift          # Product struct with Category enum
├── CartItem.swift         # CartItem struct linking products with quantities
├── ShoppingCart.swift     # ShoppingCart class managing cart operations
├── Address.swift          # Address struct for shipping information
├── Order.swift            # Order struct for immutable purchase records
├── User.swift             # User class managing order history (bonus)
└── main.swift             # Test scenarios demonstrating all functionality
```

## Key Concepts Demonstrated
✓ Value types vs Reference types  
✓ Struct vs Class decision making  
✓ Immutability and data integrity  
✓ Failable initializers with validation  
✓ Computed properties  
✓ Mutating methods  
✓ Access control (`private(set)`)  
✓ Optional handling  

## How to Run
```bash
swiftc Product.swift CartItem.swift ShoppingCart.swift Address.swift Order.swift User.swift main.swift -o test
./test
```

---
**Author**: Perizat Muratova  
**Date**: October 2025