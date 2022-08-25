import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/cubit/drawer_cubit/drawer_cubit_state.dart';

import '../../cubit/drawer_cubit/drawer_cubit_bloc.dart';
import '../widgets/drawer_row.dart';
import '../widgets/profile_widget.dart';

class Drawer11 extends StatelessWidget {
  const Drawer11({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrawerCubitBloc(),
      child: BlocConsumer<DrawerCubitBloc, DrawerCubitState>(
        listener: (context, state) {},
        builder: (context, state) {
          DrawerCubitBloc drawerCubitBloc = DrawerCubitBloc.get(context);
          return SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.04,
                    left: MediaQuery.of(context).size.width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    profileWidget(
                        context: context,
                        image: AssetImage("assets/images/Group 624543.png"),
                        name: "kerolos faie",
                        email: "kerolosfaie@gmail.com"),
                    drawerRow(
                        context: context,
                        icon: Icons.dashboard_outlined,
                        title: "Dashboard",
                        onTap: () {}),
                    drawerRow(
                        context: context,
                        icon: Icons.local_offer_outlined,
                        title: "Offers",
                        onTap: () {}),
                    drawerRow(
                        context: context,
                        icon: Icons.payments_outlined,
                        title: "Payments Methods",
                        onTap: () {}),
                    drawerRow(
                        context: context,
                        icon: Icons.settings_outlined,
                        title: "Settings",
                        onTap: () {}),
                    Row(
                      children: [
                        Icon(
                          drawerCubitBloc.isDark
                              ? Icons.dark_mode_outlined
                              : Icons.light_mode_outlined,
                          size: MediaQuery.of(context).size.width * 0.08,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                        CupertinoSwitch(
                          value: drawerCubitBloc.isDark,
                          onChanged: (value) {
                            drawerCubitBloc.changeTheme(value);
                          },
                          trackColor: Colors.grey.shade400,
                          activeColor: Colors.grey.shade400,
                        )
                      ],
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width * 0.5,
                            color: Colors.black,
                          ),
                          drawerRow(
                              context: context,
                              icon: Icons.help_outline,
                              title: "About Us",
                              onTap: () {}),
                          drawerRow(
                              context: context,
                              icon: Icons.call_outlined,
                              title: "Support",
                              onTap: () {}),
                          drawerRow(
                              context: context,
                              icon: Icons.logout,
                              title: "Logout",
                              onTap: () {}),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
