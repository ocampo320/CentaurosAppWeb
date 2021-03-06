
import 'package:centauros_app/views/widgets/platform_widgets/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformDialogAction
    extends PlatformWidget<CupertinoDialogAction, TextButton> {
  final String text;
  final VoidCallback? onPressed;
  final bool isDefaultAction;
  final bool isDestructiveAction;

  PlatformDialogAction({
    required this.text,
    required this.onPressed,
    this.isDefaultAction = false,
    this.isDestructiveAction = false,
  });

  @override
  TextButton createAndroidWidget(BuildContext context) {
    return TextButton(
      autofocus: true,
      
      child: Text(text.toUpperCase()),
      onPressed: onPressed,
    );
  }

  @override
  CupertinoDialogAction createIosWidget(BuildContext context) {
    return CupertinoDialogAction(
      child: Text(text),
      onPressed: onPressed,
      isDefaultAction: isDefaultAction,
      isDestructiveAction: isDestructiveAction,
    );
  }
}
