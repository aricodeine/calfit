import 'package:flutter_workout_app_ui/widgets/horizontal_line.dart';
import '../constants.dart';
import 'package:flutter_workout_app_ui/widgets/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workout_app_ui/widgets/bottom_button.dart';
import 'package:flutter_workout_app_ui/objects/food_object.dart';

class CalorieConsumptionResultsPage extends StatelessWidget {
  const CalorieConsumptionResultsPage({
    Key? key,
    required this.foodData,
  }) : super(key: key);

  final List<FoodObject> foodData;

  // static List<FoodObject> food = [
  //   FoodObject(
  //     foodName: 'Chapati',
  //     quantity: 5,
  //     calories: 250,
  //   ),
  //   FoodObject(
  //     foodName: 'Potato',
  //     quantity: 1,
  //     calories: 100,
  //   ),
  //   FoodObject(
  //     foodName: 'Naan',
  //     quantity: 2,
  //     calories: 500,
  //   ),
  //   FoodObject(
  //     foodName: 'Butter Roti',
  //     quantity: 3,
  //     calories: 800,
  //   ),
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('BMI Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                top: 20.0,
                left: 15.0,
              ),
              child: Text(
                'Your Calorie Consumption',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Padding(
                padding: const EdgeInsets.all(10.0),
                // child: ListView.builder(
                //   shrinkWrap: true,
                //   itemBuilder: ((context, index) => Column(
                //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: [
                //           Row(
                //             children: [
                //               Text(
                //                 'Food Name: ',
                //                 style: kCalorieDetailTitleStyle,
                //               ),
                //               Text(
                //                 '${food[index].foodName}',
                //                 style: kCalorieDetailStyle,
                //               ),
                //             ],
                //           ),
                //           Row(
                //             children: [
                //               Text(
                //                 'Quantity: ',
                //                 style: kCalorieDetailTitleStyle,
                //               ),
                //               Text(
                //                 '${food[index].quantity}',
                //                 style: kCalorieDetailStyle,
                //               ),
                //             ],
                //           ),
                //           Row(
                //             children: [
                //               Text(
                //                 'Total Calories: ',
                //                 style: kCalorieDetailTitleStyle,
                //               ),
                //               Text(
                //                 '${food[index].calories}',
                //                 style: kCalorieDetailStyle,
                //               ),
                //             ],
                //           ),
                //           Padding(
                //             padding: const EdgeInsets.symmetric(
                //               horizontal: 2.0,
                //               vertical: 20.0,
                //             ),
                //             child: HorizontalLine(),
                //           ),
                //         ],
                //       )),
                //   itemCount: food.length,
                // ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    child: DataTable(
                      columns: [
                        DataColumn(
                          label: Text('Food'),
                        ),
                        DataColumn(
                          label: Text('Quantity'),
                        ),
                        DataColumn(
                          label: Text('Calories'),
                        ),
                      ],
                      rows: foodData
                          .map((e) => DataRow(cells: [
                                DataCell(
                                  Text(e.foodName.toString()),
                                ),
                                DataCell(
                                  Text(e.quantity.toString()),
                                ),
                                DataCell(
                                  Text(e.calories.toString()),
                                ),
                              ]))
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'Check again',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
