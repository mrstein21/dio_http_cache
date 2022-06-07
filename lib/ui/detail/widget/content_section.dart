import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_trial/mixins/constant/constant.dart';
import 'package:movie_trial/model/detail_movie.dart';
import 'package:movie_trial/ui/detail/widget/field_section.dart';

class ContentSection extends StatelessWidget {
  const ContentSection({Key? key, required this.movie}) : super(key: key);
  final DetailMovie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding/2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FieldSection(field: "Original Title", value: movie.originalTitle!+" (${movie.title!}) "),
          SizedBox(height: kDefaultPadding/2,),
          FieldSection(field: "Genres", value: movie.genresString),
          SizedBox(height: kDefaultPadding/2,),
          FieldSection(field: "Tagline", value: movie.tagline==""?"N/A":movie.tagline!),
          SizedBox(height: kDefaultPadding/2,),
          FieldSection(field: "Synopsis", value: movie.overview!),
          SizedBox(height: kDefaultPadding/2,)
        ],
      ),
    );
  }
}
