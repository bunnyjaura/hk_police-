import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hk_policestation_hq/API.dart';
import 'package:hk_policestation_hq/controllers/Controllers.dart';
import 'package:hk_policestation_hq/screens/fresh_screen.dart';
import 'package:hk_policestation_hq/screens/history_screen.dart';
import 'package:hk_policestation_hq/screens/settings_screen.dart';
import 'package:hk_policestation_hq/widgets/home_items.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final box = GetStorage();
  abc() {
    Api().policeStationHeadTotalCase().then((value) {
      /*  Fresh_count
Pending_count
History_count */
      print(value);
      //box.write(, value);
      if (value['message'] == "Details found successfuly") {
        Controllers().userPutData.Fresh_count.value = value['Fresh_count'];
        Controllers().userPutData.Pending_count.value = value['Pending_count'];
        Controllers().userPutData.History_count.value = value['History_count'];
      }
      print(Controllers().userFetchData.Pending_count.value);
    });
  }

  @override
  void initState() {
    super.initState();
    abc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 27.sp, bottom: 25.sp, left: 15.sp),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.sp),
                  child: CircleAvatar(
                    radius: 25.sp,
                    backgroundImage: const AssetImage('assets/img_police.png'),
                  ),
                ),
                Text(
                  '${Controllers().userFetchData.name}',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Obx(
                () => HomeItem(
                  ontap: () => Get.to(FreshScreen()),
                  heading: 'Fresh Cases',
                  image: 'assets/ic_fresh_cases.png',
                  title: 'Fresh case',
                  number: Controllers().userFetchData.Fresh_count.value,
                ),
              ),
              Obx(
                () => HomeItem(
                  heading: 'Pending',
                  image: 'assets/ic_pending.png',
                  title: 'Pending case',
                  number: Controllers().userFetchData.Pending_count.value,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Obx(() => HomeItem(
                    heading: 'History',
                    image: 'assets/ic_history.png',
                    title: 'History case',
                    number: Controllers().userFetchData.History_count.value,
                    ontap: () => Get.to(HistoryScreen()),
                  )),
              HomeItem(
                heading: 'Settings',
                image: 'assets/ic_settings.png',
                ontap: () => Get.to(SettingsScreen()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
