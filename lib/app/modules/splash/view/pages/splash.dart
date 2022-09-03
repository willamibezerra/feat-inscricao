import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() async {
    await Future.delayed(Duration(seconds: 2))
        .then((value) => Navigator.of(context).pushNamed('/onBoarding'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [CircularProgressIndicator()],
      ),
    );
  }
}
