import 'package:flutter/material.dart';
import 'package:project_iconsen/login_page.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ));
    });

    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/image/iconsen.png",
          height: 60,
        ),
      ),
    );
  }
}
