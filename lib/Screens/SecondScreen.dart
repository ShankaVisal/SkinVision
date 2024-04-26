import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class splashSecond extends StatefulWidget {
  const splashSecond({super.key});

  @override
  State<splashSecond> createState() => _splashSecondState();
}

class _splashSecondState extends State<splashSecond> {
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    // Start the animation after 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isVisible = false;
      });
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
          TweenAnimationBuilder<double>(
            duration: Duration(seconds: 3),
            tween: Tween<double>(begin: 0.0, end: 1.0),
            builder: (BuildContext context, double value, Widget? child) {
              return Opacity(
                opacity: value,
                child:  SizedBox(
                  height: height,
                  width: width,
                  child: Image(
                    image: AssetImage('assets/2s.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),

          AnimatedPositioned(
            duration: Duration(seconds: 2),
            curve: Curves.easeIn,
            top: _isVisible ? 0 : height-height*0.7,
            child: SizedBox(
              height: height,
              width: width*0.55,
              child: Image(image: AssetImage('assets/logoWhite.png')),
            ),
          ),

          AnimatedOpacity(
            duration: Duration(seconds: 2),
            opacity: _isVisible ? 0 : 1,
            child: Padding(
              padding: EdgeInsets.only(top: height*0.8),
              child: SizedBox(
                height: 50,
                width: 300,
                child: FloatingActionButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {},
                  backgroundColor: Colors.white,
                  child: Text("Get Started"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
