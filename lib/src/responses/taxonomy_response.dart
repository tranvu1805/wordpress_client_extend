import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

import '../utilities/helpers.dart';
import '../utilities/self_representive_base.dart';

/// Represents a tag in the WordPress system.
///
/// This class encapsulates all the properties of a tag as defined in the WordPress REST API.
/// Tags are a taxonomy that can be used to classify posts (and sometimes other content types).
///
/// For more details, see: https://developer.wordpress.org/rest-api/reference/taxonomies/
@immutable
final class Taxonomy implements ISelfRespresentive {
  /// Creates a new [Taxonomy] instance.
  ///
  /// All parameters correspond to the properties of a tag as defined in the WordPress REST API.
  const Taxonomy({
    required this.category,
    required this.productCat,
    required this.productTag,
    required this.navMenu,
    required this.wpPatternCategory,
    required this.productBrand,
    required this.postTag,
    required this.appBuilderTemplateTag,
    required this.appBuilderPresetTag,
    required this.scCouponCategory,
    required this.self,
  });

  /// Creates a [Tag] instance from a JSON map.
  ///
  /// This factory constructor is used to deserialize tag data received from
  /// the WordPress REST API.
  factory Taxonomy.fromJson(Map<String, dynamic> json) {
    return Taxonomy(
      category: castOrElse(json['category']),
      postTag: castOrElse(json['post_tag']),
      navMenu: castOrElse(json['nav_menu']),
      wpPatternCategory: castOrElse(json['wp_pattern_category']),
      productBrand: castOrElse(json['product_brand']),
      productCat: castOrElse(json['product_cat']),
      productTag: castOrElse(json['product_tag']),
      appBuilderTemplateTag: castOrElse(json['app_builder_template_tag']),
      appBuilderPresetTag: castOrElse(json['app_builder_preset_tag']),
      scCouponCategory: castOrElse(json['sc_coupon_category']),
      self: json,
    );
  }

  final Map<String, dynamic> category;
  final Map<String, dynamic> postTag;
  final Map<String, dynamic> navMenu;
  final Map<String, dynamic> wpPatternCategory;
  final Map<String, dynamic> productBrand;
  final Map<String, dynamic> productCat;
  final Map<String, dynamic> productTag;
  final Map<String, dynamic> appBuilderTemplateTag;
  final Map<String, dynamic> appBuilderPresetTag;
  final Map<String, dynamic> scCouponCategory;

  /// The raw JSON response from the API.
  @override
  final Map<String, dynamic> self;

  /// Converts the [Tag] instance to a JSON map.
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'category': category,
      'post_tag': postTag,
      'nav_menu': navMenu,
      'wp_pattern_category': wpPatternCategory,
      'product_brand': productBrand,
      'product_cat': productCat,
      'product_tag': productTag,
      'app_builder_template_tag': appBuilderTemplateTag,
      'app_builder_preset_tag': appBuilderPresetTag,
      'sc_coupon_category': scCouponCategory,
    };
  }

  @override
  bool operator ==(covariant Taxonomy other) {
    if (identical(this, other)) {
      return true;
    }

    final mapEquals = const DeepCollectionEquality().equals;

    return other.category == category &&
        other.postTag == postTag &&
        other.navMenu == navMenu &&
        other.wpPatternCategory == wpPatternCategory &&
        other.productBrand == productBrand &&
        other.productCat == productCat &&
        other.productTag == productTag &&
        other.appBuilderTemplateTag == appBuilderTemplateTag &&
        other.appBuilderPresetTag == appBuilderPresetTag &&
        other.scCouponCategory == scCouponCategory &&
        mapEquals(other.self, self);
  }

  @override
  int get hashCode {
    return category.hashCode ^
        postTag.hashCode ^
        navMenu.hashCode ^
        wpPatternCategory.hashCode ^
        productBrand.hashCode ^
        productCat.hashCode ^
        productTag.hashCode ^
        appBuilderTemplateTag.hashCode ^
        appBuilderPresetTag.hashCode ^
        scCouponCategory.hashCode ^
        self.hashCode;
  }

  @override
  String toString() {
    return 'Tag(category: $category, postTag: $postTag, navMenu: $navMenu,'
        ' wpPatternCategory: $wpPatternCategory, productBrand: $productBrand, '
        'productCat: $productCat, productTag: $productTag, '
        'appBuilderTemplateTag: $appBuilderTemplateTag, appBuilderPresetTag: $appBuilderPresetTag,'
        'scCouponCategory: $scCouponCategory)';
  }
}
