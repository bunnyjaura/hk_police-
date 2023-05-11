import 'package:flutter/material.dart';


class HistoryItem extends StatelessWidget {
  String title;
  String subtitle;
  String date;
   HistoryItem({super.key,
   required this.date,required this.subtitle,required this.title
   });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: 105,
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15),boxShadow: [
          BoxShadow(blurRadius: 5,spreadRadius: 4,offset: Offset(-1, 4),color: Color.fromARGB(20, 0, 0, 0))
        ]
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/img_police.png'),
              ),
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,style: TextStyle(fontWeight: FontWeight.w700),),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(subtitle,style: TextStyle(color: Colors.grey,fontSize: 12),),
                ),
                Text(date,style: TextStyle(color: Colors.grey),),
              ],
            )
          ],
        ),
      ),
    );
  }
}