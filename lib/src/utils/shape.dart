import "package:interpreter/cat_interpreter.dart";
import "package:interpreter/src/models/basic_shape.dart";
import "package:interpreter/src/models/cross.dart";
import "package:interpreter/src/models/square.dart";

/// A factory that returns a `BasicShape` object.
enum Shape {
  cross(object: Cross),
  square(object: Square);

  /// A constructor that takes an object as a parameter.
  const Shape({
    required this.object,
  });

  /// A type of object that is passed to the constructor.
  final Type object;

  /// A getter that returns a `BasicShape` object.
  BasicShape get build {
    switch (object) {
      case Cross:
        {
          return Cross();
        }
      case Square:
        {
          return Square();
        }
      default:
        throw Exception("Not defined shape");
    }
  }
}
