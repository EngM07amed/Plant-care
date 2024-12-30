import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:plantcare/screens/Start.dart';
import 'package:plantcare/screens/login.dart';
import 'package:plantcare/screens/nav.dart';
import 'package:plantcare/screens/register.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantcare/services/chatg.dart';

int index = 3;
Future<void> main() async {
  Gemini.init(
    apiKey: GEMAIN9_API_KEY,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(500, 900),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Start1(),
          /*( FirebaseAuth.instance.currentUser != null &&
        FirebaseAuth.instance.currentUser!.emailVerified)?Login() : Start1(),
        */
          routes: {
            "Register": (context) => Register(),
            "login": (context) => Login(),
            "select1": (context) => select1()
          },
        );
      },
    );
  }
}
//AIzaSyBgujY9UaGYxsjC7moNb-w6dM3EKLqlP5o