import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:plantcare/screens/jornal.dart';
import 'package:plantcare/screens/treatment.dart';
import 'package:plantcare/services/tratment.dart';

import '../customs_wedgit/list_text.dart';

class ShowImage extends StatefulWidget {
  const ShowImage({super.key, required this.image, required this.result});
  final File? image;
  final String? result;
  @override
  State<ShowImage> createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Diagnoses',
          style: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 71, 102, 50),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Image.file(
                width: 400,
                File((widget.image?.path ?? "no")),
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 227, 227, 227),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.r),
                    topRight: Radius.circular(50.r),
                  ),
                ),
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check_rounded,
                              color: Color(0xFF7CBC50),
                            ),
                            Text(
                              'Hurray, we identified the disease',
                              style: TextStyle(
                                  color: Color(0xFF7CBC50), fontSize: 20.sp),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        " ${widget.result}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 40.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      Center(
                        child: SizedBox(
                          height: 50.h,
                          width: 300.w,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF7CBC50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                            ),
                            onPressed: () {
                              GetTreatment();
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return TreatmentData(
                                  result: widget.result!,
                                );
                              }));
                            },
                            child: Text(
                              'Show Treatment ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 30.r),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'About ',
                                style: TextStyle(
                                    color: Color(0xFF275C4D),
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: EdgeInsets.all(5.0.r),
                        child: Padding(
                          padding: EdgeInsets.all(5.0.r),
                          child: FutureBuilder(
                            future: GetTreatment().getTips(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              if (snapshot.data != null &&
                                  snapshot.data!.isNotEmpty) {
                                return BulletList(
                                  physics: const NeverScrollableScrollPhysics(),
                                  items:
                                      snapshot.data!.map((e) => e.res).toList(),
                                );
                              }
                              return const SizedBox();
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 40.r, left: 40.r, right: 40.r),
                        child: Divider(
                          color: Colors.black,
                          height: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 40.r, top: 75.r),
                        child: Row(
                          children: [
                            Text(
                              'Save this diagnose\nto new entry journal',
                              style: TextStyle(
                                  fontSize: 25.sp,
                                  color: Color(0xFF275C4D),
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 60.w,
                            ),
                            SizedBox(
                              height: 50.h,
                              width: 100.w,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF7CBC50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Journal(
                                      label: widget.result!,
                                    );
                                  }));
                                },
                                child: Text(
                                  'Add ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 50.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
             /* "Welcome ${widget.result}",*/
             //FileImage(File((widget.image?.path ?? "no"))),
