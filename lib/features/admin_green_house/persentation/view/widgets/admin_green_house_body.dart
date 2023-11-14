import 'package:flutter/material.dart';
import 'package:smart_agricultural_green_house/core/utils/customButtoms.dart';
import 'package:smart_agricultural_green_house/core/utils/custom_textform_field.dart';
import 'package:smart_agricultural_green_house/features/admin_green_house/persentation/view/widgets/bottom_sheet_add_planet.dart';
import 'package:smart_agricultural_green_house/features/admin_green_house/persentation/view_model/add_green_house_model.dart';

class AdminGreenHouseBody extends StatefulWidget {
  const AdminGreenHouseBody({Key? key}) : super(key: key);

  @override
  State<AdminGreenHouseBody> createState() => _AdminGreenHouseBodyState();
}

class _AdminGreenHouseBodyState extends State<AdminGreenHouseBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController = AnimationController(
    vsync: this, // the SingleTickerProviderStateMixin
    duration: Duration(seconds: 1),
  );

  List<AddGreenHouseModel> addPlanetList = [];

  DateTime dateTime = DateTime.now();



  AddGreenHouseModel planet = AddGreenHouseModel(greenHouseName: "aaa", planetSelected: "planetSelected", photo: "assets/on_boarding_images/smart-agriculture.jpg");


  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;

    void refresh(){
      setState(() {

      });
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          showModelBottomSheetPlanet(context, animationController,addPlanetList, refresh);
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  'Smart green house',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Agriculture is under control',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                height: heightScreen,
                child: ListView.builder(
                  itemCount: addPlanetList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                         /*   backgroundImage: AssetImage(
                              addPlanetList[index].photo,
                            ),*/
                          ),
                          title: Text(
                            addPlanetList[index].greenHouseName,
                          ),
                          subtitle: Text(
                            addPlanetList[index].planetSelected,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
