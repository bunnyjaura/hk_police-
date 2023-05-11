import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../style.dart';

class CurevedGreenButton extends StatelessWidget {
  GestureTapCallback? onTap;
  double radius;
  double height;
  double width;
  dynamic font;
  Color? buttonColor;
  CurevedGreenButton(
      {Key? key,
      required this.text,
      this.height = 55,
      this.width = 200,
      this.font = 16.00,
      this.onTap,
      this.radius = 30,
      this.buttonColor})
      : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
            ),
            color: buttonColor ?? Styles().themeGreen,),
        child: Text(
          text,
          style: TextStyle(
            color: Color(0xfff5f5f5),
            fontSize: font,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
