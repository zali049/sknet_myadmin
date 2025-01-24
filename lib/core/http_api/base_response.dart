import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class BaseResponse<T> {
  bool? status;
  String? messages;
  T? data;

  BaseResponse({

    this.status,
    this.messages,
    this.data,
  });

  factory BaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseResponseFromJson(json, fromJsonT);
}
