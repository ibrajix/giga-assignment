import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

PreferredSizeWidget gigaAppBar({Color? backgroundColor, double height = kToolbarHeight}) {
  return AppBar(
      toolbarHeight: height,
      backgroundColor: backgroundColor,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // <-- SEE HERE
        statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
        statusBarBrightness: Brightness.light,
      )
  );
}