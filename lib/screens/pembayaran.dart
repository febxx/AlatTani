import 'package:alat_tani/constant.dart';
import 'package:alat_tani/maps.dart';
import 'package:alat_tani/models/produk.dart';
import 'package:flutter/material.dart';

import '../components/produk.dart';

class PembayaranPage extends StatelessWidget {
  const PembayaranPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final List<Produk> produks = [
      Produk(
        gambar: "assets/images/traktor/1.png",
        nama: "Motozappa Honda serie FG",
        harga: "Rp. 300.000",
        jumlah: "1",
        total: "1"
      ),
      Produk(
        gambar: "assets/images/traktor/2.png",
        nama: "Motozappa A Scoppio Bertolini 215",
        harga: "Rp. 500.000",
        jumlah: "1",
        total: "1"
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          "Pembayaran", 
          style: TextStyle(
           color: Colors.white
          ),
        ),
        centerTitle: true,
        backgroundColor: backgroundColor,
        elevation: 2,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(10, 7.5, 10, 7.5),
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.07,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: buttonColor
            ),
            child: Row(
              children: [
                const Text(
                  "Alamat Pengiriman",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.42,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) {
                      return const MapSample();
                    }));
                  },
                  icon: const Icon(
                    Icons.add_location_sharp,
                    color: backgroundColor,
                  ),
                ),
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.fromLTRB(10, 7.5, 10, 7.5),
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.07,
            // color: Colors.amber,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: buttonColor
            ),
            child: Row(
              children: [
                const Text(
                  "Catatan Pembelian(Opsional)",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.27,
                ),
                const Icon(
                  Icons.note_add,
                  color: backgroundColor,
                ),
              ],
            ),
          ),
          
          Container(
            margin: const EdgeInsets.fromLTRB(10, 7.5, 10, 7.5),
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            width: size.width * 1,
            height: size.height * .65,
            // color: Colors.amber,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: buttonColor
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(5, 15, 5, 10),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  height: size.height * .26,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: backgroundColor
                  ),
                  child: ListView.builder(
                    itemCount: produks.length,
                    itemBuilder: (context, index) =>
                        ProdukWidget(produk: produks[index])
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  height: size.height * .05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: backgroundColor
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Subtotal(${produks.length} Produk)",
                        style: const TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      const Text(
                        "Total",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  height: size.height * .05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: backgroundColor
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        "METODE PEMBAYARAN",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.keyboard_arrow_right_rounded),
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: backgroundColor
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Subtotal(${produks.length} Produk)",
                            style: const TextStyle(fontSize: 15, color: Colors.white),
                          ),
                          const Text(
                            "Total",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Biaya Pengiriman",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                          Text(
                            "Total",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Voucher",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                          Text(
                            "Total",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Total Pembayaran",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                          Text(
                            "Total",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: backgroundColor,
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: const Center(
                      child: Text(
                        "BAYAR",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
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
