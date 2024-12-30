import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantcare/main.dart';
import 'package:plantcare/services/jouranl.dart';

import '../services/tratment.dart';
import 'list_text.dart';

class ImmediateWidget extends StatefulWidget {
  const ImmediateWidget({super.key});

  @override
  State<ImmediateWidget> createState() => _ImmediateWidgetState();
}

class _ImmediateWidgetState extends State<ImmediateWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: task().getJOURNALDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data != null && snapshot.hasData) {
            final data = snapshot.data;
            return Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      width: .5, color: Color.fromARGB(255, 151, 150, 150)),
                ),
              ),
              child: CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                contentPadding: EdgeInsets.all(10.r),
                activeColor: const Color.fromARGB(255, 190, 186, 186),
                tileColor: const Color.fromARGB(255, 255, 255, 255),
                title: Text(data!.immediate),
                value: true,
                onChanged: (bool? value) {
                  setState(() {});
                },
              ),
            );
          }
          return const Text('there are rreror');
        });
  }
}

class AddedTaskWidget extends StatefulWidget {
  const AddedTaskWidget({super.key});

  @override
  State<AddedTaskWidget> createState() => _AddedTaskWidgetState();
}

class _AddedTaskWidgetState extends State<AddedTaskWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: displaytask().getJOURNALtask(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data != null && snapshot.hasData) {
            final data = snapshot.data;
            return Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      width: .5, color: Color.fromARGB(255, 151, 150, 150)),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(15.r),
                child: BulletList(
                  items: data!,
                ),
              ),
            );
          }
          return const Text('there are rreror');
        });
  }
}

class TreatmentWidget extends StatefulWidget {
  const TreatmentWidget({super.key});

  @override
  State<TreatmentWidget> createState() => _TreatmentWidgetState();
}

class _TreatmentWidgetState extends State<TreatmentWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: GetTreatment().getTreatment(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data != null && snapshot.hasData) {
            final data = snapshot.data;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: data!.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: .5, color: Color.fromARGB(255, 151, 150, 150)),
                    ),
                  ),
                  child: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    contentPadding: EdgeInsets.all(10.r),
                    activeColor:const Color.fromARGB(255, 190, 186, 186),
                    tileColor: const Color.fromARGB(255, 255, 255, 255),
                    title: Text(item.res),
                    value: true,
                    onChanged: (bool? value) {
                      setState(() {});
                    },
                  ),
                );
              },
            );
          }
          return const Text('there are rreror');
        });
  }
}

class DaTA3 extends StatefulWidget {
  const DaTA3({super.key});

  @override
  State<DaTA3> createState() => _DaTA3State();
}

class _DaTA3State extends State<DaTA3> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: task().getJOURNALDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data != null && snapshot.hasData) {
            final data = snapshot.data;
            return Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      width: .5, color: Color.fromARGB(255, 151, 150, 150)),
                ),
              ),
              child: CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                contentPadding: EdgeInsets.all(10.r),
                activeColor: const Color.fromARGB(255, 190, 186, 186),
                tileColor: const Color.fromARGB(255, 255, 255, 255),
                title: Text(data!.frequency_based),
                value: true,
                onChanged: (bool? value) {
                  setState(() {});
                },
              ),
            );
          }
          return const Text('there are rreror');
        });
  }
}
