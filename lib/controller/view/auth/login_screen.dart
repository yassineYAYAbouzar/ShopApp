// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, missing_return

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopapp/controller/authCubit/cubit.dart';
import 'package:shopapp/controller/authCubit/states.dart';
import 'package:shopapp/controller/service/remote/cache_helper.dart';
import 'package:shopapp/controller/view/auth/register_screen.dart';
import 'package:shopapp/controller/view/shop_screen.dart';
import 'package:shopapp/controller/view/widgets/constant.dart';
import 'package:shopapp/controller/view/widgets/custom_SocialAccontBox.dart';
import 'package:shopapp/controller/view/widgets/custom_text.dart';
import 'package:shopapp/controller/view/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocConsumer<LoginCubit , LoginState>(
    listener: (context,state){
      if(state is LoginSucsessState){
        if(state.loginModel.status==true){
          CachHelper.SetData(key: 'token', value: state.loginModel.data.token);
          Navigator.of(context).pushReplacement( MaterialPageRoute(
            builder: (BuildContext context) =>  ShopScreen()
          ));
          Fluttertoast.showToast(
              msg: state.loginModel.message,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.greenAccent,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }else{
          print(state.loginModel.message);
          Fluttertoast.showToast(
              msg: state.loginModel.message,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
      }
    },
    builder: (context,state) {
      var cubit = LoginCubit.get(context);
    return  Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(backgroundColor: Colors.white, elevation: 0,),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    CustomText(text: 'Login',
                        size: 29.9,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5E5E5E)),
                    SizedBox(height: 20,),
                    CustomText(text: 'Add your details to login',
                      size: 13.9,
                      color: secondrycolor,),
                    SizedBox(height: 20,),
                    CustomTextFilde(
                      controller: emailController,
                      validator: (String value){
                        if(value.isEmpty){
                          return 'email c ant be empty';
                        }
                      },
                      hint: 'Your Email', prefixIcon: Icon(Icons.mail),
                    ),
                    SizedBox(height: 23,),
                    CustomTextFilde(hint: 'Password',
                        prefixIcon: Icon(Icons.password_outlined,),
                        obscureText: cubit.obscureText,
                        isPassword: true,
                        ontap: (){
                         cubit.changeobscureText();
                        },
                        validator: (String value){
                           if(value.isEmpty){
                             return 'password c ant be empty';
                           }
                        },
                        controller:passwordController ,
                    ),
                    SizedBox(height: 20,),
                    CustomText(text: 'Forgot your password?',
                        color: secondrycolor,
                        size: 16),
                    SizedBox(height: 26,),
                    ConditionalBuilder(
                        condition: state != LoginLoadedState,
                        builder: (context) {
                          return  CustomSocialAccontBox(
                              color: primerycolor,
                              text: 'Login',
                              isNotSocial: false,
                              onPressed: () {
                                if(_formkey.currentState.validate()){
                                  _formkey.currentState?.save();
                                  cubit.userLogin(Email: emailController.text, Password: passwordController.text);
                                }
                              }
                          );
                        },
                        fallback: (context) {
                          return Center(child: CircularProgressIndicator());
                        }
                    ),
                    SizedBox(height: 26,),
                    CustomText(text: '-OR-', color: secondrycolor, size: 16),
                    SizedBox(height: 26,),
                    CustomSocialAccontBox(image: 'images/facebook.png',
                        onPressed: () {},
                        color: Color(0XFF367FC0),
                        text: 'Login with facebook'),
                    SizedBox(height: 26,),
                    CustomSocialAccontBox(image: 'images/gmail.png',
                        color: primerycolor,
                        text: 'Login with  Google',
                        onPressed: () {}),
                    SizedBox(height: 26,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(text: 'D\'ont have an Accont?',
                            color: secondrycolor,
                            size: 14),
                        InkWell(onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  RegisterScreen()));
                        }, child: CustomText(text: 'Sign Up',
                            color: primerycolor,
                            size: 14)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
      );
    }
    );
  }
}
