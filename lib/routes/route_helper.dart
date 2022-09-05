import 'package:cart_app/pages/auth/sign_in_page.dart';
import 'package:cart_app/pages/cart/cart_page.dart';
import 'package:cart_app/pages/food/popular_food_details.dart';
import 'package:cart_app/pages/food/recommended_food_details.dart';
import 'package:cart_app/pages/home/home_page.dart';
import 'package:cart_app/pages/splash/splash_screen.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String splashScreen = "/splash-screen";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";
  static const String signIn = "/sign-in";

  static String getSplashScreen() => splashScreen;
  static String getInitial() => initial;
  static var pageData = 0;
  static var pageType = "";

  static String getPopularFood(int pageId, String popularPage) {
    pageType = popularPage;
    pageData = pageId;
    return popularFood;
  }

  static String getRecommendedFood(int pageId, String recommendedPage) {
    pageType = recommendedPage;
    pageData = pageId;
    return recommendedFood;
  }

  static String getCartPage() => cartPage;
  static String getSignInPage() => signIn;

  static List<GetPage> routes = [
    GetPage(
      name: splashScreen,
      page: () {
        return const SplashScreen();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: initial,
      page: () {
        return const HomePage();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: popularFood,
      page: () {
        return PopularFoodDetail(
          pageId: pageData,
          page: pageType,
        );
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        return RecommendedFoodDetails(
          pageId: pageData,
          page: pageType,
        );
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: cartPage,
      page: () {
        return const CartPage();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: signIn,
      page: () {
        return const SignInPage();
      },
      transition: Transition.fade,
    ),
  ];
}
