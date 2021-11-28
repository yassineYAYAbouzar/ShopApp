// ignore_for_file: prefer_const_constructors, missing_return
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopapp/controller/appCubit/cubit.dart';
import 'package:shopapp/controller/appCubit/states.dart';
import 'package:shopapp/controller/authCubit/cubit.dart';
import 'package:shopapp/controller/homeCubit/cubit.dart';
import 'package:shopapp/controller/service/locale/constant.dart';
import 'package:shopapp/controller/service/remote/cache_helper.dart';
import 'package:shopapp/controller/service/remote/dio_helper.dart';
import 'package:shopapp/controller/view/auth/login_screen.dart';
import 'package:shopapp/controller/view/onbording_screen.dart';
import 'package:shopapp/controller/view/widgets/midelwer_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  int myNum =0;
  print(myNum+0.3);
  await GetStorage.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context)=> AppCubit()..seTisLight(
                fromStoreg:CachHelper.RedeBool(key: 'isLight')
            )..seOnbording(frombording:CachHelper.RedeBool(key: 'Screen')),
          ),
          BlocProvider(
            create: (context)=> LoginCubit(),
          ),
          BlocProvider(
            create: (context)=> HomeCubit()..getHomeItems(),
          ),
        ],
        child: BlocConsumer<AppCubit , AppState>(
            listener: (context,state){},
            builder: (context,state){
              var cubit = AppCubit.get(context);
              token = CachHelper.RedeData(key: 'token');
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(
                  inputDecorationTheme: InputDecorationTheme(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  textTheme: TextTheme(
                      bodyText1: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      )
                  ),
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: AppBarTheme(
                      titleTextStyle: TextStyle(
                          color:Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                      iconTheme:IconThemeData(
                          color: Colors.black
                      ) ,
                      backgroundColor: Colors.white,
                      elevation: 0,
                      backwardsCompatibility: false,
                      systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarColor: Colors.white,
                          statusBarIconBrightness: Brightness.dark
                      )
                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      backgroundColor: Colors.white,
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.deepOrange
                  ),
                  primarySwatch: Colors.deepOrange,
                ),
                darkTheme:ThemeData(
                  inputDecorationTheme: InputDecorationTheme(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  textTheme: TextTheme(
                      bodyText1: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      )
                  ),
                  scaffoldBackgroundColor: Colors.black12,
                  appBarTheme: AppBarTheme(
                      titleTextStyle: TextStyle(
                          color:Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                      iconTheme:IconThemeData(
                          color: Colors.white
                      ) ,
                      backgroundColor: Colors.black12,
                      elevation: 0,
                      backwardsCompatibility: false,
                      systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarColor: Colors.black12,
                          statusBarIconBrightness: Brightness.light
                      )
                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      backgroundColor: Colors.black12,
                      unselectedItemColor: Colors.grey,
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.deepOrange
                  ),
                  primarySwatch: Colors.deepOrange,
                ) ,
                themeMode:  ThemeMode.light,
                home: Midelwer(),
              );
            }
        ));


  }
}
