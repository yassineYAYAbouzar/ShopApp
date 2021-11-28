

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shopapp/controller/view/widgets/custom_text.dart';

class CustomSocialAccontBox extends StatelessWidget {
  final String  text ;
  final Color color;
  final String image;
  final bool isNotSocial;
  final  onPressed;
  const

  CustomSocialAccontBox({Key key, this.onPressed,this.image='',this.isNotSocial=true, this.color=Colors.black,this.text='Sum Text'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.all(17),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color:color ,
        ),
        child: Row(
          mainAxisAlignment:isNotSocial ?MainAxisAlignment.spaceAround:MainAxisAlignment.center,
          children: [
            isNotSocial ? Image.asset(image,width: 25,height: 25,):Text(""),
            CustomText(text: text,color: Colors.white,size: 17),
          ],
        ),

      ),
    );
  }
}
