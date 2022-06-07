import 'package:get/get.dart';
import 'package:movie_trial/mixins/dialog/dialog.dart';
import 'package:movie_trial/model/movie.dart';
import 'package:movie_trial/model/res/movie_res.dart';
import 'package:movie_trial/provider/movie_provider.dart';

class HomeController extends GetxController{
  RxList<Movie> _listMovie=<Movie>[].obs;

  final _movieProvider=Get.find<MovieProvider>();

  RxList get listMovie => _listMovie;

  RxBool _isNoLoadMore=false.obs;

  bool get isNoLoadMore=> _isNoLoadMore.value;

  int page=1;

  RxBool _isLoading=true.obs;

  bool get isLoading=> _isLoading.value;

  int getItemLength(){
    if(_isNoLoadMore.value==true){
      return _listMovie.length;
    }
    return _listMovie.length+1;
  }


  void callAPI({bool refresh=false}){
    if(refresh==true){
      _isNoLoadMore.value=false;
       page=1;
      _listMovie.clear();
    }
    _isLoading.value=true;
    _movieProvider.getTopRatedMovie(page).then((MovieRes res){
      _isLoading.value=false;
      if(res.results!.isEmpty){
        _isNoLoadMore.value=true;
      }
      if(res.results!.isNotEmpty){
        page++;
        _listMovie.addAll(res.results!);
      }
    }).onError((error, stackTrace){
      showSnackBar(error, onButtonClick: (){
      });
    });
  }

  @override
  void onInit() {
    callAPI();
    // TODO: implement onInit
    super.onInit();
  }

}