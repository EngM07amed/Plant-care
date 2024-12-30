import 'dart:developer';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:plantcare/customs_wedgit/design.dart';
import 'package:plantcare/services/users_api.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool pass = true;
  Icon icon = const Icon(Icons.remove_red_eye_outlined, color: Colors.black);
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  Future signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return;
    }

    /* final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );*/

    // Once signed in, return the UserCredential
    /*await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.of(context).pushNamedAndRemoveUntil("select1", (route) => false);*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Stack1(
          op: .3,
        ),
        ListView(children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(
              'assets/images/480-[Converted] - Copy.png',
              width: 180,
              height: 180,
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Welcome Back',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 40.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w800,
                height: 0,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.r),
            child: Text(
              'log in to your account',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 25.sp,
                fontFamily: 'Inter',
                height: 0,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Form(
            key: formState,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(50.0.r),
                  child: boxDesign(
                    controller: username,
                    Text1: "username",
                    validator: (val) {
                      if (val == "") {
                        return "Can not to be empty";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0.r),
                  child: boxDesign(
                    validator: (val) {
                      if (val == "") {
                        return "Can not to be empty";
                      }
                      return null;
                    },
                    controller: password,
                    Text1: "password",
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(50.0.r),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(100.w, 60.h),
                backgroundColor: Color(0xFF54796E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ),
              child: Text(
                'log In',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w800,
                ),
              ),
              onPressed: () async {
                if (formState.currentState!.validate()) {
                  try {
                    final status =
                        await login1().loginUser(username.text, password.text);
                    if (status) {
                      Navigator.of(context).pushReplacementNamed("select1");
                    } else {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc: 'check yourGmail and verified ',
                      ).show();
                    }
                  } catch (e) {
                    log(e.toString());
                  }
                } else {
                  print("not");
                }
              },
            ),
          ),
          Center(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account? ",
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed("Register");
                    },
                    child: Text(
                      'Sign Up ',
                      style: TextStyle(
                        color: Color(0xff006633),
                        fontSize: 20.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 9,
          ),
          /* Container(
              alignment: Alignment.center,
              child: const Text(
                "Or continue with ",
                style: TextStyle(color: Colors.black45),
              )),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: IconButton(
                      // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                      icon: const FaIcon(
                        FontAwesomeIcons.google,
                        color: Color.fromARGB(255, 255, 255, 255),
                        size: 35,
                      ),
                      onPressed: () {
                        signInWithGoogle();
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    child: IconButton(
                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                        icon: FaIcon(
                          FontAwesomeIcons.facebook,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          size: 35,
                        ),
                        onPressed: () {
                          print("Pressed");
                        }),
                  ),
                )
              ],
            ),
          ),*/
        ])
      ],
    ));
  }
}
