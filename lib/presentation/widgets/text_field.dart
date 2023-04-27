import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.keyboardType = TextInputType.text})
      : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 60,
        child: CupertinoTextField(
          keyboardType: keyboardType,
          placeholder: hintText,
          controller: controller,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.blue,
              )),
        ),
      ),
    );
  }
}
