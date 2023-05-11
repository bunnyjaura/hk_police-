import 'package:flutter/material.dart';


class DetailsItem extends StatefulWidget {
  String title;
  String? subtitle;
  bool isDropDown;
List<String>?  dropDownItems;

   DetailsItem({super.key,required this.title,this.subtitle,required this.isDropDown,this.dropDownItems});

  @override
  State<DetailsItem> createState() => _DetailsItemState();
}

class _DetailsItemState extends State<DetailsItem> {
String dropDownValue = 'a';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
      child: Container(
        padding: EdgeInsets.all( 15),
  constraints: BoxConstraints(minHeight: 70,),
        width: MediaQuery.of(context).size.width,
        
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white,boxShadow: [
            BoxShadow(blurRadius: 5,spreadRadius: 4,offset: Offset(-1, 4),color: Color.fromARGB(20, 0, 0, 0))
        ]),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(widget.title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
          SizedBox(height: 6,),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: widget.subtitle!= null?  Text('${widget.subtitle}',style: TextStyle(fontSize: 13,color: Colors.black54),):Container(),
          ),
   widget.isDropDown ==true? DropdownButton(
      value: dropDownValue,
      items: widget.dropDownItems!.map((String value) {
return DropdownMenuItem<String>(value: value,child: Text(value));
      } ).toList(),
      onChanged: (dynamic newValue){
        setState(() {
          dropDownValue=newValue;
        });
      },): Container()
        ],),
      ),
    );
  }
}