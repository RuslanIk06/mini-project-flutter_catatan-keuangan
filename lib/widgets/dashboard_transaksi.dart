import 'package:catatan_keuangan/pages/catatan_page.dart';
import 'package:catatan_keuangan/pages/create_transaction_page.dart';
import 'package:catatan_keuangan/pages/form_catatan_page.dart';
import 'package:catatan_keuangan/providers/provider_transaksi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../styles/colors_style.dart';

class DashboardTransaksi extends StatefulWidget {
  const DashboardTransaksi({super.key});

  @override
  State<DashboardTransaksi> createState() => _DashboardTransaksiState();
}

class _DashboardTransaksiState extends State<DashboardTransaksi> {
  @override
  Widget build(BuildContext context) {
    final transaksiMasuk =
        Provider.of<TransaksiProvider>(context).getTotalIncome();
    final transaksiKeluar =
        Provider.of<TransaksiProvider>(context).getTotalExpnse();
    final selisihTransaksi =
        Provider.of<TransaksiProvider>(context).getTotalDifference();

    return Container(
      width: double.infinity,
      height: 275,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
        color: greenColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "Hi Ruslan !",
                  style: TextStyle(
                      color: whiteColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, FormCatatan.routeName);
                      },
                      icon: const Icon(
                        Icons.notifications,
                        color: whiteColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Catatanpage.routeName);
                      },
                      icon: const Icon(
                        Icons.note,
                        color: whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Total Income",
                      style: TextStyle(
                          color: whiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Rp. ${transaksiMasuk}",
                      style: const TextStyle(
                          color: whiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      "Total Expense",
                      style: TextStyle(
                          color: whiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Text(
                      "Rp. ${transaksiKeluar}",
                      style: const TextStyle(
                          color: redColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: Text(
                    "Transaction Difference",
                    style: TextStyle(
                        color: whiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Text(
                    "Rp. ${selisihTransaksi}",
                    style: const TextStyle(
                        color: whiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
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
