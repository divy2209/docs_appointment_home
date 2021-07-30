import 'dart:convert';

import 'package:dio/dio.dart';

import 'doctor_model.dart';

class DoctorService {
  static Dio dio = Dio();

  static Future<DoctorModel> getDoctor() async {
    final response = await dio.get('https://reqres.in/api/users/1');

    print(response.data);

    if(response.statusCode == 200) {
      print(response.statusCode);
      return DoctorModel.fromJson(response.data);
    } else {
      throw Exception('Not able to load doctors');
    }
  }

}