
import 'package:et_movie_tickets/mvc/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'util/helpers/app_shared_preferences.dart';
import 'util/helpers/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: (5)),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Lottie.asset(
              'assets/animations/splash_screen.json',
              controller: _controller,
              height: MediaQuery.of(context).size.height * 1,
              animate: true,
              onLoaded: (composition) {
                _controller
                  ..duration = composition.duration
                  ..forward().whenComplete(() => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          LayoutBuilder(
                            builder: (context, constraints) {
                              SizeConfig().init(constraints);
                              return AppSharedPreferences.getFirsPage() ?? false
                                  ? HomeScreenPage(0)
                                  : HomeScreenPage(1);
                            },
                          ),
                    ),
                  ));
              },
            ),
          ),
        ));
  }
}
