import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheet1 extends StatelessWidget {
  const BottomSheet1({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(title: Text("Bottom Sheet")),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  child: Text("Dialog button"),
                  onPressed: (() {
                    Get.bottomSheet(
                        Container(
                          child: Wrap(
                            children: [
                              ListTile(
                                leading: Icon(Icons.wb_sunny_outlined),
                                title: Text("Light Theme"),
                                onTap: () => Get.changeTheme(ThemeData.light()),
                              ),
                              ListTile(
                                leading: Icon(Icons.wb_sunny),
                                title: Text("dark Theme"),
                                onTap: () => Get.changeTheme(ThemeData.dark()),
                              )
                            ],
                          ),
                        ),
                        barrierColor: Color.fromARGB(59, 189, 202, 193),
                        backgroundColor: Colors.purpleAccent);
                  }),
                ),
              ),
            ],
          )),
        );
  }
}
