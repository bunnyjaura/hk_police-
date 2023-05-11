import 'dart:convert';
import 'package:get/get.dart' as g;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
class Api {
  String url =
      "http://3.128.57.77/app/healthKangaroo/index.php/api/Hospital/";

  var dio = Dio();

  Future<dynamic> login({
    required String username,
    required String pass,
  
  }) async {
   
    var data;
    var formdata = FormData.fromMap({
      'username': username,
      'password': pass,
    
      'reg_id': '',
      'device_type': '',
      'latitude': '',
      'longitude': ''
    });

    Response response = await dio.post('${url}login', data: formdata);

    if (response.statusCode == 200) {
      data = jsonDecode(response.data) as Map;
      if (data["message"] == "login successfully") {
        return data;
      }
      if (data["message"] == "Invalid password and username!") {
        g.Get.snackbar('Error', "Invalid password and username!",
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: g.SnackPosition.BOTTOM);
      }
    } else {
      g.Get.snackbar('Error', 'Something went wrong',
      snackPosition: g.SnackPosition.BOTTOM,
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}
