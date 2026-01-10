//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_import

library piped_api.api;

import 'package:dio/dio.dart';
import 'package:built_value/serializer.dart';
import 'package:piped_api/serializers.dart';
import 'package:piped_api/auth/api_key_auth.dart';
import 'package:piped_api/auth/basic_auth.dart';
import 'package:piped_api/auth/oauth.dart';
import 'package:piped_api/src/api/unauthenticated_api.dart';

final _defaultInterceptors = [
  OAuthInterceptor(),
  BasicAuthInterceptor(),
  ApiKeyAuthInterceptor(),
];

class PipedApi {
  static const String basePath = r'https://pipedapi.kavin.rocks';

  final Dio dio;

  final Serializers serializers;

  PipedApi({
    Dio? dio,
    Serializers? serializers,
    String? basePathOverride,
    List<Interceptor>? interceptors,
  })  : this.serializers = serializers ?? standardSerializers,
        this.dio = dio ??
            Dio(BaseOptions(
              baseUrl: basePathOverride ?? basePath,
              connectTimeout: const Duration(milliseconds: 5000),
              receiveTimeout: const Duration(milliseconds: 3000),
            )) {
    if (interceptors == null) {
      this.dio.interceptors.addAll(_defaultInterceptors);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }
  }

  void setOAuthToken(String name, String token) {
    final interceptor = this.dio.interceptors.firstWhere(
          (element) => element is OAuthInterceptor,
          orElse: () => throw StateError('OAuthInterceptor not found'),
        ) as OAuthInterceptor;
    interceptor.tokens[name] = token;
  }

  void setBasicAuth(String name, String username, String password) {
    final interceptor = this.dio.interceptors.firstWhere(
          (element) => element is BasicAuthInterceptor,
          orElse: () => throw StateError('BasicAuthInterceptor not found'),
        ) as BasicAuthInterceptor;
    interceptor.authInfo[name] = BasicAuthInfo(username, password);
  }

  void setApiKey(String name, String apiKey) {
    final interceptor = this.dio.interceptors.firstWhere(
          (element) => element is ApiKeyAuthInterceptor,
          orElse: () => throw StateError('ApiKeyAuthInterceptor not found'),
        ) as ApiKeyAuthInterceptor;
    interceptor.apiKeys[name] = apiKey;
  }

  /**
   * Get UnauthenticatedApi instance, base route and serializer can be overridden by a given but be careful,
   * by doing that all interceptors will not be executed
   */
  UnauthenticatedApi getUnauthenticatedApi() {
    return UnauthenticatedApi(dio, serializers);
  }
}
