/// {@template base_urls}
/// A model containing base urls for your app.
/// To specyfiy more urls extend class here
/// {@endtemplate}
class BaseUrls {
  /// {@macro base_urls}
  BaseUrls({
    required this.api,
  });

  ///Base api url
  final String api;
}
