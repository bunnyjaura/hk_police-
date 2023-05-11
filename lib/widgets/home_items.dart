import 'dart:ffi';

import 'package:flutter/material.dart';

class HomeItem extends StatelessWidget {
  String? title;
  int? number;
  String image;
  String heading;
  void Function()? ontap;


   HomeItem({super.key,
   required this.heading,
   required this.image,
    this.number,
    this.title,
    this.ontap
   });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
        height: 190,
        width: 180,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color.fromARGB(80, 158, 158, 158)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(number==null? '':'$title:',style: const TextStyle(color: Colors.red,fontWeight: FontWeight.w600),),
                Visibility(
                  visible: number==null? true:false,
                  child: SizedBox(height: 30,)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Visibility(
                    visible: number == null? false:true,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.green,foregroundColor: Colors.white,
                      child: Text('$number'),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Image.asset(image,height: 70,),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(heading,style: TextStyle(fontSize: 18,color: Colors.green,fontWeight: FontWeight.w600),),
            )
          ],
        ),
      ),
    );
  }
}