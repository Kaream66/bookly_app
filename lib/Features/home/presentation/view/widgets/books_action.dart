import 'package:bookly_app/core/widgets/custom_action_button.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
            child: CustomActionButton(
          text: '19.9 €',
          textColor: Colors.black,
          backgroundColor: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
        )),
        Expanded(
            child: CustomActionButton(
          text: 'Free Preview',
          textColor: Colors.white,
          backgroundColor: Color(0xffEF8262),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        )),
      ],
    );
  }
}
