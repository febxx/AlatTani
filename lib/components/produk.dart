import 'package:flutter/material.dart';

import '../models/produk.dart';


class ProdukWidget extends StatelessWidget {
  const ProdukWidget({required this.produk, Key? key}) : super(key: key);

  final Produk produk;

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: MediaQuery.of(context).size.width * 0.2,
          height: MediaQuery.of(context).size.height * 0.11,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
                image: AssetImage(produk.gambar), fit: BoxFit.cover
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(produk.nama, style: const TextStyle(color: Colors.white, fontSize: 13),),
            Row(
              children: [
                Text(
                  produk.total,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(width: 10,),
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5), color: Colors.green),
                  child: Text(
                    "x${produk.jumlah}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
