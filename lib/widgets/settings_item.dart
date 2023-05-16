import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
      child: SizedBox(
          height: 30.sp,
          child: ListTile(
              leading: Icon(
                icon,
                color: Colors.green,
              ),
              title: Text(
                name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500),
              ),
              trailing:  CircleAvatar(
                backgroundColor: Colors.green,
                radius: 13.sp,
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 16.sp,
                  color: Colors.white,
                ),
              ))),
    );
  }
}
