// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants.dart';
import '../screens/1.dart';
import '../screens/AndroidLarg-32.dart';
import '../widgets/default_text_button.dart';
import '../widgets/registration_button.dart';

class BoardingModel {
  late final String image;
  late final String title;
  late final String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      title: 'Learn anytime and anywhere',
      image: 'assets/images/onboarding/on1.png',
      body: 'This is the perfect time to spend your day learning',
    ),
    BoardingModel(
      title: 'Start your journey with fun learning videos',
      image: 'assets/images/onboarding/on2.png',
      body: 'Explore various learning videos based on your passion',
    ),
    BoardingModel(
      title: 'Find your Favourite Lesson',
      image: 'assets/images/onboarding/on3.png',
      body: 'Anyone can join our community to learn more subjects',
    ),
  ];

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Row(
            children: [
              defaultTextButton(
                onpressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Screen1(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                },
                text: 'Skip',
                color: defaultColor,
              ),
              // IconButton(
              //   iconSize: 18.0,
              //   color: defaultColor,
              //   onPressed: () {
              //     Navigator.pushAndRemoveUntil(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => Screen1(),
              //       ),
              //       (Route<dynamic> route) => false,
              //     );
              //   },
              //   icon: Icon(Icons.arrow_forward_ios),
              // ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Center(
              child: SmoothPageIndicator(
                controller: boardController,
                count: boarding.length,
                effect: ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  activeDotColor: defaultColor,
                  dotHeight: 6,
                  expansionFactor: 2,
                  dotWidth: 10,
                  spacing: 10,
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            registrationButton(
              onTap: () {
                if (isLast == false) {
                  boardController.nextPage(
                    duration: Duration(
                      milliseconds: 1500,
                    ),
                    curve: Curves.fastLinearToSlowEaseIn,
                  );
                } else {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Screen1(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                }
              },
              text: 'Continue',
              context: context,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        children: [
          Expanded(
            child: Image(
              image: AssetImage(model.image),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Center(
            child: Text(
              textAlign: TextAlign.center,
              model.title,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Center(
            child: Text(
              textAlign: TextAlign.center,
              model.body,
              style: GoogleFonts.montserrat(
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
        ],
      );
}
