import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Saved extends StatefulWidget {
  const Saved({super.key});

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
          ),
          dense: true,
          minVerticalPadding: 30,
          leading: Image.asset("assets/images/unsplash_WPZlpwJx0Lk.png"),
          title: const Text(
            "Water your tomato today ",
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 15,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_forward_ios),
          ) // Icon(Icons.arrow_forward_ios),
          ),
    );
  }
}

class Saved2 extends StatefulWidget {
  const Saved2({super.key});

  @override
  State<Saved2> createState() => _Saved2State();
}

class _Saved2State extends State<Saved2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0.r, right: 20.r, top: 5.r),
      child: Material(
          elevation: 15,
          shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.elliptical(20.r, 10.r),
                  bottomLeft: Radius.elliptical(10.r, 10.r))),
          shadowColor: Color.fromARGB(255, 120, 114, 120),
          child: SizedBox(
            height: 80.h,
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
                side: const BorderSide(color: Color.fromARGB(255, 69, 66, 66)),
              ),
              dense: true,
              minVerticalPadding: 20.r,
              leading: Image.asset("assets/images/unsplash_WPZlpwJx0Lk.png"),
              title: Text(
                "Healthy ",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(left: 200.0.r),
                child: Text("data"),
              ),
            ),
          )),
    );
  }
}

class JournalFiled extends StatelessWidget {
  const JournalFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
