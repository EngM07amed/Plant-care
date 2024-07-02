import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BulletList extends StatelessWidget {
  const BulletList({super.key, required this.items});
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: items.length,
        prototypeItem: ListTile(
          title: Text(items.first),
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '\u2022',
                  style: TextStyle(
                    fontSize: 14,
                    height: 2,
                  ),
                ),
                const SizedBox(
                  width: 1,
                ),
                Container(
                  width: 380.w,
                  child: Text(
                    items[index],
                    textAlign: TextAlign.left,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 18.r,
                      color: Color.fromARGB(255, 21, 49, 23),
                      height: 2,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
          //title: Text(items[index]),

    
