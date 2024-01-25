import 'package:to_do_app/config/imports.dart';

class TaskController extends GetxController {
  bool loading = false;
  MyDb mydb = MyDb();

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

  String startTime = "06:00";
  String endTime = "18:00";
  String selectedCategory = '';

  saveTime(bool start, time) {
    if (start) {
      startTime = time;
    } else {
      endTime = time;
    }
    update();
    Get.back();
  }

  setCategory(String category) {
    selectedCategory = category;
    update();
  }

  List<CategoryModel> categories = [];

  Future getCategories() async {
    loading = true;
    update();
    await mydb.open();
    Future.delayed(const Duration(seconds: 1), () async {
      var res =
          await mydb.db!.rawQuery('SELECT * FROM category ORDER BY id DESC');
      categories = categoryFromJson(res.toList());
      loading = false;
      update();
    });
  }

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  bool validation() {
    return title.text.trim().isEmpty ||
        description.text.trim().isEmpty ||
        selectedCategory.isEmpty;
  }

    void remove(){
      title.clear();
      description.clear();
      selectedCategory='';

    }

  Future<void> addTask() async {
    if(loading)return;
    try {
      loading=true;
      update();
      if (validation()) {
        Get.snackbar("Please", "Add the full info",
            backgroundColor: Colors.red, colorText: Colors.white);
        return;
      }
      await mydb.open();
      await Future.delayed(Duration(seconds: 5));
      await mydb.db
          ?.rawInsert("INSERT INTO task(title, startTime, endTime, description, category) VALUES (?, ?, ?, ?, ?);",
           [title.text.trim(), startTime, endTime, description.text.trim(), selectedCategory]);
      Get.snackbar("Success", 'New task added',
          duration: const Duration(seconds: 1));
          remove();
    } catch (err) {
      print(err);
    }
    finally{
      loading=false;
      update();
    }
  }
}
