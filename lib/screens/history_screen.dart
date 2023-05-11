import 'package:flutter/material.dart';
import 'package:hk_policestation_hq/widgets/history_item.dart';
import 'package:get/get.dart';
import '../widgets/not_found.dart';


class HistoryScreen extends StatelessWidget {
   HistoryScreen({super.key});

int items = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  leading: InkWell(
    onTap: () => Get.back(),
    child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
  centerTitle: true,
  title: Text('History',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 18),),
  elevation: 0,
  backgroundColor: Colors.transparent,
  actions: [
   Padding(
     padding: const EdgeInsets.all(16.0),
     child: Image.asset('assets/ic_home.png'),
   )
  ],
),
body: items == 0? NotFound() :ListView.builder(
  itemCount: items,
  itemBuilder: (BuildContext context, int index) {
    return HistoryItem(title: '4707023745',subtitle: 'asd',date: '2023-04-27',);
  },
),

    );
  }
}