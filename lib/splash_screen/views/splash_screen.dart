import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rifas/core/instances.dart';
import 'package:rifas/home/views/home.dart';
import 'package:rifas/login/views/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  _checkAAuth() async {
    bool? result = await loginController.checkAuth();
    await Future.delayed(const Duration(seconds: 1));
    if(result == true) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> Home()));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> LoginPage()));
    }
  }

  @override
  void initState() {
    _checkAAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff08196D), Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/ieaderp.png',
                height: 150,
              ),
              Text('Rifas',
                style: GoogleFonts.dancingScript(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}