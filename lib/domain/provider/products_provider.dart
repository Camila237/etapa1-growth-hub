import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:etapa1/data/entities/product_model.dart';

/// * ProductsProvider: class that provides the products data.
/// * [isLoading] - a boolean that indicates if the data is loading.
/// * [error] - a string that contains the error message.
/// * [products] - a list of products.
class ProductsProvider extends ChangeNotifier {
  bool isLoading = false;
  String error = '';
  List<ProductModel>? products;


  /// * Loads products from a local JSON file.
  /// * Sets `isLoading` to true while loading and false when done.
  /// * If an error occurs, sets the `error` message.
  void loadProducts() async {
    try {
      isLoading = true;
      await Future.delayed(const Duration(seconds: 2));
      final String response = await rootBundle.loadString('assets/db.json');
      final List<dynamic> jsonData = json.decode(response);
      products = jsonData.map((item) => ProductModel.fromJson(item)).toList();
      isLoading = false;
      notifyListeners();
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }

  /// * Updates an existing product in the list.
  /// * Sets `isLoading` to true while updating and false when done.
  /// * If an error occurs, sets the `error` message.
  /// * Returns the updated list of products.
  List<ProductModel> updateProduct(ProductModel product) {
    isLoading = true;
    notifyListeners();
    try {
      final int index = products?.indexWhere((item) => item.id == product.id) ?? -1;
      if (index != -1) {
        products?[index] = product;
      }
      isLoading = false;
      notifyListeners();
      return products ?? [];
    } catch (e) {
      isLoading = false;
      error = e.toString();
      notifyListeners();
    }
    return [];
  }

  /// * Deletes a product from the list by its ID.
  /// * Sets `isLoading` to true while deleting and false when done.
  /// * If an error occurs, sets the `error` message.
  void deleteProduct(int productId) {
    isLoading = true;
    notifyListeners();
    try {
      products?.removeWhere((item) => item.id == productId);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      error = e.toString();
      notifyListeners();
    }
    //return [];
  }


  /// * Creates a new product and adds it to the list.
  /// * Sets `isLoading` to true while creating and false when done.
  /// * If an error occurs, sets the `error` message.
  /// * Returns the updated list of products.
  List<ProductModel> createProduct(ProductModel product)  {
    isLoading = true;
    notifyListeners();
    try {
      if(products != null) {
        final int newId = products!.isNotEmpty ? products!.length + 1 : 1;
        final newProduct = product.copyWith(id: newId);
        products!.insert(0, newProduct);
        isLoading = false;
        return products ?? [];
      }else{
        return [];
      }
    } catch (e) {
      isLoading = false;
      error = e.toString();
      notifyListeners();
    }
    return [];
  }
}