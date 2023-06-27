import 'package:first_app/api_constant.dart';
import 'package:first_app/product_listing/api_service.dart';
import 'package:first_app/product_listing/cart_screen.dart';
import 'package:first_app/product_listing/category_view.dart';
import 'package:first_app/product_listing/favourite_provider.dart';
import 'package:first_app/product_listing/product_details.dart';
import 'package:first_app/product_listing/product_model.dart';
import 'package:first_app/product_listing/search_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  final String category;

  ProductList({required this.category});
  @override
  State<ProductList> createState() => _ProductListState(this.category);
}

class _ProductListState extends State<ProductList> {
  final String category;

  late List<Products>? _userModel = [];
  late List<Products>? _filteredList = [];
  late List<Products>? _favProduct = [];

  _ProductListState(this.category);
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    // var search;

    _userModel = (await ApiService().getProduct(categories: category));
    _filteredList = _userModel;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void _getSearchedProduct(String value) async {
    setState(() {
      _filteredList = _userModel!
          .where((element) =>
              element.title!.toLowerCase().contains(value.toLowerCase()) &&
              element.title!.toUpperCase().contains(value.toUpperCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteProvider>(context);
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back)),
          title: Text('Events'),
          actions: [
            IconButton(
              onPressed: () {
                // _favouriteProvider.addItems(product);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) => CartScreen())));
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          ],
        ),
        body: _filteredList == null || _filteredList!.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, bottom: 4, top: 4),
                    child: TextField(
                      onChanged: (value) {
                        _getSearchedProduct(value);
                      },
                      decoration: InputDecoration(
                        hintText: "Search Product",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7.0)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: _filteredList!.length,
                        itemBuilder: (context, index) {
                          final product = _filteredList![index];
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, bottom: 4, top: 4),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) =>
                                        ProductDetails(product))));
                              },
                              child: Card(
                                elevation: 2,
                                child: ListTile(
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: AspectRatio(
                                      aspectRatio: 1.0,
                                      child: Image.network(
                                        _filteredList![index]
                                            .thumbnail
                                            .toString(),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  title: Column(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(_filteredList![index]
                                          .title
                                          .toString()),
                                      Text(
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        _filteredList![index]
                                            .description
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromARGB(
                                                255, 75, 75, 75)),
                                      )
                                    ],
                                  ),
                                  subtitle: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        // mainAxisAlignment:
                                        //     MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "₹${_filteredList![index].price}",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 139, 139, 139))),
                                          Text(
                                              "Discount : ${_filteredList![index].discountPercentage}%",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 139, 139, 139))),
                                        ],
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          product.isFavorite
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: Colors.redAccent,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            product.isFavorite =
                                                !product.isFavorite;
                                            if (product.isFavorite) {
                                              favouriteProvider
                                                  .addItems(product);
                                            } else {
                                              favouriteProvider
                                                  .removeItems(product);
                                            }
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ));
  }
}
