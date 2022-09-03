import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inscricao/app/modules/subscription/core/provider/subscription_provider.dart';
import 'package:inscricao/app/modules/subscription/view/components/info_component.dart';
import 'package:inscricao/app/shared/services/prefs_servicer.dart';
import 'package:validatorless/validatorless.dart';

class RegisterUserPage extends ConsumerStatefulWidget {
  const RegisterUserPage({Key? key}) : super(key: key);

  @override
  ConsumerState<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends ConsumerState<RegisterUserPage> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isvisible = true;
  final _formkey = GlobalKey<FormState>();
  final _key = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addSubscriptionState);
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
                  _formkey.currentState?.validate() ?? false;
                  _key.currentState?.validate() ?? false;

                  if (_passwordController.text.isEmpty ||
                      _emailController.text.isEmpty ||
                      _ageController.text.isEmpty ||
                      _nameController.text.isEmpty) {
                  } else {
                    ref.read(addSubscriptionState.notifier).load(
                        _nameController.text,
                        int.parse(_ageController.text),
                        _passwordController.text,
                        _emailController.text);
                    Navigator.pop(context);
                    PrefsServices.save(_passwordController.text);
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
          formKey: _formkey,
          namecontroller: _nameController,
          emailcontroller: _emailController,
          agecontroller: _ageController,
          passwordcontroller: _passwordController,
        ),
        Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                validator: Validatorless.required("crie uma senha"),
                keyboardType: TextInputType.number,
                obscureText: _isvisible,
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: "Crie uma senha ",
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isvisible = !_isvisible;
                      });
                    },
                    icon: Icon(
                        _isvisible ? Icons.visibility : Icons.visibility_off),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
