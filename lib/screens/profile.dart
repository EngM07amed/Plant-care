import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantcare/customs_wedgit/design.dart';
import 'package:plantcare/customs_wedgit/saved.dart';
import 'package:plantcare/screens/Edit.dart';
import 'package:plantcare/screens/about_us.dart';
import 'package:plantcare/services/users_api.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                          alignment: AlignmentDirectional.topStart,
                          children: [
                            Container(
                              width: double.infinity,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              child: ListView(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 20.r, left: 170.r),
                                    child: Text(
                                      userData!.username,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20.sp),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 180.r, top: 10.r),
                                    child: Text(
                                      userData!.email,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 13.sp),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 40.r, left: 25.r, right: 25.r),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(350.h, 50.w),
                                        backgroundColor:
                                            const Color(0xFF54796E),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                      ),
                                      child: Text(
                                        'Edit',
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontSize: 15.sp,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return const Edit();
                                        }));
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 300.0.r, top: 20.r),
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return const AboutUs();
                                          }));
                                        },
                                        child: Text(
                                          "About us",
                                          style: TextStyle(
                                              color: Color(0xff54796E),
                                              fontSize: 15.sp),
                                        )),
                                  ),
                                  Divider(
                                    endIndent: 30.w,
                                    indent: 30.w,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0.r),
                                    child: Center(
                                        child: Text(
                                      "Saved Diagnoses",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18.sp),
                                    )),
                                  ),
                                  const Saved2(),
                                  const Saved2(),
                                  const Saved2(),
                                ],
                              ),
                            ),
                            Positioned(
                              top: -80.h,
                              left: 8.r,
                              child: CircleAvatar(
                                radius: 70.r,
                                backgroundImage: AssetImage(
                                    "assets/images/480-[Converted] 3.png"),
                              ),
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
