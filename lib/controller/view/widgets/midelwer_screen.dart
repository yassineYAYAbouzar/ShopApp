import 'package:flutter/material.dart';
import 'package:shopapp/controller/service/remote/cache_helper.dart';
import 'package:shopapp/controller/view/auth/login_screen.dart';
import 'package:shopapp/controller/view/onbording_screen.dart';
import 'package:shopapp/controller/view/shop_screen.dart';
class Midelwer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var curentscren =CachHelper.RedeBool(key: 'Screen');
    var token = CachHelper.RedeData(key:'token');
     if(curentscren == false){
       if(token != null){
         return ShopScreen();
       }
       return LoginScreen();
     }
     else{
       return OnbordingScreen();
     }
  }
}
