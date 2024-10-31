
import 'package:flutter/material.dart';

class HomeShell extends StatelessWidget {
  final Widget child;

  const HomeShell({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book'),
        centerTitle: true, 
        backgroundColor: Colors.purple[50]
      ),
      body: child,
    );
  }
}
