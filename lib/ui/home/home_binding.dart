import 'package:get/get.dart';
import 'package:movie_trial/ui/home/controllers/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    // TODO: implement dependencies
  }

}