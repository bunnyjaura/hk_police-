import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hk_policestation_hq/API.dart';
import 'package:hk_policestation_hq/controllers/Controllers.dart';
import 'package:hk_policestation_hq/screens/settings/about.dart';
import 'package:hk_policestation_hq/screens/settings/help.dart';
import 'package:hk_policestation_hq/screens/settings/manage_police_station.dart';
import 'package:hk_policestation_hq/screens/settings/profile_screen.dart';
import 'package:hk_policestation_hq/screens/settings/terms.dart';

import '../widgets/settings_item.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  List<String> names = [
    'My Profile',
    'Manage Police station ',
    'About',
    'Help',
    'Terms & Conditions',
    'Logout'
  ];
  List<IconData> icons = [
    Icons.person,
    Icons.local_post_office,
    Icons.note_add,
    Icons.help,
    Icons.confirmation_num,
    Icons.logout,
  ];
  List<void Function()?> ontaps = [
    () {
      Get.to(ProfileScreen());
    },
    () {
      Get.to(ProfileScreen());
    },
    () {
      Get.to(ProfileScreen());
    },
    () {
      Get.to(ProfileScreen());
    },
    () {
      Get.to(ProfileScreen());
    },
    () {
      Get.to(ProfileScreen());
    },
    // Get.to(ManagePoliceStation()),
    // Get.to(AboutScreen()),
    // Get.to(HelpScreen()),
    // Get.to(TermsScreen()),
    // Api().logout().whenComplete(() => null).then((value) {
    //   print(value);
    // }
    // )
  ];
  Map i = {
    0: {
      "nmae": "kok",
      "icon": Icons.help,
      "onTAp": Get.to(ProfileScreen()),
    }
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        title: Center(
            child: Text(
          'Settings',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/ic_home.png',
              height: 20,
              width: 20,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/ic_hospital.png'),
                      radius: 20,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '${Controllers().userFetchData.name}',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      Text('${Controllers().userFetchData.address}',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w100)),
                    ],
                  ),
                ],
              ),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return SettingsItem(
                      name: names[index],
                      icon: icons[index],
                      ontap: () => ontaps[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
