import 'dart:convert';

import 'package:cart_app/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});
  List<String> cart = [];
  List<String> cartHistory = [];
  void addToCartList(List<CartModel> carList) {
    cart = [];
    var time = DateTime.now().toString();
    for (var element in carList) {
      element.time = time;
      cart.add(jsonEncode(element));
    }
    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    getCartList();
  }

  List<CartModel> getCartList() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
    }
    List<CartModel> cartList = [];
    for (var element in carts) {
      cartList.add(CartModel.fromJson(jsonDecode(element)));
    }
    return cartList;
  }

  List<CartModel> getCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)) {
      cartHistory = [];
      cartHistory =
          sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    List<CartModel> cartListHistory = [];
    for (var element in cartHistory) {
      cartListHistory.add(CartModel.fromJson(jsonDecode(element)));
    }

    return cartListHistory;
  }

  void addToCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)) {
      cartHistory =
          sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    for (int i = 0; i < cart.length; i++) {
      cartHistory.add(cart[i]);
    }

    sharedPreferences.setStringList(
        AppConstants.CART_HISTORY_LIST, cartHistory);
    removeCart();
  }

  void removeCart() {
    cart = [];
    sharedPreferences.remove(AppConstants.CART_LIST);
  }

  clearAllData() {
    sharedPreferences.remove(AppConstants.CART_LIST);
    sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);
  }

  void clearCartHistory() {
    removeCart();
    clearAllData();
  }
}
