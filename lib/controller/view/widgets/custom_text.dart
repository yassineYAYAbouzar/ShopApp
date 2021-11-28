

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String  text ;
  final double size;
  final Color color;
  final FontWeight fontWeight ;
  final AlignmentGeometry alignments;
  const CustomText({Key key,this.alignments=Alignment.center,this.fontWeight=FontWeight.normal, this.color=Colors.black,this.size=20,this.text='Sum Text'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(alignment:alignments ,child: Text(text,style: TextStyle( color: color,fontSize:size,fontWeight:fontWeight ),));
  }
}
