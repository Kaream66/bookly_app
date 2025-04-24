import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/core/functions/launch_url.dart';
import 'package:bookly_app/core/widgets/custom_action_button.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            child: CustomActionButton(
          text: 'Free',
          textColor: Colors.black,
          backgroundColor: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
        )),
        Expanded(
            child: CustomActionButton(
          onPressed: () {
            customLaunchUrl(context, bookModel.volumeInfo.previewLink);
          },
          text: getText(bookModel),
          textColor: Colors.white,
          backgroundColor: const Color(0xffEF8262),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        )),
      ],
    );
  }

  getText(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return 'Not Availalbe';
    } else {
      return 'Preview';
    }
  }
}
