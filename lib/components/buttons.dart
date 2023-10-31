import 'package:flutter/material.dart';

class RawButton extends StatelessWidget {
  bool? active = true;
  final String? text;
  VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  bool autofocus = false;
  Clip clipBehavior = Clip.none;
  Widget? child;

  RawButton({
    this.active,
    Key? key,
    this.text,
    required this.onPressed,
    this.child,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text ?? 'Button'),
      style: style,
    );
  }
}
