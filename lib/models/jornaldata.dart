import 'dart:io';

class JornsalData {
  final String title;
  final String age;
  final String diagnoses;
  final String date;
  final File image;

  JornsalData(
      {required this.age,
      required this.date,
      required this.title,
      this.diagnoses = '',
      required this.image});
}

class tasks {
  final String frequency_based;
  final String immediate;
  final String one;

  tasks(
      {required this.frequency_based,
      required this.immediate,
      required this.one});
}
