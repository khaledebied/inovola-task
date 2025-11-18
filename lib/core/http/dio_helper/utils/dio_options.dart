import 'package:dio/dio.dart';
import 'package:expense_tracker/core/helpers/di.dart';
import 'package:injectable/injectable.dart';
import 'dio_header.dart';

@lazySingleton
class DioOptions {
  Options call({bool forceRefresh = true}) {
    var header = getIt<DioHeader>().call();
    return Options(headers: header);
  }
}
