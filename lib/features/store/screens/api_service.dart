import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sixam_mart_store/features/store/screens/product.dart';
class ApiService {
  final String _googleSheetId = 'AIzaSyDeJgugMSfeLHwJAeqV9KszZTgSLawlq24'; // Replace with your actual sheet ID
  final String _sheetRange = 'Sheet1'; // Use the sheet name to fetch all data
  final String _apiKey = '1sCVHoyUER4SlNmcp1DRupaGIKaOkiQPYqUsty7E'; // Replace with your API key

  Future<List<Product>> fetchSheetData() async {
    const url = 'https://sheets.googleapis.com/v4/spreadsheets/1jyGPc66Oji0Oc0FqpkhKYuZ6gZ3petT3YGQZMnBGwSA/values/Sheet1?key=AIzaSyDKey6oJQUIJiVnbJqFhT1sZJGgMpSI9Rk';
    //const url = 'https://sheets.googleapis.com/v4/spreadsheets/1bL8SdBAPAQDvBSupAZm-GbejndI8WcndMYN_aBAZb88/values/Sheet1?key=AIzaSyDKey6oJQUIJiVnbJqFhT1sZJGgMpSI9Rk';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // Check if 'values' key exists in response
      if (data.containsKey('values')) {
        List<List<dynamic>> rows = List<List<dynamic>>.from(data['values']);
        return rows.skip(1).map((row) => Product.fromSheet(row)).toList();
        // Skip the header row and map each row to a Product object
      } else {
        throw Exception('No data found in the sheet');
      }
    } else {
      throw Exception('Failed to load sheet data: ${response.reasonPhrase}');
    }
  }
}

