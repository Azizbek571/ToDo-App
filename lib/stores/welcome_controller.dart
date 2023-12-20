import 'package:to_do_app/config/imports.dart';

class WelcomeController extends GetxController {


@override
  void onInit() {
    GetStorage().write('welcome', true);
    super.onInit();
  }

  
   PageController pageController=PageController(initialPage: 0);

  int currentPage = 0;

  List<Widget> pages = [
    const StepOne(),
    const StepTwo(),
    const StepThree(),
  ];

  setPageIndex(int value) {
    currentPage = value;
    update();
  }

  back() {
    if (currentPage == 0) return;
    pageController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  forward() {
    if (currentPage == 2){
      Get.off(()=>const MainPage());
      return;
    } 
    pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }
}
