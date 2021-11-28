// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/controller/appCubit/cubit.dart';
import 'package:shopapp/controller/appCubit/states.dart';
import 'package:shopapp/controller/service/remote/cache_helper.dart';
import 'package:shopapp/controller/view/auth/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class pages {
  final image ;
  final title;
  final description;

  pages({this.image, this.title, this.description});
}
class OnbordingScreen extends StatelessWidget {
 var bordScontroller = PageController();
    List<dynamic> page =[
      pages(image:'images/Groupe1467.png',title:'Create Order',description:'Order product(s) from online stores or a specific pickup location.'),
      pages(image:'images/Groupe1467.png',title:'Create Order',description:'Order product(s) from online stores or a specific pickup location.'),
      pages(image:'images/Groupe1467.png',title:'Create Order',description:'Order product(s) from online stores or a specific pickup location.'),
    ];

  @override
  Widget build(BuildContext context) {
  return  BlocConsumer<AppCubit , AppState>(
    listener: (context,state){},
    builder: (context,state) {
      var cubit = AppCubit.get(context);
      print(cubit.Screen);
      print("dddddddd${CachHelper.RedeBool(key: 'Screen')}");

      return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(onTap: () {
                cubit.seOnbording(frombording: false);
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (BuildContext context) => LoginScreen()));
              },
                  child: Text('skip',
                    style: TextStyle(color: Colors.black, fontSize: 15),)),
            )
          ],
        ),
        floatingActionButton: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: SmoothPageIndicator(
                controller: bordScontroller,
                count: page.length,
                axisDirection: Axis.horizontal,
                effect: SlideEffect(
                    spacing: 5.0,
                    radius: 4.0,
                    dotWidth: 24.0,
                    dotHeight: 16.0,
                    paintStyle: PaintingStyle.stroke,
                    strokeWidth: 1.5,
                    dotColor: Colors.grey,
                    activeDotColor: Colors.deepOrange
                ),
              )
              ,
            ),
            Spacer(),
            FloatingActionButton(
              onPressed: () {
                bordScontroller.nextPage(
                    duration: Duration(seconds: 1), curve: Curves.bounceIn);
              },
              child: Icon(Icons.navigate_next),
            ),
          ],
        ),
        body: PageView.builder(onPageChanged: (index) {
          if (index == page.length - 1) {
            cubit.seOnbording(frombording: false);
            Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (BuildContext context) => LoginScreen()));
          }
        },
            controller: bordScontroller,
            physics: BouncingScrollPhysics(),
            itemCount: page.length,
            itemBuilder: (context, index) =>
                Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Image(
                        image: AssetImage('${page[0].image}'),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child:
                      Column(
                        children: [
                          Text(
                            '${page[0].title}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            width: MediaQuery
                                .of(context)
                                .size
                                .width - 40,
                            alignment: Alignment.center,
                            child: Text(
                                '${page[0].description}',
                                style: TextStyle(color: Colors.grey,
                                  fontSize: 18,
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
      );
    });
  }

}
