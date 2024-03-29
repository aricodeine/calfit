import 'package:flutter/material.dart';
import 'package:flutter_workout_app_ui/screens/log_or_reg_page.dart';
import 'package:flutter_workout_app_ui/screens/login_page.dart';
import 'package:flutter_workout_app_ui/screens/register_page.dart';
import 'screens/home_navigation_bar_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: LogOrRegPage.id,
      routes: {
        LogOrRegPage.id: (context) => const LogOrRegPage(),
        LoginPage.id: (context) => const LoginPage(),
        RegisterPage.id: (context) => const RegisterPage(),
        HomeNavigationBarPage.id: (context) => const HomeNavigationBarPage(),
      },
    );
  }
}
