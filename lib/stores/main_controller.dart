import 'package:to_do_app/config/imports.dart';

class MainController extends GetxController {
  Widget currentWidget = const Home();
  List menus = [
    {"id": 1, "icon": AppIcons.home, "page": Home()},
    {"id": 2, "icon": AppIcons.calendar, "page": const CalendarPage()},
    {"id": 3, "icon": AppIcons.add, "page":  Container()},
    {"id": 4, "icon": AppIcons.bell, "page": const NotificationPage()},
    {"id": 5, "icon": AppIcons.profile, "page": const ProfilePage()},
  ];
  setWidget(Widget page) {
    currentWidget = page;
    update();
  }

  bool activePage(Widget page){
   
    return currentWidget == page;
  }
}
