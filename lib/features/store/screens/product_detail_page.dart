import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'product.dart';

import 'add_name_screen.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    List<String> imageUrls = [
      product.imageUrl1,
      product.imageUrl2,
      product.imageUrl3,
      product.imageUrl4,
      product.imageUrl5,
      product.imageUrl6,
      product.imageUrl7,
      product.imageUrl8,
      product.imageUrl9,
      product.imageUrl10,
    ].where((url) => url.isNotEmpty).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.productName,
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(  // Allows scrolling for long content
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (imageUrls.isNotEmpty)
                Container(
                  height: 300,
                  child: PageView.builder(
                    itemCount: imageUrls.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          imageUrls[index],
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
              SizedBox(height: 24),
              Text(
                product.productName,
                style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              _buildProductDetailRow('Description', product.description),
              _buildProductDetailRow('Price', product.mrp),
              _buildProductDetailRow('Discount', product.discountAmount),
              _buildProductDetailRow('Brand', product.brand),

              _buildProductDetailRow('Discount', product.discountedSellingPrice),
              _buildProductDetailRow('Category', product.primaryCategoryName),
              _buildProductDetailRow('Sub Category', product.primarySubcategoryName),
              _buildProductDetailRow('Total Stock', product.availableQuantity),
              _buildProductDetailRow('Unit', '${product.unitOfMeasure} '),
              _buildProductDetailRow('Maximum Order Quantity', product.maxAllowedQuantity),
              // _buildProductDetailRow('Packsize', product.packsize),
              // _buildProductDetailRow('Weight', '${product.weightInGms} ${product.unitOfMeasure}'),
              // _buildProductDetailRow('unit', '${product.unitOfMeasure} '),
              // _buildProductDetailRow('format_pack_size', '${product.formattedPacksize} '),
              // _buildProductDetailRow('Available Quantity', product.availableQuantity),
              // _buildProductDetailRow('Max Quantity', product.maxAllowedQuantity),
              // _buildProductDetailRow('Min Age required', product.minimumRequiredAge),
              // _buildProductDetailRow('Imported', product.imported),
              // //_buildProductDetailRow('Product Theme', product.productTheme),
              // //_buildProductDetailRow('Cuisine Type', product.cuisineType),
              // _buildProductDetailRow('Discount Percent', '${product.discountPercent}%'),
              // //_buildProductDetailRow('Zepto Pass Price', product.zeptoPassPrice),
              // //_buildProductDetailRow('Zepto Pass Price Discount Percent', '${product.zeptoPassPriceDiscountPercent}%'),
              // //_buildProductDetailRow('Zepto Pass Price Discount Percent Difference', product.zeptoPassPriceDiscountPercentDifference),
              //
              //
              // _buildProductDetailRow('Priority', product.priority),
              SizedBox(height: 16),

              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> prefillData = _getPrefillData();
                  print("Prefill Data: $prefillData"); // Print the data
                  Get.to(() => AddNameScreen(item: null, prefillData: prefillData));
                },
                child: Text('Add Item to Store'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductDetailRow(String label, dynamic value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Expanded(
            child: Text(
              value.toString(),
              style: GoogleFonts.poppins(fontSize: 16),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }


  // Helper function to prepare data for pre-filling
  Map<String, dynamic> _getPrefillData() {
    return {
      'name': product.productName,
      'description': product.description,
      'price': product.mrp,
      'discount': product.discountAmount,
      'brand': product.brand,
      'category': product.primaryCategoryName,
      'subcategory': product.primarySubcategoryName,
      'totalStock': product.availableQuantity,
      'unit': product.unitOfMeasure,
      'maxOrderQuantity': product.maxAllowedQuantity,
      'imageUrl1': product.imageUrl1,
      'imageUrl2': product.imageUrl2,
      'imageUrl3': product.imageUrl3,
      'imageUrl4': product.imageUrl4,
      'imageUrl5': product.imageUrl5,
      'imageUrl6': product.imageUrl6,
      'imageUrl7': product.imageUrl7,
      'imageUrl8': product.imageUrl8,
      'imageUrl9': product.imageUrl9,
      'imageUrl10': product.imageUrl10,
      // ... add other mappings as needed ...
    };
  }
}
