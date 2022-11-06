import 'package:catatan_keuangan/pages/create_transaction_page.dart';
import 'package:catatan_keuangan/providers/provider_transaksi.dart';
import 'package:catatan_keuangan/styles/colors_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListTransaksiPemasukan extends StatefulWidget {
  const ListTransaksiPemasukan({super.key});

  @override
  State<ListTransaksiPemasukan> createState() => _ListTransaksiPemasukanState();
}

class _ListTransaksiPemasukanState extends State<ListTransaksiPemasukan> {
  @override
  Widget build(BuildContext context) {
    final trans = Provider.of<TransaksiProvider>(context).itemsTransaksi;
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        final transaksi = trans[index];
        if (transaksi.type == "Pemasukan") {
          return ListTile(
            leading: CircleAvatar(
              child: Image.asset(
                "assets/images/icon_in.png",
              ),
            ),
            title: Text(transaksi.categrory),
            subtitle: Text(transaksi.note),
            trailing: Column(
              children: [
                Text(
                  "Rp. ${transaksi.nominal.toString()}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  transaksi.waktu.toString(),
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
            onLongPress: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text('Delete Transaksi'),
                  content: Text(
                      'Are you sure want to delete transaction ${transaksi.id}?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Provider.of<TransaksiProvider>(context, listen: false)
                            .delete(transaksi.id!);
                        Navigator.pop(ctx);
                      },
                      child: const Text('Sure'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: const Text('Cancel'),
                    ),
                  ],
                ),
              );
            },
            onTap: () {
              Navigator.of(context)
                  .pushNamed(CreateTransaction.routeName, arguments: transaksi);
            },
          );
        }
        return Text("Error");
      },
      itemCount: trans.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
