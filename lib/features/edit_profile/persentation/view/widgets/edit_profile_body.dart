import 'package:flutter/material.dart';
import 'package:smart_agricultural_green_house/core/utils/customButtoms.dart';
import 'package:smart_agricultural_green_house/core/utils/custom_textform_field.dart';

class EditProfileBody extends StatelessWidget {
  EditProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xff39D2C0), Color(0xff4B39EF)]),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.transparent,
                    child: CircleAvatar(
                      radius: 50,
                      child: Image.asset('assets/create_user_image/41px.png'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomButton(
                  onPressed: () {},
                  text: Text(
                    'Change Photo',
                    style: TextStyle(
                        color: Color(0xff39D2C0),
                        fontWeight: FontWeight.normal),
                  ),
                  color: Colors.white,
                  borderColor: Color(0xff0E466E),
                  width: widthScreen * 0.33,
                  height: heightScreen * 0.047,
                  radius: 8,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: TextFormField(
                  maxLength: 100,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Bio',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: CustomButton(
                    onPressed: () {},
                    text: Text(
                      'Save Changes',
                      style: TextStyle(fontSize: 16),
                    ),
                    color: Color(0xff39D2C0),
                    borderColor: Color(0xff26B8B8),
                    width: widthScreen * 0.5,
                    height: heightScreen * 0.059,
                    radius: 30),
              )
            ],
          ),
        ),
      ),
    );
  }
}
