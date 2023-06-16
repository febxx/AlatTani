import 'package:alat_tani/constant.dart';
import 'package:alat_tani/screens/home.dart';
import 'package:alat_tani/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/logo.png"),
                  fit: BoxFit.fill
                ),
              )
            ),
            const Text(
              "Selamat Datang",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            const Text(
              "Silahkan Login",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Email",
                  icon: Icon(
                    Icons.email,
                    color: backgroundColor,
                  ),
                  border: InputBorder.none
                ),
                onChanged: (value) {
                  setState(() {});
                },
                controller: emailController,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Password",
                  icon: Icon(
                    Icons.lock,
                    color: backgroundColor,
                  ),
                  border: InputBorder.none
                ),
                onChanged: (value) {
                  setState(() {});
                },
                controller: passwordController,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => login(
                context,
                emailController.text,
                passwordController.text,
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 70),
                backgroundColor: buttonColor
              ),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 20, color: Colors.black)
              )
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return const RegisterPage();
                    },
                  ),
                );
              },
              child: const Text(
                'Belum punya akun',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void login(BuildContext context, String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      var snackBar = const SnackBar(
        duration: Duration(seconds: 5),
        content: Text("Email dan password harus diisi"),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    } else {
      await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((uid) => {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const Home();
          }))
        });
    }
  }
}