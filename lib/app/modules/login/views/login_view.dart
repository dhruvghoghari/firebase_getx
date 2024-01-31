import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/PrimaryButton.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController obj = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login View'),
        centerTitle: true,
      ),
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              PrimaryButton(
                btntext: "Login with Google",
                onClick: () {
                  obj.LoginwithGoogle();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
