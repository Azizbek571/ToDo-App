import 'package:flutter/widgets.dart';
import 'package:to_do_app/config/imports.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Calendar"),
    );
  }
}