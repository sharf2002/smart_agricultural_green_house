import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_agricultural_green_house/core/constants/strings.dart';
import 'package:smart_agricultural_green_house/core/utils/custom_textform_field.dart';
import 'package:smart_agricultural_green_house/features/login/persentation/view/login_view.dart';
import 'package:smart_agricultural_green_house/features/otp/persentation/view/otp_view.dart';
import 'package:smart_agricultural_green_house/features/otp/persentation/view/widgets/otp_body.dart';
import 'package:smart_agricultural_green_house/features/otp/persentation/view_model/manger/otp_cubit/otp_cubit.dart';

import '../../../../../core/utils/customButtoms.dart';
import '../../../../create_user/persentation/view/create_user_view.dart';

class CreateAccountBody extends StatefulWidget {
  CreateAccountBody({Key? key}) : super(key: key);

  @override
  State<CreateAccountBody> createState() => _CreateAccountBodyState();
}

class _CreateAccountBodyState extends State<CreateAccountBody> {
  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xff39D2C0), Color(0xFF4B39EF)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  final phoneController = TextEditingController();

  void showProgressIndicator(BuildContext context) {
    AlertDialog alertDialog = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        ), // CircularProgressIndicator
      ), // Center
    ); // AlertDialog
    showDialog(
      barrierColor: Colors.white.withOpacity(0),
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return alertDialog;
      },
    );
  }

  Widget buildPhoneSubmitedBlock() {
    return BlocListener<OtpCubit, OtpState>(
      listenWhen: (previous, current) {
        return previous != current;
      },
      listener: (context, state) {
        if (state is Loading) {
          return showProgressIndicator(context);
        }
        if (state is PhoneNumberSubmitted) {
          Navigator.pop(context);
          Navigator.of(context).pushNamed(
            otpScreen,
            arguments: phoneController.text,
          );
        }
        if (state is ErrorOccurred) {
          Navigator.pop(context);
          String errorMessage = (state).errorMessage;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage),
              backgroundColor: Colors.black,
              duration: Duration(seconds: 3),
            ),
          );
        } // SnackBar
      },
      child: Container(),
    );
  }

  Future<void> _register(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      Navigator.pop(context);
      return;
    } else {
      Navigator.pop(context);
      _formKey.currentState!.save();
      BlocProvider.of<OtpCubit>(context)
          .submitPhoneNumber(phoneController.text);
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Get Started',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.w700),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              'The future of agriculture is at your\n finger tips',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w100),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    hintText: 'Email address',
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(Icons.email_outlined),
                    height: 56,
                    topRightRadius: 30,
                    bottomRightRadius: 0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: CustomTextFormField(
                    controller: phoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    hintText: 'Phone',
                    enabledOutBorder: true,
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.phone),
                    height: 56,
                    topRightRadius: 0,
                    bottomRightRadius: 0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    hintText: 'Password',
                    enabledOutBorder: true,
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: Icon(Icons.visibility_outlined),
                    height: 56,
                    topRightRadius: 0,
                    bottomRightRadius: 0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    hintText: 'Confirm Password',
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: Icon(Icons.visibility_outlined),
                    height: 56,
                    topRightRadius: 0,
                    bottomRightRadius: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Already have an account?',
                              style: TextStyle(
                                foreground: Paint()..shader = linearGradient,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return LoginView();
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  foreground: Paint()..shader = linearGradient,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomButton(
                        onPressed: () {
                          showProgressIndicator(context);
                          _register(context);
                        },
                        text: Text(
                          'Create',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        color: Color(0xff39D2C0),
                        borderColor: Color(0xffC1F802),
                        width: 130,
                        height: 50,
                        radius: 30,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text(
                    'Use a Social Platform to Login',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xB2FFFFFF),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              'assets/login_images/Google.png',
                              width: widthScreen * 0.11,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              'assets/login_images/apple-logo-6-1024x1024.png',
                              width: widthScreen * 0.11,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              'assets/login_images/phone.png',
                              width: widthScreen * 0.10,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: CustomButton(
                    onPressed: () {},
                    text: Text(
                      'Continue as Guest',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    color: Colors.black,
                    width: 230,
                    height: 50,
                    radius: 50,
                  ),
                ),
                buildPhoneSubmitedBlock(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
