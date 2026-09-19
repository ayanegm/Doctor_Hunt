import 'package:doctor_hunt/generated/assets.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final Widget? bottomNavigationBar;
  const CustomScaffold({
    super.key,
    required this.body,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Transform.translate(
              offset: Offset(-screenWidth * 0.06, 0),
              child: Image(
                image: AssetImage(Assets.leftBlur),
                width: screenWidth * 0.57,
                height: screenWidth * 0.57,
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: Transform.translate(
              offset: Offset(screenWidth * 0.03, 0),
              child: Image(
                image: AssetImage(Assets.rightBlur),
                width: screenWidth * 0.57,
                height: screenWidth * 0.57,
              ),
            ),
          ),

          Positioned.fill(child: body),

          if (bottomNavigationBar != null)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: bottomNavigationBar!,
            ),
        ],
      ),
    );
  }
}
