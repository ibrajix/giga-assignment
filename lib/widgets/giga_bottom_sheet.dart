import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutterassignment/widgets/giga_button.dart';
import '../constants/images.dart';
import '../utils/utility.dart';

class BaseBottomSheet extends StatelessWidget {
  const BaseBottomSheet(
      {required this.child,
        required this.title,
        this.onDismiss,
        this.subtitle,
        this.bottomSheetTopSpacing = 40,
        this.isDismissible = true,
        Key? key})
      : super(key: key);

  final Widget child;
  final String title;
  final String? subtitle;
  final double? bottomSheetTopSpacing;
  final void Function()? onDismiss;
  final bool isDismissible;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 24.0,
          left: 24.0,
          right: 24.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: bottomSheetTopSpacing??0),
            Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                if (isDismissible)
                  IconButton(
                      onPressed: () => onDismiss ?? Navigator.pop(context),
                      icon: const Icon(
                        Icons.cancel_rounded,
                        color: Colors.grey,
                        size: 27,
                      ))
              ],
            ),
            Visibility(
              visible: subtitle != null,
              child: Text(
                subtitle ?? '',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
            const SizedBox(width: 20),
            child
          ],
        ),
      ),
    );
  }
}
