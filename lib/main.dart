import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

import 'package:plantcare/screens/login.dart';
import 'package:plantcare/screens/nav.dart';
import 'package:plantcare/screens/register.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantcare/services/chatg.dart';
import 'firebase_options.dart';

int index = 3;
Future<void> main() async {
  Gemini.init(
    apiKey: GEMAIN9_API_KEY,
  );

// ...
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
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
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(500, 900),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Register(),
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