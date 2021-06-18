import 'dart:convert';

Ranking RankingFromJson(String str) {
  final jsonData = json.decode(str);
  return Ranking.fromMap(jsonData);
}

String RankingToJson(Ranking data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Ranking {
  int? id;
  String name;
  int hit;

  Ranking({
    this.id,
    required this.name,
    required this.hit,
  });

  factory Ranking.fromMap(Map<String, dynamic> json) => new Ranking(
        id: json["id"],
        name: json["name"],
        hit: json["hit"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "hit": hit,
      };
}
