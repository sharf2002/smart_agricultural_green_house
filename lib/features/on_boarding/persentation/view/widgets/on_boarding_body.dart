import 'package:flutter/material.dart';
import 'package:smart_agricultural_green_house/core/utils/customButtoms.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(
                'assets/on_boarding_images/logo.jpg',
                width: widthScreen * 0.3,
                height: heightScreen * 0.2,
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(100000)),
                child: Image.asset(
                  'assets/on_boarding_images/smart-agriculture.jpg',
                  width: widthScreen,
                  height: heightScreen * 0.48,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'The Future Of Agriculture',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  'Keep track of all future agriculture in one\napplication.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff57636C),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: CustomButton(
                    onPressed: () {},
                    text: Text(
                      'Continue',
                      style: TextStyle(
                        color: Color(0xff39D2C0),
                      ),
                    ),
                    color: Color(0xffF0F5F6),
                    width: widthScreen * 0.5,
                    height: heightScreen * 0.058,
                    radius: 40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
