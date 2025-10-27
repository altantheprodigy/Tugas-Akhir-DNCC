import 'package:flutter/material.dart';
import 'package:ta_dncc/ui/colors.dart';
import 'package:with_space_between/with_space_between.dart';
import '../ui/typography.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {
        'image': 'assets/product/Air Max 98.png',
        'name': 'Air Max 98',
        'price': '20.09',
      },
      {
        'image': 'assets/product/Air Presto.png',
        'name': 'Air Presto',
        'price': '18.99',
      },
      {
        'image': 'assets/product/React Presto.png',
        'name': 'React Presto',
        'price': '25.49',
      },
      {
        'image': 'assets/product/KD13 EP.png',
        'name': 'KD13 EP',
        'price': '22.59',
      },
      {
        'image': 'assets/product/Air Max 97.png',
        'name': 'Air Max 97',
        'price': '23.79',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔸 Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: grey),
                      ),
                      child: const Icon(Icons.format_align_left_rounded, size: 20),
                    ),
                    Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: grey),
                      ),
                      child: const Icon(Icons.shopping_bag_outlined, size: 20),
                    ),
                  ],
                ),

                // 🔸 Banner
                Container(
                  padding: const EdgeInsets.only(left: 25),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: cardProduct,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("20% Discount ",
                                style: smSemiBold.copyWith(color: textDark)),
                            Text("on your first purchase ",
                                style: sRegular.copyWith(color: textDark)),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: dark,
                              ),
                              child: Text("Shop now",
                                  style: xsSemiBold.copyWith(color: textWhite)),
                            ),
                          ].withSpaceBetween(height: 5),
                        ),
                      ),
                      Image.asset(
                        'assets/product/Air Presto.png',
                        height: 171,
                        width: 150,
                      ),
                    ],
                  ),
                ),

                // 🔸 Kategori horizontal
                CategoryFilter(),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   physics: const BouncingScrollPhysics(),
                //   child: Row(
                //     children: [
                //       reuseInfo("All", true),
                //       reuseInfo("Running", false),
                //       reuseInfo("Sneakers", false),
                //       reuseInfo("Formal", false),
                //       reuseInfo("Casual", false),
                //     ].withSpaceBetween(width: 10),
                //   ),
                // ),

                // 🔸 Grid Produk (scroll ikut parent)
                GridView.builder(
                  itemCount: products.length,
                  shrinkWrap: true, // penting agar tidak ambil seluruh tinggi
                  physics: const NeverScrollableScrollPhysics(), // nonaktifkan scroll di grid
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.60,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return reuseCardProduct(
                      product['image']!,
                      product['name']!,
                      product['price']!,
                    );
                  },
                ),
              ].withSpaceBetween(height: 20),
            ),
          ),
        ),
      ),
    );
  }
}

Widget reuseInfo(String judul, bool isActive) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: isActive ? dark : Colors.white,
    ),
    child: Text(
      judul,
      style: sSemiBold.copyWith(color: isActive ? textWhite : textGray),
    ),
  );
}

Widget reuseCardProduct(String image, String nameProduct, String price) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(18),
      color: cardProduct,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Image.asset(image, height: 125, width: 130)),
        SizedBox(height: 20,),
        Text(nameProduct, style: smBold.copyWith(color: dark)),
        const SizedBox(height: 6),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('\$$price', style: smSemiBold.copyWith(color: dark)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: borderIconDark),
                color: textWhite,
              ),
              child: const Icon(Icons.arrow_forward_outlined, size: 20),
            ),
          ],
        ),
      ],
    ),
  );
}

class CategoryFilter extends StatefulWidget {
  const CategoryFilter({super.key});

  @override
  State<CategoryFilter> createState() => _CategoryFilterState();
}

class _CategoryFilterState extends State<CategoryFilter> {
  int selectedIndex = 0; // simpan index aktif

  final List<String> categories = [
    "All",
    "Running",
    "Sneakers",
    "Formal",
    "Casual",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: List.generate(categories.length, (index) {
          bool isActive = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index; // ubah index aktif
              });
            },
            child: reuseInfo(categories[index], isActive),
          );
        }).withSpaceBetween(width: 10),
      ),
    );
  }
}
