import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hk_policestation_hq/screens/details_screen.dart';
import 'package:hk_policestation_hq/widgets/fresh_item.dart';
import 'package:hk_policestation_hq/widgets/not_found.dart';

class FreshScreen extends StatelessWidget {
  
   FreshScreen({super.key,});


int items = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
  leading: InkWell(
    onTap: () => Get.back(),
    child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
  centerTitle: true,
  title: Text('Fresh Cases',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 18),),
  elevation: 0,
  backgroundColor: Colors.transparent,
  actions: [
   Padding(
     padding: const EdgeInsets.all(16.0),
     child: Image.asset('assets/ic_home.png'),
   )
  ],
),
body: items == 0? NotFound(): ListView.builder(
  itemCount: items,
  itemBuilder: (BuildContext context, int index) {
    return FreshItem(caseNo: '23',date: 'fdf',location: 'fdsf',);
  },
),
    );
  }
}