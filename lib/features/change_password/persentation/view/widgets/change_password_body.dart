import 'package:flutter/material.dart';
import 'package:smart_agricultural_green_house/core/utils/customButtoms.dart';
import 'package:smart_agricultural_green_house/core/utils/custom_textform_field.dart';

class ChangePasswordBody extends StatelessWidget {
  const ChangePasswordBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Change Password',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: CustomTextFormField(
                  hintText: 'Old Password',
                  topRightRadius: 2,
                  bottomRightRadius: 2,
                  prefixIcon: Icon(Icons.password),
                  height: 60,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: CustomTextFormField(
                  hintText: 'Old Password',
                  topRightRadius: 2,
                  bottomRightRadius: 2,
                  prefixIcon: Icon(Icons.password),
                  height: 60,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: CustomButton(
                  onPressed: () {},
                  text: Text(
                    'Change',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  color: Colors.white,
                  width: widthScreen * 0.25,
                  height: heightScreen * 0.0493,
                  radius: 30,
                  borderColor: Color(0xFFDBEC0E),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
