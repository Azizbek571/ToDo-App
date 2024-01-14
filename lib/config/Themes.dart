import 'package:to_do_app/config/imports.dart';

class Themes{
  static ThemeData dark = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
     backgroundColor: Colors.black,
     titleTextStyle: TextStyle(color: Colors.white),
     iconTheme: IconThemeData(color: Colors.white)
      
    ),
      
    );
   
  
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
     backgroundColor: Colors.white,
     titleTextStyle: TextStyle(color: Colors.black),
     iconTheme: IconThemeData(color: Colors.black)
      
    ),

  );
}