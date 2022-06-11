import 'package:flutter/material.dart';

class SubscriptionWidget extends StatelessWidget {
  final String title;
  final TextInputType textTipe;
  final String label;
  String? Function(String?)? validator;
  final TextEditingController controller;
  SubscriptionWidget(
      {Key? key,
      required this.title,
      required this.validator,
      required this.textTipe,
      required this.label,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
        Text(title),
        const SizedBox(
          height: 4,
        ),
        TextFormField(
          validator: validator,
          keyboardType: textTipe,
          controller: controller,
          decoration: InputDecoration(
            hintText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}
