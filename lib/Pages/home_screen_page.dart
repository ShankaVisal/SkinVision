import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled5/Pages/dermatologistsPage.dart';
import 'package:untitled5/Pages/goPremiumPage.dart';
import 'package:untitled5/Pages/productCatalogPage.dart';

import 'skin_scan_page.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  late double width;
  late double height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Scaffold(
          body: Container(
            width: width,
            height: height,
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    "assets/logo2.png",
                    width: 150,
                  ),
                  Container(
                    width: width * 0.9,
                    height: height * 0.25,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage("assets/homePageImage.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            homePageActionTiles(
                                context,
                                "Skin Scan",
                                "assets/IconImages/scan_Icon.png",
                                Colors.black,
                                Colors.white),
                            homePageActionTiles(
                                context,
                                "Dermatologists",
                                "assets/IconImages/Dermetalogist_Icon.png",
                                Colors.black,
                                Colors.white),
                          ],
                        ),
                        SizedBox(height: height * 0.015),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            homePageActionTiles(
                                context,
                                "Product Catalog",
                                "assets/IconImages/Product_Catalog_Icon.png",
                                Colors.black,
                                Colors.white),
                            homePageActionTiles(
                                context,
                                "Go Premium!",
                                "assets/IconImages/Go_Premium_Icon.png",
                                const Color.fromARGB(255, 239, 168, 133),
                                const Color.fromARGB(255, 239, 168, 133)),
                          ],
                        ),
                      ],
                    ),
                  )
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
      ],
    );
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

  homePageActionTiles(
    BuildContext context,
    String actionTitle,
    String imagePath,
    Color color,
    Color borderColour,
  ) {
    return GestureDetector(
      onTap: () {
        // Navigate to the appropriate page based on the action title
        if (actionTitle == "Skin Scan") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SkinScanPage()),
          );
        } else if (actionTitle == "Dermatologists") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DermatologistsPage()),
          );
        } else if (actionTitle == "Product Catalog") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProductCatalogPage()),
          );
        } else if (actionTitle == "Go Premium!") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const GoPremiumPage()),
          );
        }
      },
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.42,
          height: MediaQuery.of(context).size.width * 0.42,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: borderColour, width: 1),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 30, bottom: 30, left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  imagePath,
                  width: 50,
                  height: 50,
                  color: color,
                ),
                Text(
                  actionTitle,
                  style: const TextStyle(fontSize: 15),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
