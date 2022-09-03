import 'package:flutter/material.dart';
import 'package:inscricao/app/modules/splash/view/components/page_view_component.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageViewComponent(),
    );
  }
}
