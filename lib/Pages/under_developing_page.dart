import 'package:flutter/material.dart';

class underDevelopingPage extends StatelessWidget {
  const underDevelopingPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: width/2,
                child: Image.asset("assets/develop.jpg")
            ),
            SizedBox(height: 10),
            Text("We are under developing now.."),
          ],
        ),
      )
    );
  }
}
