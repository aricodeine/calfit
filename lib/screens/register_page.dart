import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workout_app_ui/screens/home_navigation_bar_page.dart';
import 'package:flutter_workout_app_ui/widgets/bottom_button.dart';

class RegisterPage extends StatefulWidget {
  static String id = 'registerpage';
  static String tag = 'Login-page';
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final firebaseInstance = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passowrdController = TextEditingController();

  Future signUp() async {
    try {
      final newUser = await firebaseInstance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(), password: _passowrdController.text.trim());
      if (newUser != null) {
        if (context.mounted) Navigator.pushNamed(context, HomeNavigationBarPage.id);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  dispose() {
    _emailController.dispose();
    _passowrdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const logo = Hero(
      tag: 'hero',
      child: ImageIcon(
        AssetImage('assets/calfit_icon.png'),
        size: 150.0,
      ),
    );

    final email = TextFormField(
      controller: _emailController,
      style: const TextStyle(color: Colors.white),
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Colors.grey),
        hintText: 'Email',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(
              width: 2.0,
              // color: Colors.blue,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(
              width: 2.0,
              color: Color.fromARGB(255, 1, 250, 225),
            )),
      ),
    );

    final password = TextFormField(
      controller: _passowrdController,
      style: const TextStyle(color: Colors.white),
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Colors.grey),
        hintText: 'Password',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
            borderSide: const BorderSide(
                // color: Colors.green,
                width: 1.0,
                style: BorderStyle.solid)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(
              width: 2.0,
              color: Color.fromARGB(255, 1, 250, 225),
            )),
      ),
    );

    final registerButton = BottomButton(
      buttonTitle: 'Register',
      onTap: () async {
        await signUp();
      },
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
                const SizedBox(
                  height: 15.0,
                ),
                const Row(
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
                registerButton,
              ],
            ),
          )),
    );
  }
}
