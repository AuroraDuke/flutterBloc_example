import 'package:flutter/material.dart';
import 'package:flutter_application_bloc/blocs/cart_bloc.dart';
import 'package:flutter_application_bloc/blocs/product_bloc.dart';
import 'package:flutter_application_bloc/models/cart.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shooping"),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, "/cart"),
          )
        ],
      ),
      body: buildProductList(),
    );
  }

  buildProductList() {
    return StreamBuilder(
        initialData: productBloc.getAll(),
        stream: productBloc.getStream,
        builder: (context, snapshot) {
          return snapshot.data.length > 0
              ? buildProductListItems(snapshot)
              : Center(
                  child: Text("Data No founded"),
                );
        });
  }

  buildProductListItems(AsyncSnapshot snapshot) {
    return ListView.builder(itemBuilder: (BuildContext context,index){
      final list = snapshot.data;
      return ListTile(
        title: Text(list[index].name),
        subtitle: Text(list[index].price.toString()),
        trailing: IconButton(icon: Icon(Icons.add_shopping_cart), 
                   onPressed: () { cartBloc.addToCart(Cart(list[index],1)) ; },),
      );
    },
    itemCount: snapshot.data.length,);
  }
}
