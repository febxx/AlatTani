import 'package:alat_tani/screens/keranjang.dart';
import 'package:alat_tani/screens/pembayaran.dart';
import 'package:flutter/material.dart';
import 'package:alat_tani/constant.dart';

class DetailProduk extends StatelessWidget {
  final String nama;
  final String gambar;
  final String deskripsi;
  final String harga;

  const DetailProduk({
    Key? key,
    required this.nama,
    required this.gambar,
    required this.deskripsi,
    required this.harga,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail Produk",
          style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.bold,
            color: Colors.black
          )
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xff00B3D8)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            Text(
              nama,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),
            Container(
              height: height * 0.20,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(gambar),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            SizedBox(
              width: width * 0.8,
              child: Text(
                deskripsi,
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: width * 0.8,
              child: Text(
                "Harga: $harga",
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  width: width * .3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => KeranjangPage()));
                    },
                    child: const Text(
                      "Keranjang", 
                      style: TextStyle(color: Colors.white),),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  width: width * .3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PembayaranPage()));
                    },
                    child: const Text("Beli", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
