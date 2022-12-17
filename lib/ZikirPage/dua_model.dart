class Dua{
  int? id;
  String? title;
  String? dua;
  String? meaning;

  Dua(
      {
        this.id,
        this.title,
        this.dua,
        this.meaning,

      });

  Dua.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    title = json['title'];
    dua =json['dua'];
    meaning = json['meaning'];
  }
}