import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:movie_trial/mixins/constant/constant.dart';
import 'package:movie_trial/mixins/network/error_handling.dart';
import 'package:movie_trial/mixins/network/interceptor.dart';
import 'package:movie_trial/model/detail_movie.dart';
import 'package:movie_trial/model/res/movie_res.dart';
import '../mixins/logging/logger.dart';

class MovieProvider{
  late Dio _dio;
  late DioCacheManager _dioCacheManager;
  late Options _cacheOptions;

  MovieProvider(){
    BaseOptions options  =
    BaseOptions(
        baseUrl: kUrlAPI,
        receiveTimeout: 15000,
        connectTimeout: kConnectionTimeout
    );
    _dio = Dio(options);
    _dio.interceptors.add(LoggingInterceptor());
    _dioCacheManager = DioCacheManager(CacheConfig());
    _cacheOptions = buildCacheOptions(Duration(days: 7), forceRefresh: true);
    _dio.interceptors.add(_dioCacheManager.interceptor);
  }


  Future<DetailMovie> geDetailMovie(String id) async {
    try {
        final response = await _dio.get(
          '/movie/$id',
          queryParameters: {
            'api_key':kApiKey
          },
          options: _cacheOptions
        );
      return DetailMovie.fromJson(response.data);
    } catch (e, s) {
      logger.e('getDetailMovie', e, s);
      return Future.error(ErrorHandling(e));
    }
  }

  Future<MovieRes> getTopRatedMovie(int page) async {
    final response = await _dio.get(
      '/movie/top_rated',
      queryParameters: {
        'page':'$page',
        'api_key':kApiKey
      },
      options: _cacheOptions
    );
    try {
      return MovieRes.fromJson(response.data);
    } catch (e, s) {
      logger.e('getMoviePopular', e, s);
      return Future.error(ErrorHandling(e));
    }
  }
}