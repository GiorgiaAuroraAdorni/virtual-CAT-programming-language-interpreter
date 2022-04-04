import "package:test/expect.dart";
import "package:test/scaffolding.dart";

import '../bin/src/cross.dart';

void main() {
  group("Cross", () {
    test("Base testing", () {
      Cross cross = Cross();
      expect(cross, isNotNull);
      expect(cross == cross, isTrue);
      expect(cross.hashCode, isNotNull);
      expect(cross.hashCode == cross.hashCode, isTrue);
      expect(cross.copy() == cross, isTrue);
      expect(cross.toString(), isNotNull);
      expect(cross.copy().hashCode == cross.hashCode, isFalse);
      Cross copyCross = cross.copy();
      copyCross.cross[0][3] = 3;
      expect(cross == copyCross, isFalse);
      expect(cross.hashCode == copyCross.hashCode, isFalse);
    });
  });
}
