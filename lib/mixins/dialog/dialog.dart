import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_trial/mixins/network/error_handling.dart';

showSnackBar(message, {String textButton="", required Function() onButtonClick}) {
  String msg;
  var code = 0;
  if (message is ErrorHandling) {
    msg = message.message;
    code = message.code;
  } else {
    msg = message.toString();
  }
  Get.snackbar(
    "",
    "",
    titleText: Container(),
    padding: EdgeInsets.zero,
    messageText: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            child: Text(
              msg,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        if (code != 401 && textButton != null && textButton.isNotEmpty) ...[
          TextButton(
            onPressed: onButtonClick,
            child: Text(
              textButton,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ],
    ),
    snackPosition: SnackPosition.BOTTOM,
    snackStyle: SnackStyle.GROUNDED,
    margin: EdgeInsets.zero,
    backgroundColor: Colors.black,
    colorText: Colors.white,
    /*duration: Duration(seconds: 10)*/
  );
}