import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/cubit/registration_cubit_bloc.dart';
import 'package:task/cubit/registration_cubit_state.dart';

import '../widgets/cerved_container.dart';
import '../widgets/registration_button.dart';
import '6 sign in.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => RegistrationCubitBloc(),
        child: BlocConsumer<RegistrationCubitBloc, RegistrationCubitState>(
          listener: (BuildContext context, RegistrationCubitState state) {},
          builder: (BuildContext context, RegistrationCubitState state) {
            RegistrationCubitBloc cub = RegistrationCubitBloc.get(context);
            return Scaffold(
                backgroundColor: const Color(0XFFe4f1f8),
                body: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        cervedContainer(context: context),
                        SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.21,
                                    ),
                                    const Image(
                                      image: AssetImage(
                                          "assets/images/Group 624543.png"),
                                    ),
                                  ],
                                )
                              ],
                            )),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.05,
                              right: MediaQuery.of(context).size.width * 0.05),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              registrationButton(
                                text: 'Sign up with Facebook',
                                context: context,
                                imagePath: 'assets/images/Facebook F.png',
                                color: const Color(0XFFe35f60),
                                onTap: () {
                                  cub.SignUpWithFacebook();
                                },
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                              ),
                              registrationButton(
                                text: 'Sign up with Google',
                                context: context,
                                imagePath: 'assets/images/Google.png',
                                color: const Color(0XFF868686),
                                onTap: () {
                                  cub.SignUpWithGoogle();
                                },
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: const Text(
                                  'or',
                                  style: TextStyle(
                                    color: Color(0XFF3f3f3f),
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              registrationButton(
                                text: 'Sign up with Email',
                                context: context,
                                onTap: () {
                                  cub.SignUpWithEmail();
                                },
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Already have an account? ",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0XFF3f3f3f))),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SignIn()));
                                    },
                                    child: const Text('Login',
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.blueAccent)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    )));
          },
        ));
  }
}
