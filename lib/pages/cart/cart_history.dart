import 'dart:convert';

import 'package:cart_app/common_widget/app_icon.dart';
import 'package:cart_app/common_widget/big_text.dart';
import 'package:cart_app/common_widget/no_data_page.dart';
import 'package:cart_app/common_widget/small_text.dart';
import 'package:cart_app/controller/cart_controller.dart';
import 'package:cart_app/routes/route_helper.dart';
import 'package:cart_app/utils/app_constants.dart';
import 'package:cart_app/utils/colors.dart';
import 'package:cart_app/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../models/cart_model.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList =
        Get.find<CartController>().getCartHistoryList().reversed.toList();
    Map<String, int> cartItemsPerOrder = {};

    Map<String, dynamic> getCartTimes() {
      for (int i = 0; i < getCartHistoryList.length; i++) {
        if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
          cartItemsPerOrder.update(
              getCartHistoryList[i].time!, (value) => ++value);
        } else {
          cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
        }
      }
      return cartItemsPerOrder;
    }

    getCartTimes();

    List<dynamic> cartItemsPerOrderToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<dynamic> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.key).toList();
    }

    List<dynamic> itemsPerOrder = cartItemsPerOrderToList();
    var listCounter = 0;

    Widget timeWidget(int index) {
      var outputDate = DateTime.now().toString();
      if (index < getCartHistoryList.length) {
        DateTime date = DateFormat("yyyy-MM-dd HH:mm:ss")
            .parse(getCartHistoryList[listCounter].time!);
        var outputDateFormat = DateFormat("MM/dd/yyyy hh:mm a");
        outputDate = outputDateFormat.format(date);
      }
      return BigText(text: outputDate.toString());
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            color: AppColors.mainColor,
            height: Dimensions.height20 * 5,
            width: double.maxFinite,
            padding: EdgeInsets.only(
              top: Dimensions.height45,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(
                  text: "Cart History",
                  color: Colors.white,
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize24,
                  bgColor: AppColors.mainColor,
                )
              ],
            ),
          ),
          GetBuilder<CartController>(builder: (_cartController) {
            return _cartController.getCartHistoryList().isNotEmpty
                ? Expanded(
                    child: Container(
                    margin: EdgeInsets.only(
                      top: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                    ),
                    child: MediaQuery.removePadding(
                      removeTop: true,
                      context: context,
                      child: ListView(
                        children: [
                          for (int x = 0; x < itemsPerOrder.length; x++)
                            Container(
                              height: Dimensions.height30 * 4.2,
                              margin:
                                  EdgeInsets.only(bottom: Dimensions.height20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  timeWidget(listCounter),
                                  SizedBox(
                                    height: Dimensions.height10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Wrap(
                                        direction: Axis.horizontal,
                                        children: List.generate(
                                          itemsPerOrder[x],
                                          (index) {
                                            if (listCounter <=
                                                getCartHistoryList.length) {
                                              listCounter++;
                                            }
                                            return index <= 2
                                                ? Container(
                                                    margin: EdgeInsets.only(
                                                      right: Dimensions.width10,
                                                    ),
                                                    width:
                                                        Dimensions.width20 * 4,
                                                    height:
                                                        Dimensions.height20 * 4,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        Dimensions.radius15 / 2,
                                                      ),
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                          AppConstants
                                                                  .BASE_URL +
                                                              AppConstants
                                                                  .UPLOADS +
                                                              getCartHistoryList[
                                                                      index]
                                                                  .img!,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : Container();
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: Dimensions.height30 * 3,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            SmallText(
                                              text: "Total",
                                              color: AppColors.titleColor,
                                            ),
                                            BigText(
                                              text:
                                                  itemsPerOrder[x].toString() +
                                                      " Items",
                                              color: AppColors.titleColor,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                var orderTime =
                                                    cartOrderTimeToList();
                                                Map<int, CartModel> moreOrder =
                                                    {};
                                                for (int j = 0;
                                                    j <
                                                        getCartHistoryList
                                                            .length;
                                                    j++) {
                                                  if (getCartHistoryList[j]
                                                          .time ==
                                                      orderTime[x]) {
                                                    moreOrder.putIfAbsent(
                                                        getCartHistoryList[j]
                                                            .id!,
                                                        () => CartModel.fromJson(
                                                            jsonDecode(jsonEncode(
                                                                getCartHistoryList[
                                                                    j]))));
                                                  }
                                                }
                                                Get.find<CartController>()
                                                    .setItems = moreOrder;
                                                Get.find<CartController>()
                                                    .addToCartList();
                                                Get.toNamed(
                                                    RouteHelper.getCartPage());
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      Dimensions.width10 / 2,
                                                  vertical:
                                                      Dimensions.height10 / 2,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    Dimensions.radius15 / 3,
                                                  ),
                                                  border: Border.all(
                                                    width: 1,
                                                    color: AppColors.mainColor,
                                                  ),
                                                ),
                                                child: SmallText(
                                                  text: "one more",
                                                  color: AppColors.mainColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ))
                : SizedBox(
                    height: Dimensions.screenHeight / 1.5,
                    child: const Center(
                      child: NoDataPage(
                        text: "You didn't buy anything so far!",
                        imgPath: "assets/image/empty_box.png",
                      ),
                    ),
                  );
          })
        ],
      ),
    );
  }
}
