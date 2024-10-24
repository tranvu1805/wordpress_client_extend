import '../../wordpress_client.dart';

/// Represents the interface for interacting with WordPress posts revisions.
///
/// This class provides methods for creating, retrieving, deleting,
/// and listing posts in a WordPress site.
///
/// Example usage:
///
/// ```dart
/// final wordpress = WordpressClient(baseUrl: 'https://your-wordpress-site.com');
/// final postRevisionInterface = wordpress.postRevision;
///
/// // Create a new post revisions.
/// final newPostRevision = await postRevisionInterface.create(CreatePostRequest(
///   title: 'My New Post revisions.',
///   content: 'This is the content of my new post revisions.',
///   status: 'publish',
/// ));
///
/// // Retrieve a post revisions.
/// final post = await postsInterface.retrieve(RetrievePostRequest(id: 123));
///
/// // Delete a post revisions.
/// await postsInterface.delete(DeletePostRequest(id: 123));
///
/// // List post revisions.
/// final posts = await postsInterface.list(ListPostRequest(
///   perPage: 10,
///   page: 1,
/// ));
/// ```
final class PostRevisionInterface extends IRequestInterface
    with
        CreateOperation<PostRevision, CreatePostRevisionRequest>,
        DeleteOperation<DeletePostRevisionRequest>,
        RetrieveOperation<PostRevision, RetrievePostRevisionRequest>,
        ListOperation<PostRevision, ListPostRequest> {}
