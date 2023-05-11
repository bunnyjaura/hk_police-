import 'package:flutter/material.dart';

import '../style.dart';




class TextfieldPrefixIcon extends StatefulWidget {
  //const name({super.key});
  TextEditingController controller;
  String hintText;
  bool obscureText;
  bool boolonTap;
  IconData? icon;
  TextfieldPrefixIcon(
      {required this.controller,
      this.obscureText = false,
      required this.hintText,
      required this.icon,
      this.boolonTap = false});

  @override
  State<TextfieldPrefixIcon> createState() => _TextfieldPrefixIconState();
}

class _TextfieldPrefixIconState extends State<TextfieldPrefixIcon> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        style: const TextStyle(fontSize: 20),
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintStyle: const TextStyle(fontSize: 16),
          hintText: widget.hintText,
       
          suffixIcon: widget.boolonTap
              ? InkWell(
                  onTap: () {
                    if (widget.boolonTap) {
                      print(widget.obscureText);
                      setState(() {
                        widget.obscureText = !widget.obscureText;
                      });
                    }
                  },
                  child: Icon(
                    widget.obscureText
                        ? Icons.visibility_off
                        : Icons.remove_red_eye,
                    color: widget.obscureText ? Colors.black26 : Colors.black,
                  ))
              : null,
          prefixIcon: Icon(
            widget.icon,
            color: Styles().themeGreen,
            size: 35,
          ),
          border: InputBorder.none,
        ));
  }
}
