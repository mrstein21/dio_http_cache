import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_trial/mixins/style/color.dart';
import 'package:movie_trial/mixins/constant/constant.dart';
import 'package:movie_trial/ui/detail/controller/detail_movie_controller.dart';
import 'package:movie_trial/ui/detail/widget/content_section.dart';
import 'package:movie_trial/ui/detail/widget/cover_section.dart';
import 'package:movie_trial/ui/detail/widget/section_header.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key}) : super(key: key);
  final _controller=Get.find<DetailMovieController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kColorDark,
        body: Obx((){
          if(_controller.isLoading){
            return Container(
              width: double.infinity,
              height: double.infinity,
              color: kColorBlack,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return NestedScrollView(
              headerSliverBuilder:  (BuildContext context, bool innerBoxIsScrolled){
                return <Widget>[
                  SliverLayoutBuilder(
                    builder: (context, constraint) {
                      return SliverAppBar(
                        elevation: 0,
                        floating: true,
                        backgroundColor: kColorDark,
                        expandedHeight: 340,
                        pinned: true,
                        title: constraint.scrollOffset > 10
                            ? SectionHeader(
                          name: _controller.detail.title!,
                        )
                            : Container(),
                        centerTitle: false,
                        automaticallyImplyLeading: false,
                        titleSpacing: 0,
                        flexibleSpace: FlexibleSpaceBar(
                          background: CoverSection(
                             movie: _controller.detail,
                          ),
                        ),
                      );
                    },
                  )
                ];
              }, 
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContentSection(movie: _controller.detail)
                ],
              )
          );
          return ListView(
            children: [
              CoverSection(movie: _controller.detail),
              SizedBox(height: kDefaultPadding/4,),
              ContentSection(movie: _controller.detail)
            ],
          );
        }),
      ),
    );
  }
}
