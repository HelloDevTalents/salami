import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';

/// {@template auth_response}
/// A model containing data about a auth response.
/// {@endtemplate}
@JsonSerializable(fieldRename: FieldRename.snake)
class AuthResponse {
  /// {@macro auth_response}
  AuthResponse({
    required this.accessToken,
  });

  ///User access token
  final String accessToken;

  ///Getter for authorization headears
  String get authhorization => 'Bearer $accessToken';

  /// Converts a JSON [Map] into a [AuthResponse] instance.
  static AuthResponse fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  /// Converts this [AuthResponse] instance into a JSON [Map].
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
