import 'package:to_do_app/config/imports.dart';

class CategoryController extends GetxController {
  TextEditingController title = TextEditingController();
  bool loading =false;
  MyDb mydb = MyDb();
  
  Future add() async {
    try {
      if(title.text.trim().isEmpty){
        Get.snackbar("Error", "Category not added");
        return;
      }
      await mydb.open();
      await mydb
          .db
          ?.rawInsert("INSERT INTO category(title) VALUES (?);", [title.text]);
          title.text = '';
          Get.back();
          Get.snackbar("Success", 'New category created',
          duration: const Duration(seconds: 1));
          getCategories();
    } catch (err) {
      print(err);
    }
  }




    Future edit(int id) async {
    try {
      if (title.text.trim().isEmpty) {
        Get.snackbar("Error", "Category name not added");
        return;
      }
      await mydb.open();
      await mydb.db?.rawUpdate(
          "UPDATE category SET title = ? WHERE id = ?", [title.text, id]);
      Get.back();
      Get.snackbar("Success", "Category name changed",
          duration: const Duration(seconds: 1));
      getCategories();
    } catch (err) {
      print(err);
    }
  }

  Future delete(int id) async {
    try {
      await mydb.open();
      Get.back();
      await mydb.db?.rawDelete("delete from category where id = ?", [id]);
      Get.back();
      Get.snackbar("Success", "Category deleted", duration: const Duration(seconds: 1));
      getCategories();
    } catch (err) {
      print(err);
    }
  }





  List categories = [];

  Future getCategories()async{
    loading=true;
    update();
    await mydb.open();
    Future.delayed(const Duration(seconds:1),()async{
    var res = await mydb.db!.rawQuery('SELECT * FROM category ORDER BY id DESC');
    categories = res.toList();
    loading= false;
    update();
    });
 }
}
