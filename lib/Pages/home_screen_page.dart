import 'package:flutter/material.dart';

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
                    "assets/Logowithout_theme.png",
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
                                "Skin Scan",
                                "assets/IconImages/scan_Icon.png",
                                Colors.black,
                                Colors.white),
                            homePageActionTiles(
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
                                "Product Catalog",
                                "assets/IconImages/Product_Catalog_Icon.png",
                                Colors.black,
                                Colors.white),
                            homePageActionTiles(
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
      String actionTitle, String imagePath, Color color, Color borderColour) {
    return Center(
      child: Container(
        width: width * 0.42,
        height: width * 0.42,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: borderColour, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
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
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
