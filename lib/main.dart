import 'package:flutter/material.dart';

import 'package:get/get.dart';


import 'bluetooth/bluetooth_screen.dart';
import 'bottomSheet.dart';
import 'demo/level_Indicator.dart';
import 'demo/student_data.dart';
import 'routes/routes.dart';

void main() {
  runApp(
      // SackBar(),
      GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    unknownRoute: GetPage(
        name: '/notfound',
        page: () => UnknownRoutePage()), //like 404 page in web
    getPages: [
      GetPage(name: '/', page: () => const SackBar()),
      GetPage(name: '/level', page: () => LevelIndicator()),
      GetPage(name: '/bottom', page: () => const BottomSheet1())
    ],
  ));
}

class UnknownRoutePage extends StatelessWidget {
  const UnknownRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("UnknownRoutePage"),
        ),
        body: Container(
          child: Text("UnknownRoutePage"),
        ));
  }
}

class SackBar extends StatelessWidget {
  const SackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                child: Text("Got to Bottomsheet"),
                onPressed: (() {
                  Get.to(BottomSheet1());
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                child: Text("Got to Level check"),
                onPressed: (() {
                  Get.toNamed("/level");
                }),
              ),
            ),
            // code dialog

            Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                child: Text("Dialog button"),
                onPressed: (() {
                  Get.defaultDialog();
                }),
              ),
            ),
            // code for snackbar testing
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  onPressed: () {
                    Get.snackbar("New Notofication", "This is snackbar message",
                        snackPosition: SnackPosition.BOTTOM,
                        colorText: Colors.red,
                        backgroundColor: Colors.black,
                        borderRadius: 10,
                        animationDuration: Duration(milliseconds: 3000),
                        margin: EdgeInsets.all(10));
                  },
                  child: Text("ScanckBar")),
            ),
            // 
             Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                child: Text("Statemanegment"),
                onPressed: (() {
                  Get.to(MyStateUpdate());
                }),
              ),
            ),
             Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                child: Text("Check Bluetooth"),
                onPressed: (() {
                 Get.to( BluetoothScreen(), arguments: "Hello World");
                //  Get.toNamed( BluetoothScreen(), arguments: 'Get is the best');
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
