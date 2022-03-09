// To parse this JSON data, do
//
//     final schemes = schemesFromJson(jsonString);

import 'dart:convert';

import 'cross.dart';

Schemes schemesFromJson(String str) => Schemes.fromJson(json.decode(str));

class Schemes {
  final Map<int, Cross> schemas;

  Schemes({
    required this.schemas,
  });

  factory Schemes.fromJson(Map<String, dynamic> json) => Schemes(
        schemas: {
          for (var k in json["data"])
            k["index"]: Cross.fromList(List<List<int>>.from(
              k["array"].map((x) => List<int>.from(x.map((x) => x))),
            )),
        },
      );
}
