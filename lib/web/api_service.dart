import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_bloc/models/resp_main.dart';
import 'package:test_bloc/models/products.dart';

class ApiService {
  ApiService._internal(); //private constructor

  static final ApiService _singleton = ApiService._internal();

  factory ApiService() {
    return _singleton;
  }

  Future<List<Products>?> fetchData() async {
    final response = await http.get(
      Uri.parse('https://dummyjson.com/products'),
    );
    final jsonn = jsonDecode(response.body);
    final res = RespMain.fromJson(jsonn);
    final list = res.products;
    return list;
  }
}
