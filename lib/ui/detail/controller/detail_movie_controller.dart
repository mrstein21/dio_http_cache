import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:movie_trial/mixins/dialog/dialog.dart';
import 'package:movie_trial/mixins/logging/logger.dart';
import 'package:movie_trial/model/detail_movie.dart';
import 'package:movie_trial/provider/movie_provider.dart';

class DetailMovieController extends GetxController{
  String movie_id=Get.parameters["id"]!;
  Rx<DetailMovie> _detail= Rx(DetailMovie());
  var _isLoading=false.obs;

  DetailMovie get detail =>_detail.value;
  bool get isLoading =>_isLoading.value;

  var _provider=Get.find<MovieProvider>();

  void getDetailMovie(){
    _isLoading.value=true;
    _provider.geDetailMovie(movie_id).then((value){
      _isLoading.value=false;
      _detail.value=value;
    }).onError((error, stackTrace){
      logger.e(error,stackTrace);
      showSnackBar(error, onButtonClick:(){});
    });
  }

  @override
  void onInit() {
    getDetailMovie();
    // TODO: implement onInit
    super.onInit();
  }

}