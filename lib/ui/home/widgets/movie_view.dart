import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_trial/mixins/constant/constant.dart';
import 'package:movie_trial/mixins/routes/routes.dart';
import 'package:movie_trial/mixins/style/color.dart';
import 'package:movie_trial/mixins/style/text.dart';
import 'package:movie_trial/model/movie.dart';

class MovieView extends StatelessWidget {
  late Movie movie;
  MovieView({
    required this.movie
  });


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        goToDetail(movie.id);
      },
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding/2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              width: 80,
              height: 120,
              imageUrl: kImageAddress+movie.poster_path,
              imageBuilder: (context,imageProvider)=>Image(image: imageProvider,),
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(width: kDefaultPadding/2,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title,style: kTextAveHev14.copyWith(
                    color: kColorWhite
                  ),),
                  SizedBox(height: kDefaultPadding/4,),
                  Text(movie.release_date,style: kTextAveRom12.copyWith(
                    color: kColorWhite
                  ),),
                 SizedBox(height: kDefaultPadding/10,),
                 Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.star,color: Colors.yellow,size: 16,),
                      SizedBox(width: kDefaultPadding/4,),
                      Text(movie.vote_average.toString(),style: kTextAveHev14.copyWith(
                          color: kColorWhite,
                           fontSize: 12
                      )),
                    ],
                  ),
                  SizedBox(height: kDefaultPadding/4,),
                  Text(movie.overview,style: kTextAveRom12.copyWith(
                    color: kColorWhite
                  ),
                    maxLines: 4,overflow: TextOverflow.ellipsis,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
