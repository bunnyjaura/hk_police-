import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/details_item.dart';

class DetailsScreen extends StatelessWidget {
  String title;
  String img;
  DetailsScreen({super.key, required this.title, required this.img});

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
        title: Text(
          title,
          style: const TextStyle(
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
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  img,
                  height: 160,
                  fit: BoxFit.fitHeight,
                )),
          ),
          DetailsItem(
            title: 'Details',
            isDropDown: true,
            dropDownItems: const ['a', 'b', 'c', 'd'],
          ),
        ],
      )),
    );
  }
}
