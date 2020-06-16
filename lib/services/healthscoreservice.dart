import 'dart:convert';

import 'package:health_score_app/models/api-response.dart';
import 'package:health_score_app/models/parameters.dart';
import 'package:http/http.dart' as http;

class HealthScoreService {
  static const API="http://localhost/api/getScoreApp";

  static const headers = {
    'Content-Type': 'application/json'
  };

  Future<APIResponse<Object>> getHealthScore(Parameters item){
    return http.post(API, headers: headers, body: json.encode(item.toJson()))
    .then((value) {
      if(value.statusCode == 200) {
        return APIResponse<Object>(data: value);
      } else {
        return APIResponse<Object>(error: true, errorMessage: "Cannot Get Health Score");
      }
      
    }).catchError((_)=>{
      APIResponse<Object>(error: true, errorMessage: "Cannot Get Health Score")
    });
  }
}