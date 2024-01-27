import 'package:to_do_app/config/imports.dart';

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

  List<int> selectedTask = [];

  bool isHaveTaskId(int id){
    return selectedTask.indexWhere((element) => element == id) > -1;
  }
  
  void addorRemoveTaskId(int id){
   var  index = selectedTask.indexWhere((element) => element == id);
   if(index> -1){
    selectedTask.removeAt(index);
   }else{
  selectedTask.add(id);
   }
   update();
  }

  

}