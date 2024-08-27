import 'dart:ui';

class ProductModel {
  final int id;
  final String imagePath;
  final String glbSource;
  final String extraGlb;
  final String description;
  final String name;
  final String productType;
  final Color primcolor;
  final Color extracolor;

  ProductModel({
    required this.id,
    required this.glbSource,
    required this.extraGlb,
    required this.imagePath,
    required this.description,
    required this.name,
    required this.productType,
    required this.primcolor,
    required this.extracolor,
  });
}
