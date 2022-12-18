import 'package:flutter/material.dart';
import 'package:twitter/widgets/bar_menu.dart';
import 'package:twitter/widgets/custom_appbar.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});
  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Notifications'),
      body: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text('No Notifications available yet',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text("When new notifications are found, they'll show up here",
                      style: TextStyle(fontSize: 16, color: Colors.grey)),
                ]),
          )),
      bottomNavigationBar: const BottomBarMenu(),
    );
  }
}
