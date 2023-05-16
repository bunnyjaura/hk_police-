import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hk_policestation_hq/screens/details_screen.dart';
import 'package:hk_policestation_hq/style.dart';

class FreshItem extends StatelessWidget {
  String caseNo;
  String date;
  String location;

  FreshItem({
    super.key,
    required this.caseNo,
    required this.date,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  blurRadius: 5,
                  spreadRadius: 4,
                  offset: Offset(-1, 4),
                  color: Color.fromARGB(20, 0, 0, 0))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'Case No: ',
                        style: TextStyle(
                            color: Styles().themeGreen,
                            fontWeight: FontWeight.w700)),
                    TextSpan(
                        text: caseNo,
                        style: const TextStyle(
                          color: Colors.black,
                        )),
                  ])),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'Date: ',
                        style: TextStyle(
                            color: Styles().themeGreen,
                            fontWeight: FontWeight.w700)),
                    TextSpan(
                        text: date,
                        style: const TextStyle(color: Colors.black)),
                  ])),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Location: ',
                    style: TextStyle(
                        color: Styles().themeGreen,
                        fontWeight: FontWeight.w700)),
                TextSpan(
                    text: location,
                    style: const TextStyle(color: Colors.black)),
              ])),
            ),
            Divider(
              color: Styles().themeGreen,
              thickness: 1,
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: InkWell(
                onTap: () => Get.to(DetailsScreen(
                  title: caseNo,
                  img: '',
                )),
                child: Container(
                  height: 35,
                  width: 90,
                  decoration: BoxDecoration(
                      color: Styles().themeGreen,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                      child: Text(
                    'Details',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
