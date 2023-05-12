import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hk_policestation_hq/API.dart';
import 'package:hk_policestation_hq/controllers/Controllers.dart';
import 'package:hk_policestation_hq/screens/settings/about.dart';
import 'package:hk_policestation_hq/screens/settings/help.dart';
import 'package:hk_policestation_hq/screens/settings/manage_police_station.dart';
import 'package:hk_policestation_hq/screens/settings/profile_screen.dart';
import 'package:hk_policestation_hq/screens/settings/terms.dart';
import 'package:hk_policestation_hq/screens/splashScreen.dart';

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

  Map i = {
    0: {
      "name": "My Profile",
      "icon": Icons.person,
      "to": const ProfileScreen(),
    },
    1: {
      "name": "Manage Police station ",
      "icon": Icons.local_post_office,
      "to": const ManagePoliceStation(),
    },
    2: {
      "name": "About",
      "icon": Icons.note_add,
      "to": const AboutScreen(),
    },
    3: {
      "name": "Help",
      "icon": Icons.help,
      "to": const HelpScreen(),
    },
    4: {
      "name": "Terms & Conditions",
      "icon": Icons.confirmation_num,
      "to": const TermsScreen(),
    },
    5: {
      "name": "Logout",
      "icon": Icons.logout,
      "to": const ProfileScreen(),
    },
  };
  final box = GetStorage();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
  leading: InkWell(
    onTap: () => Get.back(),
    child: const Icon(Icons.arrow_back_ios,color: Colors.black,)),
  centerTitle: true,
  title: const Text('Settings',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 18),),
  elevation: 0,
  backgroundColor: Colors.transparent,
  actions: [
   Padding(
     padding: const EdgeInsets.all(16.0),
     child: Image.asset('assets/ic_home.png'),
   )
  ],
),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/ic_hospital.png',
                      ),
                      radius: 20,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '${Controllers().userFetchData.name}',
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      Text('${Controllers().userFetchData.address}',
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w100)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return SettingsItem(
                    name: names[index],
                    icon: icons[index],
                    ontap: () => Get.to(i[index]["to"]),
                  );
                },
              ),
            ),
            SettingsItem(
                name: i[5]['name'],
                icon: i[5]['icon'],
                ontap: () {
                  Api().logout().whenComplete(() => null).then((value) {
                    box.erase();
                    Get.offAll(const SplashScreen());
                  });
                })
          ],
        ),
      ),
    );
  }
}
