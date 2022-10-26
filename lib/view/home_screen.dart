import 'package:apiapp/controller/user_controller.dart';
import 'package:apiapp/service/api_get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                child: Text('data'),
                onPressed: () {
                  APiGet().getData();
                },
              ),
            ),
            SizedBox(
              child: Obx(() {
                if (userController.isLoading.value)
                  return CircularProgressIndicator();

                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: userController.userList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              userController.userList[index].avatar),
                        ),
                        subtitle: Text(userController.userList[index].email),
                        title: Text(userController.userList[index].firstName),
                      );
                    });
              }),
            )
          ],
        ),
      ),
    );
  }
}
