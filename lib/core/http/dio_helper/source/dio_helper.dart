import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:expense_tracker/core/helpers/di.dart';
import '../../../../core/errors/failures.dart';
import '../../generic_http/api_names.dart';
import '../../models/request_body_model.dart';
import '../utils/dio_header.dart';

abstract class DioHelper {
  Dio get dio => Dio(BaseOptions(baseUrl: ApiNames.baseUrl, headers: getIt<DioHeader>().call()))
    ..interceptors.add(LogInterceptor(responseBody: true, requestBody: true, responseHeader: true, logPrint: (data) => log(data.toString())));

  Future<Either<ServerFailure, Response>> call(RequestBodyModel params);
}
