import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hk_policestation_hq/screens/splashScreen.dart';
import 'package:hk_policestation_hq/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Styles().themeGreen

      ),
      child: ResponsiveSizer(
builder: (context, orientation, screenType)
         { return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            
            primarySwatch: Colors.blue,
          ),
          home:  const SplashScreen(),
        );}
      ),
    );
  }
}
