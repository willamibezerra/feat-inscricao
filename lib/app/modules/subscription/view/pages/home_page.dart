import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:inscricao/app/modules/subscription/core/provider/subscription_provider.dart';
import 'package:inscricao/app/modules/subscription/view/state_notifier.dart/get/get_subscription_state.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void dispose() {
    Hive.close();

    super.dispose();
  }

  @override
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  bool _isObscure = false;
  Widget build(BuildContext context) {
    final stateGet = ref.watch(getSubscriptionState);
    ref.listen<GetSubscriptionState>(getSubscriptionState, (previous, next) {
      if (next is LoadFailure) {
        Container();
      } else if (next is LoadSucess) {
        if (emailController.text == next.data?.email &&
            passwordController.text == next.data?.password) {
          Navigator.of(context).pushNamed("/user");
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.red,
              content: Text('Senha ou email incorreto'),
            ),
          );
        }
        //    return Text("${state.data?.name}");
      } else if (next is LoadInProgress) {
        const CircularProgressIndicator();
      } else {
        Container();
      }
    });
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                children: const [
                  Text(
                    "Bem-vindo de Volta",
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ],
              ),
              const Text(
                  "Bem-vindo de volta, por favor preencha suas informações de login."),
              const SizedBox(
                height: 40,
              ),
              const Text("email"),
              const SizedBox(
                height: 4,
              ),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Digite seu email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text("Senha"),
              TextField(
                controller: passwordController,
                obscureText: _isObscure,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Digite sua Senha",
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      icon: Icon(_isObscure
                          ? Icons.visibility
                          : Icons.visibility_off)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: double.maxFinite,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    if (passwordController.text.isEmpty ||
                        emailController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Preencha os campos'),
                        ),
                      );
                    }
                    setState(() {
                      ref.read(getSubscriptionState.notifier).load();
                    });
                  },
                  child: const Text("Entrar"),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Não tem uma conta?"),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          "/register",
                        );
                      },
                      child: const Text("Cadastre-se")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
