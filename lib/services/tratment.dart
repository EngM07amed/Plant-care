import 'dart:convert';
import 'dart:developer';
import 'package:plantcare/models/treatmentData.dart';
import 'package:http/http.dart' as http;

class GetTreatment {
  Future<List<modelTreatment>> getTips() async {
    try {
      http.Response response =
          await http.get(Uri.parse('http://192.168.1.6:5001/select_data'));
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
      http.Response response = await http
          .get(Uri.parse('http://192.168.1.6:5001/select_data_treetment'));
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
