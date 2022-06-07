import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_trial/mixins/style/color.dart';
import 'package:movie_trial/mixins/style/text.dart';
import 'package:movie_trial/ui/home/controllers/home_controller.dart';
import 'package:movie_trial/ui/home/widgets/loading_view.dart';
import 'package:movie_trial/ui/home/widgets/movie_view.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final _controller=Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:kColorDark,
      appBar: AppBar(
        backgroundColor: kColorBlack,
        title: Text("Top Rated Movie",style: kTextAveHev16,),
      ),
      body: Obx(
          ()=> _controller.listMovie.isEmpty?
          LoadingView():
          NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollNotification){
              if(scrollNotification.metrics.pixels==scrollNotification.metrics.maxScrollExtent){
                if(_controller.isNoLoadMore==false){
                  if(_controller.isLoading==false){
                    _controller.callAPI();
                  }
                }
              }
              return true;
            },
            child: RefreshIndicator(
              onRefresh: ()async{
                _controller.callAPI(refresh: true);
              },
              child: ListView.builder(
                  itemCount: _controller.getItemLength(),
                  itemBuilder: (BuildContext context,int index){
                    if(index<_controller.listMovie.length){
                      return MovieView(movie:_controller.listMovie[index]);
                    }else{
                      return LoadingView();
                    }
                  }
              ),
            ),
          ),
      ),
    );
  }
}
