import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utility {
  static String? Function(String?) validateString(
      {int minLength = 1, int? maxLength, String? error}) {
    return (String? value) {
      value = harmonize(value);
      if (value.isEmpty && value.length < minLength) {
        return error ?? "Field is required.";
      }
      if (maxLength != null) {
        if (minLength == maxLength && value.length != minLength) {
          return "Field must be $minLength characters";
        }
        if (value.length < minLength || value.length > maxLength) {
          return "Field must be $minLength-$maxLength characters";
        }
      }
      if (value.length < minLength) {
        return "Field must have a minimum of $minLength characters";
      }
      if (maxLength != null && value.length < maxLength) {
        return "Field must not have more than $maxLength characters";
      }
      return null;
    };
  }

  static String harmonize(String? value) =>
      value == null ? "" : value.replaceAll(",", "").trim();
}

mixin FormMixin<T extends StatefulWidget> on State<T> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode? autoValidateMode;

  void validate(VoidCallback callback, {VoidCallback? orElse}) {
    final formState = formKey.currentState;
    if (formState != null && formState.validate()) {
      FocusScope.of(context).unfocus();
      formState.save();
      callback();
    } else {
      setState(() {
        autoValidateMode = AutovalidateMode.onUserInteraction;
      });
      orElse?.call();
    }
  }
}

mixin BaseBottomSheetMixin {
  Widget build(BuildContext context);

  Future<R?> show<R>(
      BuildContext context, {
        bool isDismissible = true,
        bool enableDrag = true,
      }) {
    return showModalBottomSheet<R>(
      isScrollControlled: true,
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      builder: (context) => build(context),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
    );
  }
}


extension ContextExtension on BuildContext {
  double getHeight([double factor = 1]) {
    assert(factor != 0);
    return MediaQuery.of(this).size.height * factor;
  }

  double getWidth([double factor = 1]) {
    assert(factor != 0);
    return MediaQuery.of(this).size.width * factor;
  }

  double get height => getHeight();
  double get width => getWidth();

}
