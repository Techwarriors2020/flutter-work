import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40, width: 100,
      padding: const EdgeInsets.all(50),
      child: Text('Landing screen'),
    );
  }
}

