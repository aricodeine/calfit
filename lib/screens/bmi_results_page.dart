import '../constants.dart';
import 'package:flutter_workout_app_ui/widgets/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workout_app_ui/widgets/bottom_button.dart';

class BmiResultsPage extends StatelessWidget {
  static String id = 'bmiresultspage';
  const BmiResultsPage(
      {Key? key,
      required this.resultBMI,
      required this.resultText,
      required this.resultInterpretation})
      : super(key: key);

  final String resultBMI;
  final String resultText;
  final String resultInterpretation;

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
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
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
                      Text(
                        resultText,
                        style: kResultTextStyle,
                      ),
                      Text(
                        resultBMI,
                        style: kBMITextStyle,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          resultInterpretation,
                          textAlign: TextAlign.center,
                          style: kBodyTextStyle,
                        ),
                      ),
                    ]),
              )),
          BottomButton(
            buttonTitle: 'RECALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
