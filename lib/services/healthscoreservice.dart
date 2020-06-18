import 'dart:convert';

import 'package:health_score_app/models/api-response.dart';
import 'package:health_score_app/models/parameters.dart';
import 'package:http/http.dart' as http;

class HealthScoreService {
  static const API="http://localhost/api/getScoreApp";

  static const headers = {
    'Content-Type': 'application/json'
  };

  Future<APIResponse<dynamic>> getHealthScore (Parameters item) async{
    final http.Response response = await http.post(
      API,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(item),
    );
    if(response.statusCode == 200) {
      return APIResponse<dynamic>(data: response.body);
    } else {
      return APIResponse<dynamic>(error: true, errorMessage: "Error in getting Health Score");
    }
    
  }
}