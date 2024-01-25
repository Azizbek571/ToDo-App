import 'package:to_do_app/config/imports.dart';
import 'package:to_do_app/models/task.dart';

class HomeController extends GetxController{
  bool loading=false;
  MyDb mydb = MyDb();

  List<TaskModel> tasks = [];
  Future<void> fetchTasks()async{
    try{
      loading=true;
      update();
      // await Future.delayed(Duration(seconds: 5));
     await mydb.open();
    Future.delayed(const Duration(seconds:1),()async{
    var res = await mydb.db!.rawQuery('SELECT * FROM task ORDER BY id DESC');
    tasks = taskListFromJson(res.toList());


    loading= false;
    update();
    });
    }catch(err){
      print(err);
    }
  }

}