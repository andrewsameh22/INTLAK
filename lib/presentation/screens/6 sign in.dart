import 'package:flutter/material.dart';
import 'package:task/presentation/widgets/default_text_button.dart';

import '../widgets/aTXTFld.dart';
import '../widgets/cerved_container.dart';
import '../widgets/registration_button.dart';

// ignore_for_file: prefer_const_constructors
class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

bool isPassword = true;
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0XFFe4f1f8),
        body: SingleChildScrollView(
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  cervedContainer(context: context),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.14,
                        ),
                        Image(
                          image: AssetImage("assets/images/signin.png"),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                        right: MediaQuery.of(context).size.width * 0.05),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        registrationButton(
                          text: 'Sign in with Facebook',
                          context: context,
                          imagePath: 'assets/images/Facebook F.png',
                          color: Color(0XFFe35f60),
                          onTap: () {},
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        registrationButton(
                          text: 'Sign in with Google',
                          context: context,
                          imagePath: 'assets/images/Google.png',
                          color: const Color(0XFF868686),
                          onTap: () {},
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          'or',
                          style: TextStyle(
                            color: Color(0XFF3f3f3f),
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        TxtFld(
                          controller: emailController,
                          label: 'Email',
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        TxtFld(
                          sicon: IconButton(
                            onPressed: () {
                              setState(() {
                                isPassword = !isPassword;
                              });
                            },
                            icon: Icon(
                              Icons.visibility_off,
                              color: Colors.grey,
                            ),
                          ),
                          controller: passwordController,
                          label: 'Password',
                          isPassword: isPassword,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'empty field required';
                            }
                            return null;
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            defaultTextButton(
                                color: Color(0xff3f3f3f),
                                text: 'Forgot Password?',
                                onpressed: () {})
                          ],
                        ),
                        registrationButton(
                          text: 'Sign in',
                          context: context,
                          onTap: () {},
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ));
  }
}
