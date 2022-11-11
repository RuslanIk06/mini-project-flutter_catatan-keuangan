import 'package:catatan_keuangan/firebase_options.dart';
import 'package:catatan_keuangan/services/api_transaksi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  group("Transaction", () {
    test("Get All Transaction", () async {
      // var trans = await APITransaksi().getAllTransaksi();
      // expect(trans.isNotEmpty, true);
    });
  });
}
