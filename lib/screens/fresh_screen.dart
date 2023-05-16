import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hk_policestation_hq/API.dart';
import 'package:hk_policestation_hq/widgets/fresh_item.dart';
import 'package:hk_policestation_hq/widgets/not_found.dart';

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
  abc() {
    Api().patientDetailsByPoliceSta().then((value) {
      data.value = value['details'];
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
            child: Image.asset('assets/ic_home.png'),
          )
        ],
      ),
      body: items == 0
          ? const NotFound()
          : ListView.builder(
              itemCount: items,
              itemBuilder: (BuildContext context, int index) {
                return Obx(() => FreshItem(
                      caseNo: data[index]['patient_no'],
                      date: data[index]['created'],
                      location: data[index]['patient_address'],
                    ));
              },
            ),
    );
  }
}
