import 'package:flutter/material.dart';
import 'package:to_do_app/config/colors.dart';
import 'package:to_do_app/config/images.dart';

class StepThree extends StatefulWidget {
  const StepThree({super.key});

  @override
  State<StepThree> createState() => _StepThreeState();
}

class _StepThreeState extends State<StepThree> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          padding: EdgeInsetsDirectional.all(50),
          constraints: BoxConstraints(maxWidth: 500),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
          
          Image.asset(AppImages.todo3),
          Text(
            'Gets things done with todo',
            style: TextStyle(fontSize: 30, color: AppColors.bluedark),
          ),
          Text(
              'When you are overwhelmed by the amount of work, you have on your plate, stop and rethink',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.blue7, fontSize: 20))
              ],
            ),
        ));
  }
}
