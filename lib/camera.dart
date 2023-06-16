import 'dart:io';
import 'package:alat_tani/constant.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  File? image;

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  Future pickCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
  }

  TextEditingController noteUlasan = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text('Ulasan', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * .35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: backgroundColor,
            ),
            child: Column(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.11,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        // color: Colors.white,
                        image: const DecorationImage(
                          image: AssetImage("assets/images/traktor/1.png"),
                          // fit: BoxFit.cover
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Motozappa Honda serie FG",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                      child: const Text("Berikan Ulasanmu",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: TextField(
                        // strutStyle: const StrutStyle(height: 5),
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        controller: noteUlasan,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(buttonColor),
                  ),
                  onPressed: () {
                    pickCamera();
                  },
                  child: const Text(
                    "Buka Kamera",
                    style: TextStyle(
                      color: Colors.black, 
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(buttonColor),
                  ),
                  onPressed: () {
                    pickImage();
                  },
                  child: const Text(
                    "Buka Galeri",
                    style: TextStyle(
                      color: Colors.black, 
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}