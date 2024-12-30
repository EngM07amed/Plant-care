import 'dart:convert';
import 'dart:developer';
import 'dart:io';
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

    try {
      if (session.isNotEmpty) {
        final response =
            await http.get(Uri.parse(url), headers: {'Cookie': session});

        if (response.statusCode == 200) {
          final Map<String, dynamic> data = json.decode(response.body);
          userModel t1 = userModel(
              email: data['User_Data']['email'],
              username: data['User_Data']['username'],
              image: File(data['User_Data']['image']));
          return t1;
        }
        throw response.statusCode;
      }
      throw 'use not login please login';
    } catch (e) {
      throw e;
    }
  }
}

String session = '';

class login1 {
  Future<bool> loginUser(userName, password) async {
    var url = '$baseUrl/login';

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      // Add fields (username, email, password) to the request
      request.fields['username'] = userName;
      request.fields['password'] = password;
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final sessionData = response.headers['set-cookie'];
        if (sessionData != null) {
          session = sessionData;
        } else {
          log('try again leter');
          return false;
        }
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
    var url = Uri.parse('$baseUrl/update');
    log("message");
    try {
      var request = http.MultipartRequest('POST', url);

      // Add fields (username, email, password) to the request
      request.fields['username'] = userModel.username;
      request.fields['email'] = userModel.email;
      request.fields['password'] = userModel.password!;
      request.headers.addAll({'Cookie': session});

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
        log('success');
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
  String apiUrl = '$baseUrl/logout';

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
