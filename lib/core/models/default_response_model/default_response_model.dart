import 'package:freezed_annotation/freezed_annotation.dart';

part 'default_response_model.freezed.dart';
part 'default_response_model.g.dart';

@freezed
class DefaultResponseModel with _$DefaultResponseModel {
  factory DefaultResponseModel({
    @JsonKey(name: 'key') String? key,
    @JsonKey(name: 'message') String? message,
  }) = _DefaultResponseModel;

  factory DefaultResponseModel.fromJson(Map<String, dynamic> json) => _$DefaultResponseModelFromJson(json);
}
