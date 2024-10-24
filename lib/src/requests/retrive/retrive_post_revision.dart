import '../../../wordpress_client.dart';

final class RetrievePostRevisionRequest extends IRequest {
  RetrievePostRevisionRequest({
    required this.id,
    required this.parent,
    this.context,
    this.password,
    super.cancelToken,
    super.authorization,
    super.events,
    super.receiveTimeout,
    super.requireAuth = false,
    super.sendTimeout,
    super.validator,
    super.extra,
    super.headers,
    super.queryParameters,
  });

  RequestContext? context;
  int? password;
  int id;
  int parent;

  @override
  WordpressRequest build(Uri baseUrl) {
    final queryParameters = <String, dynamic>{}
      ..addIfNotNull('context', context?.name)
      ..addIfNotNull('password', password)
      ..addAllIfNotNull(this.queryParameters)
      ..addAllIfNotNull(extra);

    return WordpressRequest(
      method: HttpMethod.get,
      headers: headers,
      url: RequestUrl.relativeParts(
        [
          'posts',
          parent.toString(),
          'revisions',
          id,
        ],
      ),
      queryParameters: queryParameters,
      requireAuth: requireAuth || context == RequestContext.edit,
      cancelToken: cancelToken,
      authorization: authorization,
      events: events,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
      validator: validator,
    );
  }
}
