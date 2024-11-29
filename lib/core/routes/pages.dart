import 'package:flutter/material.dart';
import 'package:vezzeta_clone/core/routes/routes_name.dart';
import 'package:vezzeta_clone/pages/home.dart';
import 'package:vezzeta_clone/pages/login.dart';
import 'package:vezzeta_clone/pages/register.dart';
import 'package:vezzeta_clone/pages/splash.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AppRoute {
  static Route<dynamic> generate(RouteSettings? settings) {
    switch (settings?.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (_) {
          return const Splash();
        });

      //Replace With Home
      case RoutesName.login:
        return MaterialPageRoute(builder: (_) {
          return const Login();
        });
      case RoutesName.register:
        return MaterialPageRoute(builder: (_) {
          return const Register();
        });
      case RoutesName.home:
        return MaterialPageRoute(builder: (_) {
          return const Home();
        });

      default:
        return MaterialPageRoute(builder: (_) {
          return const UnderDev();
        });
    }
  }
}

class UnderDev extends StatelessWidget {
  const UnderDev({super.key});

  @override
  Widget build(BuildContext context) {
    String img = "https://media.istockphoto.com/id/1410983127/vector/under-construction-sign-and-label.jpg?s=612x612&w=0&k=20&c=8Ft81am5L7o1AAZ7SDPn3gi51ur_7cfrlU2au4_bptM=";
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 400,
              height: 400,
              child: CachedNetworkImage(
                imageUrl: img,
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const Text("Under Construction"),
          ],
        ),
      ),
    );
  }
}
