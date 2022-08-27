import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/presentation/screens/12_chapter.dart';

String? Selectedvalue1;
String? Selectedvalue2;
String? GenderValue;
String? SubjectsValue;
String? EduValue;

var items = [
  "Food",
  "Transport",
  "Personal",
  "Shopping",
  "Medical",
  "Rent",
  "Movie",
];
var Genders = [
  "Male",
  "Female",
];
var Subjects = [
  "Math Math Math Math Math Math Math Math Math Math Math Math Math Math Math Math Math Math Math Math Math ",
  "3rbi",
];
var YearOfEdu = [
  "2 e3dady",
  "3 sanawi",
];
Widget DropDown({
  required context,
  required onChanged,
  required hint,
  required SelectedValue,
  required Selecteditems,
}) =>
    Container(
      height: MediaQuery.of(context).size.height * 0.075,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffbebab3), width: 1),
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: EdgeInsets.all(5.0),
      child: DropdownButton<String>(
        value: SelectedValue,
        style: GoogleFonts.rubik(
          color: Colors.black,
        ),
        hint: Text(
          hint,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        isExpanded: true,
        iconSize: 32,
        underline: SizedBox(),
        iconDisabledColor: Color(0xffbebab3),
        items: Selecteditems, //?? items.map(buildMenuitem).toList(),
        onChanged: onChanged,
      ),
    );

DropdownMenuItem<String> buildMenuitem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(
          fontSize: 16.0,
        ),
        maxLines: null,
      ),
    );
