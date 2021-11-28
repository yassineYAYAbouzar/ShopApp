// ignore_for_file: missing_return, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/controller/appCubit/cubit.dart';
import 'package:shopapp/controller/appCubit/states.dart';
import 'package:shopapp/controller/view/shopeScreens/search.dart';
class ShopScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppState>(
    listener: (context,state){},
    builder: (context,state) {
      var cubit = AppCubit.get(context);
     return Scaffold(
        appBar: AppBar(
          title: Text('7anot'),
          actions: [
            IconButton(
                onPressed: ()=> Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>SearchScreen(),
                  ),
                ),
                icon: Icon(Icons.search))
          ],
        ),
        body: cubit.bottomScreens[cubit.currentScreens],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index)=> cubit.changeBottom(index),
          currentIndex: cubit.currentScreens,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                    Icons.home
                ),
              label: 'Home'
            ),
            BottomNavigationBarItem(
                icon: Icon(
                    Icons.category_outlined
                ),
              label: 'Category'
            ),
            BottomNavigationBarItem(
                icon: Icon(
                    Icons.favorite_border
                ),
              label: 'Favorite'
            ),
            BottomNavigationBarItem(
                icon: Icon(
                    Icons.settings
                ),
              label: 'Setting'
            ),
          ],
        )
      );
     }
    );
  }
}
