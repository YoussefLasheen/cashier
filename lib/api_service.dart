import 'dart:convert';

import 'package:cashier/app/home/models/receipt.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'mcprod.spinneys-egypt.com';

class ApiService {
  Future<Product> getProductBySku(String sku) async {
    var url = Uri.https(baseUrl, '/graphql', {
      'query':
          'query{skuSearch(search:"$sku"){price{regularPrice{amount{value}}}sku name image{url}brand{image_url name}}}'
    });
    var response = await http.get(url);
    if (response.statusCode == 200 &&
        json.decode(response.body)['data']['skuSearch'] != null) {
      Product model =
          Product.fromMap(json.decode(response.body)['data']['skuSearch']);
      return model;
    } else {
      throw Exception('Failed to find product');
    }
  }
}
