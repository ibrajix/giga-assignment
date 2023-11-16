import 'package:flutter/material.dart';
import 'package:flutterassignment/constants/destinations.dart';
import 'package:flutterassignment/constants/images.dart';
import 'package:flutterassignment/widgets/giga_app_bar.dart';
import 'package:flutterassignment/widgets/giga_button.dart';
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
      backgroundColor: AppColors.gigaPurple,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              Images.homeBg,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Images.locationPin,
                      height: 100,
                      width: 100,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'We Need Your Address \nTo Get started',
                      style: TextStyle(
                        color:  AppColors.gigaWhite,
                        fontWeight: FontWeight.w600,
                        fontSize: 20
                      ),
                    ),
                    const SizedBox(height: 30),
                    GigaButton(
                      text: "Add Address",
                      onPressed: (){
                        context.push(Destination.addAddress);
                      }
                    )
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}