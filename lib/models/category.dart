import 'package:flutter/material.dart';

class Category {
  final String name;
  final IconData icon;
  final int itemCount;

  const Category({
    required this.name,
    required this.icon,
    required this.itemCount,
  });
}

// Dummy data for now — replace with real data from a backend/database later.
final List<Category> dummyCategories = const [
  Category(name: 'Vegetables', icon: Icons.eco, itemCount: 24),
  Category(name: 'Fruits', icon: Icons.apple, itemCount: 18),
  Category(name: 'Dairy', icon: Icons.icecream, itemCount: 9),
  Category(name: 'Grains & Cereals', icon: Icons.grain, itemCount: 12),
  Category(name: 'Poultry', icon: Icons.egg, itemCount: 7),
  Category(name: 'Livestock', icon: Icons.pets, itemCount: 5),
];
