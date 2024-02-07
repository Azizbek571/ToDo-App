import 'package:to_do_app/config/imports.dart';

class HomeController extends GetxController{
  bool loading=false;
  MyDb mydb = MyDb();

  List<TaskModel> tasks = [];



  Future<void> fetchTasks({String status = 'New'})async{
    try{
      loading=true;
      update();
      // await Future.delayed(Duration(seconds: 5));
     await mydb.open();
    await Future.delayed(const Duration(seconds:1),()async{
    var res = await mydb.db!.rawQuery('SELECT * FROM task where status=? ORDER BY id DESC', [status]);
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

    Future<void> changeStatus(String value) async{
      if (loading) return;
      Get.back();
      try{
        loading=true;
        update;
        await mydb.open();
        for(var i=0; i<selectedTask.length;i++){
        await mydb.db!.rawUpdate(
          'update task set status = ? where id =?', [value, selectedTask[i]]);
         
        }
        // await mydb.db!.update('task', {'status':value}, whereArgs: selectedTask);
        selectedTask = [];
        await fetchTasks();
      } catch (err) {
        print(err);
      }finally{
        loading=false;
        update;
      }
    }
}