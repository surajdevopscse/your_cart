import 'package:cart_app/data/api/api_client.dart';
import 'package:cart_app/utils/app_constants.dart';
import 'package:get/get.dart';

class UserRepo {
  final ApiClient apiClient;
  UserRepo({required this.apiClient});

  Future<Response> getUserInfo() async {
    return await apiClient.getData(AppConstants.USER_INFO);
  }
}
