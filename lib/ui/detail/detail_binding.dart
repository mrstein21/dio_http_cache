import 'package:get/get.dart';
import 'package:movie_trial/ui/detail/controller/detail_movie_controller.dart';

class DetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DetailMovieController());
    // TODO: implement dependencies
  }

}