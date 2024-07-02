import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantcare/customs_wedgit/list_text.dart';
import 'package:plantcare/screens/jornal.dart';

import '../services/tratment.dart';

class TreatmentData extends StatefulWidget {
  const TreatmentData({super.key});

  @override
  State<TreatmentData> createState() => _TreatmentDataState();
}

class _TreatmentDataState extends State<TreatmentData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
          padding: EdgeInsets.all(5),
          alignment: Alignment.topCenter,
          child: Image.asset(
              "assets/images/close-up-hand-holding-tube-with-seed.png"),
        ),
        Expanded(
            child: Stack(children: [
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
              child: Column(
                children: [
                  Text(
                    "Name of treatment",
                    style: TextStyle(
                        fontSize: 22.sp,
                        color: Color.fromARGB(255, 71, 102, 50)),
                  ),
                  FutureBuilder(
                    future: GetTreatment().getTreatment(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.data != null && snapshot.data!.isNotEmpty) {
                        return BulletList(
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
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15.0.r, top: 6.r),
                        child: Text(
                          'Save this diagnose\nto new entry journal',
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: Color(0xFF275C4D),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        width: 100.w,
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
                              return const Journal();
                            }));
                          },
                          child: Text(
                            'Add ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ]))
      ]),
    );
  }
}
