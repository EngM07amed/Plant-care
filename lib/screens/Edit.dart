import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plantcare/customs_wedgit/design.dart';
import 'package:plantcare/customs_wedgit/log.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  XFile? image;
  galleryMethod() async {
    image = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      image;
    });
  }

//String currentUser = (Auth().auth.currentUser as User).email.toString();
  TextEditingController displayNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  bool isLoading = false;
  //User? user;
  String? imageUrl;
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
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
                              la: "name",
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.r, right: 20.r),
                            child: Textfiled(
                              hi: "Input NewUserName",
                              la: "UserName",
                            ),
                          ),
                          SizedBox(height: 40.h),
                          Padding(
                            padding: EdgeInsets.only(left: 20.r, right: 20.r),
                            child: Textfiled(
                              hi: "Input number",
                              la: "PhoneNumber",
                            ),
                          ),
                          SizedBox(height: 40.h),
                          Padding(
                            padding: EdgeInsets.only(left: 20.r, right: 20.r),
                            child: Textfiled(
                              hi: "Input Email",
                              la: "Email",
                            ),
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.r, right: 20.r),
                            child: Material(
                              elevation: 15.r,
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomRight:
                                          Radius.elliptical(20.r, 10.r),
                                      bottomLeft: Radius.elliptical(9.r, 9.r))),
                              shadowColor: Color.fromARGB(255, 138, 136, 138),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(350.w, 50.h),
                                  backgroundColor: Color(0xFF54796E),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                ),
                                child: Text(
                                  'save',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 20.sp,
                                    fontFamily: 'Inter',
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: -80.h,
                      left: 130.w,
                      child: Stack(children: [
                        CircleAvatar(
                          radius: 70.r,
                          backgroundImage: AssetImage(
                              "assets/images/vecteezy_profile-user-icon-isolated-on-white-background-vector-eps10_ 1.png"),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.all(98.0.r),
                            child: IconButton(
                                onPressed: galleryMethod,
                                icon: Icon(Icons.camera_alt)),
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
}
