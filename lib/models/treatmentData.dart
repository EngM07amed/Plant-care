class modelTreatment {
  final String res;

  modelTreatment({required this.res});

  factory modelTreatment.fromJson(jsonData) {
    return modelTreatment(res: jsonData['result']);
  }
}
