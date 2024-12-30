import 'dart:io';
import 'package:adoptive_calendar/adoptive_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plantcare/customs_wedgit/list_text.dart';
import 'package:plantcare/models/jornaldata.dart';
import 'package:plantcare/screens/nav.dart';
import 'package:plantcare/screens/profile.dart';
import 'package:intl/intl.dart';
import 'package:plantcare/services/jouranl.dart';

class Journal extends StatefulWidget {
  const Journal({Key? key, required this.label});
  final String label;
  @override
  State<Journal> createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  TextEditingController title = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController data = TextEditingController();
  TextEditingController taskValue = TextEditingController();
  DateTime? pickedDate;
  File? _image;
  final picker = ImagePicker();
  Future getImageGallery() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image Picked');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF8F8F8),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30.r, right: 90.r, top: 30.r),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFF056839),
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: title,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    labelText: 'New Entry Journal',
                    labelStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    hoverColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 10.r,
                      top: 10.r,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFF056839),
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          labelText: widget.label,
                          labelStyle: const TextStyle(color: Colors.grey),
                          hintText: widget.label,
                          hintStyle: const TextStyle(color: Colors.black),
                          filled: true,
                          fillColor: Colors.white,
                          hoverColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 80.r, right: 10.r, top: 20.r),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0xFF056839),
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: data,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(9.r),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              hintText: pickedDate != null
                                  ? DateFormat('yyyy-MM-dd').format(pickedDate!)
                                  : 'date',
                              suffixIcon: IconButton(
                                onPressed: () async {
                                  pickedDate = await showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AdoptiveCalendar(
                                        initialDate: DateTime.now(),
                                      );
                                    },
                                  );
                                  setState(() {});
                                },
                                icon: const Icon(Icons.edit),
                              ),
                              hintStyle: const TextStyle(color: Colors.black),
                              filled: true,
                              fillColor: Colors.white,
                              hoverColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 80.r, right: 10.r, top: 10.r),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0xFF056839),
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: age,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(9.r),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              hintText: 'Age',
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.edit),
                              ),
                              hintStyle: const TextStyle(color: Colors.black),
                              filled: true,
                              fillColor: Colors.white,
                              hoverColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            /*Padding(
              padding: EdgeInsets.only(top: 30.r, left: 20.r, right: 20.r),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFF056839),
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                height: 200.h,
                child: Column(
                  children: [
                     Padding(
                      padding: EdgeInsets.only(right: 300.r),
                      child: Text(
                        'Note',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                    TextField(
                      textInputAction: TextInputAction.newline,
                      keyboardType: TextInputType.multiline,
                      maxLines: 6,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText:
                            'add any additional information or observations Title ..',
                        hintStyle: TextStyle(fontSize: 15.sp),
                        filled: true,
                        fillColor: Colors.white,
                        hoverColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),*/
            Center(
              child: InkWell(
                onTap: () {
                  getImageGallery();
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 30.0.r),
                  child: Container(
                    height: 250.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFF056839),
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: _image != null
                        ? Image.file(
                            _image!,
                            fit: BoxFit.fill,
                          )
                        : Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 30.r),
                                child: Text(
                                  'Add image',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20.sp),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 40.r),
                                child: Icon(Icons.note_add_outlined),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.r, vertical: 30.r),
              child: Text(
                'Task',
                style: TextStyle(
                    fontSize: 30.sp, color: Color.fromARGB(255, 3, 93, 37)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.r),
              child: TextField(
                controller: taskValue,
                maxLines: 7,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () async {
                        if (taskValue.text.isNotEmpty) {
                          await AddTask().addTask(taskValue.text);
                          taskValue.clear();
                        }
                      },
                      icon: const Icon(Icons.add)),
                  hintText: 'add task',
                  hintStyle: TextStyle(fontSize: 20.sp),
                  filled: true,
                  fillColor: Colors.white,
                  hoverColor: Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200.w,
                  height: 60.h,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 25.r, bottom: 10.r, right: 30.r),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF54796E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      onPressed: () async {
                        final status = await RJornal1().jornal(JornsalData(
                            age: age.text,
                            date: DateFormat('yyyy-MM-dd').format(pickedDate!),
                            title: title.text,
                            image: _image!));
                        if (status == true) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const Profile();
                          }));
                        }
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.paste_sharp,
                            color: Colors.white,
                            size: 20.r,
                          ), // Icon before text
                          SizedBox(width: 10.w), // Spacer between icon and text
                          Text(
                            'Save',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 60.w,
                ),
                SizedBox(
                  width: 200.w,
                  height: 60.h,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 23.r, bottom: 10.r, right: 10.r),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 227, 91, 114),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const select1();
                        }));
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.exit_to_app,
                            color: Colors.white,
                            size: 20.r,
                          ), // Icon before text
                          SizedBox(width: 10.w), // Spacer between icon and text
                          Text(
                            ' Cancel',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
