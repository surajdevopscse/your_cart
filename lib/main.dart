import 'package:cart_app/controller/cart_controller.dart';
import 'package:cart_app/controller/popular_product_controller.dart';
import 'package:cart_app/controller/recommended_product_controller.dart';
import 'package:cart_app/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    //Get.find<CartController>().clearAllData();
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(
        builder: (_) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            //home: SignInPage(),
            initialRoute: RouteHelper.getSplashScreen(),
            getPages: RouteHelper.routes,
          );
        },
      );
    });
  }
}
