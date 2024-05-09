import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled5/Screens/SecondScreen.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  void initState() {
    super.initState();



    Future.delayed(const Duration(seconds: 4), () {



      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const splashSecond()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: height,
            width: width,


            child: const Image(image: AssetImage('assets/1.png')),



          ),
          Positioned(
            bottom: height * 0.01,
            left: width * 0.3,
            right: width * 0.3,
            child: SizedBox(
              // width: width/2,
              child: Lottie.network(
                  'https://lottie.host/db0a1cfa-ad7e-431b-90a2-993c15f3a4fb/0fPD80BKdk.json'),
            ),
          ),
          SizedBox(
            height: height,
            width: width*0.55,
            child: const Image(image: AssetImage('assets/logo.png')),
          ),
        ],
      ),
    );
  }
}
