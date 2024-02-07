import 'package:to_do_app/components/default/confirm_dilaog.dart';
import 'package:to_do_app/config/imports.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController controller = Get.put(HomeController());
  @override
  void initState() {
    controller.fetchTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              constraints: const BoxConstraints(maxWidth: 500),
              child: controller.loading
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Text(
                              "The list of tasks",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.blue7),
                            ),
                            const Spacer(),
                            controller.selectedTask.isEmpty ? Container() :
                            Row(
                              children: [
                                IconButton(onPressed: (){
                                  Get.dialog(ConfirmDialog(text:"Are you sure you have done this task?",
                                   title: "Attention",
                                    onTap: (){
                                  controller.changeStatus("Done");
                                    }));
                                }, icon: Icon(Icons.check_rounded, color: Colors.green)),
                                IconButton(
                                  onPressed: () {
                                    Get.dialog(ConfirmDialog(text: "Are you sure you want to delete the task?",
                                     title: "Attention",
                                      onTap: (){
                                        controller.changeStatus("Deleted");
                                      }));
                                  },
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 16),
                        controller.tasks.isEmpty?Text("No list of tasks"):
                        Column(
                            children:
                                List.generate(controller.tasks.length, (index) {
                          var item = controller.tasks[index];
                          return GestureDetector(
                            
                              onLongPress: () {
                                if(controller.selectedTask.isEmpty) {
                                  controller.addorRemoveTaskId(item.id);
                                }
                              },
                              onTap:(){
                                 if(controller.selectedTask.isNotEmpty) {
                                  controller.addorRemoveTaskId(item.id);
                              }} ,
                              child: TaskCard(
                                item: item,
                                isSelect: controller.isHaveTaskId(item.id),
                              ));
                        })),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}
