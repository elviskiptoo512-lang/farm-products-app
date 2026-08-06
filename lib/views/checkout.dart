import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:flutter_application_1/controllers/cart_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String _selectedMethod = 'M-Pesa';
  bool _isProcessing = false;

  static const String _createOrderUrl =
      'http://localhost/FarmMarket/create_order.php';

  Future<void> _payNow() async {
    final cartController = Get.find<CartController>();
    final box = GetStorage();
    final userEmail = box.read('user_email');

    if (userEmail == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please log in again to place an order')),
      );
      return;
    }

    setState(() => _isProcessing = true);

    // Simulate payment processing delay (mock payment, no real gateway)
    await Future.delayed(const Duration(seconds: 2));

    final itemsJson = jsonEncode(
      cartController.items
          .map(
            (item) => {
              'name': item.product.name,
              'quantity': item.quantity,
              'price': item.product.price,
            },
          )
          .toList(),
    );

    try {
      final response = await http.post(
        Uri.parse(_createOrderUrl),
        body: {
          'user_email': userEmail,
          'total': cartController.total.toString(),
          'payment_method': _selectedMethod,
          'items': itemsJson,
        },
      );

      final data = jsonDecode(response.body);

      if (data['success'] == 1) {
        cartController.clearCart();
        if (mounted) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              title: const Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green),
                  SizedBox(width: 8),
                  Text('Order Placed'),
                ],
              ),
              content: const Text('Your order has been placed successfully.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.until(
                      (route) =>
                          route.settings.name == '/home' || route.isFirst,
                    );
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data['message'] ?? 'Order failed')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not reach the server. Check your connection.'),
        ),
      );
    } finally {
      if (mounted) setState(() => _isProcessing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Summary',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: cartController.items.length,
                  itemBuilder: (context, index) {
                    final item = cartController.items[index];
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text('${item.product.name} x${item.quantity}'),
                      trailing: Text('KES ${item.subtotal.toStringAsFixed(0)}'),
                    );
                  },
                ),
              ),
            ),
            const Divider(),
            const SizedBox(height: 8),
            const Text(
              'Payment Method',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            RadioListTile<String>(
              contentPadding: EdgeInsets.zero,
              title: const Text('M-Pesa'),
              value: 'M-Pesa',
              groupValue: _selectedMethod,
              activeColor: primaryColor,
              onChanged: (value) => setState(() => _selectedMethod = value!),
            ),
            RadioListTile<String>(
              contentPadding: EdgeInsets.zero,
              title: const Text('Cash on Delivery'),
              value: 'Cash on Delivery',
              groupValue: _selectedMethod,
              activeColor: primaryColor,
              onChanged: (value) => setState(() => _selectedMethod = value!),
            ),
            const SizedBox(height: 12),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'KES ${cartController.total.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isProcessing ? null : _payNow,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: _isProcessing
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text('Pay Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
