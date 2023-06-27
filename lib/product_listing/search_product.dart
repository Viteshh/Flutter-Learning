import 'package:first_app/product_listing/product_model.dart';
import 'package:flutter/material.dart';

class SearchProduct extends StatefulWidget {
  final String search;
  const SearchProduct({super.key, required this.search});

  @override
  State<SearchProduct> createState() => _SearchProductState(this.search);
}

class _SearchProductState extends State<SearchProduct> {
  final String search;
  late List<Products>? _userModel = [];
  _SearchProductState(this.search);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 4, top: 4),
      child: TextField(
        //   onChanged: (value){
        //  searchData(st = value.trim().toLowerCase());
        //    // Method For Searching
        //              },
        decoration: InputDecoration(
          hintText: "Search Product",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
          ),
        ),
      ),
    );
  }
}
