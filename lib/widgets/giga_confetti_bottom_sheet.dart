import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/images.dart';
import '../model/address_model.dart';
import '../utils/utility.dart';
import 'giga_bottom_sheet.dart';
import 'giga_button.dart';

class GigaConfettiBottomSheet<T> extends StatefulWidget with BaseBottomSheetMixin {
  const GigaConfettiBottomSheet
      ({
    this.title = "",
    this.header = "",
    this.subtitle = "",
    this.onButtonClicked,
    required this.address,
    Key? key,
    required this.icon,
  })
      : super(key: key);

  final String icon;
  final String title;
  final String header;
  final String subtitle;
  final Function()? onButtonClicked;
  final Address address;

  @override
  State<GigaConfettiBottomSheet<T>> createState() => _GigaConfettiBottomSheetState<T>();

  @override
  Widget build(BuildContext context) => this;

}

class _GigaConfettiBottomSheetState<T> extends State<GigaConfettiBottomSheet<T>> {

  late ConfettiController _topController;

  @override
  void initState() {
    super.initState();
    _topController = ConfettiController(duration: const Duration(seconds: 10));
    _topController.play();
  }

  @override
  void dispose() {
    _topController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var child =  Stack(
      children: [
        ConfettiWidget(
          confettiController: _topController,
          canvas: Size.infinite,
          blastDirection: pi / 2,
          maxBlastForce: 5,
          minBlastForce: 1,
          emissionFrequency: 0.01,
          numberOfParticles: 20,
          shouldLoop: true,
          colors: const [
            Colors.green,
            Colors.yellow,
            Colors.pink,
            Colors.orange,
            Colors.blue
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.icon,
              width: 78,
              height: 78,
            ),
            const SizedBox(height: 10),
            Text(
              widget.title,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
            ),
            const SizedBox(height: 10),
            Text(
              widget.subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Text(
                "Country: ${widget.address.country}"
            ),
            const SizedBox(height: 10),
            Text(
                "Prefecture: ${widget.address.prefecture}"
            ),
            const SizedBox(height: 10),
            Text(
                "Municipality: ${widget.address.municipality}"
            ),
            const SizedBox(height: 10),
            Text(
                "Street Address: ${widget.address.streetAddress}"
            ),
            const SizedBox(height: 10),
            Text(
                "Apartment: ${widget.address.apartment}"
            ),
            const SizedBox(height: 30),
            GigaButton(
              onPressed: () {
                widget.onButtonClicked!();
              },
              text: 'Okay',
            ),
          ],
        )
      ],
    );
    return BaseBottomSheet(title: widget.header, child: child);
  }
}