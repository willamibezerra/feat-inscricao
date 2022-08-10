import 'package:flutter/material.dart';

class ParticipantesWidget extends StatelessWidget {
  final String name;
  final String image;
  const ParticipantesWidget({Key? key, required this.name, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: const TextStyle(fontSize: 15),
        ),
        const Spacer(),
        CircleAvatar(
          backgroundImage: AssetImage(image),
        ),
      ],
    );
  }
}
