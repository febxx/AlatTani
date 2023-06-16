import 'package:flutter/material.dart';
import 'package:alat_tani/constant.dart';

class ProdukCard extends StatelessWidget {
  final String gambar;
  final String nama;
  final VoidCallback press;
  
  const ProdukCard({
    Key? key,
    required this.size,
    required this.gambar,
    required this.nama,
    required this.press,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        // margin: EdgeInsets.only(top: 10),
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: backgroundColor,
          // color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
              color: Color(0xFFE6E6E6),
            ),
          ]
        ),
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: SizedBox(
              height: size.height * .30,
              child: Column(
                children: [
                  const Spacer(),
                  Container(
                    height: size.height * 0.12,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(gambar),
                        // fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Text(
                    nama,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12
                    ),
                  ),
                  InkWell(
                    onTap: press,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(5, 8, 5, 0),
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      width: size.width * .9,
                      height: size.height * .035,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "Detail",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}