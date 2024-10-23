import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

import '../utilities/helpers.dart';
import '../utilities/self_representive_base.dart';

/// Represents a WordPress post status.
///
/// This class encapsulates all the properties of a post status as defined in the
/// WordPress REST API. For more details, see:
/// https://developer.wordpress.org/rest-api/reference/post-statuses/
@immutable
class PostStatus implements ISelfRespresentive {
  /// Creates a new [Post] instance.
  const PostStatus({
    required this.name,
    required this.slug,
    required this.public,
    required this.queryable,
    required this.dateFloating,
    required this.links,
    required this.self,
    this.private,
    this.protected,
    this.showInList,
  });

  /// Creates a [PostStatus] instance from a JSON map.
  factory PostStatus.fromJson(Map<String, dynamic> json) {
    return PostStatus(
      name: castOrElse(json['name']),
      public: castOrElse(json['public']),
      queryable: castOrElse(json['queryable']),
      dateFloating: castOrElse(json['date_floating']),
      private: castOrElse(json['private']),
      protected: castOrElse(json['protected']),
      showInList: castOrElse(json['show_in_list']),
      slug: castOrElse(json['slug']),
      links: castOrElse(json['_links']),
      self: json,
    );
  }

  ///The title for the status.
  final String name;

  ///Whether posts of this status should be shown in the front end of the site.
  final bool public;

  ///Whether posts with this status should be publicly-queryable.
  final bool queryable;

  ///Whether posts of this status may have floating published dates.
  final bool dateFloating;

  ///Whether posts with this status should be private.
  final bool? private;

  ///Whether posts with this status should be protected.
  final bool? protected;

  ///Whether to include posts in the edit listing for their post type.
  final bool? showInList;

  /// An alphanumeric identifier for the post unique to its type.
  final String slug;

  ///_links
  final Map<String, dynamic> links;
  /// The raw JSON response from the API.
  @override
  final Map<String, dynamic> self;

  /// Converts the [PostStatus] instance to a JSON map.
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'public': public,
      'queryable': queryable,
      'date_floating': dateFloating,
      'private': private,
      'protected': protected,
      'show_in_list': showInList,
      'slug': slug,
      '_links': links,
    };
  }

  @override
  bool operator ==(covariant PostStatus other) {
    if (identical(this, other)) {
      return true;
    }

    final collectionEquals = const DeepCollectionEquality().equals;

    return other.name == name &&
        other.public == public &&
        other.queryable == queryable &&
        other.dateFloating == dateFloating &&
        other.private == private &&
        other.protected == protected &&
        other.showInList == showInList &&
        other.slug == slug &&
        other.links == links &&
        collectionEquals(other.self, self);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        public.hashCode ^
        queryable.hashCode ^
        dateFloating.hashCode ^
        private.hashCode ^
        protected.hashCode ^
        showInList.hashCode ^
        slug.hashCode ^
        links.hashCode ^
        self.hashCode;
  }

  @override
  String toString() {
    return 'PostStatus(name: $name, public: $public, queryable: $queryable, '
        'dateFloating: $dateFloating, private: $private, protected: $protected,'
        ' showInList: $showInList, slug: $slug, links: $links, self: $self)';
  }
}
