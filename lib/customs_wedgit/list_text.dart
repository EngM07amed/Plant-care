import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BulletList extends StatelessWidget {
  const BulletList({super.key, required this.items, this.physics});
  final List<String> items;
  final ScrollPhysics? physics;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: physics,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 20.r, top: 6.r),
            child: RichText(
              softWrap: true,
              text: TextSpan(
                children: [
                  TextSpan(
                      text: '\u2022  ',
                      style: TextStyle(fontSize: 20.sp, color: Colors.black)),
                  TextSpan(
                    text: items[index],
                    style: TextStyle(
                      color: const Color.fromARGB(255, 21, 49, 23),
                      fontSize: 24.sp,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
          //title: Text(items[index]),

    
