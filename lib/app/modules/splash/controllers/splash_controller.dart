import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../home/views/home_view.dart';
import '../../login/views/login_view.dart';

class SplashController extends GetxController
{

  @override
  void onInit() {
    super.onInit();
    logindata();
  }

  logindata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("islogin")) {
      Get.off(() => HomeView());
    } else {
      Get.off(() => LoginView());
    }
  }
}


