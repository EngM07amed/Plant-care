import 'dart:io';
import 'dart:typed_data';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:plantcare/customs_wedgit/design.dart';
import 'package:plantcare/models/data.dart';
import 'package:plantcare/screens/login.dart';
import 'package:plantcare/services/users_api.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool confrimpass = true;
  String selectedGender = '';
  final picker = ImagePicker();
  File? image;
  gaMethod() async {
    await picker.pickImage(source: ImageSource.gallery).then((value) async {
      if (value == null) {
        image = await convertAssetToFile('assets/images/holder_img.png');
        return;
      }
      image = File(value.path);
      setState(() {});
    });
  }

  Future<File?> convertAssetToFile(String assetPath) async {
    // Load the AssetImage
    final ByteData? byteData = await rootBundle.load(assetPath);
    if (byteData == null) {
      return null;
    }

    // Create a temporary file
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    String fileName = assetPath.split('/').last; // Extract file name from path
    File tempFile = File('$tempPath/$fileName');

    // Write the image data to the temporary file
    await tempFile.writeAsBytes(byteData.buffer.asUint8List(), flush: true);

    return tempFile;
  }
  //GlobalKey<FormState> formState = GlobalKey<FormState>();
  /* Future signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return;
    }

    final GoogleSignInAuthentication? googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.of(context).pushNamedAndRemoveUntil("select1", (route) => false);
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Stack1(op: .3),
      ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                'assets/images/480-[Converted] - Copy.png',
                width: 180,
                height: 180,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Create an account',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w800,
                height: 0,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Join our plant community',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 15,
                fontFamily: 'Inter',
                height: 0,
              ),
            ),
          ),
          Form(
            child: Column(
              children: [
                Stack(children: [
                  Stack(children: [
                    CircleAvatar(
                      radius: 70.r,
                      child: image == null
                          ? Image.asset('assets/images/holder_img.png')
                          : Image.file(image!),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 90.0.r, top: 90.r),
                      child: IconButton(
                          onPressed: gaMethod, icon: Icon(Icons.camera_alt)),
                    )
                  ])
                ]),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: boxDesign(
                      validator: (val) {
                        if (val == "") {
                          return "Can not to be empty";
                        }
                        return null;
                      },
                      controller: name,
                      Text1: "userName",
                    )),
                const SizedBox(height: 16.0),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: boxDesign(
                      validator: (val) {
                        if (val == "") {
                          return "Can not to be empty";
                        }
                        return null;
                      },
                      controller: email,
                      Text1: "Email",
                    )),
                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(25.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(80, 50),
                    backgroundColor: Color(0xFF54796E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  child: const Text(
                    'Sign UP',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  onPressed: () async {
                    final status = await Register1().registerUser(userModel(
                        username: name.text,
                        password: password.text,
                        email: email.text,
                        image: image!));
                    if (status == true) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const Login();
                      }));
                    } else {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc: 'try again',
                      ).show();
                    }
                  })),
          Container(
            alignment: Alignment.center,
            child: const Text(
              "Or With",
              style: TextStyle(
                color: Color.fromARGB(255, 139, 133, 133),
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                    icon: FaIcon(
                      FontAwesomeIcons.google,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      size: 35,
                    ),
                    onPressed: () {
                      // signInWithGoogle();
                    }),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account? ",
                style: TextStyle(color: Colors.black, fontFamily: "iner"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Login();
                  }));
                },
                child: const Text(
                  'login ',
                  style: TextStyle(
                    color: Color(0xff006633),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          )
        ],
      )
    ]));
  }
}
