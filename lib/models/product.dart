class Product {
  final int? id;
  final String? name;
  final String? image;
  final double? price;
  final int? count;

  const Product({this.id, this.name, this.image, this.price, this.count});

  String get assetName => '$id-0.jpg';
  String get assetPackage => 'shrine_images';
}
