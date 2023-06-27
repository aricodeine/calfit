import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_workout_app_ui/objects/food_object.dart';
import 'package:flutter_workout_app_ui/widgets/bottom_button.dart';
import 'package:flutter_workout_app_ui/bmi_calculator_brain.dart';
import 'package:flutter_workout_app_ui/constants.dart';
import 'package:flutter_workout_app_ui/widgets/reusable_card.dart';
import 'package:flutter_workout_app_ui/widgets/horizontal_line.dart';
import 'package:http/http.dart';
import 'calorie_consumption_results_page.dart';
import 'package:flutter_workout_app_ui/screens/bmi_results_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController calorieInputController = TextEditingController();
  int height = 180;
  int weight = 74;
  int age = 19;

  dynamic apiEndpoint = Uri.parse('https://trackapi.nutritionix.com/v2/natural/nutrients');

  static const _appID = "Your app id";
  static const _apiKey = "your api key";

  final Map<String, String> _apiPostRequestHeaders = {
    "Content-Type": "application/json",
    "x-app-id": _appID,
    "x-app-key": _apiKey,
    "x-remote-user-id": "123123213123123",
  };

  final Map<String, String> _apiPostRequestBody = {
    "query": "for breakfast i ate 2 eggs, bacon, and french toast",
  };

  Future<List<FoodObject>> postAPIRequest() async {
    // var body = json.encode(_apiPostRequestBody);
    // print("body: $body");
    // print("body.runtimeType: ${body.runtimeType}");

    Response response = await post(
      apiEndpoint,
      headers: _apiPostRequestHeaders,
      body: json.encode(_apiPostRequestBody),
    );

    List<FoodObject> foodFetchedData = [];
    if (response.statusCode == 200) {
      try {
        var data = json.decode(response.body.toString());

        num cc = 0.0;

        for (var food in data["foods"]) {
          cc += food['nf_calories'];
          foodFetchedData.add(
            FoodObject(
                foodName: food['food_name'],
                quantity: food['serving_qty'],
                calories: food['nf_calories']),
          );
          debugPrint("food: $food");
        }
        // print("Total calories: $cc");
      } catch (e) {
        debugPrint(e.toString());
      }
    } else {
      debugPrint(response.statusCode.toString());
      debugPrint(response.body.toString());
    }
    return foodFetchedData;
  }

  @override
  void initState() {
    super.initState();

    calorieInputController.addListener(() {
      setState(() {});
    });
  }

  void increment(int parameter) {
    if (parameter == age) {
      if (age < kMaxAge) {
        age = age + 1;
      }
    } else {
      if (weight < kMaxWeight) {
        weight = weight + 1;
      }
    }
  }

  void decrement(int parameter) {
    if (parameter == age) {
      if (age > kMinAge) {
        age = age - 1;
      }
    } else {
      if (weight > kMinWeight) {
        weight = weight - 1;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget workoutAppBar() => const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Your Workouts',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage(
                'assets/donald_duck.jpg',
              ),
            ),
          ],
        );

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  workoutAppBar(),
                  ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text(
                                  'HEIGHT',
                                  style: kLabelTextStyle,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: <Widget>[
                                    Text(
                                      height.toString(),
                                      style: kNumberTextStyle,
                                    ),
                                    const Text(
                                      'cm',
                                      style: kLabelTextStyle,
                                    ),
                                  ],
                                ),
                                SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    thumbColor: const Color(0xFFEB1555),
                                    overlayColor: const Color(0x29EB1555),
                                    activeTrackColor: Colors.white,
                                    inactiveTrackColor: const Color(0xFF8D8E98),
                                    thumbShape:
                                        const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                                    overlayShape:
                                        const RoundSliderOverlayShape(overlayRadius: 30.0),
                                  ),
                                  child: Slider(
                                    value: height.toDouble(),
                                    onChanged: (double newValue) {
                                      setState(() {
                                        height = newValue.round();
                                      });
                                    },
                                    min: kMinHeight,
                                    max: kMaxHeight,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text(
                                  'WEIGHT',
                                  style: kLabelTextStyle,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: <Widget>[
                                    Text(
                                      weight.toString(),
                                      style: kNumberTextStyle,
                                    ),
                                    const Text(
                                      'kg',
                                      style: kLabelTextStyle,
                                    ),
                                  ],
                                ),
                                SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    thumbColor: const Color(0xFFEB1555),
                                    overlayColor: const Color(0x29EB1555),
                                    activeTrackColor: Colors.white,
                                    inactiveTrackColor: const Color(0xFF8D8E98),
                                    thumbShape:
                                        const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                                    overlayShape:
                                        const RoundSliderOverlayShape(overlayRadius: 30.0),
                                  ),
                                  child: Slider(
                                    value: weight.toDouble(),
                                    onChanged: (double newValue) {
                                      setState(() {
                                        weight = newValue.round();
                                      });
                                    },
                                    min: kMinWeight,
                                    max: kMaxWeight,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  BottomButton(
                    buttonTitle: 'CALCULATE',
                    onTap: () {
                      CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => BmiResultsPage(
                                  resultBMI: calc.calculateBMI(),
                                  resultText: calc.getResult(),
                                  resultInterpretation: calc.getInterpretation(),
                                )),
                          ));
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                      top: 30.0,
                    ),
                    child: HorizontalLine(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      minLines: 8,
                      controller: calorieInputController,
                      maxLines: 8,
                      keyboardType: TextInputType.multiline,
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
                                icon: const Icon(Icons.close),
                              ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 1, 250, 225),
                            width: 1.6,
                          ),
                        ),
                        labelText: 'Calorie Intake',
                        labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 1, 250, 225),
                        ),
                        hintText: 'You had steak???',
                        hintStyle: const TextStyle(
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ),
                  BottomButton(
                    buttonTitle: 'Calorie Consumption',
                    onTap: () async {
                      _apiPostRequestBody['query'] = calorieInputController.text.trim();
                      List<FoodObject> food = await postAPIRequest();
                      if (context.mounted) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => CalorieConsumptionResultsPage(
                                    foodData: food,
                                  )),
                            ));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
