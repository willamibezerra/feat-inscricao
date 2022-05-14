import 'package:flutter/material.dart';

class SubscriptionWidget extends StatelessWidget {
  final String title;
  final String label;
  final TextEditingController controller;
  const SubscriptionWidget(
      {Key? key,
      required this.title,
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
        TextField(
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
