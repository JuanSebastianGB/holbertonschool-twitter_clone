import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter/widgets/side_bar_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue,
        title: const Text('Home', style: TextStyle(color: Colors.white)),
      ),
      drawer: const SideBarMenu(),
      body: Container(),
    );
  }
}
