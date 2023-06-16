import 'package:flutter/material.dart';

import 'login.dart';
import '../constant.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: [
            const Text(
              "Terima kasih",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            const Text(
              "telah bergabung",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            const Text(
              "dengan kami",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/logo.png"),
                  fit: BoxFit.fill
                ),
              ),
              // child: Image(image: AssetImage("assets/images/Logo.png")),
            ),
            const SizedBox(
              height: 40,
            ),
            // const SizedBox(
            //   height: 40,
            // ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return const LoginPage();
                }));
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 70),
                backgroundColor: buttonColor
              ),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 20, color: Colors.black)
              )
            ),
          ]
        ),
      ),
    );
  }
}
