/*import 'package:flutter/cupertino.dart';
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
                children: {
                  0: Container(color: Colors.amberAccent,),
                  1: Container(color: Colors.blueAccent,),
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
*/



import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class SkinScanPage extends StatefulWidget {
  const SkinScanPage({Key? key}) : super(key: key);

  @override
  State<SkinScanPage> createState() => _SkinScanPageState();
}

class _SkinScanPageState extends State<SkinScanPage> with TickerProviderStateMixin {
  late TabController _tabController;
  late List<CameraDescription> _cameras;
  late CameraController _cameraController;
  Future<void>? _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    // Obtain a list of available cameras
    _cameras = await availableCameras();
    // Initialize the camera controller
    _cameraController = CameraController(
      _cameras.first, // Use the first camera in the list
      ResolutionPreset.medium, // Set the resolution
    );
    // Initialize the controller future
    _initializeControllerFuture = _cameraController.initialize();
  }

  @override
  void dispose() {
    _cameraController.dispose(); // Dispose of the camera controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Normal'),
            Tab(text: 'Disease'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Normal tab content
          Center(
            child: Text(
              'Normal Tab Content',
              style: TextStyle(fontSize: 20),
            ),
          ),
          // Disease tab content
          Center(
            child: _buildCameraPreview(),
          ),
        ],
      ),
    );
  }

  Widget _buildCameraPreview() {
  return FutureBuilder<void>(
    future: _initializeControllerFuture,
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        // If the Future is complete, display the camera preview
        return CameraPreview(_cameraController);
      } else if (snapshot.hasError) {
        // If an error occurs, display an error message
        return Text('Error: ${snapshot.error}');
      } else {
        // Otherwise, display a loading indicator
        return CircularProgressIndicator();
      }
    },
  );
}
}
