import 'dart:convert';

import 'package:get/get.dart' as g;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {
  String url =
      "http://3.128.57.77/app/healthKangaroo/index.php/api/PoliceHeadquarter/";

  var dio = Dio();

  //login
  Future<dynamic> login({
    required String username,
    required String pass,
  }) async {
    var data;
    var formdata = FormData.fromMap({
      'emailPhone': username,
      'password': pass,
      'reg_id': '',
    });

    Response response = await dio.post('${url}login', data: formdata);

    if (response.statusCode == 200) {
      data = jsonDecode(response.data) as Map;

      return data;
    } else {
      g.Get.snackbar('Error', 'Something went wrong',
          snackPosition: g.SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  //validate_email

  Future<dynamic> validate_Email() async {
    print("validate_Email called");
    var data;
    var formdata = FormData.fromMap({
      'email': 'email',
    });

    Response response = await dio.post('${url}validate_Email', data: formdata);

    if (response.statusCode == 200) {
      data = jsonDecode(response.data) as Map;
      return data;
    } else {
      g.Get.snackbar('Error', 'Something went wrong',
          snackPosition: g.SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  //forgotPassword
  Future<dynamic> forgotPassword() async {
    print("forgotPassword called");
    var data;
    var formdata = FormData.fromMap({
      'email': 'email',
      'password': 'password',
    });

    Response response = await dio.post('${url}forgotPassword', data: formdata);

    if (response.statusCode == 200) {
      data = jsonDecode(response.data) as Map;
      return data;
    } else {
      g.Get.snackbar('Error', 'Something went wrong',
          snackPosition: g.SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  //logout
  Future<dynamic> logout() async {
    print("logout called");
    var data;
    var formdata = FormData.fromMap({
      'id': 'id',
    });

    Response response = await dio.post('${url}logout', data: formdata);

    if (response.statusCode == 200) {
      data = jsonDecode(response.data) as Map;
      return data;
    } else {
      g.Get.snackbar('Error', 'Something went wrong',
          snackPosition: g.SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  //ChangePassword
  Future<dynamic> ChangePassword() async {
    print("ChangePassword called");
    var data;
    var formdata = FormData.fromMap({
      'id': 'id',
      'OldPassword': 'OldPassword',
      'NewPassword': 'NewPassword',
    });

    Response response = await dio.post('${url}ChangePassword', data: formdata);

    if (response.statusCode == 200) {
      data = jsonDecode(response.data) as Map;
      return data;
    } else {
      g.Get.snackbar('Error', 'Something went wrong',
          snackPosition: g.SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  //update_policeheadquater
  Future<dynamic> update_policeheadquater() async {
    print("update_policeheadquater called");
    var data;
    var formdata = FormData.fromMap({
      'email': 'email',
      'phone': 'phone',
      'image': 'image',
    });

    Response response =
        await dio.post('${url}update_policeheadquater', data: formdata);

    if (response.statusCode == 200) {
      data = jsonDecode(response.data) as Map;
      return data;
    } else {
      g.Get.snackbar('Error', 'Something went wrong',
          snackPosition: g.SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  //add_policesStation
  Future<dynamic> add_policesStation() async {
    print("add_policesStation called");
    var data;
    var formdata = FormData.fromMap({
      'email': 'email',
      'password': 'password',
      'address': 'address',
    });

    Response response =
        await dio.post('${url}add_policeStation', data: formdata);

    if (response.statusCode == 200) {
      data = jsonDecode(response.data) as Map;
      return data;
    } else {
      g.Get.snackbar('Error', 'Something went wrong',
          snackPosition: g.SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  //get_policeStationlist
  Future<dynamic> get_policeStationlist() async {
    print("get_policeStationlist called");
    var data;
    var formdata = FormData.fromMap({
      'hq_id': 'hq-id',
      'address': 'address',
    });

    Response response =
        await dio.post('${url}get_policeStationlist', data: formdata);

    if (response.statusCode == 200) {
      data = jsonDecode(response.data) as Map;
      return data;
    } else {
      g.Get.snackbar('Error', 'Something went wrong',
          snackPosition: g.SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  //delete_police_Station
  Future<dynamic> delete_police_Station() async {
    print("delete_police_Station called");
    var data;
    var formdata = FormData.fromMap({
      'hq_id': 'hq-id',
      'address': 'address',
    });

    Response response =
        await dio.post('${url}delete_police_Station', data: formdata);

    if (response.statusCode == 200) {
      data = jsonDecode(response.data) as Map;
      return data;
    } else {
      g.Get.snackbar('Error', 'Something went wrong',
          snackPosition: g.SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

//update_policeStation
  Future<dynamic> update_policeStation() async {
    print("update_policeStation called");
    var data;
    var formdata = FormData.fromMap({
      'password': 'password',
      'address': 'address',
      'image': 'image',
    });

    Response response =
        await dio.post('${url}update_policeStation', data: formdata);

    if (response.statusCode == 200) {
      data = jsonDecode(response.data) as Map;
      return data;
    } else {
      g.Get.snackbar('Error', 'Something went wrong',
          snackPosition: g.SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

//patientDetailsByPoliceSta
  Future<dynamic> patientDetailsByPoliceSta() async {
    print("patientDetailsByPoliceSta called");
    var data;
    var formdata = FormData.fromMap({
      'policeheadquaterId': 'policeheadquaterId',
      'address': 'address',
    });

    Response response =
        await dio.post('${url}patientDetailsByPoliceSta', data: formdata);

    if (response.statusCode == 200) {
      data = jsonDecode(response.data) as Map;
      return data;
    } else {
      g.Get.snackbar('Error', 'Something went wrong',
          snackPosition: g.SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  //assignCaseToPoliceStation

  Future<dynamic> assignCaseToPoliceStation() async {
    print("assignCaseToPoliceStation called");
    var data;
    var formdata = FormData.fromMap({
      'policeStationId': 'policeStationId',
      'name': 'name',
      'address': 'address',
    });

    Response response =
        await dio.post('${url}assignCaseToPoliceStation', data: formdata);

    if (response.statusCode == 200) {
      data = jsonDecode(response.data) as Map;
      return data;
    } else {
      g.Get.snackbar('Error', 'Something went wrong',
          snackPosition: g.SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  //completePoliceStationAssignCase

  Future<dynamic> completePoliceStationAssignCase() async {
    print("completePoliceStationAssignCase called");
    var data;
    var formdata = FormData.fromMap({
      'policeStationId': 'policeStationId',
      'name': 'name',
      'address': 'address',
    });

    Response response =
        await dio.post('${url}completePoliceStationAssignCase', data: formdata);

    if (response.statusCode == 200) {
      data = jsonDecode(response.data) as Map;
      return data;
    } else {
      g.Get.snackbar('Error', 'Something went wrong',
          snackPosition: g.SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  //policeStationHeadCase_History
  Future<dynamic> policeStationHeadCase_History() async {
    print("policeStationHeadCase_History called");
    var data;
    var formdata = FormData.fromMap({
      'hq_id': 'hq-id',
      'address': 'address',
    });

    Response response =
        await dio.post('${url}policeStationHeadCase_History', data: formdata);

    if (response.statusCode == 200) {
      data = jsonDecode(response.data) as Map;
      return data;
    } else {
      g.Get.snackbar('Error', 'Something went wrong',
          snackPosition: g.SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
  //policeStationHeadTotalCase

  Future<dynamic> policeStationHeadTotalCase() async {
    print("policeStationHeadTotalCase called");
    var data;
    var formdata = FormData.fromMap({
      'policeStationId': 'policeStationId',
      'address': 'address',
    });

    Response response =
        await dio.post('${url}policeStationHeadTotalCase', data: formdata);

    if (response.statusCode == 200) {
      data = jsonDecode(response.data) as Map;
      return data;
    } else {
      g.Get.snackbar('Error', 'Something went wrong',
          snackPosition: g.SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
}
