import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bottomSheet.dart';

class LevelIndicator extends StatelessWidget {
  LevelIndicator({super.key});
  var count = 0.obs;
  double levelCount = 0.0;
  final std = Student(name: "Dnyaneshwar", age: 24).obs;

  void increment() {
    count++;
    std.value.age = double.parse("0.$count");
    levelCount = std.value.age;
    print(levelCount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Level Indicator"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(std.value.name),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => Text(count.toString()),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => SizedBox(
                height: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RotatedBox(
                      quarterTurns: -1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(21)),
                        child: LinearProgressIndicator(
                          color: Colors.black,
                          semanticsLabel: "50",
                          minHeight: 60,
                          value: double.parse(std.value.age.toString()),
                          valueColor: AlwaysStoppedAnimation(
                              Color.fromARGB(255, 217, 107, 33)),
                          backgroundColor: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (std.value.name ==
                      std.value.name.toString().toUpperCase()) {
                    // std.Name.value = std.Name.value.toLowerCase();
                    std.update((Student) {
                      std.value.name = std.value.name.toString().toLowerCase();
                    });
                  } else {
                    std.update((Student) {
                      std.value.name = std.value.name.toString().toUpperCase();
                    });
                  }

                  increment();
                },
                child: Text("Next Page")),
          ],
        ),
      ),
    );
  }
}

class Student {
  var name;
  var age;
  Student({this.name, this.age});
  // var Name = "Tom".obs;
  // var age = 25.obs;
}
