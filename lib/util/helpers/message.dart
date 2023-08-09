
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
class Message {

  Message.noConnectionMessage(){
    if(!Get.isSnackbarOpen) {
      Get.showSnackbar(
        GetSnackBar(
          title: 'NoInternetConnection'.tr,
          message: 'PleaseCheckYourInternetConnection'.tr,
          isDismissible: true,
          duration: Duration(milliseconds: 3000),
          backgroundColor: Color(0xff191919),
          borderRadius: 10,
          margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
        ),
      );
    }
  }

  Message.errorMessageSnackBar(String? title, String? message){
    if(!Get.isSnackbarOpen) {

      if(title == "ERROR") {
        title = 'Error'.tr;
      }

      Get.showSnackbar(
        GetSnackBar(
          //title: title ?? 'Oops'.tr,
          message: message ?? 'SomethingWentWrongPleaseTryAgain'.tr,
          isDismissible: true,
          duration: const Duration(milliseconds: 5000),
          backgroundColor: const Color(0xff191919),
          borderRadius: 10,
          margin: const EdgeInsets.fromLTRB(5, 0, 5, 5),
        ),
      );
    }
  }

  Message.successMessageSnackBar(String? title, String? message){

    if(title == "SUCCESS") {
      title = 'Success'.tr;
    }

    Get.showSnackbar(
      GetSnackBar(
        title: title ?? 'Done'.tr,
        message: message ?? 'TheOperationHasCompletedSuccessfully'.tr,
        isDismissible: true,
        duration: const Duration(milliseconds: 5000),
        backgroundColor: const Color(0xff191919),
        borderRadius: 10,
        margin: const EdgeInsets.fromLTRB(5, 0, 5, 5),
      ),
    );
  }

  Message.toast(String message, {int duration = 5000}){
    Get.showSnackbar(
      GetSnackBar(
        message: message,
        isDismissible: true,
        duration: Duration(milliseconds: duration),
        backgroundColor: const Color(0xff191919),
        borderRadius: 10,
        margin: const EdgeInsets.fromLTRB(5, 0, 5, 5),
      ),
    );
  }
}