import 'package:flutter/material.dart';
import 'package:informasi_akademik_firebase/services/firestore_service.dart';
import 'package:uuid/uuid.dart';
import 'package:informasi_akademik_firebase/models/product.dart';

class ProductProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  String _productId;
  String _name;
  double _price;
  var uuid = Uuid();

  //Getters
  String get name => _name;
  double get price => _price;

  //Setters
  changeName(String value) {
    _name = value;
    notifyListeners();
  }

  changePrice(String value) {
    _price = double.parse(value);
    notifyListeners();
  }

//read
  loadValues(Product product) {
    _name = product.name;
    _price = product.price;
    _productId = product.productId;
  }

//create/update
  saveProduct() {
    print(_productId);
    if (_productId == null) {
      var newProduct = Product(name: name, price: price, productId: uuid.v4());
      firestoreService.saveProduct(newProduct);
    } else {
      //Update
      var updatedProduct =
          Product(name: name, price: _price, productId: _productId);
      firestoreService.saveProduct(updatedProduct);
    }
  }

//delete
  removeProduct(String productId) {
    firestoreService.removeProduct(productId);
  }
}
