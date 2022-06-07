class Movie{
  late int id;
  late String title;
  late String poster_path;
  late String release_date;
  late String overview;
  late double vote_average;

  Movie({
    required this.id,
    required this.title,
    required this.poster_path,
    required this.release_date,
    required this.overview,
    required this.vote_average
  });

  factory Movie.fromJson(Map<String,dynamic> map){
    return Movie(
        id: map["id"],
        title:map["title"],
        poster_path: map["poster_path"],
        release_date: map["release_date"],
        overview: map["overview"],
        vote_average:map["vote_average"]
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['overview'] = this.overview;
    data['poster_path'] = this.poster_path;
    data['release_date'] = this.release_date;
    data['title'] = this.title;
    data['vote_average'] = this.vote_average;

    return data;
  }

}
