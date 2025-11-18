class BaseResponse {
  BaseResponse({
    String? key,
    String? msg,
    num? code,
  }) {
    _key = key;
    _msg = msg;
    _code = code;
  }

  BaseResponse.fromJson(dynamic json) {
    _key = json['key'] ?? '';
    _msg = json['msg'] ?? ['message'] ?? '';
    _code = json['code'] ?? '';
    _status = (code == 200 && key != 'fail');
  }

  String? _key;
  String? _msg;
  num? _code;
  late bool _status;

  String? get key => _key;

  String? get msg => _msg;

  num? get code => _code;

  bool get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['key'] = _key;
    map['msg'] = _msg;
    map['code'] = _code;
    return map;
  }
}
