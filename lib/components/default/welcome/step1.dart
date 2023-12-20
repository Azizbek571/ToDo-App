import 'package:flutter/material.dart';
import 'package:to_do_app/config/colors.dart';
import 'package:to_do_app/config/images.dart';

class StepOne extends StatefulWidget {
  const StepOne({super.key});

  @override
  State<StepOne> createState() => _StepOneState();
}

class _StepOneState extends State<StepOne> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          padding: EdgeInsetsDirectional.all(50),
          constraints: BoxConstraints(maxWidth: 500),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
          SizedBox(height: 15),
          Text('Welcome!', style: TextStyle(fontWeight: FontWeight.w800,fontSize: 40,
          color: AppColors.blue7),),
          SizedBox(height:20),
          Image.asset(AppImages.todo1),
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
