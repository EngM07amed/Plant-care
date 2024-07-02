import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantcare/customs_wedgit/design.dart';
import 'package:plantcare/screens/login.dart';

class Start1 extends StatelessWidget {
  const Start1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack1(
        op: .3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "assets/images/480-[Converted] - Copy.png",
                width: 250.w,
                height: 250.h,
              ),
            ),
            Text(
              "SPROUTS",
              style: TextStyle(
                  color: Color(0xff056839),
                  fontSize: 32.sp,
                  fontFamily: "inika",
                  height: 0.h),
            ),
            Text(
              "Nurturing Plant",
              style: TextStyle(
                  color: Color(0xff056839),
                  fontSize: 15.sp,
                  fontFamily: "inika",
                  height: 0.h),
            ),
            SizedBox(height: 100.h),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF61AF2B),
                  minimumSize: Size(180.w, 60.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontFamily: 'Inter',
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Login();
                  }));
                }),
          ],
        ),
      ),
    );
  }
}
