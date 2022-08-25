import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:better_player/better_player.dart';
import '../../constants.dart';
import '../widgets/default_button.dart';
import 'Exam.dart';

// ignore_for_file: prefer_const_constructors
class SelectedLesson extends StatefulWidget {
  @override
  State<SelectedLesson> createState() => _SelectedLessonState();
}

class _SelectedLessonState extends State<SelectedLesson> {
  TextEditingController notesController = TextEditingController();

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
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Introduction to Forces > 1st Law of Motion'),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  '1st law of motion',
                  style: GoogleFonts.rubik(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.network(
                        'https://icatcare.org/app/uploads/2018/07/Thinking-of-getting-a-cat.png',
                        fit: BoxFit.cover,
                      ),
                      Icon(
                        Icons.play_circle,
                        color: Colors.white70,
                        size: 70,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  'Notes',
                  style: GoogleFonts.rubik(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: TextField(
                    controller: notesController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Write Notes Here',
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                  ),
                ),
                Text(
                  'Exam:',
                  style: GoogleFonts.rubik(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    defaultButton(
                      context: context,
                      color: Colors.green,
                      text: 'Easy',
                      onpressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Exam()));
                      },
                    ),
                    defaultButton(
                      context: context,
                      color: Colors.yellow.shade800,
                      text: 'Medium',
                      onpressed: () {},
                    ),
                    defaultButton(
                      context: context,
                      color: Colors.red,
                      text: 'Hard',
                      onpressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
