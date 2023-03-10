import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rifas/core/app_widget.dart';
import 'package:rifas/firebase_options.dart';

void main() async {
  // initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  runApp(const AppWidget());
}
