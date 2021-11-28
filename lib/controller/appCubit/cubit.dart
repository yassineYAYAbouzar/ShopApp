import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/controller/appCubit/states.dart';
import 'package:shopapp/controller/service/remote/cache_helper.dart';
import 'package:shopapp/controller/view/shopeScreens/category.dart';
import 'package:shopapp/controller/view/shopeScreens/favorite.dart';
import 'package:shopapp/controller/view/shopeScreens/product.dart';
import 'package:shopapp/controller/view/shopeScreens/setting.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppnitailState());

  static AppCubit get(context) =>BlocProvider.of(context);

  bool isLight = true;
  bool Screen = true;

  int currentScreens = 0;
  List<Widget> bottomScreens= [
    ProductScreen(),
    CategoryScreen(),
    FavoritScreen(),
    SettingScreen()
  ];
  void changeBottom(int index){
    currentScreens = index;
    emit(ShopAppChangeBottomScreen());
  }


  void seTisLight({bool fromStoreg}) {
    if(fromStoreg != null)
      isLight = fromStoreg;
    else
    isLight = !isLight;
    CachHelper.SetData(key: 'isLight',value: isLight);
    emit(AppChangeThemeState());
  }

  void seOnbording({bool frombording}) {
    if(frombording != null)
      Screen = frombording;
    else
      Screen = Screen;
    CachHelper.SetData(key: 'Screen',value: Screen);
    emit(AppOnbordingScreenState());
  }

}

