import 'package:to_do_app/config/imports.dart';
import 'package:to_do_app/stores/home_controller.dart';

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
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            constraints: const BoxConstraints(maxWidth: 500),
            child: controller.loading
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24),
                      Text(
                        "The list of tasks",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blue7),
                      ),
                      SizedBox(height: 16),
                      Column(
                          children:
                              List.generate(controller.tasks.length, (index) {
                        var item = controller.tasks[index];
                        return Container(
                          width: 500,
                          margin: EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.blue5),
                              borderRadius: BorderRadius.circular(14)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width:10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: AppColors.blue5,
                                      borderRadius: BorderRadius.circular(100)
                                    ),
                                  ),
                                  const SizedBox(width:10),
                                  Text(
                                    item.title,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.blue7),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18),
                                child: Text(item.description,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500, color: Colors.black)),
                              ),
                                      const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 18),
                                child: Row(
                                  children: [
                                    Text("Time: ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800)),
                                    Text("${item.startTime}_${item.endTime}",
                                    style: TextStyle(fontSize: 12, color: Colors.black),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      })),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
