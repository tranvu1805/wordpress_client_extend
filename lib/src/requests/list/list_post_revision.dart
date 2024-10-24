import '../../../wordpress_client.dart';

final class ListPostRevisionRequest extends IRequest {
  ListPostRevisionRequest({
    required this.parent,
    this.context,
    this.page = 1,
    this.perPage = 10,
    this.search,
    this.exclude,
    this.orderBy,
    this.order,
    this.offset,
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

  RequestContext? context; //
  int page = 1; //
  int perPage = 10; //
  int parent; //
  String? search; //
  List<int>? exclude; //
  OrderBy? orderBy; //
  Order? order; //
  int? offset; //

  @override
  WordpressRequest build(Uri baseUrl) {
    final queryParameters = <String, dynamic>{}
      ..addIfNotNull('context', context?.name)
      ..addIfNotNull('page', page)
      ..addIfNotNull('per_page', perPage)
      ..addIfNotNull('search', search)
      ..addIfNotNull('exclude', exclude?.join(','))
      ..addIfNotNull('orderby', orderBy?.name)
      ..addIfNotNull('order', order?.name)
      ..addIfNotNull('offset', offset)
      ..addAllIfNotNull(extra)
      ..addAllIfNotNull(this.queryParameters);

    return WordpressRequest(
      queryParameters: queryParameters,
      headers: headers,
      method: HttpMethod.get,
      url: RequestUrl.relativeParts(
        [
          'posts',
          parent.toString(),
          'revisions',
        ],
      ),
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
