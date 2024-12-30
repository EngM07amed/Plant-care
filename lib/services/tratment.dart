import 'dart:convert';
import 'dart:developer';
import 'package:plantcare/const.dart';
import 'package:plantcare/customs_wedgit/image.dart';
import 'package:plantcare/models/treatmentData.dart';
import 'package:http/http.dart' as http;

class GetTreatment {
  Future<List<modelTreatment>> getTips() async {
    try {
      http.Response response =
          await http.get(Uri.parse('$baseUrl/select_data'));
      Map<String, dynamic> data = jsonDecode(response.body);

      List<modelTreatment> TreatmentList = [];

      List re = data['result'];
      for (var item in re) {
        TreatmentList.add(modelTreatment(res: item));
      }
      log(TreatmentList.toString());
      return TreatmentList;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<List<modelTreatment>> getTreatment() async {
    try {
      http.Response response =
          await http.get(Uri.parse('$baseUrl/select_data_treetment'), headers: {
        'Cookie': sessionPredict,
      });
      Map<String, dynamic> data = jsonDecode(response.body);

      List<modelTreatment> TreatmentList = [];

      List re = data['result'];
      for (var item in re) {
        TreatmentList.add(modelTreatment(res: item));
      }
      log(TreatmentList.toString());
      return TreatmentList;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
