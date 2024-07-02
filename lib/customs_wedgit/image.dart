import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:plantcare/screens/Show_image.dart';

class ImageData extends StatefulWidget {
  const ImageData({
    super.key,
  });

  @override
  State<ImageData> createState() => _ImageDataState();
}

class _ImageDataState extends State<ImageData> {
  File? image;
  var url = 'http://192.168.1.7:5001/predict';
  String? result;
  final picker = ImagePicker();
  Future<void> upload() async {
    if (image == null) {
      print("No image selected");
      return;
    } else {
      final request = http.MultipartRequest("POST", Uri.parse(url));
      request.headers['Content-Type'] =
          'multipart/form-data'; // Correct content-type header
      request.files.add(
        http.MultipartFile(
          'file',
          image!.readAsBytes().asStream(),
          image!.lengthSync(),
          filename: image!.path.split('/').last,
        ),
      );
      final response = await request.send();
      final responseBody = await response.stream.bytesToString();
      print("Response: $responseBody");
      result = responseBody;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4F7569),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80),
          ),
        ),
        onPressed: () {
          _showmodelbotttomsheet(
            context: context,
            cameraMethod: () async {
              await picker
                  .pickImage(source: ImageSource.camera)
                  .then((value) => setState(() {
                        print("ffffffffffffffffffff${value?.path}");

                        image = File(value?.path ?? "");
                      }));
              upload().then((value) {
                print("From  upload");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowImage(
                        result: "$result",
                        image: image,
                      ),
                    ));
              });
            },
            gaMethod: () async {
              await picker
                  .pickImage(source: ImageSource.gallery)
                  .then((value) => setState(() {
                        print("${value?.path}");
                        image = File(value?.path ?? "");
                      }));
              upload().then((value) {
                print("From  upload");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowImage(
                        result: "$result",
                        image: image,
                      ),
                    ));
              });
            },
          );
        },
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.r, right: 20.r),
              child: Image.asset("assets/images/scan.png"),
            ),
            Text(
              "diagnose Your Plant",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255), fontSize: 15.sp),
            )
          ],
        ));
  }
}

Future _showmodelbotttomsheet(
    {required BuildContext context,
    void Function()? cameraMethod,
    void Function()? gaMethod}) {
  return showModalBottomSheet(
      context: context,
      builder: (context) => SizedBox(
            width: double.infinity,
            height: 600.h,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              TextButton(
                onPressed: cameraMethod,
                child: Icon(
                  Icons.camera_alt,
                  size: 30.r,
                  color: Color(0xFF204C25),
                ),
              ),
              const Text(
                "Camera",
                style:
                    TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 100.h,
              ),
              TextButton(
                onPressed: gaMethod,
                child: Icon(
                  Icons.photo_library,
                  size: 30.r,
                  color: Color(0xFF204C25),
                ),
              ),
              const Text(
                "Gallery",
                style:
                    TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w700),
              ),
            ]),
          ));
}
