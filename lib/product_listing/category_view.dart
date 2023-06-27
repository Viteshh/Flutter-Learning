import 'package:first_app/product_listing/api_service.dart';
import 'package:first_app/product_listing/product_details.dart';
import 'package:first_app/product_listing/product_list.dart';
import 'package:first_app/product_listing/product_model.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<dynamic> _category = [];

  @override
  void initState() {
    super.initState();
    _getCategories();
  }

  void _getCategories() async {
    _category = (await ApiService().getCategory());
    print("category $_category");

    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.orange[50],
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
            itemCount: _category.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              print("cat ${_category[index]}");
              // final product = _category[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) =>
                          ProductList(category: _category[index]))));
                },
                child: Card(
                  elevation: 2,
                  child: Center(
                      child: Text(
                    _category[index].toString(),
                    style: TextStyle(fontSize: 12),
                  )),
                ),
              );
            }),
      ),
    );
  }
}

// class Category extends StatefulWidget {
//   const Category({Key? key}) : super(key: key);

//   @override
//   _CategoryState createState() => _CategoryState();
// }

// class _CategoryState extends State<Category> {
//   late List<Products>? _products;
//   late List<String>? _categories;
//   String _selectedCategory = '';

//   @override
//   void initState() {
//     super.initState();
//     _getProducts();
//   }

//   void _getProducts() async {
//     _products = await ApiService().getProduct();
//     _categories = _getCategories(_products!).cast<String>();
//     setState(() {
//       _selectedCategory = _categories![0];
//     });
//   }

//   List<String?> _getCategories(List<Products> products) {
//     return products.map((product) => product.category).toSet().toList();
//   }

//   List<Products> _getFilteredProducts(String category) {
//     return _products!.where((product) => product.category == category).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_categories == null || _products == null) {
//       // Show loading indicator until data is loaded
//       return Center(child: CircularProgressIndicator());
//     }
//     return Column(
//       children: [
//         // Category grid view
//         SizedBox(
//           height: 200.0,
//           child: GridView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: _categories!.length,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 1,
//               mainAxisSpacing: 10.0,
//             ),
//             itemBuilder: (context, index) {
//               final category = _categories![index];
//               return GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _selectedCategory = category;
//                   });
//                 },
//                 child: Container(
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10.0),
//                     color: _selectedCategory == category
//                         ? Colors.blue
//                         : Colors.grey[200],
//                   ),
//                   child: Text(
//                     category,
//                     style: TextStyle(
//                       fontSize: 18.0,
//                       fontWeight: FontWeight.bold,
//                       color: _selectedCategory == category
//                           ? Colors.white
//                           : Colors.black,
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//         // Filtered product list view
//         Expanded(
//           child: GridView.count(
//             crossAxisCount: 2,
//             children: _getFilteredProducts(_selectedCategory)
//                 .map((product) => GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: ((context) => ProductDetails(product))));
//                       },
//                       child: Container(
//                         margin: EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: Colors.grey[200],
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             // Image.network(
//                             //   product.imageUrl,
//                             //   height: 100.0,
//                             // ),
//                             Text(
//                               product.title.toString(),
//                               style: TextStyle(
//                                 fontSize: 16.0,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             // Text(
//                             //   '\$${product.price!.toStringAsFixed(2)}',
//                             //   style: TextStyle(
//                             //     fontSize: 16.0,
//                             //     color: Colors.blue,
//                             //   ),
//                             // ),
//                           ],
//                         ),
//                       ),
//                     ))
//                 .toList(),
//           ),
//         ),
//       ],
//     );
//   }
// }
