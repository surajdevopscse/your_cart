import 'package:cart_app/data/repository/cart_repo.dart';
import 'package:cart_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/cart_model.dart';
import '../utils/colors.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, CartModel> _items = {};

  Map<int, CartModel> get items => _items;
  List<CartModel> storageData = [];
  void addItem(ProductModel productModel, int quantity) {
    var totalQuantity = 0;

    if (_items.containsKey(productModel.id!)) {
      _items.update(productModel.id!, (value) {
        totalQuantity = value.quantity! + quantity;
        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity! + quantity,
          isExit: value.isExit,
          time: value.time,
          product: productModel,
        );
      });
      if (totalQuantity <= 0) {
        _items.remove(productModel.id!);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(
          productModel.id!,
          () => CartModel(
            id: productModel.id,
            name: productModel.name,
            price: productModel.price,
            img: productModel.img,
            quantity: quantity,
            isExit: true,
            time: DateTime.now().toString(),
            product: productModel,
          ),
        );
      } else {
        Get.snackbar(
          "Item Count",
          "You should at least add an item in the Cart!",
          backgroundColor: AppColors.mainColor,
          colorText: Colors.white,
        );
      }
    }
    cartRepo.addToCartList(getItems);
    update();
  }

  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    } else {
      return false;
    }
  }

  int getQuantity(ProductModel products) {
    var quantity = 0;
    if (_items.containsKey(products.id)) {
      _items.forEach((key, value) {
        if (key == products.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  int get totalAmount {
    var total = 0;
    _items.forEach((key, value) {
      total += value.quantity! * value.price!;
    });
    return total;
  }

  List<CartModel> getCartData() {
    setCart = cartRepo.getCartList();
    return storageData;
  }

  set setCart(List<CartModel> items) {
    storageData = items;
    for (int i = 0; i < storageData.length; i++) {
      _items.putIfAbsent(storageData[i].product!.id!, () => storageData[i]);
    }
  }

  void addToHistory() {
    cartRepo.addToCartHistoryList();
    clear();
  }

  void clear() {
    _items = {};
    update();
  }

  clearAllData() {
    cartRepo.clearAllData();
  }

  List<CartModel> getCartHistoryList() {
    return cartRepo.getCartHistoryList();
  }

  set setItems(Map<int, CartModel> setItems) {
    _items = {};
    _items = setItems;
  }

  void addToCartList() {
    cartRepo.addToCartList(getItems);
    update();
  }
}
