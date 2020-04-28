import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "https://jsonplaceholder.typicode.com/users";

class API {
  static Future getUsers() {
    return http.get(baseUrl);
  }
}