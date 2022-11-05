import 'dart:ffi';

import 'package:catatan_keuangan/models/transaksi.dart';
import 'package:catatan_keuangan/providers/provider_transaksi.dart';
import 'package:catatan_keuangan/styles/colors_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateTransaction extends StatefulWidget {
  static const routeName = '/create_transaction';
  const CreateTransaction({super.key});

  @override
  State<CreateTransaction> createState() => _CreateTransactionState();
}

class _CreateTransactionState extends State<CreateTransaction>
    with TickerProviderStateMixin {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var transaksi = {
    'type': '',
    'category': '',
    'nominal': 0,
    'note': '',
    'waktu': ''
  };
  final TextEditingController _ctrlNominal = TextEditingController();
  final TextEditingController _ctrlNote = TextEditingController();
  final TextEditingController _ctrlCategory = TextEditingController();
  Transaksi? updateTransaksi;

  List<String> kategori = [
    'Gaji',
    'Tunjangan',
    'Hadiah',
    'Uang Masuk',
    'Makan dan Minum',
    'Transportasi',
    'Sedekah',
    'Sewa / Kontrak',
    'Pendidikan',
    'Investasi',
    'Uang Keluar',
  ];

  String _pilihanCategory = "Gaji";
  String _pilhanType = "";

  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();

  void _pilihType(String value) {
    setState(() {
      _pilhanType = value;
    });
  }

  void _onSubmit() {
    formKey.currentState!.save();
    final transaksiBaru = Transaksi(
        type: transaksi['type'].toString(),
        categrory: transaksi["categrory"].toString(),
        nominal: int.parse(transaksi['nominal'].toString()),
        note: transaksi["note"].toString());
    // tambahContact(transaksiBaru);
    if (updateTransaksi != null) {
      transaksiBaru.id = updateTransaksi!.id;
      Provider.of<TransaksiProvider>(context, listen: false)
          .update(transaksiBaru);
    } else {
      Provider.of<TransaksiProvider>(context, listen: false).add(transaksiBaru);
    }
  }

  @override
  Widget build(BuildContext context) {
    updateTransaksi = ModalRoute.of(context)!.settings.arguments as Transaksi?;
    if (updateTransaksi != null) {
      _ctrlNominal.text = updateTransaksi!.nominal.toInt().toString();
      _ctrlNote.text = updateTransaksi!.note;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
            updateTransaksi != null ? 'Edit Transaksi' : 'Tambah Transaksi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // RadioListTile(
              //   value: "Pemasukan",
              //   groupValue: _pilhanType,
              //   title: Text("Pemaasukan"),
              //   onChanged: (value) {
              //     _pilhanType;
              //   },
              // ),
              Row(
                children: [
                  const Text("kategori Transaksi"),
                  const SizedBox(width: 20),
                  DropdownButton(
                    value: _pilihanCategory,
                    items: kategori.map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _pilihanCategory = value.toString();
                        transaksi['categrory'] = _pilihanCategory;
                      });
                    },
                  ),
                ],
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.money_off_outlined),
                  label: Text('Nominal'),
                  hintText: 'Masukan Nominal',
                ),
                validator: (value) {
                  if (value == null || value.length < 3) {
                    return 'Silahkan Masukan Nominal Dengan Benar';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) transaksi['nominal'] = newValue;
                },
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                controller: _ctrlNominal,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.note_add_rounded),
                  label: Text('Note'),
                  hintText: 'Detail transaksi',
                ),
                validator: (value) {
                  if (value == null || value.length < 3) {
                    return 'Silahkan Masukan Note Dengan Benar';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) transaksi['note'] = newValue;
                },
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                controller: _ctrlNote,
              ),
              const SizedBox(height: 26),
              Text("Date 1"),
              TextButton(
                  onPressed: () async {
                    final selectDate = await showDatePicker(
                      context: context,
                      initialDate: currentDate,
                      firstDate: DateTime(1990),
                      lastDate: DateTime(currentDate.year + 5),
                    );

                    setState(() {
                      if (selectDate != null) {
                        _dueDate = selectDate;

                        transaksi['waktu'] = _dueDate;
                      }
                    });
                  },
                  child: Text("Select")),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (formKey.currentState != null &&
                      formKey.currentState!.validate()) {
                    _onSubmit();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Saving Transaction...',
                        ),
                      ),
                    );
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
