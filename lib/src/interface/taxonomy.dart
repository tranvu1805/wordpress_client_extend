import '../../wordpress_client.dart';

/// Represents the tag interface for interacting with WordPress taxonomies.
///
/// This interface provides CRUD (Create, Read, Update, Delete) operations for taxonomies.
/// It extends [IRequestInterface] and mixes in various operations to handle taxonomy-related tasks.
///
/// Example usage:
/// ```dart
/// final wordpress = WordpressClient(baseUrl: 'https://your-wordpress-site.com/wp-json');
/// final taxonomy = wordpress.taxonomies;
/// // Retrieve a taxonomy
/// final taxonomy = await taxonomyInterface.retrieve(RetrieveTaxonomyRequest());
///

final class TaxonomyInterface extends IRequestInterface
    with RetrieveOperation<Taxonomy, RetrieveTaxonomyRequest> {}
