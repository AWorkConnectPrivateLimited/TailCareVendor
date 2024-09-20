import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'api_service.dart';
import 'product.dart';
import 'product_detail_page.dart';

class ProductSearchPage extends StatefulWidget {
  @override
  _ProductSearchPageState createState() => _ProductSearchPageState();
}

class _ProductSearchPageState extends State<ProductSearchPage> {
  late Future<List<Product>> _futureProducts;
  String _searchQuery = '';
  List<Product> _allProducts = []; // Store al

  @override
  void initState() {
    super.initState();
    _futureProducts = ApiService().fetchSheetData().then((products) {
      setState(() { // Trigger a rebuild after fetching data
        _allProducts = products;
      });
      return _allProducts; // Return the fetched products
    });
  }

  void _onSearchChanged(String query) {
    setState(() {
      // Normalize the query - Remove all spaces
      _searchQuery= query.toLowerCase()
          .replaceAll("'", "")
          .replaceAll("-", "")
          .replaceAll(RegExp("\\s+"), "") // Remove all spaces
          .trim();

      if (_searchQuery.isNotEmpty) {
        List<Product> filteredProducts = _allProducts.where((product) {
          // Normalize product name and brand - Remove all spaces
          String processedName = product.productName.toLowerCase()
              .replaceAll("'", "")
              .replaceAll("-", "")
              .replaceAll(RegExp("\\s+"), "") // Remove all spaces
              .trim();
          String processedBrand = product.brand.toLowerCase()
              .replaceAll("'", "")
              .replaceAll("-", "")
              .replaceAll(RegExp("\\s+"), "") // Remove all spaces
              .trim();

          return processedName.contains(_searchQuery) ||
              processedBrand.contains(_searchQuery);}).toList();

        // Sort the filtered products by MRP (low to high)
        filteredProducts.sort((a, b) => double.parse(a.mrp).compareTo(double.parse(b.mrp)));

        _futureProducts = Future.value(filteredProducts);
      } else {
        // Sort all products by MRP when the query is empty - NUMERICALLY
        _allProducts.sort((a, b) => double.parse(a.mrp).compareTo(double.parse(b.mrp)));
        _futureProducts = Future.value(_allProducts);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: _onSearchChanged,
          decoration: InputDecoration(
            hintText: 'Search products...',
            border: InputBorder.none,
            hintStyle: GoogleFonts.poppins(color: Colors.black),
          ),
          style: GoogleFonts.poppins(color: Colors.black, fontSize: 18.0),
          cursorColor: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Product>>(
        future: _futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}', style: GoogleFonts.poppins()));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No products found.', style: GoogleFonts.poppins()));
          } else {
            final products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        product.imageUrl1.isNotEmpty ? product.imageUrl1 : 'https://via.placeholder.com/50',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      product.productName,
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Brand: ${product.brand}',
                              style: GoogleFonts.poppins(color: Colors.grey[600]),
                            ),


                          ],
                        ),

                        // Row(
                        //   children: [
                        //     Text(
                        //       ' weight ${product.weightInGms} g',
                        //       style: GoogleFonts.poppins(color: Colors.grey[600]),
                        //     ),
                        //
                        //   ],
                        // ),

                        Row(
                          children: [
                            Text(
                              '(${product.formattedPacksize})',
                              style: GoogleFonts.poppins(color: Colors.grey[600]),
                            ),
                          ],
                        ),


                        Row(
                          children: [
                            Text(
                              ' ₹ ${product.mrp}',
                              style: GoogleFonts.poppins(color: Colors.grey[600]),
                            ),
                          ],
                        ),



                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailPage(product: product),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
