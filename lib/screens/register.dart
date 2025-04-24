import 'package:alat_tani/constant.dart';
import 'package:alat_tani/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:alat_tani/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
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
            const Text(
              "Selamat Datang",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            const Text(
              "Silahkan Buat Akunmu",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white
              ),
            ),
            const SizedBox(
              height: 40,
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
                  hintText: "Username",
                  icon: Icon(
                    Icons.account_circle,
                    color: backgroundColor,
                  ),
                  border: InputBorder.none
                ),
                controller: usernameController,
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
                decoration: const InputDecoration(
                  hintText: "Alamat",
                  icon: Icon(
                    Icons.house,
                    color: backgroundColor,
                  ),
                  border: InputBorder.none
                ),
                controller: alamatController,
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
                decoration: const InputDecoration(
                  hintText: "Email",
                  icon: Icon(
                    Icons.email,
                    color: backgroundColor,
                  ),
                  border: InputBorder.none
                ),
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
                controller: passwordController,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => register(
                context,
                usernameController.text,
                alamatController.text,
                emailController.text,
                passwordController.text,
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 70),
                backgroundColor: buttonColor
              ),
              child: const Text(
                'Daftar',
                style: TextStyle(fontSize: 20, color: Colors.black)
              )
            ),
          ],
        ),
      ),
    );
  }

  void register(BuildContext context, String username, String alamat, String email, String password) async {
    if (username.isEmpty || alamat.isEmpty || email.isEmpty || password.isEmpty) {
      var snackBar = const SnackBar(
        duration: Duration(seconds: 5),
        content: Text("Lengkapi data."),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    } else {
      // try {
      //   await FirebaseAuth.instance
      //     .createUserWithEmailAndPassword(email: email, password: password)
      //     .then((uid) => {
      //       Navigator.push(context, MaterialPageRoute(builder: (_) {
      //         return const LoginPage();
      //       }))
      //     });
      // } catch (e) {
      //   print(e);
      // }

      final data = Users(
        username: username, 
        alamat: alamat, 
        email: email, 
        password: password
      );

      final docData = FirebaseFirestore.instance.collection("users").doc();
      print(docData.id);
      data.id = docData.id;
      final json = data.toJson();
      FirebaseFirestore.instance.collection("users").doc(docData.id).set(json).then((value) => print("User Added"));
      print(json);
    }
  }
}