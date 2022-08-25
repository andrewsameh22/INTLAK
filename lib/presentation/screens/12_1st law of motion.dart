import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../constants.dart';
import '13_selectedLesson.dart';

// ignore_for_file: prefer_const_constructors
class ListofVids extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Color(0xffe4f1f8),
                  ),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 50.0,
                      left: 25.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          '1st law of motion',
                          style: GoogleFonts.rubik(
                            color: dodblue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Row(
                          children: [
                            Text(
                              'Lesson 5 |',
                              style: GoogleFonts.rubik(
                                color: dodblue,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.01,
                            ),
                            Text(
                              'Types of force',
                              style: GoogleFonts.rubik(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: LinearPercentIndicator(
                                padding: EdgeInsets.all(0.0),
                                width: 200.0,
                                percent: 60 / 100,
                                barRadius: Radius.circular(20),
                                // animation: true,
                                // animationDuration: 1500,
                                progressColor: dodblue,
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.play_circle,
                                color: dodblue,
                                size: 32.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    elevation: 20,
                    shadowColor: Colors.black.withOpacity(0.3),
                    child: ListTile(
                      // tileColor: Colors.white.withOpacity(0.1),
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular(20),
                      //   // side:  BorderSide(
                      //   //   color: Colors.black,
                      //   // ),
                      // ),
                      isThreeLine: true,
                      dense: false,
                      visualDensity: VisualDensity(vertical: 4), // to compact

                      contentPadding: EdgeInsets.all(10.0),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectedLesson()));
                      },
                      title: Text(
                        'What is force',
                        style: GoogleFonts.rubik(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      subtitle: Row(
                        children: [
                          Icon(Icons.people_outline),
                          Text(
                            ' 1200 students enrolled',
                            style: GoogleFonts.rubik(
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.network(
                              'https://icatcare.org/app/uploads/2018/07/Thinking-of-getting-a-cat.png',
                              height: 150.0,
                              width: 100.0,
                              fit: BoxFit.fill,
                            ),
                            Icon(
                              Icons.play_circle,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
