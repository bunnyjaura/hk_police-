import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  String name;
  IconData icon;
  void Function()? ontap;
  SettingsItem(
      {super.key, required this.name, required this.icon, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          height: 60,
          child: ListTile(
              leading: Icon(
                icon,
                color: Colors.green,
              ),
              title: Text(
                name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              trailing: CircleAvatar(
                backgroundColor: Colors.green,
                radius: 13,
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: Colors.white,
                ),
              ))),
    );
  }
}
