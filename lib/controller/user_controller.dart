import 'package:apiapp/model/user_model.dart';
import 'package:apiapp/service/api_get.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var userList = <Datum>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    isLoading(true);
    if (userList != null) {
      var user = await APiGet().getData();
      userList.value = user;
    }
    isLoading(false);
  }
}
