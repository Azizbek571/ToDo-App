import 'package:to_do_app/config/imports.dart';

class CategoryController extends GetxController {
  TextEditingController title = TextEditingController();
  Future add() async {
    try {
      if(title.text.trim().isEmpty){
        Get.snackbar("Error", "Category not added");
        return;
      }
      await MyDb().open();
      MyDb()
          .db
          ?.rawInsert("INSERT INTO category (title) VALUES(?);", [title.text]);
          title.text = '';
          Get.back();
          Get.snackbar("Success", 'New category created');
    } catch (err) {
      print(err);
    }
  }
}
