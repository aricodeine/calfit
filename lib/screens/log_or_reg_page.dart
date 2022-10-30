import 'package:flutter/material.dart';
import 'package:flutter_workout_app_ui/screens/login_page.dart';
import 'package:flutter_workout_app_ui/screens/register_page.dart';
import 'package:flutter_workout_app_ui/widgets/bottom_button.dart';

class LogOrRegPage extends StatefulWidget {
  static String id = 'logorregpage';
  static String tag = 'Login-page';
  const LogOrRegPage({super.key});
  @override
  State<LogOrRegPage> createState() => _LogOrRegPageState();
}

class _LogOrRegPageState extends State<LogOrRegPage> {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: ImageIcon(
        AssetImage('assets/calfit_icon.png'),
        size: 150.0,
      ),
    );

    final loginButton = BottomButton(
      buttonTitle: 'Login',
      onTap: () {
        Navigator.pushNamed(context, LoginPage.id);
      },
    );

    final registerButton = BottomButton(
      buttonTitle: 'Register',
      onTap: () {
        Navigator.pushNamed(context, RegisterPage.id);
      },
    );

    final forgotLabel = TextButton(
      child: const Text(
        'Forgot password?',
        style: TextStyle(color: Colors.green),
      ),
      onPressed: () {},
    );
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              // logo,
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'CalFit',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              const SizedBox(height: 8.0),
              const SizedBox(height: 24.0),
              loginButton,
              const SizedBox(height: 24.0),
              registerButton,
            ],
          ),
        ));
  }
}
