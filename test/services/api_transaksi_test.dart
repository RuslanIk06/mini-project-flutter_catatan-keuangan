import 'package:catatan_keuangan/services/api_transaksi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/subjects.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

void main() {
  MockFirebaseAuth _auth = MockFirebaseAuth();
  BehaviorSubject<MockFirebaseAuth> auth = BehaviorSubject<MockFirebaseAuth>();

  group("all", () {
    test("Get All Transaction", () async {
      var trans = await APITransaksi().getAllTransaksi();
      expect(trans.isNotEmpty, true);
    });
  });
}
