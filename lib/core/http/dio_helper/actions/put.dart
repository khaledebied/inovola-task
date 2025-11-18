import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:expense_tracker/core/helpers/di.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../models/request_body_model.dart';
import '../source/dio_helper.dart';
import '../utils/handle_errors.dart';
import '../utils/handle_request_body.dart';
import '../utils/dio_header.dart';

@lazySingleton
class Put extends DioHelper {
  @override
  Future<Either<ServerFailure, Response>> call(RequestBodyModel params) async {
    FormData? formData = getIt<HandleRequestBody>()(params.body);
    try {
      var header = getIt<DioHeader>().call(isMultiPart: params.isMultiPart);
      var response = await dio.put(params.url,
          data: formData ?? json.encode(params.body),
          options: Options(headers: header));
      return getIt<HandleErrors>().statusError(response, params.errorFunc);
    } on DioError catch (e) {
      getIt<HandleErrors>().catchError(
        errorFunc: params.errorFunc,
        response: e.response,
      );
      return Left(ServerFailure());
    }
  }
}

