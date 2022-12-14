class Transaksi {
  String? id;
  final String type;
  final String categrory;
  final int nominal;
  final String note;
  final String waktu;

  Transaksi({
    this.id,
    required this.type,
    required this.categrory,
    required this.nominal,
    required this.note,
    required this.waktu,
  }) {
    // id = nanoid(15);
  }

  factory Transaksi.fromJson(Map<String, dynamic> json) => Transaksi(
      id: json["id"].toString(),
      type: json['type'],
      categrory: json['categrory'],
      nominal: json['nominal'],
      note: json['note'],
      waktu: json['waktu']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "categrory": categrory,
        "nominal": nominal,
        "note": note,
        "waktu": waktu,
      };
}
