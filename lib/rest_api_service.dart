import 'dart:convert';

import 'package:demo_project/user.dart';
import 'package:http/http.dart' as http;

class RestAPIService {
  String apiUrl = 'https://api.mocki.io/v2/b99aa5b4';
// this is the future method to get user from api url...(response or error)
  Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // I added return here
      return getUserList(response.body);
    } else {
      throw Exception('Unable to fetch data');
    }
  }

//this will convert response body to user object list
  List<User> getUserList(String responseBody) {
    final parsedBody = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsedBody.map<User>((json) => User.fromJson(json)).toList();
  }
}
