enum DeliveryType { pickup, delivery }

class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}

class OrderItem {
  final Product product;
  final int quantity;

  OrderItem({required this.product, required this.quantity})
    : assert(quantity > 0, "Quantity must be grater than 0");

  double getTotal() => product.price * quantity;
}

class Customer {
  final String name;
  final String adress;

  Customer({required this.name, required this.adress});
}

class Order {
  final List<OrderItem> items;
  final DeliveryType deliveryType;
  final Customer customer;

  Order({
    required this.items,
    required this.deliveryType,
    required this.customer,
  }) {
    if (deliveryType == DeliveryType.delivery && (customer.adress.isEmpty)) {
      throw Exception("Delivery address should be included");
    }
  }

  double getTotalAmount() {
    double total = items.fold(0, (sum, item) => sum + item.getTotal());
    if (deliveryType == DeliveryType.delivery) {
      total += 2.5;
    }
    return total;
  }
}

void main() {
  //Product
  var water = Product(name: "Kulen", price: 0.5);
  var drink = Product(name: "Matcha", price: 3.2);

  //Customer
  var nika = Customer(name: "Nika", adress: "Phnom Penh");
  var kaka = Customer(name: "Kaka", adress: "");

  //Order
  var item1 = OrderItem(product: water, quantity: 4);
  var item2 = OrderItem(product: drink, quantity: 2);

  //Pick up
  var pickupOrder = Order(
    items: [item1, item2],
    deliveryType: DeliveryType.pickup,
    customer: kaka,
  );

  //Delivery
  var deliveryOrder = Order(
    items: [item1, item2],
    deliveryType: DeliveryType.delivery,
    customer: nika,
  );

  print("Pickup order total: ${pickupOrder.getTotalAmount()}");
  print("Delivery order total: ${deliveryOrder.getTotalAmount()}");
}
