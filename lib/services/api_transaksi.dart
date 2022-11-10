import 'package:dio/dio.dart';
import 'package:catatan_keuangan/models/transaksi.dart';
import 'package:firebase_auth/firebase_auth.dart';

class APITransaksi {
  late Dio _dio;
  String? _userID;
  static const baseUrl =
      'https://mini-project-catatan-keuangan-default-rtdb.asia-southeast1.firebasedatabase.app/transaksi';

  APITransaksi() {
    _dio = Dio();
    getUID();
  }

  void getUID() {
    FirebaseAuth.instance.authStateChanges().listen(
      (event) {
        (User user) {
          if (user != null) {
            _userID = user.uid;
          }
        };
      },
    );
  }

  Future <List<Transaksi>> getAllTransaksi() async {
    final response = await _dio.get("$baseUrl/$_userID/list_transaksi.json");

    List<Map<String, dynamic>> transaksi = [];

    if (response.data != null) {
      response.data.forEach((key, value) {
        print("keymap : $key:$value");
        transaksi.add(Transaksi(
          id: key.toString(),
          type: value['type'].toString(),
          categrory: value['categrory'].toString(),
          nominal: value['nominal'],
          note: value['note'].toString(),
          waktu: value!['waktu'],
        ).toJson());
      });
      return List<Transaksi>.from(
          transaksi.map((e) => Transaksi.fromJson(e)).toList());
    }
    return [];
  }

  Future<Transaksi> addTransaksi(Transaksi trans) async {
    final response = await _dio.post("$baseUrl/$_userID/list_transaksi.json",
        data: trans.toJson());

    if (response.data != null) {
      response.data.forEach((key, value) {
        final transaksiByKey = key;
        trans.id = transaksiByKey;
      });
    }
    return trans;
  }

  Future<bool> deleteTransaksi(String id) async {
    // getUserID();

    final response =
        await _dio.delete("$baseUrl/$_userID/list_transaksi/$id.json");
    return true;
  }

  Future<bool> editTransaksi(Transaksi trans) async {
    final res = await _dio.get("$baseUrl/$_userID/list_transaksi.json");
    String keys = "";
    res.data.forEach((key, value) {
      if (value["id"] == trans.id) {
        keys = key;
      }
    });

    final response = await _dio.put(
        "$baseUrl/$_userID/list_transaksi/${trans.id}.json",
        data: trans.toJson());
    return true;
  }
}
