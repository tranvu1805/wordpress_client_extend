import '../../../wordpress_client.dart';

final class DeletePostRevisionRequest extends IRequest {
  DeletePostRevisionRequest({
    required this.parent,
    required this.id,
    this.force,
    super.cancelToken,
    super.authorization,
    super.events,
    super.receiveTimeout,
    super.requireAuth,
    super.sendTimeout,
    super.validator,
    super.extra,
    super.headers,
    super.queryParameters,
  }) {
    // TODO: implement DeletePostRevisionRequest
    throw UnimplementedError();
  }

  int id;
  int parent;
  bool? force;

  @override
  WordpressRequest build(Uri baseUrl) {
    final body = <String, dynamic>{}
      ..addIfNotNull('force', force)
      ..addAllIfNotNull(extra);

    return WordpressRequest(
      body: body,
      headers: headers,
      queryParameters: queryParameters,
      method: HttpMethod.delete,
      url: RequestUrl.relativeParts(
        [
          'posts',
          parent.toString(),
          'revisions',
          id,
        ],
      ),
      requireAuth: requireAuth,
      cancelToken: cancelToken,
      authorization: authorization,
      events: events,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
      validator: validator,
    );
  }
}
