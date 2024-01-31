import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:uuid/uuid.dart';
import '../../../models/Userdata.dart';
import '../../../utils/theme.dart';


class HomeController extends GetxController {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobilNo = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController profile = TextEditingController();

  RxString selectedGender = 'Male'.obs;

  // Rx<ImagePicker> picker = ImagePicker().obs;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance; // firebase instance

  checkConnection() async {
    return await InternetConnectionChecker().hasConnection;
  }



  File? selectedfile;
  var isloading = false;

  Future<void> addToDoService() async {
    try {
      if (await checkConnection()) {
        Userdata userdata = Userdata(
          firstname: firstname.text,
          lastname: lastname.text,
          email: email.text,
          gender: selectedGender.value,
          mobile: mobilNo.text,
        );
        var response = await _firestore.collection('User').add(
          userdata.toJson(),
        );

        // toDoID = response.id;
        // todoMaster.toDoId = toDoID;
        await _firestore
            .collection('User')
            .doc(response.id)
            .update({"userId": response.id});
        //
        // Get.back();
        // Get.toNamed(Routes.toDoDetailsPage, arguments: todoMaster);
        // Get.find<ToDoController>().toDoData();
      }
      else
      {
        // Get.back();
        // getDisplayAlert('Alert', 'Please Check your internet connection');
      }
    }
    on FirebaseAuthException catch (err)
    {
      // Get.back();
      // await getDisplayAlert('Alert', err.message ?? '');

    }
  }

}
