import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/cubit/main_cubit/main_cubit_bloc.dart';
import 'package:task/cubit/main_cubit/main_cubit_state.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MainCubitBloc(),
        child: BlocConsumer<MainCubitBloc, MainCubitState>(
          listener: (context, state) {},
          builder: (context, state) {
            MainCubitBloc cubit = MainCubitBloc.get(context);
            return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  title: Text(
                    cubit.screensNames[cubit.currentIndex],
                    style: GoogleFonts.montserrat(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                ),
                body: cubit.screens[cubit.currentIndex],
                bottomNavigationBar: BottomNavyBar(
                  selectedIndex: cubit.currentIndex,
                  showElevation: false,
                  onItemSelected: (index) {
                    cubit.changeIndex(index);
                  },
                  items: [
                    BottomNavyBarItem(
                      icon: Icon(
                        CupertinoIcons.home,
                        color: cubit.currentIndex == 0
                            ? Colors.blue
                            : Colors.black,
                      ),
                      title: Text('Home'),
                      activeColor: Colors.blue,
                    ),
                    BottomNavyBarItem(
                      icon: Icon(
                        CupertinoIcons.minus_circled,
                        color: cubit.currentIndex == 1
                            ? Colors.blue
                            : Colors.black,
                      ),
                      title: Text('Score'),
                      activeColor: Colors.blue,
                    ),
                    BottomNavyBarItem(
                        icon: Icon(
                          Icons.people_outline,
                          color: cubit.currentIndex == 2
                              ? Colors.blue
                              : Colors.black,
                        ),
                        title: Text('Friends'),
                        activeColor: Colors.blue),
                    BottomNavyBarItem(
                        icon: Icon(
                          CupertinoIcons.person,
                          color: cubit.currentIndex == 3
                              ? Colors.blue
                              : Colors.black,
                        ),
                        title: Text('Profile'),
                        activeColor: Colors.blue),
                  ],
                ));
          },
        ));
  }
}
