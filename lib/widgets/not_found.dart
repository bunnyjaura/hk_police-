import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      child: Image.asset('assets/not_found.png',height: 100,),
    ));
  }
}