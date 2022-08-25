import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:better_player/better_player.dart';
import '../../constants.dart';

// ignore_for_file: prefer_const_constructors
class SelectedLesson extends StatefulWidget {
  @override
  State<SelectedLesson> createState() => _SelectedLessonState();
}

class _SelectedLessonState extends State<SelectedLesson> {
  TextEditingController notesController = TextEditingController();
  // final videoPlayerController = VideoPlayerController.network(
  //     'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
  //
  // Future Test() async {
  //   await videoPlayerController.initialize();
  // }
  //
  // final chewieController = ChewieController(
  //   videoPlayerController: videoPlayerController,
  //   autoPlay: true,
  //   looping: true,
  // );
  //
  // final playerWidget = Chewie(
  //   controller: chewieController,
  // );
  // BetterPlayerController _betterPlayerController = BetterPlayerController(
  //   BetterPlayerConfiguration(),
  // );
  //
  // @override
  // void initState() {
  //   super.initState();
  //   BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
  //       BetterPlayerDataSourceType.network,
  //       "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4");
  //   _betterPlayerController = BetterPlayerController(
  //       BetterPlayerConfiguration(),
  //       betterPlayerDataSource: betterPlayerDataSource);
  // }
  VideoPlayerController controller = VideoPlayerController.network(
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4');
  @override
  void initState() {
    super.initState();

    controller.initialize();
  }

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
                VideoPlayer(controller),
                TextButton(
                    onPressed: () {
                      setState(() {
                        controller.play();
                      });
                    },
                    child: Text('plaaaaay')),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                // AspectRatio(
                //   aspectRatio: 16 / 9,
                //   child: BetterPlayer(
                //     controller: _betterPlayerController,
                //   ),
                //   // child: BetterPlayer.network(
                //   //   "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
                //   //   betterPlayerConfiguration: BetterPlayerConfiguration(
                //   //     aspectRatio: 16 / 9,
                //   //   ),
                //   // ),
                // ),
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
                      color: Colors.green,
                      text: 'Easy',
                      onpressed: () {},
                    ),
                    defaultButton(
                      color: Colors.yellow.shade800,
                      text: 'Medium',
                      onpressed: () {},
                    ),
                    defaultButton(
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

Widget defaultButton({
  required String text,
  required onpressed,
  required color,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: color,
      ),
      child: MaterialButton(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: onpressed,
      ),
    );
