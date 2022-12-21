import 'package:get/get.dart';

import 'level_Indicator.dart';


class MyController extends GetxController {
  var std = Student(name: "Dnyaneshwar").obs;
  // var std = Student();
  // void converToUpperCase(){
  //   std.name.value = std.name.value.toString().toUpperCase();
  // }
  void converToUpperCase() {
    std.update((val) {
      if (std.value.name == std.value.name.toString().toUpperCase()) {
        std.value.name = std.value.name.toString().toLowerCase();
      } else {
        std.value.name = std.value.name.toString().toUpperCase();
      }
    });
  }
}
