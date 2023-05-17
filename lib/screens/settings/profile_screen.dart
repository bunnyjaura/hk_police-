import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        centerTitle: true,
        title: const Text(
          'My Profile',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18),
        ),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/ic_edit_profile.png'),
              ),
            ),
          ),
          const Text(
            'Chandigarh Police Station',
            style: TextStyle(color: Color.fromARGB(162, 0, 0, 0)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 30, bottom: 10),
            child: Row(
              children: const [
                Text(
                  'Mobile No.',
                  style: TextStyle(color: Color.fromARGB(162, 0, 0, 0)),
                ),
              ],
            ),
          ),
          Container(
            height: 33,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(15),
              border: Border.all(color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 10, bottom: 10),
            child: Row(
              children: const [
                Text(
                  'Email',
                  style: TextStyle(color: Color.fromARGB(162, 0, 0, 0)),
                ),
              ],
            ),
          ),
          Container(
            height: 33,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(15),
              border: Border.all(color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              child: InkWell(
                child: const Text(
                  'Change Password',
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  showAlertDialog(context);
                },
                // onPressed: () {
                //   showAlertDialog(context);
                // },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = ElevatedButton(
    child: const Text("Submit"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Change password"),
    content: const Text("Create New Password"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
