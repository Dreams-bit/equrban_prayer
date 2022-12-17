class Zikr{
  int? id;
  String? zikr;
  String? pronounce;
  String? meaning;
  String? ibadah;

  Zikr(
      {
        this.id,
        this.zikr,
        this.pronounce,
        this.meaning,
        this.ibadah,

      });

  Zikr.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    zikr = json['zikr'];
    pronounce =json['pronounce'];
    meaning = json['meaning'];
    ibadah = json['ibadah'];
  }
}