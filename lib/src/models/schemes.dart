import "dart:convert";

import "package:interpreter/src/cross.dart";

/// Construct Schemes object starting from a JSON String.
Schemes schemesFromJson(String str) => Schemes.fromJson(json.decode(str));

/// Contains a Map of Cross schemes build from a JSON String.
class Schemes {
  /// A constructor.
  Schemes({
    required this.schemas,
  });

  /// It converts a JSON object into a Dart object.
  ///
  /// Args:
  ///   json (Map<String, dynamic>): The json file that you want to parse.
  factory Schemes.fromJson(Map<String, dynamic> json) => Schemes(
        schemas: <int, Cross>{
          for (Map<String, dynamic> k in json["data"])
            k["index"]: Cross.fromList(
              List<List<int>>.from(
                k["array"].map((x) => List<int>.from(x.map((x) => x))),
              ),
            ),
        },
      );

  final Map<int, Cross> schemas;
}
