import 'package:flutter/material.dart';
import 'package:flutter_workout_app_ui/constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.buttonTitle,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(
        buttonTitle,
        style: kLargeButtonTextStyle.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
