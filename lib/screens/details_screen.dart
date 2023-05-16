import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hk_policestation_hq/widgets/details_item.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetailsScreen extends StatefulWidget {
  String title;
  String img;
  var data;
  DetailsScreen({super.key, required this.title, required this.img, this.data});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  // abc() {
  //   Api().policeStationHeadCase_History().then((value) {
  //   setState(() {
  //       data = value['details'];
  //   });
  //   print(widget.data);
  //     print(data);
  //   });
  // }

  @override
  void initState() {
    super.initState();
    print(widget.data);

    // abc();
  }

  List<String> items = [
    'Details',
    'Doctor Name',
    'Hospital',
    'Ambulance No',
    'Driver Name',
    'Policemen Name',
    'Police Station Name',
    'Place Of Accident',
    'Police Report'
  ];

  @override
  Widget build(BuildContext context) {
    List details = [
      widget.data['patient_details'],
      widget.data['doctor_id'],
      widget.data['hospitalName'],
      widget.data['ambulance_number'],
      widget.data['driver_name'],
      widget.data['SHO_name'],
      widget.data['policeStation_Name'],
      widget.data['patient_address'],
      widget.data['report'],
    ];
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
          widget.title,
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
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    widget.img,
                    height: 160,
                    fit: BoxFit.fitHeight,
                  )),
            ),
            widget.data == null
                ? const CircularProgressIndicator()
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return DetailsItem(
                          title: items[index],
                          subtitle: details[index],
                          isDropDown: false);
                    },
                  ),
            SizedBox(
              height: 25.sp,
            )
          ],
        )),
      ),
    );
  }
}
