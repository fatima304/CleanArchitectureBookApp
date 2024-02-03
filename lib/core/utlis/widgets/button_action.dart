import 'package:clean_bookly_app/core/utlis/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BookAction extends StatelessWidget {
  const BookAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            onPressed: () {
              // launchURL(context,  .accessInfo?.webReaderLink);
            },
            textcolor: Colors.black,
            radius: const BorderRadius.only(
              topLeft: Radius.circular(17),
              bottomLeft: Radius.circular(17),
            ),
            text: 'Download',
            color: Colors.white,
          ),
        ),
        Expanded(
          child: CustomButton(
            onPressed: () async {
              // launchURL(context,  .volumeInfo.previewLink);
            },
            textcolor: Colors.white,
            radius: const BorderRadius.only(
              topRight: Radius.circular(17),
              bottomRight: Radius.circular(17),
            ),
            text: 'Preview',
            color: const Color.fromARGB(255, 240, 149, 149),
          ),
        ),
      ],
    );
  }

//   String getText(   ) {
//     if ( .volumeInfo.previewLink == null) {
//       return 'Not Available';
//     } else {
//       return 'Preview';
//     }
//   }

//   String download(   ) {
//     if ( .accessInfo?.webReaderLink == null) {
//       return 'Not Available';
//     } else {
//       return 'Download';
//     }
//   }
}
