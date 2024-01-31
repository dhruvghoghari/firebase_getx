import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../home/views/home_view.dart';
import '../../login/views/login_view.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('SplashView'),
            centerTitle: true,
          ),
          body: const Center(
            child: Text(
              "This is Splash Screen",
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
      },
    );
  }
}