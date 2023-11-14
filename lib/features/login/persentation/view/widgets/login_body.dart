import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_agricultural_green_house/core/constants/strings.dart';
import 'package:smart_agricultural_green_house/core/utils/custom_textform_field.dart';
import 'package:smart_agricultural_green_house/features/create_account/persentation/view/creat_account_view.dart';
import 'package:smart_agricultural_green_house/features/forgot_password/persentation/view/forgot_password_view.dart';

import '../../../../../core/utils/customButtoms.dart';
import '../../../../otp/persentation/view_model/manger/otp_cubit/otp_cubit.dart';

class LoginBody extends StatelessWidget {
  LoginBody({Key? key}) : super(key: key);

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Colors.white, Color(0xFFBAEF39)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  final GlobalKey<FormState> _formKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.network(
                      'https://picsum.photos/id/115/600',
                      height: 60,
                      width: widthScreen,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      'smart agriculture green house',
                      style: TextStyle(
                        foreground: Paint()..shader = linearGradient,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    'assets/login_images/3461225.jpg',
                    width: widthScreen,
                    height: heightScreen * 0.25,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Welcome!',
                  style: TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: CustomTextFormField(
                  hintText: 'Email Address',
                  prefixIcon: Icon(
                    Icons.email,
                    color: Color(0xffDBEC0E),
                  ),
                  suffixIcon: Icon(
                    Icons.close,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  height: 60,
                  topRightRadius: 30,
                  bottomRightRadius: 0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: CustomTextFormField(
                  hintText: 'Password',
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: Color(0xffDBEC0E),
                  ),
                  suffixIcon: Icon(
                    Icons.visibility_outlined,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  height: 60,
                  topRightRadius: 30,
                  bottomRightRadius: 0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(createAccountScreen,);
                            },
                            child: Text(
                              'Create Account',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Color(0xffDBEC0E),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomButton(
                      text: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      color: Colors.black,
                      borderColor: Color(0xffC1F802),
                      width: 130,
                      height: 50,
                      radius: 30,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ForgotPasswordView();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
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
                padding: const EdgeInsets.all(8.0),
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
                padding: const EdgeInsets.all(8.0),
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
            ],
          ),
        ),
      ),
    );
  }
}
