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
                            Row(
                              children: [
                                IconButton(onPressed: (){}, icon: Icon(Icons.check_rounded))
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 16),
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
