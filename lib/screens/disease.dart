import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantcare/screens/treatment.dart';
import 'package:readmore/readmore.dart';

class Disease extends StatefulWidget {
  const Disease({super.key});

  @override
  State<Disease> createState() => _DiseaseState();
}

class _DiseaseState extends State<Disease> {
  String content =
      'Septoria leaf spot is caused by\n mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            const Stack1(),
            ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 40.sp,
                          ),
                          color: Colors.white,
                          hoverColor: Colors.transparent,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 200.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60.r),
                              topRight: Radius.circular(60.r),
                            ),
                          ),
                          width: double.infinity,
                          height: 1000.h,
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
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Text(
                                      'Hurray, we identified the disease',
                                      style: TextStyle(
                                          color: Color(0xFF7CBC50),
                                          fontSize: 15.sp),
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Septoria Leaf Spot',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                              Center(
                                child: SizedBox(
                                  height: 50.h,
                                  width: 280.w,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF7CBC50),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return const TreatmentData();
                                      }));
                                    },
                                    child: Text(
                                      'Show Treatment ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20.r),
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'About',
                                    style: TextStyle(
                                        color: Color(0xFF275C4D),
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0.r),
                                child: SingleChildScrollView(
                                  child: ReadMoreText(
                                    content,
                                    trimLines: 1,
                                    textAlign: TextAlign.justify,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: ' Read More ',
                                    trimExpandedText: ' Read Less ',
                                    moreStyle: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600),
                                    lessStyle: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20.r),
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Tips',
                                    style: TextStyle(
                                        color: Color(0xFF275C4D),
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              SizedBox(height: 18.h),
                              Padding(
                                padding: EdgeInsets.all(8.0.r),
                                child: SingleChildScrollView(
                                  child: ReadMoreText(
                                    content,
                                    trimLines: 1,
                                    textAlign: TextAlign.justify,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: ' Read More ',
                                    trimExpandedText: ' Read Less ',
                                    moreStyle: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600),
                                    lessStyle: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(30.r),
                                child: Divider(
                                  color: Colors.black,
                                  height: 1.h,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 40.r),
                                child: Row(
                                  children: [
                                    Text(
                                      'Save this diagnose\nto new entry journal',
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          color: Color(0xFF275C4D),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      width: 50.w,
                                    ),
                                    SizedBox(
                                      height: 50.h,
                                      width: 80.w,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFF7CBC50),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                          ),
                                        ),
                                        onPressed: () {},
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
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class Stack1 extends StatelessWidget {
  const Stack1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          opacity: 0.3,
          fit: BoxFit.fill,
          image: AssetImage(
              'images/close-up-florist-holding-smartphone_23-2149235746.jpg'),
        )));
  }
}
