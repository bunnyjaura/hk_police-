import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hk_policestation_hq/API.dart';
import 'package:hk_policestation_hq/widgets/fresh_item.dart';

import '../controllers/Controllers.dart';
import 'home_screen.dart';

class FreshScreen extends StatefulWidget {
  const FreshScreen({
    super.key,
  });

  @override
  State<FreshScreen> createState() => _FreshScreenState();
}

var data = [].obs;

class _FreshScreenState extends State<FreshScreen> {
  int items = 2;

  Future<void> abc() async {
    Api().patientDetailsByPoliceSta();
    await Future.delayed(const Duration(seconds: 1));
    data.value =
        Controllers().userFetchData.patientDetailsByPoliceSta.value.obs;
    print(data.value);
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
        body: Obx(
          () => data.value.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return FreshItem(
                      data: data.value[index],
                      //data1: data1.value[0],
                      caseNo: data.value[index]['patient_no'],
                      date: data.value[index]['created'],
                      location: data.value[index]['patient_address'],
                    );
                  },
                ),
        ));
  }
}
