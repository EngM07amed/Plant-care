import 'dart:convert';

import 'package:plantcare/models/jornaldata.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;

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
      request.files.add(multipartFile);

      // Send the request
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

class saved {
  Future<void> getJORNALDetails() async {
    // Define the URL
    var url = 'http://192.168.1.7:5001/saved_journal';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Parse the response body
        final Map<String, dynamic> data = json.decode(response.body);

        // Extract the required fields
        String title = data['title'];
        String age = data['plant_age'];
        String date = data['date'];
        String image = data['file'];

        // Print the details (or use them as needed)
        print('title: $title');
        print('plant_age: $age');
        print('date: $date');
        print('file: $image');
      } else {
        print('Failed to load user details');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}

class task {
  Future<tasks> getJOURNALDetails() async {
    var url = '$baseUrl/saved_journal';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        tasks t1 = tasks(
            frequency_based: data['journal']['frequency-based'],
            immediate: data['journal']['immediate'],
            one: data['journal']['one-time']);
        return t1;
      }
      throw response.statusCode;
    } catch (e) {
      print('Error: $e');
      throw e;
    }
  }
}

class addTask {
  Future<bool> AddTask(addtask add1) async {
    var url = Uri.parse('$baseUrl/add_task');
    log("message");
    try {
      var request = http.MultipartRequest('POST', url);

      // Add fields (username, email, password) to the request
      request.fields['task'] = add1.task;
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
  Future<addtask> getJOURNALtask() async {
    var url = '$baseUrl/select_additional_task';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        addtask t2 = addtask(
          task: data['task'],
        );
        return t2;
      }
      throw response.statusCode;
    } catch (e) {
      print('Error: $e');
      throw e;
    }
  }
}
