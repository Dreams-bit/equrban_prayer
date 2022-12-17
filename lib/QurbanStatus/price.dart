class Price {
  String? harga_qurban_bahagian;
  String? harga_qurban_seekor; 
  String? kuantiti_lembu;

  Price({
  required this.harga_qurban_bahagian,
  required this.harga_qurban_seekor,
  required this.kuantiti_lembu,
});

factory Price.fromJson(Map<String, dynamic> jsonData) {
    return Price(
      harga_qurban_bahagian: jsonData['harga_qurban_bahagian'],
      harga_qurban_seekor: jsonData['harga_qurban_seekor'],
      kuantiti_lembu: jsonData['kuantiti_lembu'],
    );
  }

Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['harga_qurban_bahagian'] = this.harga_qurban_bahagian;
    data['harga_qurban_seekor'] = this.harga_qurban_seekor;
    data['kuantiti_lembu'] = this.kuantiti_lembu;
    return data;
  }
}