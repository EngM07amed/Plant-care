import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Textfiled extends StatefulWidget {
  Textfiled({
    this.la,
    this.hi,
  });
  final String? la;
  final String? hi;

  @override
  State<Textfiled> createState() => _TextfiledState();
}

class _TextfiledState extends State<Textfiled> {
  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 15,
        shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.elliptical(20, 10),
                bottomLeft: Radius.elliptical(9, 9))),
        shadowColor: Color.fromARGB(255, 120, 114, 120),
        child: TextField(
          decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.grey),
            hintStyle: TextStyle(color: const Color.fromARGB(255, 34, 66, 35)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                gapPadding: CupertinoThumbPainter.extension),
            suffixIcon: Icon(Icons.edit),
            labelText: widget.la,
            hintText: widget.hi,
          ),
          keyboardType: TextInputType.name,
        ));
  }
}
