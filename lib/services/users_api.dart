import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:plantcare/const.dart';
import 'package:plantcare/models/data.dart';

class Register1 {
  Future<bool> registerUser(userModel userModel) async {
    var url = Uri.parse('$baseUrl/register');
    log("message");
    try {
      var request = http.MultipartRequest('POST', url);

      // Add fields (username, email, password) to the request
      request.fields['username'] = userModel.username;
      request.fields['email'] = userModel.email;
      request.fields['password'] = userModel.password!;

      // Add image file to the request as a file
      var imageStream = http.ByteStream(userModel.image.openRead());
      var length = await userModel.image.length();
      var multipartFile = http.MultipartFile(
        'file',
        imageStream,
        length,
        filename: userModel.image.path.split('/').last,
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

class DisplayData {
  Future<userModel> getuserDetails() async {
    // Define the URL
    var url = '$baseUrl/display';
    var headers = {
      'Cookie':
          'session=eyJpZCI6MjcsImxvZ2dlZGluIjp0cnVlLCJyZXN1bHQiOiJMZWFmX01vbGQiLCJ1c2VybmFtZSI6Im1vU2FsYWgifQ.ZoNEYA.510GiZi7MXCQ1Y5Yd2jePlMytWU'
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    log('test error: ${response.body}');
    log('test error: ${response.statusCode}');
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      userModel t1 = userModel(
          email: data['User_Data']['email'],
          username: data['User_Data']['username'],
          image: data['User_Data']['image']);
      return t1;
    }
    log(response.body);
    try {
      throw response.statusCode;
    } catch (e) {
      log('Error: $e');
      throw e;
    }
  }
}

class login1 {
  Future<bool> loginUser(userName, password) async {
    var url = '$baseUrl/login';
    // var headers = {
    //   'Cookie':
    //       'session=eyJpZCI6MjcsImxvZ2dlZGluIjp0cnVlLCJyZXN1bHQiOiJMZWFmX01vbGQiLCJ1c2VybmFtZSI6Im1vU2FsYWgifQ.ZoNEYA.510GiZi7MXCQ1Y5Yd2jePlMytWU'
    // };
    log("message");
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      // Add fields (username, email, password) to the request
      request.fields['username'] = userName;
      request.fields['password'] = password;
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final session = response.headers['set-cookie'];
        log(session.toString());
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

class update1 {
  Future<bool> updataUser(userModel userModel) async {
    var url = Uri.parse(' http://192.168.1.7:5001/update');
    log("message");
    try {
      var request = http.MultipartRequest('POST', url);

      // Add fields (username, email, password) to the request
      request.fields['username'] = userModel.username;
      request.fields['email'] = userModel.email;
      request.fields['password'] = userModel.password!;

      // Add image file to the request as a file
      var imageStream = http.ByteStream(userModel.image.openRead());
      var length = await userModel.image.length();
      var multipartFile = http.MultipartFile(
        'file',
        imageStream,
        length,
        filename: userModel.image.path.split('/').last,
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
        log('Failed to updata: ${response.body}');
        return false;
      }
    } catch (e) {
      // Exception occurred during registration
      log('Exception during udate: $e');
      return false;
    }
  }
}

Future<void> logoutUser() async {
  // Replace with your actual API endpoint for logout
  const String apiUrl = ' http://192.168.1.7:5001/logout';

  try {
    // Make a POST request to the logout endpoint
    final response = await http.post(
      Uri.parse(apiUrl),
    );

    // Check the response status
    if (response.statusCode == 200) {
      // Successful logout
      print('User logged out successfully');
    } else {
      // Handle other status codes if needed
      print('Failed to logout. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle network or server errors
    print('Error during logout: $e');
  }
}
