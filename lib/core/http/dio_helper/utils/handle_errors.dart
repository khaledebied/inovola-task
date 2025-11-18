import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';

@lazySingleton
class HandleErrors {
  void catchError({Response? response, required Function(dynamic) errorFunc, dynamic e}) {
    if (response == null || response.data == null) {
      log("failed response Check Server");
    } else {
      log("failed response ${response.statusCode}");
      log("failed response ${response.data}");
      var data = response.data;
      try {
        if (data is String) data = json.decode(response.data);
        String message = "";
        message = data["message"].toString();
        switch (response.statusCode) {
          case 503:
          case 500:
          case 502:
          case 422:
          case 403:
          case 400:
          case 401:
          case 404:
          case 301:
          case 302:
          // Handle different error codes
            break;
        }
      } catch (e) {
        // Handle error parsing
      }
    }
  }

  Either<ServerFailure, Response> statusError(Response response, Function(dynamic) errorFunc) {
    if (response.statusCode! >= 200 && response.statusCode! <= 205) {
      return Right(response);
    }
    return Left(ServerFailure());
  }
}

