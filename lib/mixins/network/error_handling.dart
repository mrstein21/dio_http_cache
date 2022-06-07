import 'package:dio/dio.dart';
import 'package:movie_trial/mixins/network/error_res.dart';

class ErrorHandling {
  int code = 0;
  String message = "";

  ErrorHandling(messageErr) {
    if (messageErr is DioError) {
      code = messageErr.response!.statusCode!;
    }
    message = getErrorMessage(messageErr);
  }

  static String getErrorMessage(message) {
    try {
      if (message is DioError) {
        if(message.response!=null){
          return ErrorRes.fromJson(message.response!.data).statusMessage!;
        }else {
          switch (message.response!.statusCode) {
            case 200:
            case 201:
            case 202:
              return "Success";
            case 400:
              return "You are not registered.";
            case 401:
              return "You are unauthenticated";
            case 404:
              return "The resource you are looking is temporarily unavailable.\nPlease try again later";
            case 405:
              return "Method not allowed";
            case 500:
              return "There is a problem with our server, it will be fixed soon.\nPlease try again later";
            default:
              if (message.response!.statusMessage != null &&
                  message.response!.statusMessage!.isNotEmpty) {
                return message.response!.statusMessage!;
              }
              return 'Unknown error.';
          }
        }
      } else {
        return message.toString();
      }
    } catch (e) {
      return message.toString();
    }
  }

  @override
  String toString() {
    return message;
  }
}