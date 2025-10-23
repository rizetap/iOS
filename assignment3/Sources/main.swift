import Foundation

guard let laptop = Product(
    id: "lp001",
    name: "Macbook Air M3",
    price: 1299.99,
    category: .electronics,
    description: "moshniy sochniy noutbuk"
) else {
    print("cant create laptop")
    exit(1)
}

guard let book = Product(
    id: "bk001",
    name: "IOS development",
    price: 49.99,
    category: .books,
    description: "how to code to earn millions"
) else {
    print("cant create book")
    exit(1)
}

guard let headphones = Product(
    id: "hp001",
    name: "AirPods 3",
    price: 249.99,
    category: .electronics,
    description: "naushniki"
) else {
    print("cant create headphones")
    exit(1)
}

print("available products rn:")
let products = [laptop, book, headphones]
for product in products {
    
    print("\(product.name)")
    print("   Price: \(product.displayPrice)")
    print("   Category: \(product.category)")
    print("   Description: \(product.description)")
    print()
}

let cart = ShoppingCart()
print("your shopping cart is empty now. loading products...")
cart.addItem(product: laptop, quantity: 1)
cart.addItem(product: book, quantity: 3)

print(" cart item count: \(cart.itemCount)\n")


print("adding one more laptop...")
cart.addItem(product: laptop, quantity: 1)
if let laptopItem = cart.items.first(where: { $0.product.id == laptop.id }) {
    print("  laptop quantity now = \(laptopItem.quantity)")
}

print("  subtotal: $\(String(format: "%.2f", cart.subtotal))")
print("  item count: \(cart.itemCount)\n")


print("DISCOUNT PART")
print("  total before discount: $\(String(format: "%.2f", cart.total))")
cart.discountCode = "SAVE10"
print("  applied discount code: SAVE10")
print("  discount amount: -$\(String(format: "%.2f", cart.discountAmount))")
print("  total with discount: $\(String(format: "%.2f", cart.total))\n")


print("  items before removing book: \(cart.itemCount)")
cart.removeItem(productId: book.id)
print("  items after removing book: \(cart.itemCount)\n")


func modifyCart(_ cart: ShoppingCart) {
    cart.addItem(product: headphones, quantity: 1)
}
print("  items before function call: \(cart.itemCount)")
modifyCart(cart)
print("  items after function call: \(cart.itemCount)\n")



guard var item1 = CartItem(product: laptop, quantity: 1) else {
    print("cant create item1")
    exit(1)
}
var item2 = item1
print("  item1 quantity: \(item1.quantity)")
print("  item2 quantity: \(item2.quantity)")
item2.updateQuantity(5)
print("after updating item2 to quantity 5:")
print("  item1 quantity: \(item1.quantity)")
print("  item2 quantity: \(item2.quantity)\n")



let address = Address(
    street: "Tole Bi 59",
    city: "Almaty",
    zipCode: "050000",
    country: "Kazakhstan"
)
let order = Order(from: cart, shippingAddress: address)
print("order created with ID: \(order.orderId)")
print("  order item count: \(order.itemCount)")
print("  order total: $\(String(format: "%.2f", order.total))\n")



print("order items before clearing cart: \(order.itemCount)")
print("  cart items before clearing: \(cart.itemCount)")
cart.clearCart()
print("  cart items after clearing: \(cart.itemCount)")
print("  order items after clearing cart: \(order.itemCount)")
print("  order preserved original items (immutable snapshot)\n")





let user = User(
    userId: "user001",
    name: "Perizat Muratova",
    email: "rizetapq@gmail.com"
)

print("user created: \(user.name)")
print("email: \(user.email)")
print("order history: \(user.orderHistory.count) orders\n")



user.placeOrder(order)
print("order have been placed successfully")
print("  total orders: \(user.orderHistory.count)")
print("  total spent: $\(String(format: "%.2f", user.totalSpent))\n")



let cart2 = ShoppingCart()
cart2.addItem(product: book, quantity: 3)
cart2.addItem(product: headphones, quantity: 1)
cart2.discountCode = "SAVE20"

let order2 = Order(from: cart2, shippingAddress: address)
user.placeOrder(order2)
print("order have been placed successfully")
print("  total orders: \(user.orderHistory.count)")
print(". total spent: $\(String(format: "%.2f", user.totalSpent))\n")


print("User's order history:")
for (index, orderItem) in user.orderHistory.enumerated() {
    print("    order #\(index + 1):")
    print("    order ID: \(orderItem.orderId)")
    print("    items: \(orderItem.itemCount)")
    print("    total: $\(String(format: "%.2f", orderItem.total))")
}

