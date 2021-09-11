import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Library Name'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Home'),
            tileColor: Get.currentRoute == '/home' ? Colors.grey[300] : null,
            onTap: () {
              print(Get.currentRoute);
              Get.back();
              Get.offNamed('/home');
            },
          ),
          ListTile(
            title: Text('Item 1'),
            tileColor: Get.currentRoute == '/page1' ? Colors.grey[300] : null,
            onTap: () {
              Get.back();
              Get.offNamed('/page1');
            },
          ),
          ListTile(
            title: Text('Item 2'),
            tileColor: Get.currentRoute == '/page2' ? Colors.grey[300] : null,
            onTap: () {
              Get.back();
              Get.offNamed('/page2');
            },
          ),
        ],
      ),
    );
  }
}
