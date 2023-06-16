import 'package:alat_tani/components/detail.dart';
import 'package:alat_tani/constant.dart';
import 'package:flutter/material.dart';

import '../maps.dart';
import '../components/card.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<Map<String, dynamic>> produks = [
      {
        'gambar': "assets/images/traktor/1.png",
        'nama': "Motozappa Honda serie FG",
        'deskripsi': "Mesin pertanian multifungsi yang dirancang khusus untuk membantu pekerjaan pertanian seperti penggemburan tanah, penanaman, dan pemupukan.",
        'harga': "Rp. 300.000",
      },
      {
        'gambar': "assets/images/traktor/2.png",
        'nama': "Motozappa A Scoppio Bertolini 215",
        'deskripsi': "Sangat cocok digunakan untuk petani atau pengusaha kecil yang memiliki lahan pertanian atau kebun yang membutuhkan perawatan. Mesin ini mudah digunakan, hemat bahan bakar, dan dapat bekerja dengan efisien dan efektif.",
        'harga': "Rp. 500.000",
      },
      {
        'gambar': "assets/images/traktor/3.png",
        'nama': "Güde Benzin Motoreinachser",
        'deskripsi': "Mesin pemotong rumput atau alat pemangkas tanaman yang menggunakan tenaga mesin bensin. Mesin ini dirancang dan diproduksi oleh perusahaan Jerman, Güde, dan umumnya digunakan untuk merapikan kebun, taman, atau area terbuka lainnya dengan cepat dan efektif.",
        'harga': "Rp. 500.000",
      },
      {
        'gambar': "assets/images/traktor/1.png",
        'nama': "Motozappa Honda serie FG",
        'deskripsi': "Mesin pertanian multifungsi yang dirancang khusus untuk membantu pekerjaan pertanian seperti penggemburan tanah, penanaman, dan pemupukan.",
        'harga': "Rp. 300.000",
      },
      {
        'gambar': "assets/images/traktor/2.png",
        'nama': "Motozappa A Scoppio Bertolini 215",
        'deskripsi': "Sangat cocok digunakan untuk petani atau pengusaha kecil yang memiliki lahan pertanian atau kebun yang membutuhkan perawatan. Mesin ini mudah digunakan, hemat bahan bakar, dan dapat bekerja dengan efisien dan efektif.",
        'harga': "Rp. 500.000",
      },
      {
        'gambar': "assets/images/traktor/3.png",
        'nama': "Güde Benzin Motoreinachser",
        'deskripsi': "Mesin pemotong rumput atau alat pemangkas tanaman yang menggunakan tenaga mesin bensin. Mesin ini dirancang dan diproduksi oleh perusahaan Jerman, Güde, dan umumnya digunakan untuk merapikan kebun, taman, atau area terbuka lainnya dengan cepat dan efektif.",
        'harga': "Rp. 500.000",
      },
    ];

    List<Widget> produkCardsWidgets = produks.map((produk) {
      return ProdukCard(
        size: size,
        gambar: produk['gambar'],
        nama: produk['nama'],
        press: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return DetailProduk(
              nama: produk['nama'],
              gambar: produk['gambar'],
              deskripsi: produk['deskripsi'],
              harga: produk['harga'],
            );
          }));
        },
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: size.width * 1,
          padding: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(9.5),
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: "Search",
              icon: Icon(Icons.search),
              border: InputBorder.none,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return const MapSample();
                  },
                ),
              );
            },
            icon: const Icon(Icons.location_on_outlined),
            color: Colors.white,
          ),
        ],
        backgroundColor: backgroundColor,
        elevation: 2,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: .80,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: produkCardsWidgets
                ),
              ),
            ],
          ),
        ),
      ),
    );
    //
  }

}