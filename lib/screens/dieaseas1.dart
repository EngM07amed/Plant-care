import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantcare/customs_wedgit/journalData.dart';

class Problem1 extends StatefulWidget {
  const Problem1({super.key});

  @override
  State<Problem1> createState() => _Problem1State();
}

class _Problem1State extends State<Problem1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Padding(
          padding: EdgeInsets.only(top: 20.0.r, left: 13.r),
          child: Text(
            "Big Red Tomato",
            style: TextStyle(
                color: Colors.black,
                fontSize: 30.sp,
                fontWeight: FontWeight.w400),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 14.0.r),
              child: Text(
                "Disease Suspected:",
                style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ),
            Text(
              "Early Blight",
              style: TextStyle(fontSize: 16.sp),
            ),
            SizedBox(
              width: 60.w,
            ),
            Padding(
              padding: EdgeInsets.all(8.0.r),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Age:",
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "9 week",
                        style: TextStyle(fontSize: 15.sp),
                      )
                    ],
                  ),
                  Text(
                    "5/2/2024",
                    style: TextStyle(fontSize: 15.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(8.0.r),
          child: Divider(
            height: 1.h,
            color: const Color.fromARGB(96, 132, 129, 129),
            endIndent: 10.r,
            indent: 10.r,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.0.r),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0.r),
                child: Text(
                  "Treatment:  ",
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: Color(0xff0091B0),
                      fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                width: 250.w,
                child: Text(
                  "Apply fungicides containing chlorothalonil or copper according to label instructions.",
                  style: TextStyle(fontSize: 13.sp),
                ),
              )
            ],
          ),
        ),
        Row(
          children: [
            SizedBox(
              height: 350.h,
              width: 200.w,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 5.r, top: 20.r),
                    child: Text(
                      "Note:",
                      style: TextStyle(fontSize: 20.sp),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0.r),
                    child: Text(
                        "Based on my observations and image analysis, I have diagnosed Early Blight on my tomato plant. To prevent further spread, App recommend removing infected leaves. I found detailed information about Early Blight and removal techniques within the app's disease database"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 250.h,
              width: 200.w,
              child: Card(
                child: Image.asset(
                  'assets/images/close-up-hand-holding-tube-with-seed.png',
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0.r),
                ),
                elevation: 10,
                margin: EdgeInsets.all(10),
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.all(20.0.r),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Color.fromARGB(15, 0, 221, 255),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 190.0.r, bottom: 10.r),
                  child: Text(
                    "Immediate Tasks",
                    style: TextStyle(
                        color: Color(0xff0091B0),
                        fontFamily: AutofillHints.addressCityAndState,
                        fontSize: 20.sp),
                  ),
                ),
                JournalData(),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20.0.r),
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(15, 0, 221, 255),
                borderRadius: BorderRadius.circular(20.r)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 250.0.r, bottom: 10.r),
                  child: Text(
                    "Treatment",
                    style: TextStyle(
                        color: Color(0xff0091B0),
                        fontFamily: AutofillHints.addressCityAndState,
                        fontSize: 20.sp),
                  ),
                ),
                JournalData(),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20.0.r),
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 254, 185, 185),
                borderRadius: BorderRadius.circular(20.r)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 150.0.r, bottom: 10.r),
                  child: Text(
                    "Frequency-Based Tasks",
                    style: TextStyle(
                        color: Color(0xffCE0000),
                        fontFamily: AutofillHints.addressCityAndState,
                        fontSize: 20.sp),
                  ),
                ),
                DaTA3(),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 200.w,
              height: 60.h,
              child: Padding(
                padding: EdgeInsets.only(left: 23.r, bottom: 10.r, right: 30.r),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF54796E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.upload_file_rounded,
                        color: Colors.white,
                        size: 20.r,
                      ), // Icon before text
                      SizedBox(width: 10.w), // Spacer between icon and text
                      Text(
                        'Update',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            SizedBox(
              width: 200.w,
              height: 60.h,
              child: Padding(
                padding: EdgeInsets.only(left: 23.r, bottom: 10.r, right: 30.r),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffAC7979),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.exit_to_app,
                        color: Colors.white,
                        size: 20.r,
                      ), // Icon before text
                      SizedBox(width: 10.w), // Spacer between icon and text
                      Text(
                        ' Cancel',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ]),
    );
  }
}
