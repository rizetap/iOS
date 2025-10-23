import Foundation

struct CartItem {
    let product: Product
    var quantity: Int 

    var subtotal: Double {
        return product.price * Double(quantity)
    }

    init?(product: Product, quantity: Int) {
        guard quantity > 0 else {
            return nil
        }
        self.product = product
        self.quantity = quantity
    }

    mutating func updateQuantity(_ newQuantity: Int) {
        guard newQuantity > 0 else {
            print("Quantity must be greather than 0")
            return
        }
        quantity = newQuantity
    }

    mutating func increaseQuantity(by amount: Int) {
        quantity += amount
    }
}