import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'Constant/ColorGolobal.dart';
import 'Constant/TextField.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _borderColorAnimation1;
  late Animation<Color?> _borderColorAnimation2;
  late Animation<Color?> _borderColorAnimation3;
  late Animation<Color?> _borderColorAnimation4;

  @override
  void initState() {
    super.initState();
    timeDilation = 1.5;

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    )..addListener(() {
        setState(() {});
      });

    _borderColorAnimation1 = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(_controller);

    _borderColorAnimation2 = ColorTween(
      begin: Colors.green,
      end: Colors.yellow,
    ).animate(_controller);

    _borderColorAnimation3 = ColorTween(
      begin: Colors.yellow,
      end: Colors.blue,
    ).animate(_controller);

    _borderColorAnimation4 = ColorTween(
      begin: Colors.red,
      end: Colors.green,
    ).animate(_controller);

    _controller.repeat(); // Repeat the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 90.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: TextFieldWidget(
                          hintText: "Search profiles....",
                          prefixIconData: Icons.search,
                          suffixIconData: Icons.person,
                          obscureText: false,
                          onChanged: (value) {
                            // Handle search input
                          },
                          textEditingController: TextEditingController(),
                          focusNode: FocusNode(),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage("assets/profile_image.png"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // First circle
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 80,
                                backgroundColor: Colors.white,
                                backgroundImage:
                                    AssetImage("assets/profile_image.png"),
                                // Apply animated border colors
                                foregroundColor: Colors.red,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: _borderColorAnimation1.value ??
                                          Colors.transparent,
                                      width: 4,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                "Gulraiz Khan",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 16.0), // Add gap between circles
                          // Second circle
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 80,
                                backgroundColor: Colors.white,
                                backgroundImage:
                                    AssetImage("assets/profile_image2.png"),
                                // Apply animated border colors
                                foregroundColor: Colors.red,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: _borderColorAnimation2.value ??
                                          Colors.transparent,
                                      width: 4,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                "Hamza Saleem",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.0), // Add gap between rows
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Third circle
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 80,
                                backgroundColor: Colors.white,
                                backgroundImage:
                                    AssetImage("assets/profile_image3.jpeg"),
                                // Apply animated border colors
                                foregroundColor: Colors.red,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: _borderColorAnimation3.value ??
                                          Colors.transparent,
                                      width: 4,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                "Zartasha Bhatti",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 16.0), // Add gap between circles
                          // Fourth circle
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 80,
                                backgroundColor: Colors.white,
                                backgroundImage:
                                    AssetImage("assets/profile_image4.jpg"),
                                // Apply animated border colors
                                foregroundColor: Colors.red,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: _borderColorAnimation4.value ??
                                          Colors.transparent,
                                      width: 4,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                "Nabeel Masood",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    // Add more content here, such as profile cards or other widgets
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: RawMaterialButton(
              onPressed: () {
                // Scroll to top functionality
              },
              elevation: 4,
              shape: CircleBorder(),
              fillColor:
                  ColorGlobal.fabColor, // Use the custom color for the button
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
