import 'package:docs_appointment_home/doctor_model.dart';
import 'package:docs_appointment_home/doctor_service.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class ListDataX extends GetxController {
  final doctorList = DoctorModel().obs;

  void fetchDoctor() async {
    var doctor = await DoctorService.getDoctor();
    if(false) {
      doctorList.value = doctor;
      //update();
    }
  }

  /*List<int> numbers = List<int>.from([0, 1, 2, 3]);

  void httpCall() async {
    await Future.delayed(Duration(seconds: 1), () => numbers.add(numbers.last + 1));
    update();
  }

  void reset() {
    numbers = numbers.sublist(0, 3);
    update();
  }*/
}