import 'package:to_do_app/config/imports.dart';

class TaskController extends GetxController {
  List<String> categories = [
    "Books",
    "Meeting",
    "Sport",
    "Films",
    "Money",
    "Coding",
    "Going out",
  ];

  List<String> hours = [];
  List<String> minutes = [];

  autoSet(int count, List list) {
    for (var i = 0; i < count; i++) {
      if (i < 10) {
        list.add("0$i");
      } else {
        list.add(i.toString());
      }
    }
  }

  @override
  void onInit() {
    autoSet(24, hours);
    autoSet(60, minutes);
    print(minutes);
    super.onInit();
  }

  String startTime = "00:00";
  String endTime = "00:00";

  saveTime(bool start, time) {
    if (start) {
      startTime = time;
    } else{
      endTime = time;

    }
   update();
    Get.back();
  }
}
