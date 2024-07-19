import 'package:flutter/material.dart';
import 'package:flutter_application_bloc/screens/Product_list_screen.dart';
import 'package:flutter_application_bloc/screens/cart_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    routes: {
      "/":(BuildContext context)=>ProductListScreen(),
      "/cart":(BuildContext context) =>CartScreen(),
    },
    initialRoute: "/",
   );
  }
  
}
