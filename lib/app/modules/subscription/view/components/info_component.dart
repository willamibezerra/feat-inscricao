import 'package:flutter/material.dart';

import '../widgets/subscription_widget.dart';

class InfoComponent extends StatefulWidget {
  final TextEditingController namecontroller;
  final TextEditingController emailcontroller;
  final TextEditingController agecontroller;
  final TextEditingController passwordcontroller;
  const InfoComponent(
      {Key? key,
      required this.namecontroller,
      required this.emailcontroller,
      required this.agecontroller,
      required this.passwordcontroller})
      : super(key: key);

  @override
  State<InfoComponent> createState() => _InfoComponentState();
}

class _InfoComponentState extends State<InfoComponent> {
  final emailcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final agecontroller = TextEditingController();

  final passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool _isvisible = true;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        const Text(
          "Pare criar uma conta preencha os campos :)",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        SubscriptionWidget(
            title: "Nome",
            label: "Informe seu nome",
            controller: widget.namecontroller),
        SubscriptionWidget(
            title: "Idade",
            label: "Informe sua idade",
            controller: widget.agecontroller),
        SubscriptionWidget(
            title: "email",
            label: "Informe seu email",
            controller: widget.emailcontroller),
        const SizedBox(
          height: 40,
        ),
        const Text("Senha"),
        const SizedBox(
          height: 4,
        ),
      ],
    );
  }
}
