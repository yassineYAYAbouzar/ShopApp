// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/controller/homeCubit/cubit.dart';
import 'package:shopapp/controller/homeCubit/states.dart';

class ProductScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<HomeCubit , HomeState>(
    listener: (context,state){
      print(state);
    },
    builder: (context,state){
      var cubit = HomeCubit.get(context);
      return cubit.homeModel == null ? Center(child: CircularProgressIndicator()) :
      homeProductBuilder(cubit);
    });
  }
  Widget homeProductBuilder(HomeCubit cubit)=>Column(
    children: [
      CarouselSlider(
        options: CarouselOptions(
            height: 250.0,
            autoPlay: true,
            initialPage: 0,
            viewportFraction: 1.0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(seconds: 1),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal
        ),
        items: cubit.homeModel.data.banners.map((e)=>
          Image(
            image: NetworkImage(e.image),
            width: double.infinity,
            fit: BoxFit.cover,
          )
        ).toList(),
      )
    ],
  );
}
