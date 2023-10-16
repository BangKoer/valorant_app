import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:valorant_app/shared/color.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Maincolor,
      body: Center(
        child: SpinKitDancingSquare(
          color: SecondColor,
          size: 80,
        ),
      ),
    );
  }
}
