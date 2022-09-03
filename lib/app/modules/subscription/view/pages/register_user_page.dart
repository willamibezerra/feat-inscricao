import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inscricao/app/modules/subscription/core/provider/subscription_provider.dart';
import 'package:inscricao/app/modules/subscription/view/components/info_component.dart';

class RegisterUserPage extends ConsumerStatefulWidget {
  const RegisterUserPage({Key? key}) : super(key: key);

  @override
  ConsumerState<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends ConsumerState<RegisterUserPage> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isvisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: SingleChildScrollView(
            child: Column(
          children: [
            buildbody(),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: double.maxFinite,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  if (passwordController.text.isEmpty ||
                      emailController.text.isEmpty ||
                      ageController.text.isEmpty ||
                      nameController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Preencha os campos'),
                      ),
                    );
                  } else {
                    ref.read(addSubscriptionState.notifier).load(
                        nameController.text,
                        int.parse(ageController.text),
                        passwordController.text,
                        emailController.text);
                    Navigator.pop(context);
                  }
                },
                child: const Text("Entrar"),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        )
            //    ElevatedButton(onPressed: () {}, child: Text("teste"))
            ),
      )),
    );
  }

  Widget buildbody() {
    return Column(
      children: [
        InfoComponent(
            namecontroller: nameController,
            emailcontroller: emailController,
            agecontroller: ageController,
            passwordcontroller: passwordController),
        TextField(
          obscureText: _isvisible,
          controller: passwordController,
          decoration: InputDecoration(
            hintText: "Crie uma senha ",
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isvisible = !_isvisible;
                });
              },
              icon: Icon(_isvisible ? Icons.visibility : Icons.visibility_off),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}
