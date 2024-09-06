import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsRoute {
  List<Map<String, dynamic>> settingAkun = [
    {
      "icon": const Icon(
        FontAwesomeIcons.locationDot,
        color: Colors.black,
        size: 20,
      ),
      "title": "Daftar Alamat",
      "subtitle": "Atur alamat pengiriman belanja",
    },
    {
      "icon": const Icon(
        FontAwesomeIcons.buildingColumns,
        color: Colors.black,
        size: 20,
      ),
      "title": "Rekening Bank",
      "subtitle": "Tarik Saldo TokoSiDia ke rekening tujuan",
    },
    {
      "icon": const Icon(
        FontAwesomeIcons.creditCard,
        color: Colors.black,
        size: 20,
      ),
      "title": "Pembayaran Instan",
      "subtitle": "E-wallet, kartu kredit, & debit instan terdaftar",
    },
    {
      "icon": const Icon(
        FontAwesomeIcons.lock,
        color: Colors.black,
        size: 20,
      ),
      "title": "Keamanan Akun",
      "subtitle": "Kata sandi, PIN, & verifikasi data diri",
    },
    {
      "icon": const Icon(
        FontAwesomeIcons.bell,
        color: Colors.black,
        size: 20,
      ),
      "title": "Notifikasi",
      "subtitle": "Atur segala jenis pesan notifikasi",
    },
    {
      "icon": const Icon(
        FontAwesomeIcons.userGear,
        color: Colors.black,
        size: 20,
      ),
      "title": "Privasi Akun",
      "subtitle": "Atur penggunaan data",
    },
  ];
}
