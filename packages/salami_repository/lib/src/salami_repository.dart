import 'package:salami_api/salami_api.dart';

/// Thrown when an error occurs while up auth.
class AuthException implements Exception {}

/// {@template salami_repository}
/// A Dart class which exposes methods to implement salami-related
/// functionality.
/// {@endtemplate}
class SalamiRepository {
  /// {@macro salami_repository}
  const SalamiRepository(this._salamiApi);

  final SalamiApi _salamiApi;

  /// Returns an access token by given code.
  ///
  /// Throws an [AuthException] if an error occurs.
  Future<AuthResponse> exampleLogin(String code) {
    try {
      final authResponse = _salamiApi.exampleAuthRequest(code);
      return authResponse;
    } on Exception {
      throw AuthException();
    }
  }

  /// Getter that checks if user have already signed in
  bool get isSignedIn => _salamiApi.isSignedIn;
}
