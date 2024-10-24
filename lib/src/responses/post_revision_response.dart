import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

import '../utilities/helpers.dart';
import '../utilities/self_representive_base.dart';
import 'properties/content.dart';

/// Represents a WordPress post revision.
///
/// This class encapsulates all the properties of a post revision as defined in the
/// WordPress REST API. For more details, see:
/// https://developer.wordpress.org/rest-api/reference/post-revisions/
@immutable
class PostRevision implements ISelfRespresentive {
  /// Creates a new [PostRevision] instance.
  const PostRevision({
    required this.id,
    required this.slug,
    required this.author,
    required this.parent,
    required this.self,
    this.date,
    this.dateGmt,
    this.guid,
    this.modified,
    this.modifiedGmt,
    this.title,
    this.content,
    this.excerpt,
  });

  /// Creates a [Post] instance from a JSON map.
  factory PostRevision.fromJson(Map<String, dynamic> json) {
    return PostRevision(
      id: castOrElse(json['id']),
      parent: castOrElse(json['parent']),
      date: parseDateIfNotNull(castOrElse(json['date'])),
      dateGmt: parseDateIfNotNull(castOrElse(json['date_gmt'])),
      guid: castOrElse(
        json['guid'],
        transformer: (value) => Content.fromJson(value as Map<String, dynamic>),
      ),
      modified: parseDateIfNotNull(castOrElse(json['modified'])),
      modifiedGmt: parseDateIfNotNull(castOrElse(json['modified_gmt'])),
      slug: castOrElse(json['slug'], orElse: () => '')!,
      title: castOrElse(
        json['title'],
        transformer: (value) => Content.fromJson(value as Map<String, dynamic>),
      ),
      content: castOrElse(
        json['content'],
        transformer: (value) => Content.fromJson(value as Map<String, dynamic>),
      ),
      excerpt: castOrElse(
        json['excerpt'],
        transformer: (value) => Content.fromJson(value as Map<String, dynamic>),
      ),
      author: castOrElse(json['author'], orElse: () => 0)!,
      self: json,
    );
  }

  /// The unique identifier for the post status.
  final int id;

  /// The date the post status was published, in the site's timezone.
  final DateTime? date;

  /// The date the post status was published, as GMT.
  final DateTime? dateGmt;

  /// The globally unique identifier for the post status.
  final Content? guid;

  /// The date the post status was last modified, in the site's timezone.
  final DateTime? modified;

  /// The date the post status was last modified, as GMT.
  final DateTime? modifiedGmt;

  /// An alphanumeric identifier for the post status unique to its type.
  final String slug;

  /// The title for the post status.
  final Content? title;

  /// The content for the post status.
  final Content? content;

  /// The excerpt for the post status.
  final Content? excerpt;

  /// The ID for the author of the post status.
  final int author;

  /// The ID of the parent for the post status.
  final int parent;

  @override
  final Map<String, dynamic> self;

  /// Converts the [Post] instance to a JSON map.
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'date': date?.toIso8601String(),
      'date_gmt': dateGmt?.toIso8601String(),
      'guid': guid?.toJson(),
      'modified': modified?.toIso8601String(),
      'modified_gmt': modifiedGmt?.toIso8601String(),
      'slug': slug,
      'title': title?.toJson(),
      'content': content?.toJson(),
      'excerpt': excerpt?.toJson(),
      'author': author,
      'parent': parent,
    };
  }

  @override
  bool operator ==(covariant PostRevision other) {
    if (identical(this, other)) {
      return true;
    }

    final collectionEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.date == date &&
        other.dateGmt == dateGmt &&
        other.guid == guid &&
        other.modified == modified &&
        other.modifiedGmt == modifiedGmt &&
        other.slug == slug &&
        other.title == title &&
        other.content == content &&
        other.excerpt == excerpt &&
        other.author == author &&
        other.parent == parent &&
        collectionEquals(other.self, self);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        date.hashCode ^
        dateGmt.hashCode ^
        guid.hashCode ^
        modified.hashCode ^
        modifiedGmt.hashCode ^
        slug.hashCode ^
        title.hashCode ^
        content.hashCode ^
        excerpt.hashCode ^
        author.hashCode ^
        parent.hashCode ^
        self.hashCode;
  }

  @override
  String toString() {
    return 'Post(id: $id, date: $date, dateGmt: $dateGmt, guid: $guid, parent: $parent,'
        ' modified: $modified, modifiedGmt: $modifiedGmt, slug: $slug, title: $title,'
        ' content: $content, excerpt: $excerpt, author: $author, self: $self)';
  }
}
