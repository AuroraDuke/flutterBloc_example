import 'dart:async';

import 'package:flutter_application_bloc/data/product_service.dart';
import 'package:flutter_application_bloc/models/product.dart';

class ProductBloc {

  final productStreamController= StreamController.broadcast();

  Stream get getStream=> productStreamController.stream;

  List<Product> getAll(){
    return ProductService.getAll();
  }
}

final productBloc = ProductBloc();