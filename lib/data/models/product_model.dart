import 'package:flutter/material.dart';

import '../../domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {

  final String? type;
  final String? status;
  final String? catalogVisibility;
  final String? description;
  final String? shortDescription;
  final bool? onSale;
  final bool? purchasable;
  final bool? virtual;

  final String? taxStatus;
  final int? stockQuantity;
  final String? lowStockAmount;

  final String? weight;
  final bool? shippingRequired;
  final bool? shippingTaxable;
  final String? shippingClass;
  final int? shippingClassId;
  final bool? reviewsAllowed;
  final String? parentId;
  final String? purchaseNote;
  final Map<String, dynamic>? store;

  ProductModel({
    required super.id,
    required super.name,
    required super.price,
    required super.dateCreated,
    required super.dateCreatedGmt,
    required super.dateModified,
    required super.dateModifiedGmt,
    required super.images,
    required super.slug,
    required super.featured,
    required super.sku,
    required super.regularPrice,
    required super.salePrice,
    required super.totalSales,
    required super.averageRating,
    required super.ratingCount,
    required super.inStock,

     this.type,
     this.status,
     this.catalogVisibility,
     this.description,
     this.shortDescription,
     this.onSale,
     this.purchasable,
     this.virtual,

     this.taxStatus,

    this.stockQuantity,
    this.lowStockAmount,

    this.weight,
     this.shippingRequired,
     this.shippingTaxable,
    this.shippingClass,
     this.shippingClassId,
     this.reviewsAllowed,
     this.parentId,
     this.purchaseNote,
     this.store,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    print('ProductModel.fromJson');
    try {
      return ProductModel(
        id: json['id'],
        name: json['name'],
        slug: json['slug'],
        featured: json['featured'],
        sku: json['sku'] ?? '',
        price: double.parse(json['price']??'0.0'),
        regularPrice: double.parse(json['regular_price']!=null && json['regular_price']!=""?json['regular_price'].toString():"0.0"),
        salePrice: json['sale_price'] != "" ? double.parse(json['sale_price']) : 0.0,

        averageRating: double.parse(json['average_rating']),
        totalSales: json['total_sales']!=null&&json['total_sales']!=""?int.parse(json['total_sales'].toString()):0,
        ratingCount:json['rating_count']!=null&&json['rating_count']!=""?int.parse(json['rating_count'].toString()):0 ,
        inStock: json['in_stock'],
        images: (json['images'] as List).map((image) => image['src'] as String).toList(),
        dateCreated: json['date_created'],
        dateCreatedGmt: json['date_created_gmt'],
        dateModified: json['date_modified'],
        dateModifiedGmt: json['date_modified_gmt'],
        type: json['type'].toString(),
        status: json['status'].toString(),
        description: json['description'],
        shortDescription: json['short_description'],
        onSale: json['on_sale'],
        purchasable: json['purchasable'],
        virtual: json['virtual'],
        taxStatus: json['tax_status'].toString(),
        reviewsAllowed: json['reviews_allowed'],
        parentId: json['parent_id'].toString(),
      );
    } on Exception catch (e) {
      // TODO
      debugPrint('error in product model $e');
      rethrow;
    }
  }




  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      name: name,
      price: price,
      images: images,
      dateCreated: dateCreated,
      dateCreatedGmt: dateCreatedGmt,
      dateModified: dateModified,
      dateModifiedGmt: dateModifiedGmt,
      slug: slug,
      featured: featured,
      sku: sku,
      regularPrice: regularPrice,
      salePrice: salePrice ?? 0.0,
      totalSales: totalSales,
      averageRating: averageRating,
      ratingCount: ratingCount,
      inStock: inStock,
    );
  }
}