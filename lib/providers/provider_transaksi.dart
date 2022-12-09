import 'package:flutter/foundation.dart';
import 'package:catatan_keuangan/models/transaksi.dart';
import 'package:catatan_keuangan/services/api_transaksi.dart';

class TransaksiProvider with ChangeNotifier {
  late APITransaksi _service;

  List<Transaksi> _transaksi = [];
  List<Transaksi> get transaksi => [..._transaksi];
  List<Transaksi> get getIncome =>
      _transaksi.where((element) => element.type == "Pemasukan").toList();
  List<Transaksi> get getExpense =>
      _transaksi.where((element) => element.type == "Pengeluaran").toList();

  int getTotalIncome() {
    final pemasukan =
        _transaksi.where((element) => element.type == "Pemasukan").toList();

    final totalPemasukan = pemasukan.fold(0, (a, b) => a + b.nominal);

    return totalPemasukan;
    notifyListeners();
  }

  int getTotalExpnse() {
    final pengeluaran =
        _transaksi.where((element) => element.type == "Pengeluaran").toList();

    final totalPengeluaran = pengeluaran.fold(0, (a, b) => a + b.nominal);

    return totalPengeluaran;
    notifyListeners();
  }

  int getTotalDifference() {
    final pemasukan =
        _transaksi.where((element) => element.type == "Pemasukan").toList();
    final pengeluaran =
        _transaksi.where((element) => element.type == "Pengeluaran").toList();

    final totalpemasukan = pemasukan.fold(0, (a, b) => a + b.nominal);
    final totalPengeluaran = pengeluaran.fold(0, (a, b) => a + b.nominal);

    var selisih = totalpemasukan - totalPengeluaran;

    return selisih;
    notifyListeners();
  }

  final int _totalPemasaukan = 0;
  int get totalPemasukan => _totalPemasaukan;

  TransaksiProvider() {
    _service = APITransaksi();
    _fetchDataTransaksi();
    notifyListeners();
  }

  void _fetchDataTransaksi() async {
    _transaksi = await _service.getAllTransaksi();
    notifyListeners();
  }

  List<Transaksi> get itemsTransaksi {
    var temp = [..._transaksi];
    temp.sort(
      (a, b) => a.waktu.compareTo(b.waktu),
    );
    return temp;
  }

  void add(Transaksi transaksi) async {
    final result = await _service.addTransaksi(transaksi);
    if (result.id != null) {
      _transaksi.add(result);
      notifyListeners();
    }
  }

  void delete(String id) async {
    final targetIndex = _transaksi.indexWhere((element) => element.id == id);
    if (targetIndex != -1) {
      final isSuccess = await _service.deleteTransaksi(id);
      if (isSuccess) {
        _transaksi.removeAt(targetIndex);
        notifyListeners();
      }
    }
  }

  void update(Transaksi trans) async {
    final targetIndex =
        _transaksi.indexWhere((element) => element.id == trans.id);
    if (targetIndex != -1) {
      final isSuccess = await _service.editTransaksi(trans);
      if (isSuccess) {
        _transaksi[targetIndex] = trans;
        notifyListeners();
      }
    }
  }

  void hitungPemasukan() {}
}
