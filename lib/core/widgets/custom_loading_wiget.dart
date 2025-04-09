import 'package:flutter/material.dart';

class CustomLoadingWiget extends StatelessWidget {
  const CustomLoadingWiget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.red,
      ),
    );
  }
}