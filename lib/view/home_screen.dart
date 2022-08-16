import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/view/health_screen.dart';
import 'package:news_app/view/science_screen.dart';
import 'package:news_app/view/sports_screen.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget>screens=[
    Sports(),
    Science(),
    Health(),
  ];
  NewsController controller=Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:BottomNavigationBar(
          selectedItemColor: Colors.red,
          currentIndex: controller.currentIndex.value,
          onTap: (val)
          {
            setState(() {
              controller.currentIndex.value=val;

            });
          },
          items: [
            BottomNavigationBarItem(
                label: "Sports",
                icon: Icon(Icons.sports)),
            BottomNavigationBarItem(
                label: "Science",
                icon: Icon(Icons.science)),
            BottomNavigationBarItem(
                label: "health",
                icon: Icon(Icons.health_and_safety)),
          ],

        ),
        body: GetX<NewsController>(builder: (controller)=>screens[controller.currentIndex.value])
    );
  }
}







