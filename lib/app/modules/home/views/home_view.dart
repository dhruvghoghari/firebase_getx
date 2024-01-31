import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/theme.dart';
import '../../../widgets/PrimaryButton.dart';
import '../../login/controllers/login_controller.dart';
import '../../splash/views/splash_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    HomeController homeObj = Get.put(HomeController());
    LoginController loginObj = Get.put(LoginController());

    return Obx(() =>  Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  child: Image.network(Uri.encodeFull(loginObj.photo.value)),
                ),
                accountName: Text("Name :- ${loginObj.name.value}"),
                accountEmail: Text("Email :- ${loginObj.email.value}"),
              ),
              ListTile(
                title: Text("User id :- ${loginObj.googleid.value}",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.clear();

                GoogleSignIn googleSignIn = GoogleSignIn(); // Google logout
                googleSignIn.signOut();

                Get.to(SplashView());
              },
            ),
          ],
        ),
        body:SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 80.0,
                      backgroundColor: Colors.transparent,
                      child: ClipOval(
                        child: Image.asset("assets/img/bird.png",
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.photo_library),
                            onPressed: () async{
                              // final XFile? photo = await picker.pickImage(source: ImageSource.gallery);
                              // setState(() {
                              //   selectedfile = File(photo!.path);
                              // });

                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: homeObj.firstname,
                    keyboardType: TextInputType.text,
                   decoration: AppTheme.customDecoration("First Name"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: homeObj.lastname,
                    keyboardType: TextInputType.text,
                    decoration: AppTheme.customDecoration("Last Name"),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: homeObj.email,
                    keyboardType: TextInputType.emailAddress,
                   decoration: AppTheme.customDecoration("Email Id"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: homeObj.mobilNo,
                    keyboardType: TextInputType.number,
                    decoration: AppTheme.customDecoration("Mobile No"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<String>(
                    value: homeObj.selectedGender.value,
                    onChanged: (String? newValue) {
                      homeObj.selectedGender.value = newValue!;
                    },
                    items: <String>['', 'Male', 'Female'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value.isNotEmpty ? value : 'Select Gender',style: TextStyle(color: Colors.grey),),
                      );
                    }).toList(),
                    decoration: AppTheme.customDecoration("hintText")
                  ),
                ),
                PrimaryButton(
                    btntext: "Submit",
                    onClick: () async{
                       await homeObj.addToDoService();
                    })
              ],
            ),
          ),
        )
    ));
  }
}
