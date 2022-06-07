
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:movie_trial/mixins/routes/binding.dart';
import 'package:movie_trial/mixins/routes/routes.dart';

class MovieApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return GetMaterialApp(
      title: "Movie App",
      theme: ThemeData(
        primaryColor: Colors.black
      ),
      debugShowCheckedModeBanner: false,
      getPages: routePage,
      initialBinding: InitialBinding(),
      initialRoute: homeRoute,
    );
  }
}