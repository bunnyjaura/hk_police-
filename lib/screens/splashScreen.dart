import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hk_policestation_hq/controllers/Controllers.dart';
import 'package:hk_policestation_hq/screens/home_screen.dart';
import 'package:hk_policestation_hq/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final box = GetStorage();
  void navToLogin() {
    Future.delayed(Duration(seconds: 2)).whenComplete(() {
      var value = box.read('userData');
      if (value != null) {
        Controllers().userPutData.id = value['details']['id'];
        Controllers().userPutData.name = value['details']['name'];
        Controllers().userPutData.email = value['details']['email'];
        Controllers().userPutData.password = value['details']['password'];
        Controllers().userPutData.phone = value['details']['phone'];
        Controllers().userPutData.address = value['details']['address'];
        Controllers().userPutData.image = value['details']['image'];
        Controllers().userPutData.device_type = value['details']['device_type'];
        Controllers().userPutData.login_type = value['details']['login_type'];
        Controllers().userPutData.latitude = value['details']['latitude'];
        Controllers().userPutData.longitude = value['details']['longitude'];
        Controllers().userPutData.reg_id = value['details']['reg_id'];
        Controllers().userPutData.EmailOtp = value['details']['EmailOtp'];
        Controllers().userPutData.created = value['details']['created'];
        Controllers().userPutData.updated = value['details']['updated'];
      }
      value == null ? Get.to(LoginScreen()) : Get.to(HomeScreen());
    });
  }

  @override
  void initState() {
    navToLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
          child: Image.asset(
        'assets/img_health_kangaroo_logo.png',
        height: 120,
      )),
    );
  }
}
