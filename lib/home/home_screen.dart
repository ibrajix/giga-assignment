import 'package:flutter/material.dart';
import 'package:flutterassignment/constants/destinations.dart';
import 'package:go_router/go_router.dart';

import '../address/address_screen.dart';
import '../constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor: AppColors.gigaPurple,
        title: Text("jdhd"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            ElevatedButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16.0),
                textStyle: const TextStyle(fontSize: 20),
                backgroundColor: Colors.blue,
                elevation: 5,
              ),
              onPressed: () {
                context.push(Destination.addAddress);
              },
              child: const Text('Add address', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}