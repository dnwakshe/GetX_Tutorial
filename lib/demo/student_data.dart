// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'myController.dart';


class MyStateUpdate extends StatelessWidget {
  MyStateUpdate({super.key});
  // Student std = Student(name: "Dnyaneshwar", comp: "cherish", sal: 5000);
  MyController myController = Get.put(MyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Student Data")),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Student Data",
                  style: TextStyle(fontSize: 25),
                ),
                Obx(
                  () => Text("Name is ${myController.std.value.name.toString()}"),
                ),
                ElevatedButton(
                    onPressed: () {
                      myController.converToUpperCase();
                    },
                    child: Text("Upper")),
              ],
            ),
          ),
        ));
  }
}

class Student {
  var name;
  var comp;
  var sal;
  Student({
    this.name,
    this.comp,
    this.sal,
  });
}
