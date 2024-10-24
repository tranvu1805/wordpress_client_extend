import '../../../wordpress_client.dart';

final class CreatePostRevisionRequest extends IRequest {
  CreatePostRevisionRequest({
    required this.id,
    this.slug,
    this.title,
    this.content,
    this.status,
    this.excerpt,
    this.password,
    this.authorId,
    this.featuredMediaId,
    this.commentStatus,
    this.pingStatus,
    this.format,
    this.sticky,
    this.categories,
    this.tags,
    this.parent,
    this.date,
    this.template,
    this.dateGmt,
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
  });

  int id;
  String? slug;
  String? title;
  String? content;
  DateTime? date;
  DateTime? dateGmt;
  String? status;
  String? password;
  String? excerpt;
  int? parent;
  int? authorId;
  int? featuredMediaId;
  Status? commentStatus;
  Status? pingStatus;
  String? format;
  bool? sticky;
  String? template;
  List<int>? categories;
  List<int>? tags;

  @override
  WordpressRequest build(Uri baseUrl) {
    final body = <String, dynamic>{}
      ..addIfNotNull('title', title)
      ..addIfNotNull('content', content)
      ..addIfNotNull('excerpt', excerpt)
      ..addIfNotNull('status', status)
      ..addIfNotNull('password', password)
      ..addIfNotNull('author', authorId)
      ..addIfNotNull('parent', parent)
      ..addIfNotNull('date', date?.toIso8601String())
      ..addIfNotNull('data_gmt', dateGmt?.toIso8601String())
      ..addIfNotNull('featured_media', featuredMediaId)
      ..addIfNotNull('comment_status', commentStatus?.name)
      ..addIfNotNull('ping_status', pingStatus?.name)
      ..addIfNotNull('format', format)
      ..addIfNotNull('sticky', (sticky ?? false) ? '1' : null)
      ..addIfNotNull('categories', categories?.join(','))
      ..addIfNotNull('tags', tags?.join(','))
      ..addIfNotNull('slug', slug)
      ..addAllIfNotNull(extra);

    return WordpressRequest(
      body: body,
      headers: headers,
      queryParameters: queryParameters,
      method: HttpMethod.post,
      url: RequestUrl.relativeParts(
        [
          'posts',
          parent.toString(),
          'autosaves',
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
