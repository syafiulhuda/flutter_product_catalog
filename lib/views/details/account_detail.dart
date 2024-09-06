import 'package:flutter/material.dart';
import 'package:flutter_consume_api/routes/settings_route.dart';
import 'package:flutter_consume_api/widgets/custom_app_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountDetail extends StatelessWidget {
  const AccountDetail({super.key});

  @override
  Widget build(BuildContext context) {
    // ! Mediaquery
    final screenHorizontal = MediaQuery.of(context).size.width;

    // ! Mapping Pengaturan Akun
    List<Map<String, dynamic>> settings = SettingsRoute().settingAkun;

    return Scaffold(
      appBar: const CustomAppBar(
        centerTile: false,
        color: Colors.transparent,
        widget: Text("Akun Saya"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenHorizontal * 0.03),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ? Identitas
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 35,
                        child: Icon(
                          Icons.account_box_outlined,
                          color: Color.fromARGB(255, 29, 190, 153),
                          size: 35,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Emilys",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const Text(
                            "081XXXXXXXXX",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Card(
                            shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            color: Colors.green,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 5.0,
                                horizontal: 3.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.userPlus,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Sambungin Akunmu",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const FaIcon(
                    FontAwesomeIcons.pencil,
                    size: 25,
                  ),
                ],
              ),
              // ? Coba Plus
              const SizedBox(height: 10),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 5.0,
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
              ),
              // ? Saldo & points
              const SizedBox(height: 10),
              Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Saldo & Points",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "Lihat semua",
                        style: TextStyle(
                          color: Color.fromARGB(255, 37, 138, 42),
                        ),
                      ),
                    ],
                  ),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 5.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.wallet,
                                color: Colors.blue,
                              ),
                              SizedBox(height: 5),
                              Text("Rp. 0"),
                              Text("Top-Up Saldo"),
                            ],
                          ),
                          // Divider di sini
                          VerticalDivider(
                            color: Colors.black, // Warna hitam
                            thickness: 2, // Ketebalan divider
                            width: 20, // Lebar spacer antar kolom
                          ),
                          Column(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.qrcode,
                                color: Colors.green,
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Daftar Sekarang",
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                              ),
                              Text("TokoSiDia Card"),
                            ],
                          ),
                          // Divider di sini
                          VerticalDivider(
                            color: Colors.black, // Warna hitam
                            thickness: 2, // Ketebalan divider
                            width: 20, // Lebar spacer antar kolom
                          ),
                          Column(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.moneyBill,
                                color: Colors.green,
                              ),
                              SizedBox(height: 5),
                              Text("Rp. 0"),
                              Text("Saldo TokoSiDia"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // ? Pengaturan Akun
              const SizedBox(height: 10),
              Column(
                children: settings.map((item) {
                  return ListTile(
                    leading: item["icon"],
                    title: Text(item["title"]),
                    subtitle: Text(item["subtitle"]),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
