import 'package:alat_tani/constant.dart';
import 'package:alat_tani/screens/pembayaran.dart';
import 'package:flutter/material.dart';

class KeranjangPage extends StatefulWidget {
  const KeranjangPage({super.key});

  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: backgroundColor,
        title: const Text(
          'KERANJANG',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: CheckoutPage(),
    );
  }
}

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    ];
    
    var size = MediaQuery.of(context).size;

    List<Widget> checkoutCardsWidgets = produks.map((produk) {
      return CheckoutCard(
        size: size,
        gambar: produk['gambar'],
        nama: produk['nama'],
        harga: produk['harga'],
      );
    }).toList();

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 15, right: 20, left: 20),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            color: const Color(0xFFFBF3F3),
            child: Column(
              children: [
                const Row(
                  children: <Widget>[
                    Icon(Icons.check_box),
                    SizedBox(width: 10,),
                    Text("Pilih Semua"),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: checkoutCardsWidgets,
                ),
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: buttonColor,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return PembayaranPage();
                      }));
                    },
                    child: const Center(
                      child: Text(
                        "Checkout Sekarang",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CheckoutCard extends StatefulWidget {
  final String nama;
  final String gambar;
  final String harga;

  // final VoidCallback setstate;
  // final VoidCallback press;
  const CheckoutCard({
    Key? key,
    required this.size,
    required this.gambar,
    required this.nama,
    required this.harga,
    // required this.setstate,
    // required this.press,
  }) : super(key: key);

  final Size size;

  @override
  State<CheckoutCard> createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      width: widget.size.width * 3,
      height: 110,
      // color: Colors.amber,
      child: Row(
        children: [
          const Icon(Icons.check_box_sharp),
          Container(
            width: 100,
            // width: size.width * .3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.gambar),
              ),
            ),
          ),
          // Spacer(),
          Container(
            decoration: BoxDecoration(border: Border.all(width: 2)),
            width: widget.size.width * .5,
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.nama,
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontSize: 13),
                  ),
                  Text(
                    "Rp15.000",
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontSize: 13),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        onPressed: add,
                        icon: const Icon(Icons.add_circle
                            // color: Colors.white,
                            ),
                      ),
                      Container(
                        color: Colors.white,
                        // width: widget.size.width * .1,
                        child: Text(
                          '$_n',
                          style: const TextStyle(fontSize: 15.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      IconButton(
                        onPressed: minus,
                        icon: const Icon(Icons.remove_circle
                            // color: Colors.white,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  int _n = 0;

  void minus() {
    setState(() {
      if (_n != 0) _n--;
    });
  }

  void add() {
    setState(() {
      _n++;
    });
  }
}