// To parse this JSON data, do
//
//     final sampleQuotes = sampleQuotesFromJson(jsonString);

// import 'dart:convert';
//
// SampleQuotes sampleQuotesFromJson(String str) => SampleQuotes.fromJson(json.decode(str));
//
// String sampleQuotesToJson(SampleQuotes data) => json.encode(data.toJson());

/*
{
  "id": 1952871,
  "originator": {
    "id": 268779,
    "language_code": "en",
    "description": "",
    "master_id": 90584,
    "name": "NF",
    "url": "https://quotepark.com/authors/nf/"
  },
  "language_code": "en",
  "content": "Who I am and who I wanna be can not connect; why?",
  "url": "https://quotepark.com/quotes/1952871-nf-who-i-am-and-who-i-wanna-be-can-not-connect-why/",
  "tags": [
    "connection"
  ]
}
 */


///==> 1 <======================== SampleQuotes => { Originator } ================
class SampleQuotes {
  SampleQuotes({
    required this.id,
    required this.originator,
    required this.languageCode,
    required this.content,
    required this.url,
    required this.tags,
  });

  int id;
  Originator originator;
  String languageCode;
  String content;
  String url;
  List<String> tags;

  factory SampleQuotes.fromJson(Map<String, dynamic> json) => SampleQuotes(
    id: json["id"],
    originator: Originator.fromJson(json["originator"]),
    languageCode: json["language_code"],
    content: json["content"],
    url: json["url"],
    tags: List<String>.from(json["tags"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "originator": originator.toJson(),
    "language_code": languageCode,
    "content": content,
    "url": url,
    "tags": List<dynamic>.from(tags.map((x) => x)),
  };
}

//==> 1.1 <==================== SampleQuotes => Originator ========================
class Originator {
  Originator({
    required this.id,
    required this.languageCode,
    required this.description,
    required this.masterId,
    required this.name,
    required this.url,
  });

  int id;
  String languageCode;
  String description;
  int masterId;
  String name;
  String url;

  factory Originator.fromJson(Map<String, dynamic> json) => Originator(
    id: json["id"],
    languageCode: json["language_code"],
    description: json["description"],
    masterId: json["master_id"],
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "language_code": languageCode,
    "description": description,
    "master_id": masterId,
    "name": name,
    "url": url,
  };
}
