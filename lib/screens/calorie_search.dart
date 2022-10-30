import 'package:flutter/material.dart';
import 'package:flutter_workout_app_ui/constants.dart';
import 'package:flutter_workout_app_ui/widgets/reusable_card.dart';

class CalorieSearch extends StatefulWidget {
  const CalorieSearch({super.key});

  @override
  State<CalorieSearch> createState() => _CalorieSearchState();
}

class _CalorieSearchState extends State<CalorieSearch> {
  TextEditingController calorieInputController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    calorieInputController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.transparent,
                  ),
                  child: TextField(
                    controller: calorieInputController,
                    style: TextStyle(fontSize: 16.0),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      suffixIcon: calorieInputController.text.isEmpty
                          ? Container(
                              width: 0,
                            )
                          : IconButton(
                              onPressed: () {
                                calorieInputController.clear();
                              },
                              icon: Icon(Icons.close),
                            ),
                      // contentPadding: EdgeInsets.symmetric(
                      //   vertical: 15.0,
                      //   horizontal: 20.0,
                      // ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 1, 250, 225),
                          width: 1.6,
                        ),
                      ),
                      labelText: 'Calorie Intake',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 1, 250, 225),
                      ),
                      hintText: 'You had steak???',
                      hintStyle: TextStyle(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(50.0),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'You consumed 500kcal',
                              textAlign: TextAlign.center,
                              style: kBodyTextStyle,
                            ),
                          ),
                        ),
                      ]),
                )),
          ],
        )),
      ),
    );
  }
}
