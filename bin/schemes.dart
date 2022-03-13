// To parse this JSON data, do
//
//     final schemes = schemesFromJson(jsonString);

import "dart:convert";

import "cross.dart";

/// Construct Schemes object starting from a JSON String.
Schemes schemesFromJson(String str) => Schemes.fromJson(json.decode(str));

/// Contains a Map of Cross schemes build from a JSON String.
class Schemes {
  Schemes({
    required this.schemas,
  });

  factory Schemes.fromJson(Map<String, dynamic> json) => Schemes(
        schemas: <int, Cross>{
          for (var k in json["data"])
            k["index"]: Cross.fromList(
              List<List<int>>.from(
                k["array"].map((x) => List<int>.from(x.map((x) => x))),
              ),
            ),
        },
      );

  final Map<int, Cross> schemas;
}
