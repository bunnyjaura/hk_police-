import 'package:flutter/material.dart';


import '../widgets/settings_item.dart';

class SettingsScreen extends StatelessWidget {
  
SettingsScreen({super.key});
List a = [
    'My Profile',
    'Manage Police station ',
    'About',
    'Help',
    'Terms & Conditions',
    'Logout'
  ];
  List<IconData> i = [
    Icons.person,
    Icons.local_post_office,
    Icons.note_add,
    Icons.help,
    Icons.confirmation_num,
    Icons.logout,
  ];

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
                        'Ambala Police Headstation',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      Text('Chandigarh',
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
                  itemBuilder: (context, index) {
                    return SettingsItem(
                      icon: i[index],
                      name: a[index],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
