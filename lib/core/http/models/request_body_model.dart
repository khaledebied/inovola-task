class RequestBodyModel {
  final String url;
  final Map<String, dynamic> body;
  final Function(dynamic) errorFunc;
  final bool showLoader;
  final bool isMultiPart;
  final bool forceRefresh;
  final Map<String, String>? headers;
  final bool? isScan;
  final bool? isOcrDebit;

  RequestBodyModel({
    required this.url,
    this.body = const {},
    required this.errorFunc,
    this.showLoader = false,
    this.isMultiPart = false,
    this.forceRefresh = false,
    this.headers,
    this.isScan,
    this.isOcrDebit,
  });
}
