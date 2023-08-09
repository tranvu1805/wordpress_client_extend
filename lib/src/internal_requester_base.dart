import 'package:meta/meta.dart';

import 'codable_map.dart';
import 'library_exports.dart';
import 'responses/wordpress_error.dart';
import 'responses/wordpress_raw_response.dart';
import 'utilities/helpers.dart';

abstract base class IRequestExecutor {
  Uri get baseUrl;

  void configure(BootstrapConfiguration configuration);

  Future<WordpressResponse<T>> create<T>(
    WordpressRequest request,
  ) async {
    final rawResponse = await executeGuarded<WordpressRawResponse>(
      function: () async => execute(request),
      onError: (error, stackTrace) async {
        return WordpressRawResponse(
          data: const {},
          code: -7,
          message: '${error.toString()}\n\n$stackTrace',
        );
      },
    );

    return rawResponse.map<T>(
      onSuccess: (response) {
        final decoder = CodableMap.getDecoder<T>();
        final data = decoder(response.data);

        return WordpressSuccessResponse<T>(
          data: data,
          code: response.code,
          extra: response.extra,
          requestHeaders: response.requestHeaders,
          headers: response.headers,
          duration: response.duration,
          message: response.message,
        );
      },
      onFailure: (response) {
        final error = WordpressError.fromMap(response.data);

        return WordpressFailureResponse<T>(
          error: error,
          code: response.code,
          headers: response.headers,
          duration: response.duration,
          extra: response.extra,
          requestHeaders: response.requestHeaders,
          message: response.message,
        );
      },
    );
  }

  Future<WordpressResponse<T>> retrive<T>(
    WordpressRequest request,
  ) async {
    final rawResponse = await executeGuarded<WordpressRawResponse>(
      function: () async => execute(request),
      onError: (error, stackTrace) async {
        return WordpressRawResponse(
          data: const {},
          code: -7,
          message: '${error.toString()}\n\n$stackTrace',
        );
      },
    );

    return rawResponse.map<T>(
      onSuccess: (response) {
        final decoder = CodableMap.getDecoder<T>();
        final data = decoder(response.data);

        return WordpressSuccessResponse<T>(
          data: data,
          code: response.code,
          headers: response.headers,
          extra: response.extra,
          requestHeaders: response.requestHeaders,
          duration: response.duration,
          message: response.message,
        );
      },
      onFailure: (response) {
        final error = WordpressError.fromMap(response.data);

        return WordpressFailureResponse<T>(
          error: error,
          code: response.code,
          headers: response.headers,
          duration: response.duration,
          extra: response.extra,
          requestHeaders: response.requestHeaders,
          message: response.message,
        );
      },
    );
  }

  Future<WordpressResponse<bool>> delete(
    WordpressRequest request,
  ) async {
    final rawResponse = await executeGuarded<WordpressRawResponse>(
      function: () async => execute(request),
      onError: (error, stackTrace) async {
        return WordpressRawResponse(
          data: const {},
          code: -7,
          message: '${error.toString()}\n\n$stackTrace',
        );
      },
    );

    return rawResponse.map(
      onSuccess: (response) {
        return WordpressSuccessResponse(
          data: true,
          code: response.code,
          headers: response.headers,
          extra: response.extra,
          requestHeaders: response.requestHeaders,
          duration: response.duration,
          message: response.message,
        );
      },
      onFailure: (response) {
        final error = WordpressError.fromMap(response.data);

        return WordpressFailureResponse(
          error: error,
          code: response.code,
          headers: response.headers,
          duration: response.duration,
          extra: response.extra,
          requestHeaders: response.requestHeaders,
          message: response.message,
        );
      },
    );
  }

  Future<WordpressResponse<List<T>>> list<T>(
    WordpressRequest request,
  ) async {
    final rawResponse = await executeGuarded<WordpressRawResponse>(
      function: () async => execute(request),
      onError: (error, stackTrace) async {
        return WordpressRawResponse(
          data: const {},
          code: -7,
          message: '${error.toString()}\n\n$stackTrace',
        );
      },
    );

    return rawResponse.map<List<T>>(
      onSuccess: (response) {
        final decoder = CodableMap.getDecoder<T>();
        final data = (response.data as Iterable<dynamic>).map(decoder).toList();

        return WordpressSuccessResponse<List<T>>(
          data: data,
          code: response.code,
          extra: response.extra,
          requestHeaders: response.requestHeaders,
          headers: response.headers,
          duration: response.duration,
          message: response.message,
        );
      },
      onFailure: (response) {
        final error = WordpressError.fromMap(response.data);

        return WordpressFailureResponse(
          error: error,
          code: response.code,
          headers: response.headers,
          extra: response.extra,
          requestHeaders: response.requestHeaders,
          duration: response.duration,
          message: response.message,
        );
      },
    );
  }

  Future<WordpressResponse<T>> update<T>(
    WordpressRequest request,
  ) async {
    final rawResponse = await executeGuarded<WordpressRawResponse>(
      function: () async => execute(request),
      onError: (error, stackTrace) async {
        return WordpressRawResponse(
          data: const {},
          code: -7,
          message: '${error.toString()}\n\n$stackTrace',
        );
      },
    );

    return rawResponse.map(
      onSuccess: (response) {
        final decoder = CodableMap.getDecoder<T>();
        final data = decoder(response.data);

        return WordpressSuccessResponse<T>(
          data: data,
          code: response.code,
          extra: response.extra,
          requestHeaders: response.requestHeaders,
          headers: response.headers,
          duration: response.duration,
          message: response.message,
        );
      },
      onFailure: (response) {
        final error = WordpressError.fromMap(response.data);

        return WordpressFailureResponse(
          error: error,
          code: response.code,
          headers: response.headers,
          duration: response.duration,
          extra: response.extra,
          requestHeaders: response.requestHeaders,
          message: response.message,
        );
      },
    );
  }

  @protected
  Future<WordpressRawResponse> execute(WordpressRequest request);
}
