import 'package:to_do_app/config/imports.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TaskController controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(
      builder: (controller) {
        return Stack(
          children: [
            const Positioned(top: -100, child: CircleContainer()),
            const Positioned(top: -30, left: -60, child: CircleContainer()),
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(children: [
                    const Spacer(),
                    Text('Create a Task',
                        style: TextStyle(
                            color: AppColors.blue5,
                            fontWeight: FontWeight.w600,
                            fontSize: 18)),
                    const Spacer(),
                    SvgPicture.asset(AppIcons.search)
                  ]),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 30),
                    child: const TextField(
                      cursorColor: Color.fromARGB(255, 30, 118, 189),
                      style: TextStyle(
                          color: Color.fromARGB(255, 9, 66, 112),
                          fontWeight: FontWeight.w800,
                          fontSize: 20),
                      decoration: InputDecoration(
                        label: Text(
                          'Task title',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue),
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 62, 123, 213),
                                width: 2.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 54, 115, 206),
                                width: 2.0)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [AppColors.bluelight, AppColors.blue5])),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            TaskTimeComponent(
                              label: "Start Time",
                              time: controller.startTime,
                              onTap: () {
                                Get.dialog(
                                  ChooseTimeDialog(controller:controller, start:true),
                                );
                              },
                            ),
                            SizedBox(width: 100),
                            TaskTimeComponent(
                              label: "End Time",
                              time: controller.endTime,
                              onTap: () {
                             Get.dialog(
                                  ChooseTimeDialog(controller:controller, start:false),
                                );
                              },
                            ),
                          ],
                        ),
                        Divider(color: AppColors.white, thickness: 2),
                        const TextField(
                          maxLines: 3,
                          cursorColor: Colors.white,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 20),
                          decoration: InputDecoration(
                            label: Text(
                              'Description',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white, width: 2.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white, width: 2.0)),
                          ),
                        ),
                        SizedBox(height: 15),
                        Text("Category", style: TextStyle(color: Colors.white)),
                        SizedBox(height: 15),
                        Wrap(
                          spacing: 20,
                          runSpacing: 15,
                          children: List.generate(controller.categories.length,
                              (index) {
                            var item = controller.categories[index];
                            return InkWell(
                              onTap: () {
                                print('object');
                              },
                              child: Container(
                                width: 100,
                                padding: EdgeInsetsDirectional.symmetric(
                                    horizontal: 23, vertical: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  item,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.blue7),
                                ),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 15),
                        Button(onTap: () {})
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}



class TaskTimeComponent extends StatelessWidget {
  TaskTimeComponent({
    super.key,
    required this.label,
    required this.time,
    required this.onTap,
  });

  String label, time;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 16)),
          Text(
            time,
            style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w800,
                fontSize: 20),
          )
        ],
      ),
    );
  }
}

class CircleContainer extends StatelessWidget {
  const CircleContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 240, 242, 243),
          borderRadius: BorderRadius.circular(100)),
    );
  }
}
