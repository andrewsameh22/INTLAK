import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/dropdown_textField.dart';
import '../widgets/registration_button.dart';
// ignore_for_file: prefer_const_constructors

class Chapter extends StatefulWidget {
  @override
  State<Chapter> createState() => _ChapterState();
}

class _ChapterState extends State<Chapter> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            top: 50,
            right: 20,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 5.0,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: Stack(
                      children: [
                        Image(
                          image: AssetImage("assets/images/science.png"),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Science',
                        style: GoogleFonts.rubik(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  DropDown(
                    Selecteditems: items.map(buildMenuitem).toList(),
                    SelectedValue: Selectedvalue1,
                    onChanged: (value) {
                      setState(() {
                        Selectedvalue1 = value;
                      });
                    },
                    context: context,
                    hint: 'Chapter',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  DropDown(
                    Selecteditems: items.map(buildMenuitem).toList(),
                    SelectedValue: Selectedvalue2,
                    onChanged: (value) {
                      setState(() {
                        Selectedvalue2 = value;
                      });
                    },
                    context: context,
                    hint: 'Lesson',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                  registrationButton(
                    text: "Next",
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        //Navigate to b2a hna
                      }
                    },
                    context: context,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
