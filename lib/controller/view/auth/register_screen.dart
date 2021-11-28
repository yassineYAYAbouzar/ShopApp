// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shopapp/controller/view/auth/login_screen.dart';
import 'package:shopapp/controller/view/widgets/constant.dart';
import 'package:shopapp/controller/view/widgets/custom_SocialAccontBox.dart';
import 'package:shopapp/controller/view/widgets/custom_text.dart';
import 'package:shopapp/controller/view/widgets/custom_text_field.dart';

class RegisterScreen extends StatelessWidget{
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.white,elevation: 0,),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children:    [
                  CustomText(text: 'Sign Up',size: 29.9,color:Color(0xFF5E5E5E)),
                  SizedBox(height: 17,),
                  CustomText(text: 'Add Your details to sign up',size: 13.9,color: secondrycolor,),
                  SizedBox(height: 17,),
                  CustomTextFilde(hint: 'Name',prefixIcon: Icon(Icons.person),onSaved: (value){
                  },),
                  SizedBox(height: 17,),
                  CustomTextFilde(hint: 'Email',prefixIcon: Icon(Icons.mail),onSaved: (value){
                  },),
                  SizedBox(height: 17,),
                  CustomTextFilde(hint: 'Mobile ',prefixIcon: Icon(Icons.phone), onSaved: null,),
                  SizedBox(height: 17,),
                  CustomTextFilde(hint: 'Adress',prefixIcon: Icon(Icons.location_city_outlined),onSaved: null,),
                  SizedBox(height: 17,),
                  CustomTextFilde(hint: 'Password',prefixIcon: Icon(Icons.password_outlined,),obscureText: true,isPassword:true,onSaved: (value){
                  },),
                  SizedBox(height: 17,),
                  CustomTextFilde(hint: 'Confirme Password',prefixIcon: Icon(Icons.password_outlined,),obscureText: true,isPassword:true, onSaved: null,),
                  SizedBox(height: 17,),
                  CustomSocialAccontBox(color:primerycolor,text:'Sign Up',isNotSocial:false,onPressed:(){_formkey.currentState?.save(); }),
                  SizedBox(height: 17,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(text: 'Already have an Acont?',color: secondrycolor,size: 14),
                      InkWell(onTap:() {
                        Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) => LoginScreen()));}, child: CustomText(text: 'Sign In',color: primerycolor,size: 14)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
