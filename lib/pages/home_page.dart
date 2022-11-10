import 'package:catatan_keuangan/pages/catatan_page.dart';
import 'package:catatan_keuangan/pages/create_transaction_page.dart';
import 'package:catatan_keuangan/pages/form_catatan_page.dart';
import 'package:catatan_keuangan/providers/provider_transaksi.dart';
import 'package:catatan_keuangan/widgets/list_transaksi.dart';
import 'package:catatan_keuangan/components/styles/colors_style.dart';
import 'package:catatan_keuangan/widgets/list_transaksi_pemasukan.dart';
import 'package:catatan_keuangan/widgets/list_transaksi_pengeluran.dart';
import 'package:catatan_keuangan/widgets/dashboard_transaksi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/home";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const DashboardTransaksi(),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black.withOpacity(0.1),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: redColor,
                  ),
                  controller: tabController,
                  isScrollable: true,
                  labelPadding: EdgeInsets.symmetric(horizontal: 30),
                  tabs: const [
                    Tab(
                      child: Text(
                        "All Transaction",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Income",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Expense",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                ListTransaksi(),
                ListTransaksiPemasukan(),
                ListTransaksiPengeluaran()
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CreateTransaction.routeName);
        },
        child: Icon(Icons.add),
        backgroundColor: redColor,
      ),
    );
  }
}
