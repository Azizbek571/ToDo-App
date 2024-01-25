import 'package:to_do_app/config/imports.dart';

class HomeController extends GetxController{
  bool loading=false;
  MyDb mydb = MyDb();
  List tasks = [];
  Future<void> fetchTasks()async{
    try{
      loading=true;
      update();
      // await Future.delayed(Duration(seconds: 5));
     await mydb.open();
    Future.delayed(const Duration(seconds:1),()async{
    var res = await mydb.db!.rawQuery('SELECT * FROM task ORDER BY id DESC');
    tasks = res.toList();
    loading= false;
    update();
    });
    }catch(err){
      print(err);
    }
  }

}