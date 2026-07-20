class Product {
  final String name;
  final double price;
  final String unit;
  final String category;
  final String imagePath;

  const Product({
    required this.name,
    required this.price,
    required this.unit,
    required this.category,
    this.imagePath = '',
  });
}

final List<Product> dummyProducts = const [
  Product(
    name: 'Tomatoes',
    price: 80,
    unit: 'kg',
    category: 'Vegetables',
    imagePath: 'assets/products/tomatoes.png',
  ),
  Product(
    name: 'Cabbages',
    price: 40,
    unit: 'piece',
    category: 'Vegetables',
    imagePath: 'assets/products/cabbages.png',
  ),
  Product(
    name: 'Onions',
    price: 100,
    unit: 'kg',
    category: 'Vegetables',
    imagePath: 'assets/products/onions.png',
  ),
  Product(
    name: 'Bananas',
    price: 60,
    unit: 'dozen',
    category: 'Fruits',
    imagePath: 'assets/products/bananas.png',
  ),
  Product(
    name: 'Oranges',
    price: 90,
    unit: 'kg',
    category: 'Fruits',
    imagePath: 'assets/products/oranges.png',
  ),
  Product(
    name: 'Fresh Milk',
    price: 120,
    unit: 'litre',
    category: 'Dairy',
    imagePath: 'assets/products/milk.png',
  ),
  Product(
    name: 'Maize',
    price: 45,
    unit: 'kg',
    category: 'Grains & Cereals',
    imagePath: 'assets/products/maize.png',
  ),
  Product(
    name: 'Eggs',
    price: 15,
    unit: 'piece',
    category: 'Poultry',
    imagePath: 'assets/products/eggs.png',
  ),
  Product(
    name: 'Live Goat',
    price: 8000,
    unit: 'piece',
    category: 'Livestock',
    imagePath: 'assets/products/goat.png',
  ),
];
