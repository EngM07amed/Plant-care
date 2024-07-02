import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:plantcare/screens/jornal.dart';
import 'package:plantcare/screens/treatment.dart';
import 'package:plantcare/services/tratment.dart';

import '../customs_wedgit/list_text.dart';

class ShowImage extends StatefulWidget {
  const ShowImage({super.key, required this.image, required this.result});
  final File? image;
  final String? result;
  @override
  State<ShowImage> createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
          alignment: Alignment.topCenter,
          child: Image.file(
            File((widget.image?.path ?? "no")),
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
            child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 227, 227, 227),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_rounded,
                      color: Color(0xFF7CBC50),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Hurray, we identified the disease',
                      style: TextStyle(color: Color(0xFF7CBC50), fontSize: 15),
                    ),
                  ],
                ),
              ),
              Text(
                " ${widget.result}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 60,
              ),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 280,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7CBC50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      GetTreatment();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const TreatmentData();
                      }));
                    },
                    child: const Text(
                      'Show Treatment ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'About',
                        style: TextStyle(
                            color: Color(0xFF275C4D),
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  /* Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Tips',
                        style: TextStyle(
                            color: Color(0xFF275C4D),
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),*/
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SingleChildScrollView(
                    child: FutureBuilder(
                      future: GetTreatment().getTips(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (snapshot.data != null &&
                            snapshot.data!.isNotEmpty) {
                          log(snapshot.data!.toString());
                          return BulletList(
                            items: snapshot.data!.map((e) => e.res).toList(),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40, left: 40, right: 40),
                child: Divider(
                  color: Colors.black,
                  height: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, top: 75),
                child: Row(
                  children: [
                    const Text(
                      'Save this diagnose\nto new entry journal',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF275C4D),
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    SizedBox(
                      height: 50,
                      width: 80,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF7CBC50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const Journal();
                          }));
                        },
                        child: const Text(
                          'Add ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
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
        )),
      ]),
    );
  }
}
             /* "Welcome ${widget.result}",*/
             //FileImage(File((widget.image?.path ?? "no"))),
