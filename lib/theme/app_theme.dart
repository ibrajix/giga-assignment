import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/strings.dart';

final lightThemeData = ThemeData(
    primaryColor: AppColors.gigaPurple,
    fontFamily: Strings.notoSans,
    colorScheme: ThemeData().colorScheme.copyWith(primary: AppColors.gigaPurple)
);