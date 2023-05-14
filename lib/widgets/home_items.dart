import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeItem extends StatelessWidget {
  String? title;
  var number;
  String image;
  String heading;
  void Function()? ontap;


   HomeItem({super.key,
   required this.heading,
   required this.image,
    this.number,
    this.title,
    this.ontap
   });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            
            padding:  EdgeInsets.symmetric(horizontal: 15.sp,vertical: 20.sp),
            height: 56.sp,
            width: 42.w,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: const Color.fromARGB(80, 158, 158, 158)),
            child: Column(
             // crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(number==null? '':'$title:',style:   TextStyle(color: Colors.red,fontWeight: FontWeight.w600,fontSize: 16.sp),),
                  ],
                ),
                // Visibility(
                //   visible: number==null? true:false,
                //   child: const SizedBox(height: 30,)),
                
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Image.asset(image,height: 33.sp,),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(heading,style:  TextStyle(fontSize: 16.sp,color: Colors.green,fontWeight: FontWeight.w600),),
                )
              ],
            ),
          ),
          Padding(
                  padding:  EdgeInsets.symmetric(vertical: 18.sp,horizontal: 20.sp),
                  child: Visibility(
                    visible: number == null? false:true,
                    child: CircleAvatar(
                      radius: 15.sp,
                      backgroundColor: Colors.green,foregroundColor: Colors.white,
                      child: Text('$number'),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}