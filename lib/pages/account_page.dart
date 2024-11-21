import 'package:flutter/material.dart';
import 'package:flutter_consume_api/widgets/custom_app_bar.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ! Mediaquery
    final screenHorizontal = MediaQuery.of(context).size.width;
    final screenVertical = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const CustomAppBar(
        centerTile: false,
        color: Colors.transparent,
        widget: Text("Account"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenHorizontal * 0.03),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ? Identitas
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      // ? Identitas
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              CircleAvatar(
                                radius: 35,
                                child: Icon(
                                  Icons.account_box_outlined,
                                  color: Color.fromARGB(255, 29, 190, 153),
                                  size: 35,
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.account_box_outlined,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "Emilys",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.wallet,
                                        color: Colors.blue,
                                      ),
                                      SizedBox(width: 5),
                                      Text("Rp0 * 0 Coins"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.attach_money,
                                      ),
                                      SizedBox(width: 5),
                                      Text("Rp.0"),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/accountDetail");
                            },
                            icon: const Icon(
                              Icons.settings_suggest_outlined,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      // ? Card Banner
                      const SizedBox(height: 10),
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.storefront_outlined,
                                  color: Colors.greenAccent,
                                  size: 30,
                                ),
                                const SizedBox(width: 10),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Diskon 85% buat langganan PLUS",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text("Spesial buatmu, penawaran terbatas"),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.keyboard_arrow_right,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // ? Buka Toko & Daftar Affiliate
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Buka Toko",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.arrow_right),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Daftar Affiliate",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.arrow_right),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // ? Etc Menu
              const SizedBox(height: 10),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.storefront_outlined,
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Daftar Transaksi",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Row(
                                children: [
                                  Icon(
                                    Icons.rate_review_outlined,
                                    size: 30,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Ulasan",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_right,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenVertical * 0.1,
                            width: screenHorizontal * 1.0,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                // Generate stars
                                List<Icon> stars = List.generate(
                                  5,
                                  (starIndex) => Icon(
                                    Icons.star,
                                    color: starIndex < 4
                                        ? const Color.fromARGB(
                                            255, 248, 225, 22)
                                        : Colors.grey,
                                  ),
                                );

                                return Card(
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          index == 0
                                              ? Icons.coffee
                                              : index == 1
                                                  ? Icons.phone_android
                                                  : Icons.storage,
                                          size: 30,
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              index == 0
                                                  ? " Kopi Aming"
                                                  : index == 1
                                                      ? " Samsung S24 8/256"
                                                      : " Seagate HDD 1TB",
                                              style: const TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                            Row(
                                              children: stars,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        children: [
                          Icon(
                            Icons.add_shopping_cart_outlined,
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Beli Lagi",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        children: [
                          Icon(
                            Icons.favorite_outline,
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Wishlist",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        children: [
                          Icon(
                            Icons.add_home_work_outlined,
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Toko yang di Follow",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // ? Help
              const SizedBox(height: 10),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.warning_amber_outlined,
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Pesanan di Komplain",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.help_outline,
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Bantuan TokoSiDia Care",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.qr_code_scanner_outlined,
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Scan Kode QR",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // ? Log Out
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    "/login",
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  fixedSize: Size(screenHorizontal * 0.9, 40),
                  backgroundColor: Colors.greenAccent,
                ),
                child: const Text(
                  "Keluar",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
