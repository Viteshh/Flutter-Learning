import 'package:first_app/product_listing/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final cartProvider = Provider.of<FavouriteProvider>(context);
    // final products = cartProvider.favProducts;
    final favouriteProvider = Provider.of<FavouriteProvider>(context);
    final products = favouriteProvider.favProducts;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  leading: Image.network(
                    product.thumbnail.toString(),
                    fit: BoxFit.cover,
                  ),
                  title: Text(product.title.toString()),
                  subtitle: Text("₹${product.price}"),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: () {
                      favouriteProvider.removeItems(product);
                    },
                  ),
                );
              },
            ),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     // navigate back to the previous screen
          //     Navigator.of(context).pop();
          //   },
          //   child: Text('Continue Shopping'),
          // ),
          // SizedBox(
          //   height: 40,
          // )
        ],
      ),
    );
  }
}
