import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Stack1 extends StatelessWidget {
  Stack1({super.key, this.child, this.width, this.height, this.op});
  final Widget? child;
  final double? width;
  final double? height;
  final double? op;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          opacity: op ?? .7,
          fit: BoxFit.cover,
          image: AssetImage(
              'assets/images/close-up-florist-holding-smartphone.jpg'),
        ),
      ),
      child: child,
    );
  }
}

// ignore: must_be_immutable
class boxDesign extends StatelessWidget {
  boxDesign({
    super.key,
    required this.Text1,
    required this.controller,
    required this.validator,
  });
  String? Text1;
  TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(18.r)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Color.fromARGB(255, 255, 255, 255), width: 2.w),
          borderRadius: BorderRadius.circular(18.r),
        ),
        hintText: Text1,
        hintStyle:  TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 14.sp,
          fontFamily: 'Inter',
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
