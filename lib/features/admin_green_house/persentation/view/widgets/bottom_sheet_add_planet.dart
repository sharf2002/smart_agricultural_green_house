import 'package:flutter/material.dart';
import 'package:smart_agricultural_green_house/core/utils/customButtoms.dart';
import 'package:smart_agricultural_green_house/core/utils/custom_textform_field.dart';
import 'package:smart_agricultural_green_house/features/admin_green_house/persentation/view_model/add_green_house_model.dart';






List planets = [
  'tea',
  'mint',
  'flower',
];


void showModelBottomSheetPlanet(
    BuildContext context,
    AnimationController animationController,
    List<AddGreenHouseModel> addPlanetList,
    Function() refresh ,

    ) {


  double widthScreen = MediaQuery.of(context).size.width;
  double heightScreen = MediaQuery.of(context).size.height;

  TextEditingController houseNameController = TextEditingController();
  ExpansionTileController plantNameController = ExpansionTileController();

  AddGreenHouseModel planet = AddGreenHouseModel(greenHouseName: "aaa", planetSelected: "planetSelected", photo: "assets/on_boarding_images/smart-agriculture.jpg");

  showModalBottomSheet<void>(
    context: context,
    isDismissible: false,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: true,
    barrierColor: Colors.black.withOpacity(0.8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    constraints: BoxConstraints(
      maxHeight: 650,
    ),
    transitionAnimationController: animationController,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage(
                      'assets/on_boarding_images/smart-agriculture.jpg'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: CustomButton(
                  onPressed: () {},
                  text: Text(
                    'Upload Photo',
                    style: TextStyle(
                      color: Color(0xff39D2C0),
                    ),
                  ),
                  color: Colors.white,
                  width: widthScreen * 0.33,
                  height: heightScreen * 0.0474,
                  radius: 30,
                  borderColor: Color(0xffC1F802),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: CustomTextFormField(
                  onSaved: (value){

                  },
                  controller: houseNameController,
                  hintText: 'green house name',
                  bottomRightRadius: 0,
                  topRightRadius: 0,
                  suffixIcon: Icon(Icons.close),
                  prefixIcon: Icon(
                    Icons.text_fields_sharp,
                    color: Color(0xffDBEC0E),
                  ),
                  height: 60,
                ),

              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffE4E3E3),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      width: widthScreen * 0.5,
                      child: ExpansionTile(
                        controller: plantNameController,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: Color(0xffE4E3E3),
                        title: Text(
                          'Select Planet',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        children: [
                          Container(
                            height: 160,
                            child: ListView.builder(
                              itemCount: planets.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  onTap: () {
                                     planet.planetSelected = planets[index];
                                  },
                                  title: Text(planets[index]),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomButton(
                      onPressed: () {
                        planet.greenHouseName= houseNameController.text;
                        addPlanetList.add(planet);
                        refresh();
                        Navigator.pop(context);
                      },
                      text: Text(
                        'Add',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      color: Colors.white,
                      borderColor: Color(0xffC1F802),
                      width: widthScreen * 0.256,
                      height: heightScreen * 0.0474,
                      radius: 30,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      );
    },
  );
}
