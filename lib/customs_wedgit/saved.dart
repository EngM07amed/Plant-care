import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantcare/const.dart';
import 'package:intl/intl.dart';
import '../screens/dieaseas1.dart';
import '../screens/healty.dart';
import '../services/jouranl.dart';

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
    return FutureBuilder(
        future: saved().getJORNALDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.data != null && snapshot.hasData) {
            final jornalData = snapshot.data;
            if (jornalData!.isEmpty) {
              return Center(
                  child: Text(
                'No Jornal Saved yet!!',
                style: Theme.of(context).textTheme.headlineSmall,
              ));
            }
            return ListView.builder(
              shrinkWrap: true,
              itemCount: jornalData!.length,
              itemBuilder: (context, index) {
                final jornal = jornalData[index];
                return Padding(
                  padding: EdgeInsets.only(
                      left: 20.0.r, right: 20.r, top: 5.r, bottom: 10.r),
                  child: Material(
                    elevation: 15,
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.elliptical(20.r, 10.r),
                            bottomLeft: Radius.elliptical(10.r, 10.r))),
                    shadowColor: Color.fromARGB(255, 0, 71, 12),
                    child: SizedBox(
                      height: 80.h,
                      child: InkWell(
                        onTap: () {
                          if (jornal.diagnoses == 'Healthy') {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Healthy(
                                      jornal: jornal,
                                    )));
                          } else {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Problem1(
                                      jornal: jornal,
                                    )));
                          }
                        },
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.network(jornal.image.path
                                      .contains('uploads')
                                  ? '$baseUrl/${jornal.image.path}'
                                  : '$baseUrl/uploads/${jornal.image.path}'),
                              Text(
                                jornal.diagnoses,
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 3, 121, 23),
                                ),
                              ),
                              Text(DateFormat('yy-MM-dd').format(
                                  DateFormat('EEE, dd MMM yyyy HH:mm:ss')
                                      .parse(jornal.date))),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Text('There are error!!');
        });
  }
}

class JournalFiled extends StatelessWidget {
  const JournalFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
