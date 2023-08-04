import 'package:flutter/material.dart';

class LoadIndicator extends StatelessWidget {
  const LoadIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const LinearProgressIndicator(
      backgroundColor: Colors.black12,
      color: Colors.white54,
      minHeight: double.maxFinite,
    );
  }
}
