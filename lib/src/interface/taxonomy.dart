import '../../wordpress_client.dart';
import '../requests/retrive/retrive_taxonomy.dart';
import '../responses/taxonomy_response.dart';

/// Represents the tag interface for interacting with WordPress tags.
///
/// This interface provides CRUD (Create, Read, Update, Delete) operations for tags.
/// It extends [IRequestInterface] and mixes in various operations to handle tag-related tasks.
///
/// Example usage:
/// ```dart
/// final wordpress = WordpressClient(baseUrl: 'https://your-wordpress-site.com/wp-json');
/// final tagInterface = wordpress.tags;
/// // Retrieve a tag
/// final tag = await tagInterface.retrieve(RetrieveTagRequest(id: 123));
///

final class TaxonomyInterface extends IRequestInterface
    with
        RetrieveOperation<Taxonomy, RetrieveTaxonomyRequest>{}
