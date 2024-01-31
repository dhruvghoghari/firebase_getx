import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../home/views/home_view.dart';
import '../views/login_view.dart';

  class LoginController extends GetxController {


    RxString name = "".obs;
    RxString email = "".obs;
    RxString photo = "".obs;
    RxString googleid = "".obs;

    getalldata() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      name.value = prefs.getString("name") ?? "";
      email.value = prefs.getString("email") ?? "";
      photo.value = prefs.getString("photo") ?? "";
      googleid.value = prefs.getString("googleid") ?? "";
    }
    @override
    void onInit() {
      super.onInit();
      getalldata();
    }



    LoginwithGoogle() async
  {
    final FirebaseAuth auth = FirebaseAuth.instance;

    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);


      UserCredential result = await auth.signInWithCredential(authCredential);
      User user = result!.user!;

      var name = user.displayName.toString();
      var email = user.email.toString();
      var photo = user.photoURL.toString();
      var googleid = user.uid.toString();

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("name", name);
      prefs.setString("islogin", "yes");
      prefs.setString("email", email);
      prefs.setString("photo", photo);
      prefs.setString("googleid", googleid);

     Get.to(HomeView());
    }
  }


}