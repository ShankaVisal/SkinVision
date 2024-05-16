import 'package:flutter/material.dart';

class GoPremiumPage extends StatefulWidget {
  const GoPremiumPage({super.key});

  @override
  State<GoPremiumPage> createState() => _GoPremiumPageState();
}

class _GoPremiumPageState extends State<GoPremiumPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('Premium Version'),
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
                    Padding(
                      padding: const EdgeInsets.only(left: 30,right: 30),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              SizedBox(width: 30,child: Image.asset('assets/done.png'),),
                              SizedBox(width: 5,),
                              Text('Monthly Summery',style: TextStyle(fontSize: 16),),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(width: 30,child: Image.asset('assets/done.png'),),
                              SizedBox(width: 5,),
                              Text('Advance analysis report',style: TextStyle(fontSize: 16),),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(width: 30,child: Image.asset('assets/done.png'),),
                              SizedBox(width: 5,),
                              Text('Ad free',style: TextStyle(fontSize: 16),),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(width: 30,child: Image.asset('assets/done.png'),),
                              SizedBox(width: 5,),
                              Text('Advanced Product Recommendations',style: TextStyle(fontSize: 16),),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(width: 30,child: Image.asset('assets/done.png'),),
                              SizedBox(width: 5,),
                              Text('Advanced Analysis Report',style: TextStyle(fontSize: 16),),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(width: 30,child: Image.asset('assets/done.png'),),
                              SizedBox(width: 5,),
                              Text('Contact doctor through the application',style: TextStyle(fontSize: 16),),
                            ],
                          ),

                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Divider(
                        height: 1,
                        color: Colors.black,
                        thickness: 1,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "\$ 1.99",
                          style: TextStyle(
                              fontSize: 36,
                              color: Color(0xff027A76),
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 11,
                            ),
                            Text(
                              "/ month",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff027A76),
                                  fontWeight: FontWeight.w500
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: width*0.8,
                      child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        backgroundColor: Colors.black,
                        onPressed: (){},
                        child: Text(
                          'Get Premium',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
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