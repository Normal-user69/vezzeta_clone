import 'package:flutter/material.dart';
import 'package:vezzeta_clone/core/constants/colors.dart';
import 'package:vezzeta_clone/core/routes/routes_name.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.blue,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 50,
            ),
            title(),
            btns(context),
          ],
        ),
      ),
    );
  }

  Text title() {
    return Text("Vezzeta Clone",
        style: TextStyle(
          fontSize: 30,
          color: AppColor.white,
          fontWeight: FontWeight.bold,
        ));
  }

  Column btns(BuildContext context){
    return Column(
      children: [
        btn("login",true , context),
        btn("register",false , context),
        Container(height: 50,),
      ],
    );
  }

  InkWell btn(String txt , bool fill , BuildContext context){
    return InkWell(
      child: Container(
        width: double.infinity,
        height: 50,
        margin:const EdgeInsets.all(16),
      
        decoration: _btnFill(fill),
      
        child: Center(
          child: Text(txt , style: TextStyle(
            color: AppColor.white,
            fontSize: 20,
          ),),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, RoutesName.login);
      },
    );

  }

  BoxDecoration _btnFill(bool fill){
    double radius = 8;
      if(!fill){
          return BoxDecoration(
        border: Border.all(color: AppColor.lightBlue),
        borderRadius: BorderRadius.circular(radius),
      );
      }
    return BoxDecoration(
        border: Border.all(color: AppColor.lightBlue),
        borderRadius: BorderRadius.circular(radius),
        color: AppColor.lightBlue
      );
}
}