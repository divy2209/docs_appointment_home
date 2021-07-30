import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:docs_appointment_home/services/doctor_api_model.dart';
import 'package:get/get.dart';

class DoctorApiManager{
  Dio dio = Dio();
  Future<DoctorApiModel> getDoctors() async {
    final response = await dio.get('https://reqres.in/api/users/');

    if(response.statusCode == 200) {
      return DoctorApiModel.fromJson(response.data);
    } else {
      throw Exception('Could not load doctors');
    }
  }
}