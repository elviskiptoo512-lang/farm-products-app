enum OrderStatus { pending, completed, cancelled }

class Order {
  final String orderNumber;
  final DateTime date;
  final OrderStatus status;
  final double total;

  const Order({
    required this.orderNumber,
    required this.date,
    required this.status,
    required this.total,
  });
}

final List<Order> sampleOrders = [
  Order(
    orderNumber: 'ORD-1001',
    date: DateTime(2026, 7, 10),
    status: OrderStatus.completed,
    total: 450,
  ),
  Order(
    orderNumber: 'ORD-1002',
    date: DateTime(2026, 7, 12),
    status: OrderStatus.pending,
    total: 780,
  ),
  Order(
    orderNumber: 'ORD-1003',
    date: DateTime(2026, 7, 13),
    status: OrderStatus.cancelled,
    total: 200,
  ),
  Order(
    orderNumber: 'ORD-1004',
    date: DateTime(2026, 7, 14),
    status: OrderStatus.pending,
    total: 1150,
  ),
];
