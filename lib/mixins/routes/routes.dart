import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movie_trial/ui/detail/detail_binding.dart';
import 'package:movie_trial/ui/detail/detail_screen.dart';
import 'package:movie_trial/ui/home/home_binding.dart';
import 'package:movie_trial/ui/home/home_screen.dart';

const String homeRoute="/home";
const String detailRoute="/detail";

var routePage=[
  GetPage(
      name: homeRoute,
      page: ()=>HomeScreen(),
      binding: HomeBinding()
  ),
  GetPage(
      name: detailRoute,
      page: ()=>DetailScreen(),
      binding: DetailBinding()
  )
];

goToDetail(int id){
  Get.toNamed(detailRoute,parameters: {
    "id":"$id"
  });
}