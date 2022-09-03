import 'package:flutter/material.dart';
import 'package:inscricao/app/modules/splash/view/components/page_view_component.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageViewComponent(),
    );
  }
}
