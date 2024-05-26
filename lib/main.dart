import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:reverse_vending_machine/home_page.dart';
import 'package:reverse_vending_machine/user_register.dart';
import 'firebase_options.dart';
import 'first_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyBml6FuMxSB0RVuDYyCaWAeuyA87nvZuyE',
      appId: '1:791283862952:android:767f67ff5113b5a1a5e19d',
      messagingSenderId: '791283862952',
      projectId: 'rvm123',
      databaseURL: 'https://rvm123-default-rtdb.firebaseio.com',
      storageBucket: 'rvm123.appspot.com',
    ),
  )
      : await Firebase.initializeApp(); //need to add firebase for ios
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(builder: (_, child) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  FirstPage(),
      );
    });
  }
}

