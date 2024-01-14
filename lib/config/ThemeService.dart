import 'package:to_do_app/config/imports.dart';

class ThemeService{
  static final box = GetStorage();
  static const key = 'dark';
  bool loadThemeFromBox() => box.read(key)??false;

  saveThemeToBox(bool isDarkMode)=>box.write(key, isDarkMode);

  ThemeMode get theme => loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  switchTheme(){
    Get.changeThemeMode(loadThemeFromBox()? ThemeMode.light : ThemeMode.dark);
    saveThemeToBox(!loadThemeFromBox());
  }

}