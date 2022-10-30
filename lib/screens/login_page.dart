import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workout_app_ui/widgets/bottom_button.dart';

import 'home_navigation_bar_page.dart';

class LoginPage extends StatefulWidget {
  static String id = 'loginpage';
  static String tag = 'Login-page';
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final firebaseInstance = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passowrdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: ImageIcon(
        AssetImage('assets/calfit_icon.png'),
        size: 150.0,
      ),
    );

    final email = TextFormField(
      controller: _emailController,
      style: TextStyle(color: Colors.white),
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.grey),
        hintText: 'Email',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              width: 2.0,
              // color: Colors.blue,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              width: 2.0,
              color: Color.fromARGB(255, 1, 250, 225),
            )),
      ),
    );

    final password = TextFormField(
      controller: _passowrdController,
      style: TextStyle(color: Colors.white),
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.grey),
        hintText: 'Password',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
            borderSide: BorderSide(
                // color: Colors.green,
                width: 1.0,
                style: BorderStyle.solid)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              width: 2.0,
              color: Color.fromARGB(255, 1, 250, 225),
            )),
      ),
    );

    Future signIn() async {
      try {
        final user = await firebaseInstance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passowrdController.text.trim(),
        );

        if (user != null) {
          Navigator.pushNamed(
            context,
            HomeNavigationBarPage.id,
          );
        }
      } catch (e) {
        print(e);
      }
    }

    @override
    dispose() {
      _emailController.dispose();
      _passowrdController.dispose();
      super.dispose();
    }

    final loginButton = BottomButton(
      buttonTitle: 'Login',
      onTap: () async {
        await signIn();
      },
    );

    final forgotLabel = TextButton(
      child: const Text(
        'Forgot password?',
        style: TextStyle(color: Colors.green),
      ),
      onPressed: () {},
    );
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
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
                email,
                const SizedBox(height: 8.0),
                password,
                const SizedBox(height: 24.0),
                loginButton,
                forgotLabel
              ],
            ),
          )),
    );
  }
}
