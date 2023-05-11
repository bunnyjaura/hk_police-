import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/details_item.dart';

class DetailsScreen extends StatelessWidget {
  String title;
   DetailsScreen({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
  leading: InkWell(
    onTap: () => Get.back(),
    child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
  centerTitle: true,
  title: Text(title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 18),),
  elevation: 0,
  backgroundColor: Colors.transparent,
  actions: [
   Padding(
     padding: const EdgeInsets.all(16.0),
     child: Image.asset('assets/ic_home.png'),
   )
  ],
),
body: Center(child: Column(
  children: [
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Container(
        height: 150,
        width: 230,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/img_patient.jpg'),fit: BoxFit.fill),borderRadius: BorderRadius.circular(15),color: Colors.amber),
      ),
    ),
    DetailsItem(title: 'Details',isDropDown: true,dropDownItems: ['bunny','bunny','bjbu'],),
    
  ],
)),
    );
  }
}