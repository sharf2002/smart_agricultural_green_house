import 'package:flutter/material.dart';
import 'package:smart_agricultural_green_house/core/utils/customButtoms.dart';

import '../../../../../core/utils/custom_textform_field.dart';

class CreateUserBody extends StatefulWidget {
  CreateUserBody({Key? key}) : super(key: key);

  @override
  State<CreateUserBody> createState() => _CreateUserBodyState();
}

class _CreateUserBodyState extends State<CreateUserBody> {
  bool selectAdmin = false;
  bool selectFarmer = false;
  bool selectVisitor = false;

  String genderType = 'x';

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            'Create User',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 60,
                  child: Image.asset(
                    'assets/create_user_image/41px.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomButton(
                    onPressed: () {},
                    text: Text(
                      'upload photo',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    color: Colors.white,
                    width: 130,
                    height: 40,
                    radius: 30),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ChoiceChip(
                      backgroundColor: Colors.grey,
                      label: Text(
                        'Admin',
                        style: TextStyle(color: Colors.white),
                      ),
                      avatar: Icon(
                        Icons.admin_panel_settings_outlined,
                        color: Colors.white,
                      ),
                      selected: selectAdmin,
                      selectedColor: Colors.black,
                      onSelected: (newState) {
                        setState(
                          () {
                            selectAdmin = !selectAdmin;
                          },
                        );
                      },
                    ),
                    ChoiceChip(
                      backgroundColor: Colors.grey,
                      label: Text(
                        'Farmer',
                        style: TextStyle(color: Colors.white),
                      ),
                      avatar: Icon(
                        Icons.agriculture,
                        color: Colors.white,
                      ),
                      selected: selectFarmer,
                      selectedColor: Colors.black,
                      onSelected: (newState) {
                        setState(
                          () {
                            selectFarmer = !selectFarmer;
                          },
                        );
                      },
                    ),
                    ChoiceChip(
                      backgroundColor: Colors.grey,
                      label: Text(
                        'Visitor',
                        style: TextStyle(color: Colors.white),
                      ),
                      avatar: Icon(
                        Icons.man,
                        color: Colors.white,
                      ),
                      selected: selectVisitor,
                      selectedColor: Colors.black,
                      onSelected: (newState) {
                        setState(
                          () {
                            selectVisitor = !selectVisitor;
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: CustomTextFormField(
                    hintText: 'Full name',
                    enabledOutBorder: true,
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.person),
                    height: 56,
                    topRightRadius: 0,
                    bottomRightRadius: 0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: CustomTextFormField(
                    hintText: 'Location',
                    enabledOutBorder: true,
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.location_on_sharp),
                    height: 56,
                    topRightRadius: 0,
                    bottomRightRadius: 0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  width: widthScreen * 0.75,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          'gender',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Radio(
                        value: 'male',
                        groupValue: genderType,
                        onChanged: (val) {
                          setState(
                            () {
                              genderType = val!;
                            },
                          );
                        },
                      ),
                      Text(
                        'Male',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Radio(
                        value: 'female',
                        groupValue: genderType,
                        onChanged: (val) {
                          setState(
                            () {
                              genderType = val!;
                            },
                          );
                        },
                      ),
                      Text(
                        'Female',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: CustomButton(
                  onPressed: () {},
                  text: Text(
                    'Continue',
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
