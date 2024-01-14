import 'package:to_do_app/config/imports.dart';

Future main() async{
  await GetStorage.init();
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      darkTheme: Themes.dark,
      theme: Themes.light,
      themeMode: ThemeService().theme,
      home: const SafeArea(child:  Splash()),
    );
  }
}

