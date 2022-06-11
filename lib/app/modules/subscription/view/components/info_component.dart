import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

import '../widgets/subscription_widget.dart';

class InfoComponent extends StatefulWidget {
  final TextEditingController namecontroller;
  final Key? formKey;
  final TextEditingController emailcontroller;
  final TextEditingController agecontroller;
  final TextEditingController passwordcontroller;
  const InfoComponent(
      {Key? key,
      required this.namecontroller,
      required this.emailcontroller,
      required this.agecontroller,
      required this.passwordcontroller,
      this.formKey})
      : super(key: key);

  @override
  State<InfoComponent> createState() => _InfoComponentState();
}

class _InfoComponentState extends State<InfoComponent> {
  final emailcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final agecontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool _isvisible = true;
    return Form(
      key: widget.formKey,
      child: Column(
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
            textTipe: TextInputType.name,
            title: "Nome",
            label: "Informe seu nome",
            controller: widget.namecontroller,
            validator: Validatorless.multiple(
              [Validatorless.required("informe seu nome")],
            ),
          ),
          SubscriptionWidget(
              validator: Validatorless.multiple([
                Validatorless.required("informe sua idade"),
              ]),
              textTipe: TextInputType.number,
              title: "Idade",
              label: "Informe sua idade",
              controller: widget.agecontroller),
          SubscriptionWidget(
            title: "email",
            label: "Informe seu email",
            controller: widget.emailcontroller,
            textTipe: TextInputType.emailAddress,
            validator: Validatorless.multiple(
              [
                Validatorless.email("formato de email incorreto"),
                Validatorless.required("informe seu email"),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text("Senha"),
          const SizedBox(
            height: 4,
          ),
        ],
      ),
    );
  }
}
