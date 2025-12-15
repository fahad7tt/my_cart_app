import 'package:cart_app/model/cart_item.dart';
import 'package:cart_app/model/product_model.dart';

class CartManager {
  static final CartManager _instance = CartManager._internal();
  factory CartManager() => _instance;
  CartManager._internal();

  final List<CartItem> _cartItems = [];

  List<CartItem> get items => _cartItems;

  void addToCart(Product product) {
    int index = _cartItems.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      _cartItems[index].quantity++;
    } else {
      _cartItems.add(CartItem(product: product, quantity: 1));
    }
  }

  void removeFromCart(int productId) {
    _cartItems.removeWhere((item) => item.product.id == productId);
  }

  void incrementQuantity(int productId) {
    int index = _cartItems.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      _cartItems[index].quantity++;
    }
  }

  void decrementQuantity(int productId) {
    int index = _cartItems.indexWhere((item) => item.product.id == productId);
    if (index != -1 && _cartItems[index].quantity > 1) {
      _cartItems[index].quantity--;
    }
  }

  double getTotalAmount() {
    return _cartItems.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
  }

  void clear() {
    _cartItems.clear();
  }
}