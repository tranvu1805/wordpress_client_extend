import '../../wordpress_client.dart';

/// Represents the tag interface for interacting with WordPress post statuses.
///
/// This interface provides CRUD (Create, Read, Update, Delete) operations for statuses.
/// It extends [IRequestInterface] and mixes in various operations to handle status-related tasks.
///
/// Example usage:
/// ```dart
/// final wordpress = WordpressClient(baseUrl: 'https://your-wordpress-site.com/wp-json');
/// final statusesInterface = wordpress.statuses;
/// // Retrieve a status
/// final status = await statusesInterface.retrieve(RetrievePostStatusRequest(name: 'abc'));
///

final class PostStatusInterface extends IRequestInterface
    with RetrieveOperation<PostStatus, RetrievePostStatusRequest> {}
