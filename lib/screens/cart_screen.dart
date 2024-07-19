import 'package:flutter/material.dart';
import 'package:flutter_application_bloc/blocs/cart_bloc.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: StreamBuilder(
        stream: cartBloc.getStream,
        initialData: cartBloc.getCart(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildCart(snapshot);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget buildCart(AsyncSnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, int index) {
        final cart = snapshot.data;
        return ListTile(
          title: Text(cart[index].product.name),
          subtitle: Text(cart[index].product.price.toString()),
          trailing: IconButton(
            icon: Icon(Icons.remove_shopping_cart),
            onPressed: () {
              cartBloc.removeFromCart(cart[index]);
            },
          ),
        );
      },
    );
  }
}
