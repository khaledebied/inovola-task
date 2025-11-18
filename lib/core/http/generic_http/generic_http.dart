import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:expense_tracker/core/helpers/di.dart';
import '../../errors/failures.dart';
import '../dio_helper/actions/get.dart';
import '../dio_helper/actions/post.dart';
import '../dio_helper/actions/put.dart';
import '../dio_helper/actions/patch.dart';
import '../dio_helper/actions/delete.dart';
import '../models/http_request_model.dart';
import '../models/request_body_model.dart';

class GenericHttpImpl<T> {
  Future<Either<Failure, T>> call(HttpRequestModel model) async {
    final requestBodyModel = RequestBodyModel(
      url: model.url,
      body: model.requestBody,
      errorFunc: model.errorFunc,
      showLoader: model.showLoader,
      isMultiPart: model.isMultipart,
      forceRefresh: model.refresh,
      headers: model.headers,
    );

    Either<Failure, Response> response;

    switch (model.requestMethod) {
      case RequestMethod.get:
        response = await getIt<Get>()(requestBodyModel);
        break;
      case RequestMethod.post:
        response = await getIt<Post>()(requestBodyModel);
        break;
      case RequestMethod.put:
        response = await getIt<Put>()(requestBodyModel);
        break;
      case RequestMethod.patch:
        response = await getIt<Patch>()(requestBodyModel);
        break;
      case RequestMethod.delete:
        response = await getIt<Delete>()(requestBodyModel);
        break;
    }

    return response.fold(
          (failure) => Left(failure),
          (successResponse) {
        try {
          dynamic data = successResponse.data;

          if (model.responseKey != null) {
            data = model.responseKey!(data);
          }

          if (model.toJsonFunc != null) {
            final result = model.toJsonFunc!(data);
            return Right(result as T);
          }

          return Right(data as T);
        } catch (e) {
          return Left(ServerFailure());
        }
      },
    );
  }
}
