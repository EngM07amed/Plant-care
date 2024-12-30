import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plantcare/const.dart';
import 'package:plantcare/customs_wedgit/design.dart';
import 'package:plantcare/customs_wedgit/log.dart';
import 'package:plantcare/models/data.dart';

import '../services/users_api.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  File? image;
  galleryMethod() async {
    image = File(
        (await ImagePicker().pickImage(source: ImageSource.gallery))!.path);

    setState(() {});
  }

//String currentUser = (Auth().auth.currentUser as User).email.toString();
  TextEditingController displayNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  bool isLoading = false;
  //User? user;
  String? imageUrl;
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DisplayData().getuserDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data != null && snapshot.hasData) {
            final userData = snapshot.data;
            return Scaffold(
              body: Stack1(
                  op: .5,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 200.h,
                      ),
                      Expanded(
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: AlignmentDirectional.topCenter,
                          children: [
                            Container(
                              width: double.infinity,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              child: ListView(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 80.r, left: 20.r, right: 20.r),
                                    child: Textfiled(
                                      hi: "Input Name",
                                      la: userData!.username,
                                      cn: name,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.r, right: 20.r),
                                    child: Textfiled(
                                      hi: "password",
                                      la: userData.password,
                                      cn: password,
                                    ),
                                  ),
                                  SizedBox(height: 40.h),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.r, right: 20.r),
                                    child: Textfiled(
                                      hi: "Input Email",
                                      la: userData!.email,
                                      cn: email,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.r, right: 20.r),
                                    child: Material(
                                      elevation: 15.r,
                                      shape: BeveledRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              bottomRight:
                                                  Radius.elliptical(20.r, 10.r),
                                              bottomLeft:
                                                  Radius.elliptical(9.r, 9.r))),
                                      shadowColor:
                                          Color.fromARGB(255, 138, 136, 138),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: Size(350.w, 50.h),
                                          backgroundColor: Color(0xFF54796E),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                          ),
                                        ),
                                        child: Text(
                                          'save',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontSize: 20.sp,
                                            fontFamily: 'Inter',
                                          ),
                                        ),
                                        onPressed: () async {
                                          await update1().updataUser(userModel(
                                              username: name.text,
                                              password: password.text,
                                              email: email.text,
                                              image: image!));
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: -80.h,
                              left: 150.w,
                              child: Stack(children: [
                                CircleAvatar(
                                  radius: 70.r,
                                  backgroundImage: NetworkImage(userData
                                          .image.path
                                          .contains('uploads/')
                                      ? '$baseUrl/${userData.image.path}'
                                      : '$baseUrl/uploads/${userData.image.path}'),
                                ),
                                Container(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: EdgeInsets.all(90.0.r),
                                    child: IconButton(
                                        onPressed: galleryMethod,
                                        icon: Icon(
                                          Icons.camera_alt,
                                          size: 30.r,
                                          color: Colors.black,
                                        )),
                                  ),
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            );
          }
          return const Center(child: Text('No data'));
        });
  }
}
