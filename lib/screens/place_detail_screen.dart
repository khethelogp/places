import 'package:flutter/material.dart';

class PlaceDetailScreen extends StatelessWidget {
  static const routeName = '/detail-screen';

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Place Details'),
      ),
      body: Center(
        child: Text('Centered Detail'),
      ),
    );
  }
}