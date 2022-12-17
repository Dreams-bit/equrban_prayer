class Status {
  String? ic_number;
  String? peserta_name; 
  String? hari_korban;
  String? waktu_sembelihan;

  Status({
  required this.ic_number,
  required this.peserta_name,
  required this.hari_korban,
  required this.waktu_sembelihan,
});

factory Status.fromJson(Map<String, dynamic> jsonData) {
    return Status(
      ic_number: jsonData['ic_number'],
      peserta_name: jsonData['peserta_name'],
      hari_korban: jsonData['hari_korban'],
      waktu_sembelihan: jsonData['waktu_sembelihan'],
    );
  }

Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['ic_number'] = this.ic_number;
    data['peserta_name'] = this.peserta_name;
    data['hari_korban'] = this.hari_korban;
    data['waktu_sembelihan'] = this.waktu_sembelihan;
    return data;
  }


}