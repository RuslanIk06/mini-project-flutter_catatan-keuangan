import 'package:catatan_keuangan/pages/create_transaction_page.dart';
import 'package:catatan_keuangan/widgets/list_transaksi.dart';
import 'package:catatan_keuangan/providers/provider_transaksi.dart';
import 'package:catatan_keuangan/styles/colors_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/testing";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              color: greenColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 60),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Hi Ruslan",
                    style: TextStyle(color: whiteColor, fontSize: 24),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: ListTrabsaksi(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CreateTransaction.routeName);
        },
        child: const Icon(Icons.add),
        backgroundColor: greenColor,
      ),
    );
  }
}
