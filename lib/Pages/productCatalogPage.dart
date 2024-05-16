import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductCatalogPage extends StatefulWidget {
  const ProductCatalogPage({super.key});

  @override
  State<ProductCatalogPage> createState() => _ProductCatalogPageState();
}

class _ProductCatalogPageState extends State<ProductCatalogPage> {
  final TextEditingController name = TextEditingController();
  List<dynamic> products = [];

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    String productsJson = await rootBundle.loadString('assets/products.json');
    setState(() {
      products = json.decode(productsJson);
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
        children:[
          Scaffold(
            appBar: AppBar(
              title: const Text(
                'Product Catalog',
                style: TextStyle(fontSize: 24),
              ),
            ),
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 254, 238, 232),
                    Color.fromARGB(255, 240, 228, 252)
                  ],
                ),
              ),
              child: SafeArea(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          width: width * 0.9,
                          child: TextField(
                            controller: name,
                            decoration: InputDecoration(
                              hintText: 'Find Your Doctor',
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              suffixIcon: Icon(Icons.search, color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              // filled: true,
                              // fillColor: Colors.grey[200],
                            ),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: height / 100,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              Map<String, dynamic> product = products[index];

                              return Card(
                                // color: Color(0xffFEF9FB),
                                color: Colors.white,
                                margin: EdgeInsets.only(
                                    left: 20, right: 20, top: 10, bottom: 10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: SizedBox(
                                          width: width / 4,
                                          height: height / 6,
                                          child: Image.asset(
                                            product['image'],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width / 50,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  product['name'],
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(' - '),
                                                Text(
                                                  product['price'],
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff027A76)
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: height / 100,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                    'Brand Name',
                                                  style: const TextStyle(fontSize: 12),
                                                ),
                                                Text(' - '),
                                                Text(
                                                  product['brand'],
                                                  style: const TextStyle(fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: height / 100,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                OutlinedButton(
                                                    onPressed: (){},
                                                    child: Text(
                                                        'View Product',
                                                      style: TextStyle(
                                                        color: Colors.black
                                                      ),
                                                    )
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {},
                                                  child: SizedBox(
                                                    width: 20,
                                                    height: 20,
                                                    child: const Image(
                                                        image: AssetImage(
                                                            'assets/cart.png',
                                                        )
                                                    ),
                                                  ),
                                                  style: ElevatedButton.styleFrom(
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(25),
                                                    ),
                                                    backgroundColor: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: width / 50,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            bottomNavigationBar: SizedBox(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      _buildIconButton("assets/IconImages/HomeIcon.png"),
                      _buildIconButton("assets/IconImages/userIcon.png"),
                    ],
                  ),
                  Row(
                    children: [
                      _buildIconButton("assets/IconImages/infoIcon.png"),
                      _buildIconButton("assets/IconImages/notificationIcon.png"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 35,
            left: MediaQuery.of(context).size.width / 2 - 35,
            child: SizedBox(
              width: 70,
              height: 70,
              child: FloatingActionButton(
                backgroundColor: const Color.fromARGB(255, 37, 37, 37),
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image.asset(
                  "assets/IconImages/scan_Icon.png",
                  width: 30,
                  height: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ]

    );
  }
}

Widget _buildIconButton(String assetPath) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18.0),
    child: IconButton(
      icon: Image.asset(
        assetPath,
        width: 30,
        height: 30,
      ),
      onPressed: () {},
    ),
  );
}