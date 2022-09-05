import 'package:cart_app/controller/auth_controller.dart';
import 'package:cart_app/controller/cart_controller.dart';
import 'package:cart_app/controller/popular_product_controller.dart';
import 'package:cart_app/controller/user_controller.dart';
import 'package:cart_app/data/api/api_client.dart';
import 'package:cart_app/data/repository/auth_repo.dart';
import 'package:cart_app/data/repository/cart_repo.dart';
import 'package:cart_app/data/repository/popular_product_repo.dart';
import 'package:cart_app/data/repository/user_repo.dart';
import 'package:cart_app/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/recommended_product_controller.dart';
import '../data/repository/recommended_product_repo.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  ///Api Client
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));

  ///Repos
  Get.lazyPut(
    () => AuthRepo(
      apiClient: Get.find(),
      sharedPreferences: Get.find(),
    ),
  );
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  Get.lazyPut(() => UserRepo(apiClient: Get.find()));

  //Controller
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
}
