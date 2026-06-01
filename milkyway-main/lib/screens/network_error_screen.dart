import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:milkyway/provider/network_controller.dart';
import 'package:provider/provider.dart';

class NetworkChecker extends StatelessWidget {
  final Widget child;

  const NetworkChecker({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isOnline = Provider.of<NetworkController>(context).isOnline;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        child, // Main App UI

        // Show overlay only when offline
        if (!isOnline) ...[
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0), // Blur effect
              child: Container(
                color: Colors.black.withOpacity(0.5), // Slight overlay
              ),
            ),
          ),

          // Centered No Internet Message
          Positioned.fill(
            child: Center(
              child: Container(
                height: height * 0.17,
                width: width * 0.850,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black, // Semi-transparent black
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(
                      "OOPS!!",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 20,
                          color: Colors.red,
                          fontFamily: "Arial"),
                    ),
                    SizedBox(
                      height: height * 0.035,
                    ),
                    Text(
                      "Please Connect To Network To Continue",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 15,
                          fontFamily: "Arial",
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
