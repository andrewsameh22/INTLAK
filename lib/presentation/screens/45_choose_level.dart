import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../constants.dart';
import '../widgets/alert_dialog.dart';

class Level {
  Level(this.title, this.body, [this.isExpanded = false]);
  String title;
  String body;
  Checkbox checker = Checkbox(value: false, onChanged: (value) {});
  bool isExpanded;
}

List<Level> getLevels() {
  return [
    Level(
      'Level 1',
      'Expanded aho yababa',
    ),
    Level('Level 2', 'Expanded aho ya 7bibi'),
    Level('Level 3', '3agbk el expanded awi??.'),
    Level('Level 4', 'bs eh r2yk fl animation.'),
  ];
}

class ChooseLevel extends StatefulWidget {
  @override
  State<ChooseLevel> createState() => _ChooseLevelState();
}

class _ChooseLevelState extends State<ChooseLevel> {
  //bool isExpanded = false;

  final List<Level> levels = getLevels();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     showDialog(
      //         barrierDismissible: false,
      //         context: context,
      //         builder: (context) {
      //           return Alert(
      //             context,
      //           );
      //         });
      //   },
      // ),
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
                Text(
                  'Select Plan',
                  style: GoogleFonts.rubik(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Color(0xffe4f1f8),
                    ),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.40,
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
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '\$9.99',
                                style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0,
                                ),
                              ),
                              Text(
                                '/month',
                                style: GoogleFonts.rubik(
                                  color: dodblue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Text(
                            'This plan includes:',
                            style: GoogleFonts.rubik(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            children: [
                              Image(
                                image: AssetImage(
                                  'assets/images/done.png',
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                'Tests',
                                style: GoogleFonts.rubik(
                                  color: dodblue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            children: [
                              Image(
                                image: AssetImage(
                                  'assets/images/done.png',
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                'Class Materials',
                                style: GoogleFonts.rubik(
                                  color: dodblue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            children: [
                              Image(
                                image: AssetImage(
                                  'assets/images/done.png',
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                'Games and challengs',
                                style: GoogleFonts.rubik(
                                  color: dodblue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
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
                ExpansionPanelList(
                  animationDuration: Duration(seconds: 1),
                  elevation: 1,
                  expandedHeaderPadding: EdgeInsets.all(8),
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      levels[index].isExpanded = !isExpanded;
                    });
                  },
                  children: levels.map<ExpansionPanel>((Level level) {
                    return ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          leading: level.checker,
                          title: Text(level.title),
                        );
                      },
                      body: ListTile(
                        title: Text(level.body),
                      ),
                      isExpanded: level.isExpanded,
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//
// Widget buildCard({required title}) => Card(
//       child: ExpansionPanel(body: Text('a'),headerBuilder: (context, isExpanded) => ,),
//     );
