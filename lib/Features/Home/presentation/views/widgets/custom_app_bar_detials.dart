import 'package:flutter/material.dart';

class CustomAppBarDetials extends StatelessWidget {
  const CustomAppBarDetials({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close),
        ),
      ],
    );
  }
}
