import 'package:flutter/material.dart';

import '../widgets/participantes_widget.dart';

class ParticipantsComponent extends StatelessWidget {
  const ParticipantsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          "Participantes:",
          style: TextStyle(fontSize: 20),
        ),
        ParticipantesWidget(
            name: "Gabriel", image: "assets/images/gabriel.jpg"),
        SizedBox(
          height: 10,
        ),
        ParticipantesWidget(name: "Aline", image: "assets/images/aline.jpg"),
        SizedBox(
          height: 10,
        ),
        ParticipantesWidget(
            name: "Willami", image: "assets/images/willami.jpg"),
        SizedBox(
          height: 10,
        ),
        ParticipantesWidget(name: "Jairon", image: "assets/images/jairon.jpg"),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
