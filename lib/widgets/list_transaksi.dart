import 'package:catatan_keuangan/providers/provider_transaksi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListTrabsaksi extends StatefulWidget {
  const ListTrabsaksi({super.key});

  @override
  State<ListTrabsaksi> createState() => _ListTrabsaksiState();
}

class _ListTrabsaksiState extends State<ListTrabsaksi> {
  @override
  Widget build(BuildContext context) {
    final trans = Provider.of<TransaksiProvider>(context).itemsTransaksi;
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        final transaksi = trans[index];
        return ListTile(
          title: Row(
            children: [
              Text(transaksi.type),
              const Text(" - "),
              Text(transaksi.nominal.toString())
            ],
          ),
          subtitle: Text(transaksi.note),
          trailing: Text(
            transaksi.waktu.toString(),
            style: TextStyle(fontSize: 10),
          ),
        );
      },
      itemCount: trans.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
