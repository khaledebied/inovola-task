import 'package:injectable/injectable.dart';

@lazySingleton
class DioHeader {
  Map<String, String> call({bool isMultiPart = false}) {
    var language = 'en';

    var data = {
      'Content-Type': isMultiPart ? "multipart/form-data" : "application/json",
      'Accept': 'application/json',
      'Channel-Source': 'App',
      'X-LANGUAGE': language,
    };

    return data;
  }
}
