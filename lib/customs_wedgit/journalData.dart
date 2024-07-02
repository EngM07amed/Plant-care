import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantcare/main.dart';

class JournalData extends StatefulWidget {
  const JournalData({super.key});

  @override
  State<JournalData> createState() => _JournalDataState();
}

class _JournalDataState extends State<JournalData> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: index,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                width: .5, color: Color.fromARGB(255, 151, 150, 150)),
          ),
        ),
        child: CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          contentPadding: EdgeInsets.all(10.r),
          activeColor: Color.fromARGB(255, 190, 186, 186),
          tileColor: Color.fromARGB(255, 255, 255, 255),
          title: Text('CheckboxListTile with red background'),
          value: true,
          onChanged: (bool? value) {
            setState(() {});
          },
        ),
      ),
    );
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
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: index,
      itemBuilder: (context, index) => Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: .5, color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
        child: CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          contentPadding: EdgeInsets.all(5.r),
          activeColor: Color.fromARGB(255, 137, 137, 137),
          tileColor: Color.fromARGB(255, 255, 255, 255),
          title: Text('CheckboxListTile with red background'),
          value: true,
          onChanged: (bool? value) {
            setState(() {});
          },
        ),
      ),
    );
  }
}
