import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hk_policestation_hq/API.dart';
import 'package:hk_policestation_hq/widgets/history_item.dart';

import '../widgets/not_found.dart';
import 'home_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  RxList data = [].obs;
  int items = 1;
  abc() {
    Api().policeStationHeadCase_History().then((value1) {
      data.value = value1['details'];
      print(data);
    });
  }

  @override
  void initState() {
    abc();
    super.initState();
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
          'History',
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
      body: data.value == null
          ? const NotFound()
          : Obx(() => ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return HistoryItem(
                    img: data.value[index]['image'],
                    title: data.value[index]['patient_no'],
                    subtitle: data.value[index]['patient_address'],
                    date: data.value[index]['created'],
                    data: data[index],
                  );
                },
              )),
    );
  }
}
