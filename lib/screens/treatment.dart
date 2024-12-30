import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantcare/customs_wedgit/list_text.dart';
import 'package:plantcare/screens/jornal.dart';

import '../services/tratment.dart';

class TreatmentData extends StatefulWidget {
  const TreatmentData({super.key, required this.result});
  final String result;
  @override
  State<TreatmentData> createState() => _TreatmentDataState();
}

class _TreatmentDataState extends State<TreatmentData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Treatment',
          style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 71, 102, 50)),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Image.asset(
                "assets/images/close-up-hand-holding-tube-with-seed.png"),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 227, 227, 227),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.r),
                  topRight: Radius.circular(50.r),
                ),
              ),
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(top: 30.0.r),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      FutureBuilder(
                        future: GetTreatment().getTreatment(),
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
                              items: snapshot.data!.map((e) => e.res).toList(),
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.all(50.0.r),
                        child: Divider(
                          height: 1.h,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 40.r, top: 5.r),
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
                                      label: widget.result,
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
            )
          ],
        ),
      ),
    );
  }
}
