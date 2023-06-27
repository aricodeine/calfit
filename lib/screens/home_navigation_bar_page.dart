import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workout_app_ui/report.dart';
import 'package:flutter_workout_app_ui/screens/home_page.dart';

class HomeNavigationBarPage extends StatefulWidget {
  static String id = 'homenavigationbarpage';
  const HomeNavigationBarPage({Key? key}) : super(key: key);

  @override
  State<HomeNavigationBarPage> createState() => _HomeNavigationBarPageState();
}

class _HomeNavigationBarPageState extends State<HomeNavigationBarPage> {
  final firebaseInstance = FirebaseAuth.instance;
  int _currentIndex = 0;
  Widget getWidgets(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const HomePage();

      // case 1:
      //   return const CalorieSearch();

      case 1:
        return const Center(
          child: Text('Training'),
        );

      case 2:
        return const WorkoutReport();

      case 3:
        return Center(
          child: ElevatedButton(
              onPressed: () async {
                await firebaseInstance.signOut();
                if (context.mounted) Navigator.pop(context);
              },
              child: const Text('Sign out')),
        );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: const Color.fromARGB(255, 12, 12, 12),
        selectedItemColor: const Color.fromARGB(255, 1, 250, 225),
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'home',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.search),
          //   label: 'CalorieSearch',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'training',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profile',
          ),
        ],
      ),
      body: getWidgets(_currentIndex),
    );
  }
}
