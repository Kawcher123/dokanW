class ProductEntity {
  final int id;
  final String name;
  final double price;
  final String dateCreated;
  final String dateCreatedGmt;
  final String dateModified;
  final String dateModifiedGmt;
  final List<String> images;
  final String slug;
  final bool featured;
  final String sku;
  final double regularPrice;
  final double salePrice;
  final int totalSales;
  final double averageRating;
  final int ratingCount;
  final bool inStock;

  ProductEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.dateCreated,
    required this.dateCreatedGmt,
    required this.dateModified,
    required this.dateModifiedGmt,
    required this.images,
    required this.slug,
    required this.featured,
    required this.sku,
    required this.regularPrice,
    required this.salePrice,
    required this.totalSales,
    required this.averageRating,
    required this.ratingCount,
    required this.inStock,
  });
}