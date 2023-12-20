import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/config/imports.dart';
import 'package:to_do_app/stores/main_controller.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MainController controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<MainController>(
        builder: (controller) {
          return Scaffold(
            bottomNavigationBar: BottomAppBar(
              padding: EdgeInsets.zero,
              height: 100,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.blue7),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(controller.menus.length, (index) {
                      var item = controller.menus[index];
                      return InkWell(
                          onTap: () {
                            controller.setWidget(item['page']);
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: SvgPicture.asset(item['icon'],
                                  width: 25,
                                  color: controller.activePage(item['page'])
                                      ? AppColors.blue7
                                      : AppColors.gray6)));
                    })),
              ),
            ),
            body: controller.currentWidget,
          );
        },
      ),
    );
  }
}
