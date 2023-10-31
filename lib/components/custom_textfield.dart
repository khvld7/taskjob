import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextField extends StatelessWidget {
  final Widget? prefixIcon;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final ValueChanged<String> onChanged;

  CustomTextField({
    Key? key,
    this.prefixIcon,
    this.hintText,
    this.keyboardType,
    this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Color.fromRGBO(103, 116, 130, 1),
      textAlignVertical: TextAlignVertical.center,
      minLines: null,
      maxLines: 1,
      autocorrect: false,
      textCapitalization: TextCapitalization.sentences,
      textInputAction: TextInputAction.next,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          hintText: hintText,
          hintStyle:
              TextStyle(color: Color.fromRGBO(103, 116, 130, 1), fontSize: 14),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
          prefixIcon: prefixIcon,
          prefixIconColor: Color.fromRGBO(103, 116, 130, 1),
          border: OutlineInputBorder(borderSide: BorderSide.none)),
      style: TextStyle(color: Color.fromRGBO(103, 116, 130, 1), fontSize: 14),
    );
  }
}
