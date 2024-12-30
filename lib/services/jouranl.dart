import 'dart:convert';
import 'dart:io';

import 'package:plantcare/customs_wedgit/image.dart';
import 'package:plantcare/models/jornaldata.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:plantcare/services/users_api.dart';

import '../const.dart';

class RJornal1 {
  Future<bool> jornal(JornsalData jornal2) async {
    var url = Uri.parse('$baseUrl/create_journal');
    log("message");
    try {
      var request = http.MultipartRequest('POST', url);

      // Add fields (username, email, password) to the request
      request.fields['title'] = jornal2.title;
      request.fields['plant_age'] = jornal2.age;
      request.fields['date'] = jornal2.date;

      // Add image file to the request as a file
      var imageStream = http.ByteStream(jornal2.image.openRead());
      var length = await jornal2.image.length();
      var multipartFile = http.MultipartFile(
        'file',
        imageStream,
        length,
        filename: jornal2.image.path.split('/').last,
      );
      request.headers.addAll({'Cookie': sessionPredict});
      request.files.add(multipartFile);

      // Send the request
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        log('success ');
        log(response.body.toString());
        return true;
      } else {
        // Registration failed
        log('Failed to register: ${response.body}');
        return false;
      }
    } catch (e) {
      // Exception occurred during registration
      log('Exception during registration: $e');
      return false;
    }
  }
}

class saved {
  Future<List<JornsalData>> getJORNALDetails() async {
    // Define the URL
    var url = '$baseUrl/saved_journal';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Cookie': session,
        },
      );
      if (response.statusCode == 200) {
        // Parse the response body
        final bodyDecoded = jsonDecode(response.body);
        final List data = bodyDecoded['Journal_Data'];
        log(bodyDecoded.toString());
        // Extract the required fields
        List<JornsalData> jornsals = [];
        for (var item in data) {
          String title = item['title'];
          String age = item['Plant_age'];
          String date = item['date'] ?? '';
          String image = item['image'];
          String diagnoses = item['Disease_name'];
          jornsals.add(JornsalData(
              age: age,
              date: date,
              title: title,
              image: File(image),
              diagnoses: diagnoses));
        }

        return jornsals;
      } else {
        print('Failed to load user details');
        throw 'Failed to load user details';
      }
    } catch (e) {
      print('Error: $e');
      throw e.toString();
    }
  }
}

class task {
  Future<tasks> getJOURNALDetails() async {
    var url = '$baseUrl/tasks';
    try {
      final response =
          await http.get(Uri.parse(url), headers: {'Cookie': sessionPredict});

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final jornal = data['journal'];
        if (jornal != null) {
          tasks t1 = tasks(
            frequency_based:
                jornal['frequency-based'] ?? [], // Providing default value
            immediate: jornal['immediate'] ?? [], // Providing default value
            one: jornal['one-time'] ?? [], // Providing default value
          );
          return t1;
        } else {
          throw Exception("Journal data is null");
        }
      } else {
        throw Exception("Failed to load tasks");
      }
    } catch (e) {
      log('Error: $e');
      throw e;
    }
  }
}

class AddTask {
  Future<bool> addTask(String task) async {
    var url = Uri.parse('$baseUrl/add_task');
    log("message");
    try {
      var request = http.MultipartRequest('POST', url);

      // Add fields (username, email, password) to the request
      request.fields['task'] = task;
      request.headers['Cookie'] = sessionPredict;
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        log('success ');
        return true;
      } else {
        // Registration failed
        log('Failed to register: ${response.body}');
        return false;
      }
    } catch (e) {
      // Exception occurred during registration
      log('Exception during registration: $e');
      return false;
    }
  }
}

class displaytask {
  Future<List<String>> getJOURNALtask() async {
    var url = '$baseUrl/select_additional_task';
    try {
      final response =
          await http.get(Uri.parse(url), headers: {'Cookie': sessionPredict});

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final List tasks = data['task'];
        return tasks.map((e) => e['task'] as String).toList();
      }
      throw response.statusCode;
    } catch (e) {
      log('Error: $e');
      throw e;
    }
  }
}
