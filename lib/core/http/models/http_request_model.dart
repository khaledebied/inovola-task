enum RequestMethod { get, post, put, patch, delete }
enum ResType { model, list, type }

class HttpRequestModel {
  final String url;
  final RequestMethod requestMethod;
  final ResType responseType;
  final Map<String, dynamic> requestBody;
  final Function(dynamic) errorFunc;
  final Function(dynamic)? responseKey;
  final Function(dynamic)? toJsonFunc;
  final bool refresh;
  final bool showLoader;
  final bool isMultipart;
  final Map<String, String>? headers;

  HttpRequestModel({
    required this.url,
    required this.requestMethod,
    required this.responseType,
    this.requestBody = const {},
    required this.errorFunc,
    this.responseKey,
    this.toJsonFunc,
    this.refresh = true,
    this.showLoader = false,
    this.isMultipart = false,
    this.headers,
  });
}

