import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
   
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
   final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          Center(
            child: Text('Page 1'),
          ),
          Center(
            child: Text('Page 2'),
          ),
          Center(
            child: Text('Page 3'),
          ),
        ],
      ),
    );
  }
}
