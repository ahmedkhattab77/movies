import 'package:flutter/material.dart';

import '../home/home.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = 'splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(Home.routeName);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121312),
      body: Center(
        child: Image.asset('assets/images/movies.png'),
      ),
    );
  }
}
