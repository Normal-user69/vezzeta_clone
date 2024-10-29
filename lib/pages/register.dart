import 'package:flutter/material.dart';
import 'package:vezzeta_clone/core/constants/colors.dart';
import 'package:vezzeta_clone/core/routes/routes_name.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> gb = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool agreeToTerms = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Text("Already have an account? "),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, RoutesName.login);
                      },
                      child: Text(
                        " Sign in!",
                        style: TextStyle(color: AppColor.purble),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Form(
                  key: gb,
                  child: Column(
                    children: [
                      input("Email*", emailController),
                      input("Password*", passwordController, isPassword: true),
                      input("Confirm Password*", confirmPasswordController,
                          isPassword: true),
                      CheckboxListTile(
                        title: const Text("I agree to the terms and services"),
                        value: agreeToTerms,
                        onChanged: (bool? value) {
                          setState(() {
                            agreeToTerms = value ?? false;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ],
                  ),
                ),
                registerBtn(context),
              ],
            ),
          ),
          Container(),
        ],
      ),
    );
  }

  Container input(String txt, TextEditingController controller,
      {bool isPassword = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: txt,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        validator: (value) {
          return check(value!, txt);
        },
      ),
    );
  }

  InkWell registerBtn(BuildContext context) {
    return InkWell(
      child: Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: AppColor.blue),
        child: Center(
          child: Text(
            "Sign Up",
            style: TextStyle(
              color: AppColor.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
      onTap: () async {
        if (gb.currentState!.validate() && agreeToTerms) {
          Navigator.pushReplacementNamed(context, RoutesName.home);
        } else if (!agreeToTerms) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text("Please agree to the terms and services")),
          );
        }
      },
    );
  }

  String? check(String value, String fieldName) {
    if (value.isEmpty) {
      return "Please enter text";
    }
    if (fieldName == "Confirm Password*" && value != passwordController.text) {
      return "Passwords do not match";
    }
    return null;
  }
}
