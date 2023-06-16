import 'package:alat_tani/constant.dart';
import 'package:alat_tani/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController usernameController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Container(),
      body: SingleChildScrollView(
        child: StreamBuilder<List<Users>>(
          stream: readData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Ada Kesalahan! ${snapshot.hasError}");
            } else if (snapshot.hasData) {
              final datas = snapshot.data!;
              return Column(children: datas.map(buildData).toList(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      )
    );
  }
}

Stream<List<Users>> readData() => FirebaseFirestore.instance
    .collection("users")
    .where("email", isEqualTo: FirebaseAuth.instance.currentUser!.email!)
    .snapshots()
    .map((snapshots) =>
        snapshots.docs.map((doc) => Users.fromJson(doc.data())).toList());

Widget buildData(Users data) => Container(
  margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
  // margin: const EdgeInsets.fromLTRB(0, 2, 10, 5),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const SizedBox(
        height: 20,
      ),
      Text(
        "Hai, ${data.username}", 
        style: const TextStyle(
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(
        height: 70,
      ),
      const Text(
        "Username",
        style: TextStyle(fontSize: 16),
      ),
      Container(
        padding: const EdgeInsets.only(top: 10, left: 5),
        decoration: const BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        height: 40,
        width: 250,
        child: Text(data.username, style: const TextStyle(color: Colors.white),),
      ),
      const SizedBox(height: 10,),
      const Text(
        "Email",
        style: TextStyle(fontSize: 16),
      ),
      Container(
        padding: const EdgeInsets.only(top: 10, left: 5),
        decoration: const BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        height: 40,
        width: 250,
        child: Text(data.email, style: const TextStyle(color: Colors.white),),
      ),
      const SizedBox(height: 10,),
      const Text(
        "Alamat",
        style: TextStyle(fontSize: 16),
      ),
      Container(
        padding: const EdgeInsets.only(top: 10, left: 5),
        decoration: const BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        height: 40,
        width: 250,
        child: Text(data.alamat, style: const TextStyle(color: Colors.white),),
      ),
    
    ],
  ),
);