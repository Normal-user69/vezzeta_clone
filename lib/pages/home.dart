import 'package:flutter/material.dart';
import 'package:vezzeta_clone/components/available_doctor_card.dart';
import 'package:vezzeta_clone/components/custom_app_bar.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:vezzeta_clone/components/heightlight.dart';
// import 'package:vezzeta_clone/components/rating.dart';
// import 'package:vezzeta_clone/components/section_title.dart';
import 'package:vezzeta_clone/models/AvailableDoctor.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const CustomAppBar(text: "Home Page", title: "home")),
      body: 
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                demoAvailableDoctors.length,
                (index) {
                  return AvailableDoctorCard(info: demoAvailableDoctors[index]);
                },
              ),
            ),
          ),
          // const Rating(score: 50),
          // AvailableDoctorCard(info: demoAvailableDoctors.first),
    );
  }
}
