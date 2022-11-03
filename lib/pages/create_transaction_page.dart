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
  // GlobalKey formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyPemasukan = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyPengeluaran = GlobalKey<FormState>();
  var transaksi = {'type': '', 'category': '', 'nominal': 0, 'note': ''};

  List<String> kategoriPemasukan = [
    'Gaji',
    'Tunjangan',
    'Hadiah',
    'Uang Masuk'
  ];

  List<String> kategoriPengeluaran = [
    'Makan dan Minum',
    'Transportasi',
    'Sedekah',
    'Sewa / Kontrak',
    'Pendidikan',
    'Investasi',
    'Uang Keluar',
  ];

  String _pilihanCategoryPemasukan = "Gaji";
  String _pilihanCategoryPengeluaran = "Sedekah";

  void _onSubmit() {
    formKeyPemasukan.currentState!.save();
    final transaksiBaru = Transaksi(
        type: transaksi['type'].toString(),
        categrory: transaksi["categrory"].toString(),
        nominal: int.parse(transaksi['nominal'].toString()),
        note: transaksi["note"].toString());
    // tambahContact(transaksiBaru);

    Provider.of<TransaksiProvider>(context, listen: false).add(transaksiBaru);
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Transaksi"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: blackColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: greenColor,
                  ),
                  controller: tabController,
                  isScrollable: true,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 30),
                  tabs: const [
                    Tab(
                      child: Text("Pemasukan",
                          style: TextStyle(color: blackColor)),
                    ),
                    Tab(
                      child: Text("Pengeluaran",
                          style: TextStyle(color: blackColor)),
                    ),
                    Tab(
                      child:
                          Text("Laporan", style: TextStyle(color: blackColor)),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  Form(
                    key: formKeyPemasukan,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("kategori Transaksi"),
                            SizedBox(width: 20),
                            DropdownButton(
                              value: _pilihanCategoryPemasukan,
                              items: kategoriPemasukan
                                  .map((String valuePemasukan) {
                                return DropdownMenuItem(
                                  value: valuePemasukan,
                                  child: Text(valuePemasukan),
                                );
                              }).toList(),
                              onChanged: (String? valuePemasukan) {
                                setState(() {
                                  _pilihanCategoryPemasukan =
                                      valuePemasukan.toString();
                                  transaksi['categrory'] =
                                      _pilihanCategoryPemasukan;
                                });
                              },
                            ),
                          ],
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person),
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
                            if (newValue != null)
                              transaksi['nominal'] = newValue;
                          },
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person),
                            label: Text('Note'),
                            hintText: 'Detail transaksi',
                          ),
                          validator: (value) {
                            if (value == null || value.length < 3) {
                              return 'Silahkan Masukan Nominal Dengan Benar';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            if (newValue != null) transaksi['note'] = newValue;
                          },
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: formKeyPengeluaran,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("kategori Transaksi"),
                            SizedBox(width: 20),
                            DropdownButton(
                              value: _pilihanCategoryPengeluaran,
                              items: kategoriPengeluaran
                                  .map((String valuePengeluaran) {
                                return DropdownMenuItem(
                                  value: valuePengeluaran,
                                  child: Text(valuePengeluaran),
                                );
                              }).toList(),
                              onChanged: (String? valuePengeluaran) {
                                setState(() {
                                  _pilihanCategoryPengeluaran =
                                      valuePengeluaran.toString();
                                  transaksi['categrory'] =
                                      _pilihanCategoryPengeluaran;
                                });
                              },
                            ),
                          ],
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person),
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
                            if (newValue != null)
                              transaksi['nominal'] = newValue;
                          },
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person),
                            label: Text('Note'),
                            hintText: 'Detail transaksi',
                          ),
                          validator: (value) {
                            if (value == null || value.length < 3) {
                              return 'Silahkan Masukan Nominal Dengan Benar';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            if (newValue != null) transaksi['note'] = newValue;
                          },
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                        ),
                      ],
                    ),
                  ),
                  const Text("Pemasukan"),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                // if (formKey.currentState != null &&
                //     formKey.currentState!.validate()) {
                //   _onSubmit();
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     const SnackBar(
                //       content: Text(
                //         'Saving Transaction...',
                //       ),
                //     ),
                //   );
                //   Navigator.of(context).pop();
                // }
                _onSubmit();
                Navigator.of(context).pop();
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
