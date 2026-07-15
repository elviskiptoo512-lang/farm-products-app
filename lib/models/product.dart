class Product {
  final String name;
  final double price;
  final String unit; // e.g. "kg", "dozen", "litre"
  final int quantity; // stock available
  final String imagePath; // asset path — placeholder for now

  const Product({
    required this.name,
    required this.price,
    required this.unit,
    required this.quantity,
    this.imagePath = '',
  });
}

// Dummy data for now — replace with real data from a backend/database later.
final List<Product> dummyProducts = const [
  Product(name: 'Tomatoes', price: 80, unit: 'kg', quantity: 50),
  Product(name: 'Bananas', price: 60, unit: 'dozen', quantity: 30),
  Product(name: 'Fresh Milk', price: 120, unit: 'litre', quantity: 25),
  Product(name: 'Maize', price: 45, unit: 'kg', quantity: 100),
  Product(name: 'Eggs', price: 15, unit: 'piece', quantity: 200),
  Product(name: 'Cabbages', price: 40, unit: 'piece', quantity: 40),
  Product(name: 'Oranges', price: 90, unit: 'kg', quantity: 35),
  Product(name: 'Onions', price: 100, unit: 'kg', quantity: 60),
];
