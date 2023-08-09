
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {


  Widget moviesIcon = Image.asset(
    'assets/images/home/book_gray.png',
    // fit: BoxFit.fitWidth,
    height: 23,
  );
  Widget theatersIcon = Image.asset(
    'assets/images/home/mytrips_unselected.png',
    // fit: BoxFit.fitWidth,
    height: 23,
  );
  Widget newsIcon = Image.asset(
    'assets/images/home/mytrips_unselected.png',
    // fit: BoxFit.fitWidth,
    height: 23,
  );
  Widget trailersIcon = Image.asset(
    'assets/images/home/mytrips_unselected.png',
    // fit: BoxFit.fitWidth,
    height: 23,
  );
  Widget profileIcon = Image.asset(
    'assets/images/home/mytrips_unselected.png',
    // fit: BoxFit.fitWidth,
    height: 23,
  );
  getMoviesIcon(int selectedPage) {
    if(selectedPage == 1) {
      moviesIcon = Icon(
          Icons.movie_sharp,
          size: 24,
          color: Colors.black
      );
    }
    update();
  }
  getTheatersIcon(int selectedPage) {
    if(selectedPage == 2) {
      theatersIcon = Icon(Icons.movie_filter_outlined,
         size: 23,
        color: Colors.black,
      );
    }
    update();
  }
  getTrailersIcon(int selectedPage) {
    if(selectedPage == 4) {
      trailersIcon = Icon(Icons.local_movies_rounded,
      size: 23,
        color: Colors.black,
      );
    }
    update();
  }
  getProfilesIcon(int selectedPage) {
    if(selectedPage == 5) {
      profileIcon = Icon(Icons.person,
          size: 23,
          color: Colors.black);
    }
    else {
      profileIcon = Icon(Icons.person,
          size: 23,
          color: Colors.black);
    }

    update();
  }
  changeIcons(int index) async {
    await Future.delayed(Duration(seconds: 0));
    getMoviesIcon(index);
    getTheatersIcon(index);
    getTrailersIcon(index);
    getProfilesIcon(index);
    
  }
}