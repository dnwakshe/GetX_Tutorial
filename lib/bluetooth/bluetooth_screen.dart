import 'dart:async';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/demo/myController.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class BluetoothScreen extends StatelessWidget {
  final flutterReactiveBle = FlutterReactiveBle();
  countController controller = countController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.arguments ?? ""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome to bluetooth module",
                style: TextStyle(fontSize: 25)),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder(
                initialData: 0,
                stream: controller.dataflow().asBroadcastStream(),
                builder: ((BuildContext context, AsyncSnapshot snapshot) =>
                    Column(
                      children: [
                        Text(
                          snapshot.data.toString(),
                          style: const TextStyle(fontSize: 25),
                        ),
                        LinearProgressIndicator(
                          color: Colors.black,
                          minHeight: 60,
                          value: snapshot.data.toString() != ""
                              ? double.parse("0.${snapshot.data.toString()}")
                              : 0,
                          valueColor: const AlwaysStoppedAnimation(
                              Color.fromARGB(255, 217, 107, 33)),
                          backgroundColor: Colors.grey,
                        ),
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class countController extends GetxController {
  var count = 0.obs;
  var title = "";

  void increment() {
    count++;
  }

  Stream<int> dataflow() async* {
    try {
      for (int i = 0; i <= 100; i++) {
        await Future.delayed(Duration(milliseconds: 1000));

        yield i;
        print(i);
      }
    } catch (e) {
      print(e);
    }
  }
}
