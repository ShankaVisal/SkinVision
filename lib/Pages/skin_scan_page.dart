import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SkinScanPage extends StatefulWidget {
  const SkinScanPage({Key? key}) : super(key: key);

  @override
  State<SkinScanPage> createState() => _SkinScanPageState();
}

class _SkinScanPageState extends State<SkinScanPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: CupertinoSlidingSegmentedControl<int>(
                children: const {
                  0: Text(
                    'Normal',
                    style: TextStyle(fontSize: 14),
                  ),
                  1: Text(
                    'Disease',
                    style: TextStyle(fontSize: 14),
                  ),
                },
                onValueChanged: (int? index) {
                  if (index != null) {
                    setState(() {
                      _currentIndex = index;
                    });
                  }
                },
                groupValue: _currentIndex,
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
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Image.asset(
                "assets/IconImages/scan_Icon.png",
                width: 30,
                height: 30,
                color: Colors.black,
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
}
