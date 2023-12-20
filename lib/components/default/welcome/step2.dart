import 'package:flutter/material.dart';
import 'package:to_do_app/config/colors.dart';
import 'package:to_do_app/config/images.dart';

class StepTwo extends StatefulWidget {
  const StepTwo({super.key});

  @override
  State<StepTwo> createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          padding: EdgeInsetsDirectional.all(50),
          constraints: BoxConstraints(maxWidth: 500),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               
          Image.asset(AppImages.todo2),
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
