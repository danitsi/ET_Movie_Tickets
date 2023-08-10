import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:et_movie_tickets/mvc/controller/home/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class HomeScreenPage extends StatefulWidget {
  int selectedPage;
  HomeScreenPage(this.selectedPage);

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState(selectedPage);
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  int selectedPage;

  _HomeScreenPageState(this.selectedPage) {
    HomeScreenController homeController = Get.put(HomeScreenController());
    homeController.changeIcons(selectedPage);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.white,
      ),
    );

    return Container(
      child: DefaultTabController(
        length: 4,
        child: GetBuilder<HomeScreenController>(
            builder: (controller) => Scaffold(
                  backgroundColor: Colors.black,
                  body: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [],
                  ),
                  bottomNavigationBar: Container(
                    height: 60,
                    margin: EdgeInsets.only(
                        bottom: Get.mediaQuery.viewPadding.bottom),
                    child: Container(
                      color: Colors.white,
                      child: TabBar(
                        indicatorWeight: 0.1,
                        automaticIndicatorColorAdjustment: false,
                        unselectedLabelColor: Colors.black,
                        labelStyle: const TextStyle(fontSize: 15),
                        labelColor: Colors.white,
                        onTap: (index) {
                          controller.changeIcons(index);
                        },
                        tabs: <Widget>[
                          Tab(
                            icon: controller.moviesIcon,
                            text: 'MOVIES'.tr,
                            iconMargin: EdgeInsets.only(bottom: 0),
                          ),
                          Tab(
                              icon: controller.theatersIcon,
                              text: 'THEATERS'.tr,
                              iconMargin: EdgeInsets.only(bottom: 0)),
                          Tab(
                              icon: controller.trailersIcon,
                              text: 'TRAILERS'.tr,
                              iconMargin: EdgeInsets.only(bottom: 0)),
                          Tab(
                              icon: controller.profileIcon,
                              text: 'PROFILE'.tr,
                              iconMargin: EdgeInsets.only(bottom: 0)),
                        ],
                      ),
                    ),
                  ),
                )),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    if (EasyLoading.isShow) {
      print("BackButton clicked :- Loading is shown");
      return true;
    }

    print("BackButton clicked :- Get.currentRoute :-${Get.currentRoute}");

    if (Get.currentRoute == "/" || Get.currentRoute == "/HomeTabbedPage") {
    } else {
      print("BackButton clicked :- Current Page :-${Get.currentRoute}");
      Get.back();
    }

    return true;
  }
}
