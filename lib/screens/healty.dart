import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantcare/const.dart';
import 'package:plantcare/customs_wedgit/journalData.dart';
import 'package:plantcare/models/jornaldata.dart';

class Healthy extends StatefulWidget {
  const Healthy({super.key, required this.jornal});
  final JornsalData jornal;
  @override
  State<Healthy> createState() => _HealthyState();
}

class _HealthyState extends State<Healthy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Padding(
          padding: EdgeInsets.only(top: 20.0.r, left: 13.r),
          child: Text(
            "Healthy Tomato care",
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
              widget.jornal.diagnoses,
              style: TextStyle(fontSize: 16.sp),
            ),
            SizedBox(
              width: 100.w,
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
        /* Padding(
          padding: EdgeInsets.only(left: 8.0.r),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0.r),
                child: Text(
                  "Treatment:  ",
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w400),
                ),
              ),
              Text(
                "none",
                style: TextStyle(fontSize: 20.sp),
              )
            ],
          ),
        ),*/
        /* Column(
          children: [
            /* Padding(
              padding: EdgeInsets.only(bottom: 10.r, top: 40.r),
              child: Text(
                "Note:",
                style: TextStyle(fontSize: 20.sp),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0.r),
              child: Text(
                  "Excited to see the first flower buds! This is my first time growing tomatoes, and everything seems to be going well so fa"),
            ),*/
          ],
        ),-*/
        Center(
          child: SizedBox(
            height: 250.h,
            width: 200.w,
            child: Image.network(
              widget.jornal.image.path.contains('uploads')
                  ? '$baseUrl/${widget.jornal.image.path}'
                  : '$baseUrl/uploads/${widget.jornal.image.path}',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20.0.r),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.r),
              color: Color.fromARGB(15, 40, 141, 235),
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(right: 130.0.r, bottom: 10.r, top: 10.r),
                  child: Row(
                    children: [
                      Text(
                        "One-Time Tasks",
                        style: TextStyle(
                            color: Color(0xff0091B0),
                            fontFamily: AutofillHints.addressCityAndState,
                            fontSize: 20.sp),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        size: 30.r,
                      )
                    ],
                  ),
                ),
                ImmediateWidget(),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20.0.r),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.r),
              color: Color.fromARGB(255, 254, 185, 185),
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(right: 100.0.r, bottom: 10.r, top: 10.r),
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
        Padding(
          padding: EdgeInsets.all(20.0.r),
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(15, 0, 221, 255),
                borderRadius: BorderRadius.circular(20.r)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 150.0.r, bottom: 10.r),
                  child: Text(
                    "Your tasks",
                    style: TextStyle(
                        color: Color(0xffCE0000),
                        fontFamily: AutofillHints.addressCityAndState,
                        fontSize: 20.sp),
                  ),
                ),
                const AddedTaskWidget(),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
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
