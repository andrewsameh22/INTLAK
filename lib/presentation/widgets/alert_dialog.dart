import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/presentation/widgets/default_button.dart';

import '../../constants.dart';

//
// Widget ClickAlert({
//   required title,
//   required content,
//   context,
//   YesOnPressed,
// }) =>
//     AlertDialog(
//       title: Text(title),
//       content: Text(content),
//       actions: [
//         TextButton(
//           onPressed: YesOnPressed,
//           child: Text(
//             'Yes',
//             style: Theme.of(context).textTheme.bodyText1,
//           ),
//         ),
//         TextButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: Text(
//             'No',
//             style: Theme.of(context).textTheme.bodyText1,
//           ),
//         ),
//       ],
//     );
double rating = 0;

Widget buildRating() => RatingBar(
    initialRating: rating,
    minRating: 1,
    maxRating: 5,
    itemSize: 30,
    itemPadding: EdgeInsets.symmetric(horizontal: 4),
    ratingWidget: RatingWidget(
      full: Icon(
        Icons.star,
        color: dodblue,
      ),
      half: Icon(
        Icons.star,
        color: dodblue,
      ),
      empty: Icon(
        Icons.star_border_outlined,
        color: dodblue,
      ),
    ),
    updateOnDrag: true,
    onRatingUpdate: (value) {
      rating = value;
    });

showRating({
  context,
}) =>
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('AS'),
        content: Text('ASD'),
      ),
    );

Widget Alert(context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image(
              //   image: AssetImage(
              //     "assets/images/wave.png",
              //   ),
              //   height: 50,
              //   width: 50,
              // ),
              Icon(
                Icons.cloud_done_outlined,
                color: dodblue,
                size: 100,
              ),
            ],
          ),
          Text(
            'Done!',
            style: GoogleFonts.rubik(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Text(
            'Please rate this video',
            style: GoogleFonts.rubik(
              fontSize: 16.0,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          buildRating(),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            defaultButton(
              context: context,
              color: Colors.white70,
              textColor: Colors.black,
              text: 'Cancel',
              onpressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
            defaultButton(
              color: dodblue,
              text: 'Submit',
              onpressed: () {},
              context: context,
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
      ],
    );
