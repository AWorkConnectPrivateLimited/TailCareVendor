class Product {
  final String recommendationId;
  final String objectId;
  final String storeProductId;
  final String storeId;
  final String productId;
  final String productName;
  final String brand;
  final String primarySubcategoryId;
  final String imported;
  final String discountApplicable;
  final String minimumRequiredAge;
  final String description;
  final String productVariantId;
  final String mrp;
  final String packsize;
  final String weightInGms;
  final String unitOfMeasure;
  final String formattedPacksize;
  final String maxAllowedQuantity;
  final String unlisted;
  final String quantity;
  final String productTheme;
  final String cuisineType;
  final String discountedSellingPrice;
  final String discountPercent;
  final String discountAmount;
  final String zeptoPassPrice;
  final String zeptoPassPriceDiscountPercent;
  final String zeptoPassPriceDiscountPercentDifference;
  final String availableQuantity;
  final String allocatedQuantity;
  final String outOfStock;
  final String isNewProduct;
  final String primarySubcategoryName;
  final String primaryCategoryName;
  final String priority;
  final String imageUrl1;
  final String imageUrl2;
  final String imageUrl3;
  final String imageUrl4;
  final String imageUrl5;
  final String imageUrl6;
  final String imageUrl7;
  final String imageUrl8;
  final String imageUrl9;
  final String imageUrl10;

  Product({
    required this.recommendationId,
    required this.objectId,
    required this.storeProductId,
    required this.storeId,
    required this.productId,
    required this.productName,
    required this.brand,
    required this.primarySubcategoryId,
    required this.imported,
    required this.discountApplicable,
    required this.minimumRequiredAge,
    required this.description,
    required this.productVariantId,
    required this.mrp,
    required this.packsize,
    required this.weightInGms,
    required this.unitOfMeasure,
    required this.formattedPacksize,
    required this.maxAllowedQuantity,
    required this.unlisted,
    required this.quantity,
    required this.productTheme,
    required this.cuisineType,
    required this.discountedSellingPrice,
    required this.discountPercent,
    required this.discountAmount,
    required this.zeptoPassPrice,
    required this.zeptoPassPriceDiscountPercent,
    required this.zeptoPassPriceDiscountPercentDifference,
    required this.availableQuantity,
    required this.allocatedQuantity,
    required this.outOfStock,
    required this.isNewProduct,
    required this.primarySubcategoryName,
    required this.primaryCategoryName,
    required this.priority,
    required this.imageUrl1,
    required this.imageUrl2,
    required this.imageUrl3,
    required this.imageUrl4,
    required this.imageUrl5,
    required this.imageUrl6,
    required this.imageUrl7,
    required this.imageUrl8,
    required this.imageUrl9,
    required this.imageUrl10,
  });

  factory Product.fromSheet(List<dynamic> row) {
    return Product(
      recommendationId: row.isNotEmpty ? row[0].toString() : '',
      objectId: row.length > 1 ? row[1].toString() : '',
      storeProductId: row.length > 2 ? row[2].toString() : '',
      storeId: row.length > 3 ? row[3].toString() : '',
      productId: row.length > 4 ? row[4].toString() : '',
      productName: row.length > 5 ? row[5].toString() : '',
      brand: row.length > 6 ? row[6].toString() : '',
      primarySubcategoryId: row.length > 7 ? row[7].toString() : '',
      imported: row.length > 8 ? row[8].toString() : '',
      discountApplicable: row.length > 9 ? row[9].toString() : '',
      minimumRequiredAge: row.length > 10 ? row[10].toString() : '',
      description: row.length > 11 ? row[11].toString() : '',
      productVariantId: row.length > 12 ? row[12].toString() : '',
      mrp: row.length > 13 ? row[13].toString() : '',
      packsize: row.length > 14 ? row[14].toString() : '',
      weightInGms: row.length > 15 ? row[15].toString() : '',
      unitOfMeasure: row.length > 16 ? row[16].toString() : '',
      formattedPacksize: row.length > 17 ? row[17].toString() : '',
      maxAllowedQuantity: row.length > 18 ? row[18].toString() : '',
      unlisted: row.length > 19 ? row[19].toString() : '',
      quantity: row.length > 20 ? row[20].toString() : '',
      productTheme: row.length > 21 ? row[21].toString() : '',
      cuisineType: row.length > 22 ? row[22].toString() : '',
      discountedSellingPrice: row.length > 23 ? row[23].toString() : '',
      discountPercent: row.length > 24 ? row[24].toString() : '',
      discountAmount: row.length > 25 ? row[25].toString() : '',
      zeptoPassPrice: row.length > 26 ? row[26].toString() : '',
      zeptoPassPriceDiscountPercent: row.length > 27 ? row[27].toString() : '',
      zeptoPassPriceDiscountPercentDifference: row.length > 28 ? row[28].toString() : '',
      availableQuantity: row.length > 29 ? row[29].toString() : '',
      allocatedQuantity: row.length > 30 ? row[30].toString() : '',
      outOfStock: row.length > 31 ? row[31].toString() : '',
      isNewProduct: row.length > 32 ? row[32].toString() : '',
      primarySubcategoryName: row.length > 33 ? row[33].toString() : '',
      primaryCategoryName: row.length > 34 ? row[34].toString() : '',
      priority: row.length > 35 ? row[35].toString() : '',
      imageUrl1: row.length > 36 ? row[36].toString() : '',
      imageUrl2: row.length > 37 ? row[37].toString() : '',
      imageUrl3: row.length > 38 ? row[38].toString() : '',
      imageUrl4: row.length > 39 ? row[39].toString() : '',
      imageUrl5: row.length > 40 ? row[40].toString() : '',
      imageUrl6: row.length > 41 ? row[41].toString() : '',
      imageUrl7: row.length > 42 ? row[42].toString() : '',
      imageUrl8: row.length > 43 ? row[43].toString() : '',
      imageUrl9: row.length > 44 ? row[44].toString() : '',
      imageUrl10: row.length > 45 ? row[45].toString() : '',
    );
  }
}
