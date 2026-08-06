import 'package:get/get.dart';
import 'package:flutter_application_1/models/cart_item.dart';
import 'package:flutter_application_1/models/product.dart';

class CartController extends GetxController {
  final RxList<CartItem> items = <CartItem>[].obs;

  int get itemCount => items.fold(0, (sum, item) => sum + item.quantity);

  double get total => items.fold(0, (sum, item) => sum + item.subtotal);

  void addToCart(Product product) {
    final index = items.indexWhere((item) => item.product.name == product.name);
    if (index >= 0) {
      items[index].quantity++;
      items.refresh();
    } else {
      items.add(CartItem(product: product));
    }
  }

  void incrementQuantity(int index) {
    items[index].quantity++;
    items.refresh();
  }

  void decrementQuantity(int index) {
    if (items[index].quantity > 1) {
      items[index].quantity--;
      items.refresh();
    } else {
      items.removeAt(index);
    }
  }

  void removeItem(int index) {
    items.removeAt(index);
  }

  void clearCart() {
    items.clear();
  }
}
