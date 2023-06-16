import 'package:alat_tani/components/ulasan.dart';
import 'package:alat_tani/constant.dart';
import 'package:flutter/material.dart';

class PembelianPage extends StatelessWidget {
  const PembelianPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Pembelian", style: TextStyle(color: Colors.white),),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            isScrollable: true, 
            tabs: [
              Tab(text: "Menunggu"),
              Tab(text: "Proses"),
              Tab(text: "Pengiriman"),
              Tab(text: "Ulasan"),
            ],
          ),
          elevation: 10,
          titleSpacing: 5,
          backgroundColor: backgroundColor,
        ),
        body: const TabBarView(
          children: [
            Center(child: Text("Belum ada pesanan")),
            Center(child: Text("Belum ada pesanan")),
            Center(child: Text("Belum ada pesanan")),
            UlasanPage(),
          ]
        ),
        // Text(
        //   "BELI",
        //   style: TextStyle(fontSize: 50),
        // ),
      ),
    );
  }
}