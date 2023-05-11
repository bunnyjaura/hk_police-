import 'package:flutter/material.dart';
import 'package:hk_policestation_hq/screens/fresh_screen.dart';
import 'package:hk_policestation_hq/screens/history_screen.dart';
import 'package:hk_policestation_hq/screens/settings_screen.dart';
import 'package:hk_policestation_hq/widgets/home_items.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 45,),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/img_police.png'),
                  ),
                ),
                Text('chandigarh police headstation',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
              ],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeItem(ontap: () => Get.to(FreshScreen()),heading: 'Fresh Cases', image: 'assets/ic_fresh_cases.png',title: 'Fresh case',number: 2,),
              HomeItem(heading: 'Pending', image: 'assets/ic_pending.png',title: 'Pending case',number: 2,),
            ],
          ),
          SizedBox(height: 20,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeItem(heading: 'History', image: 'assets/ic_history.png',title: 'History case',number: 2,ontap:()=> Get.to(HistoryScreen()),),
              HomeItem(heading: 'Settings', image: 'assets/ic_settings.png',ontap: () => Get.to(SettingsScreen()),),
            ],
          ),
        ],
      ),
    );
  }
}