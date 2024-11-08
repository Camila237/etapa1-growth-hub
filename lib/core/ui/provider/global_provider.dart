import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:etapa1/core/exports.dart';

class ProductsProvider extends ChangeNotifier {
  bool isLoading = false;
  String error = '';
  List<ProductModel> products = [];

  ProductsProvider() {}

  Future<List<ProductModel>> loadProducts() async {
    try {
      final String response = await rootBundle.loadString('assets/db.json');
      final List<dynamic> jsonData = json.decode(response);
      products = jsonData.map((item) => ProductModel.fromJson(item)).toList();
      return products;
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
    return [];
  }

  Future<List<ProductModel>> updateProduct(ProductModel product) async {
    isLoading = true;
    notifyListeners();
    try {
      products = await loadProducts();
      final int index = products.indexWhere((item) => item.id == product.id);
      if (index != -1) {
        products[index] = product;
      }
      isLoading = false;
      notifyListeners();
      return products;
    } catch (e) {
      isLoading = false;
      error = e.toString();
      notifyListeners();
    }
    return [];
  }

  Future<List<ProductModel>> deleteProduct(int productId) async {
    isLoading = true;
    notifyListeners();
    try {
      products = await loadProducts();
      products.removeWhere((item) => item.id == productId);
      isLoading = false;
      notifyListeners();
      return products;
    } catch (e) {
      isLoading = false;
      error = e.toString();
      notifyListeners();
    }
    return [];
  }
  Future<List<ProductModel>> createProduct(ProductModel product) async {
    isLoading = true;
    notifyListeners();
    try {
      products = await loadProducts();
      final int newId = products.isNotEmpty ? products.last.id + 1 : 1;
      final newProduct = product.copyWith(id: newId);
      products.add(newProduct);
      isLoading = false;
      notifyListeners();
      return products;
    } catch (e) {
      isLoading = false;
      error = e.toString();
      notifyListeners();
    }
    return [];
  }
}