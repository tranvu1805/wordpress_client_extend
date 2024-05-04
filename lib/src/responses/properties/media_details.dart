import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

import '../../library_exports.dart';
import 'image_meta.dart';
import 'media_size_value.dart';

@immutable
final class MediaDetails {
  const MediaDetails({
    this.width,
    this.height,
    this.file,
    this.sizes,
    this.imageMeta,
  });

  factory MediaDetails.fromJson(Map<String, dynamic> json) {
    return MediaDetails(
      width: castOrElse(json['width']),
      height: castOrElse(json['height']),
      file: castOrElse(json['file']),
      sizes: castOrElse(
        json['sizes'],
        transformer: (value) {
          return Map<String, dynamic>.from(value as Map<String, dynamic>).map(
            (key, value) {
              return MapEntry(key, SizeValue.fromJson(value));
            },
          );
        },
      ),
      imageMeta: castOrElse(
        json['image_meta'],
        transformer: (value) {
          return ImageMeta.fromJson(value as Map<String, dynamic>);
        },
      ),
    );
  }

  final int? width;
  final int? height;
  final String? file;
  final Map<String, SizeValue>? sizes;
  final ImageMeta? imageMeta;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'width': width,
      'height': height,
      'file': file,
      'sizes': sizes == null
          ? null
          : Map<String, dynamic>.from(sizes!).map<String, dynamic>(
              (k, dynamic v) => MapEntry<String, dynamic>(
                k,
                v.toJson(),
              ),
            ),
      'image_meta': imageMeta?.toJson(),
    };
  }

  @override
  bool operator ==(covariant MediaDetails other) {
    if (identical(this, other)) {
      return true;
    }

    final mapEquals = const DeepCollectionEquality().equals;

    return other.width == width &&
        other.height == height &&
        other.file == file &&
        mapEquals(other.sizes, sizes) &&
        other.imageMeta == imageMeta;
  }

  @override
  int get hashCode {
    return width.hashCode ^
        height.hashCode ^
        file.hashCode ^
        sizes.hashCode ^
        imageMeta.hashCode;
  }

  @override
  String toString() {
    return 'MediaDetails(width: $width, height: $height, file: $file, sizes: $sizes, imageMeta: $imageMeta)';
  }
}
