import 'dart:developer';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
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

    final GoogleSignInAuthentication? googleAuth =
        await googleUser.authentication;

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
            height: 4,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Welcome Back',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 28,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w800,
                height: 0,
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'log in to your account',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 15,
                fontFamily: 'Inter',
                height: 0,
              ),
            ),
          ),
          Form(
            key: formState,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(40.0),
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
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
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
                Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.only(right: 29.0),
                  child: TextButton(
                    onPressed: () async {
                      if (username.text == "") {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.rightSlide,
                          title: 'Error',
                          desc:
                              'write your username to send message to reset password',
                        ).show();
                      }
                      try {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          animType: AnimType.rightSlide,
                          title: 'Error',
                          desc: 'check your username  to reset password',
                        ).show();
                      } catch (e) {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          animType: AnimType.rightSlide,
                          title: 'Error',
                          desc: ' please Write  your username correct',
                        ).show();
                      }
                    },
                    child: const Text(
                      'Forget password',
                      style: TextStyle(
                        color: Color(0xFF2F7346),
                        fontSize: 11,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(80, 50),
                backgroundColor: Color(0xFF54796E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              child: const Text(
                'log In',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 15,
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
                  Text("Don’t have an account? "),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed("Register");
                    },
                    child: const Text(
                      'Sign Up ',
                      style: TextStyle(
                        color: Color(0xff006633),
                        fontSize: 15,
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
          Container(
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
          ),
        ])
      ],
    ));
  }
}
