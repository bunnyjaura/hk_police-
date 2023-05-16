import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hk_policestation_hq/API.dart';
import 'package:hk_policestation_hq/widgets/fresh_item.dart';
import 'package:hk_policestation_hq/widgets/not_found.dart';

import 'home_screen.dart';

class FreshScreen extends StatefulWidget {
  const FreshScreen({
    super.key,
  });

  @override
  State<FreshScreen> createState() => _FreshScreenState();
}

class _FreshScreenState extends State<FreshScreen> {
  int items = 2;
  var data = [].obs;
  var data1 = [].obs;
  abc() async{
    Api().patientDetailsByPoliceSta().then((value) {
      data.value = value['details'];

      print(data.value);
      Api().get_policeStationlist().then((value) {
        print(value);
       data1.value = value['details'];
   });
    });
  }


  @override
  void initState() {
    super.initState();
    abc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        centerTitle: true,
        title: const Text(
          'Fresh Cases',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
      onTap: () => Get.off(const HomeScreen()),
      child: Image.asset('assets/ic_home.png')),
          )
        ],
      ),
      body:( data1 == null)
          ? const NotFound()
          : Obx(() => ListView.builder(
              itemCount: data.value.length,
              itemBuilder: (BuildContext context, int index) {
                return FreshItem(
                  data: data.value[index],
                  data1: data1.value[0],
                      caseNo: data.value[index]['patient_no'],
                      date: data.value[index]['created'],
                      location: data.value[index]['patient_address'],
                    );
              },
            ),)
    );
  }
}
