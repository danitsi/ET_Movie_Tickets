

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData
        (
        primarySwatch: Colors.blue,
        fontFamily: 'montserrat',
        //scaffoldBackgroundColor: ThemeData.dark(),
        textTheme: Theme.of(context).textTheme.apply(
          //bodyColor: ThemeData.dark(),
          // displayColor: DarkTheme.white
        )
      ),
      home: Scaffold(

        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 64, left: 24, right: 24),
              child: SizedBox(
                height: size.height/25,
                child: Row(
                  children: [
                    Text(
                      'Find Your Best\nMovie'
                    ),
                  ],
                ),
              ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
