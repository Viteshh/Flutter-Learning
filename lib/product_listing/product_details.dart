import 'package:first_app/product_listing/api_service.dart';
import 'package:first_app/product_listing/components/body.dart';
import 'package:first_app/product_listing/favourite_provider.dart';
import 'package:first_app/product_listing/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final Products product;
  static var routeName = '/product_details';

  const ProductDetails(this.product);

  @override
  // ignore: no_logic_in_create_state
  State<ProductDetails> createState() => _ProductDetailsState(this.product);
}

class _ProductDetailsState extends State<ProductDetails> {
  late final Products product;
  int selectImages = 0;

  _ProductDetailsState(this.product);
  // late Products product;

  @override
  void initState() {
    super.initState();
    _fetchProduct();
  }

  void _fetchProduct() async {
    product = (await ApiService().getProduct()) as Products;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<FavouriteProvider>(context);
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        // ),
        body: Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.arrow_back)),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Text(
                          product.rating.toString(),
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.amber[400],
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
        // title: Text(product.title ?? ''),
        product == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.network(
                      product.images![selectImages].toString(),
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      height: 48,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: product.images!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectImages = index;
                              });
                            },
                            child: Container(
                              width: 48,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black26),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.network(
                                product.images![index].toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 10,
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title.toString(),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          product.description.toString(),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              '\$${product.price}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: ElevatedButton(
                            //     onPressed: () {
                            //       cartProvider.addItems(product);
                            //       ScaffoldMessenger.of(context).showSnackBar(
                            //         SnackBar(
                            //           content: Text('Item added to cart'),
                            //           duration: Duration(seconds: 2),
                            //         ),
                            //       );
                            //     },
                            //     child: Text('Add to Cart'),
                            //   ),
                            // )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ],
    ));
  }
}
