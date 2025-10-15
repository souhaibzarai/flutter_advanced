import 'package:json_annotation/json_annotation.dart';

import '../helpers/extensions.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final int? code;
  final String? message;
  @JsonKey(name: 'data')
  final Map<String, dynamic>? errors;

  const ApiErrorModel({this.code, this.message, this.errors});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  String getAllErrorMessages() {
    if (errors.isNullOrEmpty()) return message ?? 'Unknown Error occurred';

    return errors!.entries
        .map((entry) {
          return entry.value.join(',');
        })
        .join('\n');
  }
}
