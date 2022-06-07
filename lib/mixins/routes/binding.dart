import 'package:get/get.dart';
import 'package:movie_trial/provider/movie_provider.dart';

class InitialBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MovieProvider());
    // TODO: implement dependencies
  }

}