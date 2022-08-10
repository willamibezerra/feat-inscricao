
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:inscricao/app/modules/splash/view/pages/splash_page.dart';
import 'package:inscricao/app/modules/subscription/view/pages/register_user_page.dart';
import 'package:inscricao/app/modules/subscription/data/models/subscription_model.dart';
import 'package:inscricao/app/modules/subscription/view/pages/home_page.dart';
import 'package:inscricao/app/modules/subscription/view/pages/user_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(SubscriptionModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/splash",
        routes: <String, WidgetBuilder>{
          "/home": ((context) => const HomePage()),
          "/register": (BuildContext context) => const RegisterUserPage(),
          "/user": (BuildContext context) => const UserPage(),
          "/splash": (BuildContext context) => const SplashPage()
        },
      ),
    );
  }
}
