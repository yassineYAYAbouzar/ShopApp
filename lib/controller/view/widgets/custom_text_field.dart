

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomTextFilde extends StatelessWidget {
  final String  hint ;
  final prefixIcon ;
  final bool isPassword ;
  final bool  obscureText ;
  final Widget label;
  final  onSaved;
  final  controller;
  final  validator;
  final  ontap;
  const CustomTextFilde({Key key,this.hint='Sum Text',this.label,this.controller,this.ontap,this.validator, this.onSaved,this.prefixIcon,this.isPassword=false,this.obscureText=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        label: label,
        prefixIcon:prefixIcon,
        suffixIcon: isPassword ?  InkWell(onTap: ontap, child: Icon(Icons.remove_red_eye_outlined)):Icon(Icons.mail,size: 0,),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        focusedBorder:OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
