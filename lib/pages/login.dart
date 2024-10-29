import 'package:flutter/material.dart';
import 'package:vezzeta_clone/core/constants/colors.dart';
import 'package:vezzeta_clone/core/routes/routes_name.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> gb = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
                      "Sign In",
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Text("Don't have an account ? "),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, RoutesName.register);
                      },
                      child: Text(
                        " Sign up!",
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
                        input("Password*", passwordController,isPassword: true),
                      ],
                    )),
                Row(
                  children: [
                    Text(
                      "Forgot your Password?",
                      style: TextStyle(color: AppColor.purble),
                    ),
                  ],
                ),
                loginBtn(context),
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
          return check(value!);
        },
      ),
    );
  }

  InkWell loginBtn(BuildContext context) {
    return InkWell(
      child: Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: AppColor.blue),
        child: Center(
          child: Text(
            "Sign in",
            style: TextStyle(
              color: AppColor.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    onTap: () async {
      if (gb.currentState!.validate()) {
          Navigator.pushReplacementNamed(context, RoutesName.home);
      }
    },
    );
  }

  String? check(String value) {
    return value.isEmpty ? "Please enter text" : null;
  }
}
