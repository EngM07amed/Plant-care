import 'dart:io';

class JornsalData {
  final String title;
  final String age;
  final String date;
  final File image;

  JornsalData(this.age, this.date, this.title, this.image);
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

class addtask {
  final String task;

  addtask({required this.task});
}
