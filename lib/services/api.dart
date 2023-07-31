import 'package:dio/dio.dart';
import 'package:leaf_for_business/services/urls.dart';

class Api {
  static final BaseOptions _options = BaseOptions(
    baseUrl: URLs.baseUrl(),
    contentType: "application/json",
    connectTimeout: const Duration(milliseconds: 60000).inMilliseconds,
    receiveTimeout: const Duration(milliseconds: 60000).inMilliseconds,
  );

  static final Dio _ins = Dio(_options);
  static Dio get ins => Api._ins;
}
