import 'package:flutter/material.dart';
import 'package:ta_dncc/reuse_widget/reuse_title.dart';
import 'package:ta_dncc/ui/colors.dart';
import 'package:with_space_between/with_space_between.dart';

import '../reuse_widget/textfield.dart';
import '../ui/typography.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {
        'image': 'assets/product/Air Max 98.png',
        'name': 'Air Max 98',
        'price': '20.09',
        'rating': '4.5',
        'location': 'East Cost',
      },
      {
        'image': 'assets/product/Air Presto.png',
        'name': 'Air Presto',
        'price': '18.99',
        'rating': '4.3',
        'location': 'North Gate',
      },
      {
        'image': 'assets/product/React Presto.png',
        'name': 'React Presto',
        'price': '25.49',
        'rating': '4.6',
        'location': 'Ecma',
      },
      {
        'image': 'assets/product/KD13 EP.png',
        'name': 'KD13 EP',
        'price': '22.59',
        'rating': '4.3',
        'location': 'South North 43',
      },
      {
        'image': 'assets/product/Air Max 97.png',
        'name': 'Air Max 97',
        'price': '23.79',
        'rating': '4.3',
        'location': 'Ecma 1213',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: myTextFieldSearch(
                    labelText: "Search",
                    isObscured: true,
                    controller: TextEditingController(),
                    onSubmitted: (value) {},
                  ),
                ),
                ReuseTitle(title: '10 product found'),
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: reuseCardProduct(
                        product['image']!,
                        product['name']!,
                        product['price']!,
                        product['rating']!,
                        product['location']!,
                      ),
                    );
                  },
                ),
              ].withSpaceBetween(height: 15),
            ),
          ),
        ),
      ),
    );
  }
}

Widget reuseCardProduct(
  String image,
  String productName,
  String price,
  String rating,
  String location,
) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
    decoration: BoxDecoration(
      border: Border.all(color: borderGrey, width: 1.0),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: 140, width: 140),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(productName, style: sSemiBold.copyWith(color: dark)),
              Text('\$$price', style: smSemiBold.copyWith(color: dark)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.star, size: 20, color: textBrown),
                  Expanded(
                    child: Text(
                      " $rating | $location",
                      style: xsSemiBold.copyWith(color: dark),
                    ),
                  ),
                ],
              ),
            ].withSpaceBetween(height: 10),
          ),
        ),
      ].withSpaceBetween(width: 10),
    ),
  );
}
