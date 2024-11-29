import 'package:flutter/material.dart';
import 'package:vezzeta_clone/components/available_doctor_card.dart';
import 'package:vezzeta_clone/components/custom_app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vezzeta_clone/components/section_title.dart';
import 'package:vezzeta_clone/core/constants/icons.dart';
// import 'package:vezzeta_clone/components/heightlight.dart';
// import 'package:vezzeta_clone/components/rating.dart';
// import 'package:vezzeta_clone/components/section_title.dart';
import 'package:vezzeta_clone/models/AvailableDoctor.dart';
import 'package:vezzeta_clone/models/Category.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:
       const CustomAppBar(text: "Home Page", title: "home")),
      body: 
          Column(
            children: [

            Column(
              children: [
                SectionTitle(title: "Catigories",
                 pressOnSeeAll: (){}),
                SizedBox(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        demo_categories.length,
                        (index) {
                          return Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                SvgPicture.asset(demo_categories[index].icon),
                                Text(demo_categories[index].title),
                              ],
                            ));
                        },
                      ),
                    ),
                  ),
              ],
            ),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    demoAvailableDoctors.length,
                    (index) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        child: AvailableDoctorCard(info: demoAvailableDoctors[index]));
                    },
                  ),
                ),
              ),
            ],
          ),
            bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          // Navigate or handle logic based on the tapped index
          print("Tapped index: $index");
        },
        items:  [
          BottomNavigationBarItem(
            icon: AppIcons().home,
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: AppIcons().doctors,
            label: "Doctors",
          ),
          BottomNavigationBarItem(
            icon: AppIcons().appointment,
            label: "Appointments",
          ),
          BottomNavigationBarItem(
            icon: AppIcons().profile,
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
