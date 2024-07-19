import 'package:flutter_application_bloc/models/product.dart';

class ProductService{
  static List<Product> products = List<Product>.empty(growable: true);


  static ProductService _singleton = ProductService._internal();

  factory ProductService(){

    return _singleton;
  }
  ProductService._internal();


  static List<Product> getAll(){
    products.add(new Product(1, "macbook", 34000));
    products.add(new Product(2, "macbook m1", 40000));
    products.add(new Product(3, "macbook m2", 44000));
    products.add(new Product(4, "macbook m3", 50000));
    return products;
  }
}