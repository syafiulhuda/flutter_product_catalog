import 'package:flutter/material.dart';
import 'package:flutter_consume_api/widgets/custom_app_bar.dart';

class PesanView extends StatelessWidget {
  const PesanView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const CustomAppBar(
        widget: Text("Pesan"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ? Card 1
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "/chat",
                        );
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Icons.contact_mail_outlined,
                            size: 25,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Chat Penjual",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Icon(
                          Icons.message_outlined,
                          size: 25,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Diskusi Produk",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Icon(
                          Icons.star_outline,
                          size: 25,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Ulasan",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // ? Card 2
            const Card(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.notifications_outlined, size: 25),
                        SizedBox(width: 10),
                        Text(
                          "Notifikasi",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.info_outline_rounded),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Info"),
                              Text(
                                  "Horee! Satu Misi Seru baru saja kamu selesaikan ✅"),
                              Text(
                                "Ambil hadiahnya buat belanja dengan klik di sini sekarang 💕👌",
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Text("4 mnt"),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.info_outline_rounded),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Info"),
                              Text("Ulasanmu dibalas oleh penjual, lho!"),
                              Text(
                                "Terima kasih telah berbelanja di Toko Kami!. Jangan lupa follow Official Store kami untuk mendapatkan informasi dan promo menarik lainya",
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Text("3 jam"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // ? Selengkapnya
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                fixedSize: Size(screenWidth * 0.9, 40),
                elevation: 5,
              ),
              child: const Text(
                "Selengkapnya",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
