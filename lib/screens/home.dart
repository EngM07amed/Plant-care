import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:plantcare/customs_wedgit/image.dart';
//import 'package:plantcare/compent/saved.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 15.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("SPROUTS",
                    style: TextStyle(
                        color: Color(0xff056839),
                        fontSize: 20.sp,
                        fontFamily: "Inika",
                        fontWeight: FontWeight.w700)),
                SizedBox(
                  width: 250.w,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0.r),
                    child: TextField(
                      onSubmitted: (data) {
                        print(data);
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5.r),
                          hintText: "Search product investment",
                          hintStyle: TextStyle(
                              color: Color(0xff9B9B9B), fontSize: 10.sp),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Color(0xff056839),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.r))),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () async {
                      GoogleSignIn googleSignIn = GoogleSignIn();
                      googleSignIn.disconnect();
                      await FirebaseAuth.instance.signOut();
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil("login", (route) => false);
                    },
                    icon: Icon(
                      Icons.exit_to_app,
                      color: Color(0xff056839),
                      size: 30.r,
                    ))
              ],
            ),
          ),
          Container(),
          Divider(
            height: 10.h,
            endIndent: 25,
            indent: 25.w,
            color: Colors.black,
            thickness: 1.h,
          ),
          Padding(
            padding: EdgeInsets.all(8.0.r),
            child: Text(
              "Heal your crop",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0.r),
            child: Row(
              children: [
                Column(
                  children: [
                    Image.asset("assets/images/Group 776.png"),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0.r),
                      child: const Text("Take a picture"),
                    )
                  ],
                ),
                SizedBox(
                  width: 60.w,
                  child: Icon(Icons.arrow_forward_ios_outlined),
                ),
                Column(
                  children: [
                    Image.asset("assets/images/mobile_v.png"),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0.r),
                      child: Text("See diagnosis"),
                    )
                  ],
                ),
                const SizedBox(
                  width: 60,
                  child: Icon(Icons.arrow_forward_ios_outlined),
                ),
                Column(
                  children: [
                    Image.asset("assets/images/med_v.png"),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0.r),
                      child: Text("Get medicine"),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.0.r, vertical: 50.r),
            child: SizedBox(
              width: 50.w,
              height: 90.h,
              child: ImageData(),
            ),
          ),
          Divider(
            height: 10.h,
            endIndent: 25.w,
            indent: 25.w,
            color: Colors.black,
            thickness: 1.h,
          ),
          /* Padding(
            padding: EdgeInsets.only(top: 15.0.r, left: 15.r),
            child: Row(
              children: [
                Text(
                  "Alerts ",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 30.w,
                  child: Icon(Icons.add_box_outlined, color: Colors.black),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 230.0.r),
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "View all",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xff61AF2B)),
                      )),
                )
              ],
            ),*/

          /*Padding(
            padding:  EdgeInsets.only(top: 15.0.r),
            child: Saved(),
          ),
          Saved(),
          Saved(),*/
        ],
      ),
    );
  }
}
