import 'package:dartx/dartx.dart';
import "package:interpreter/cat_interpreter.dart";
import "package:interpreter/src/utils/errors.dart";
import "package:interpreter/src/utils/shape.dart";
import "package:test/expect.dart";
import "package:test/scaffolding.dart";

void main() {
  base_interpreter();
  schema_1();
  schema_2();
  schema_3();
  schema_4();
  other_schemas();
  valid_patters();
  not_valid();
}

void base_interpreter() {
  const json =
      '{"data":[{"index":1,"array":[[0,0,3,3,0,0],[0,0,3,3,0,0],[3,3,3,3,3,3],[3,3,3,3,3,3],[0,0,3,3,0,0],[0,0,3,3,0,0]]}]}';

  test("base interpreter", () {
    var schemes = schemesFromJson(json);
    final CATInterpreter interpreter1 = CATInterpreter(json, Shape.cross);
    final CATInterpreter interpreter2 =
        CATInterpreter.fromSchemes(schemes, Shape.cross);
    expect(interpreter1.schemes.getData[1] == interpreter2.schemes.getData[1],
        isTrue);
  });
  test("cross as string interpreter", () {
    var schemes = schemesFromJson(json);
    final CATInterpreter interpreter = CATInterpreter(json, Shape.cross);
    var results = interpreter.validateOnScheme("FILL_EMPTY(blue)", 1);
    expect(results.first.completed, isTrue);
    expect(results.first.getStates.length, equals(2));
    expect(results.first.getPositions.length, equals(2));
    expect(results.first.getPositions.last, Pair(3, 0));
    expect(
        results.first.getStates.last.toString(), schemes.getData[1].toString());
  });
}

void schema_1() {
  group("Schema 1 algorithms", () {
    const json =
        '{"data":[{"index":1,"array":[[0,0,3,3,0,0],[0,0,3,3,0,0],[3,3,3,3,3,3],[3,3,3,3,3,3],[0,0,3,3,0,0],[0,0,3,3,0,0]]}]}';
    final CATInterpreter interpreter = CATInterpreter(json, Shape.cross);
    test("1", () {
      interpreter.reset();
      expect(interpreter.getResults.getStates.length, equals(1));
      expect(interpreter.getResults.getCommands.length, equals(1));
      expect(interpreter.getResults.completed, isFalse);
      expect(interpreter.board.move.column, equals(0));
      expect(interpreter.board.move.row, equals(3));
      expect(
          interpreter.board.getCross.getGrid,
          equals([
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
          ]));
      expect(
          interpreter.validateOnScheme("FILL_EMPTY(blue)", 1).first.completed,
          isTrue);
    });
    test("wrong", () {
      interpreter.reset();
      expect(interpreter.getResults.getStates.length, equals(1));
      expect(interpreter.getResults.getCommands.length, equals(1));
      expect(interpreter.getResults.completed, isFalse);
      expect(interpreter.board.move.column, equals(0));
      expect(interpreter.board.move.row, equals(3));
      expect(
          interpreter.board.getCross.getGrid,
          equals([
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
          ]));
      expect(
          interpreter.validateOnScheme("FILL_EMPTY(yellow)", 1).first.completed,
          isFalse);
    });
  });
}

void schema_2() {
  group("Schema 2 algorithms", () {
    const json =
        '{"data":[{"index":2,"array":[[0,0,3,4,0,0],[0,0,3,4,0,0],[3,3,3,4,4,4],[3,3,3,4,4,4],[0,0,3,4,0,0],[0,0,3,4,0,0]]}]}';
    final CATInterpreter interpreter = CATInterpreter(json, Shape.cross);
    test("1", () {
      interpreter.reset();
      expect(interpreter.getResults.getStates.length, equals(1));
      expect(interpreter.getResults.getCommands.length, equals(1));
      expect(interpreter.getResults.completed, isFalse);
      expect(interpreter.board.move.column, equals(0));
      expect(interpreter.board.move.row, equals(3));
      expect(
          interpreter.board.getCross.getGrid,
          equals([
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
          ]));
      expect(
          interpreter
              .validateOnScheme(
                  "PAINT({blue}, 4, square), GO(A3), PAINT({blue}, :, up), GO(right), PAINT({yellow}, :, up), GO(C5), PAINT({yellow}, 4, square)",
                  2)
              .first
              .completed,
          isTrue);
    });
    test("2", () {
      interpreter.reset();
      expect(interpreter.getResults.getStates.length, equals(1));
      expect(interpreter.getResults.getCommands.length, equals(1));
      expect(interpreter.getResults.completed, isFalse);
      expect(interpreter.board.move.column, equals(0));
      expect(interpreter.board.move.row, equals(3));
      expect(
          interpreter.board.getCross.getGrid,
          equals([
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
          ]));
      expect(
          interpreter
              .validateOnScheme(
                  "PAINT({blue}, 4, square), GO(A3), PAINT({blue}, :, up), FILL_EMPTY(yellow)",
                  2)
              .first
              .completed,
          isTrue);
    });
    test("3", () {
      interpreter.reset();
      expect(interpreter.getResults.getStates.length, equals(1));
      expect(interpreter.getResults.getCommands.length, equals(1));
      expect(interpreter.getResults.completed, isFalse);
      expect(interpreter.board.move.column, equals(0));
      expect(interpreter.board.move.row, equals(3));
      expect(
          interpreter.board.getCross.getGrid,
          equals([
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
          ]));
      expect(
          interpreter
              .validateOnScheme(
                  "PAINT({blue}, 2, right), GO(D1), PAINT({blue}, 2, right), GO(F3), PAINT({blue})",
                  2)
              .first
              .completed,
          isFalse);
    });
  });
}

void schema_3() {
  group("Schema 3 algorithms", () {
    const json =
        '{"data":[{"index":3,"array":[[0,0,4,2,0,0],[0,0,4,2,0,0],[4,2,4,2,4,2],[4,2,4,2,4,2],[0,0,4,2,0,0],[0,0,4,2,0,0]]}]}';
    final CATInterpreter interpreter = CATInterpreter(json, Shape.cross);
    test("1", () {
      interpreter.reset();
      expect(interpreter.getResults.getStates.length, equals(1));
      expect(interpreter.getResults.getCommands.length, equals(1));
      expect(interpreter.getResults.completed, isFalse);
      expect(interpreter.board.move.column, equals(0));
      expect(interpreter.board.move.row, equals(3));
      expect(
          interpreter.board.getCross.getGrid,
          equals([
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
          ]));
      expect(
          interpreter
              .validateOnScheme(
                  "PAINT({yellow}), GO(down), PAINT({yellow}), GO(diagonal up right), PAINT({red}), GO(down), PAINT({red}), GO(F3), PAINT({yellow}), GO(down), PAINT({yellow}), GO(down), PAINT({yellow}), GO(down), PAINT({yellow}), GO(down), PAINT({yellow}), GO(down), PAINT({yellow}), GO(F4), PAINT({red}), GO(down), PAINT({red}), GO(down), PAINT({red}), GO(down), PAINT({red}), GO(down), PAINT({red}), GO(down), PAINT({red}), GO(D5), PAINT({yellow}), GO(down), PAINT({yellow}), GO(diagonal up right), PAINT({red}), GO(down), PAINT({red})",
                  3)
              .first
              .completed,
          isFalse);
    });
    test("2", () {
      interpreter.reset();
      expect(interpreter.getResults.getStates.length, equals(1));
      expect(interpreter.getResults.getCommands.length, equals(1));
      expect(interpreter.getResults.completed, isFalse);
      expect(interpreter.board.move.column, equals(0));
      expect(interpreter.board.move.row, equals(3));
      expect(
          interpreter.board.getCross.getGrid,
          equals([
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
          ]));
      expect(
          interpreter
              .validateOnScheme(
                  "PAINT({yellow}, :, down),  GO(right), PAINT({red}, :, down), GO(F3), PAINT({yellow}, :, down), GO(right), PAINT({red}, :, down), GO(D5), PAINT({yellow}, :, down), GO(right), PAINT({red}, :, down)",
                  3)
              .first
              .completed,
          isTrue);
    });
    test("3", () {
      interpreter.reset();
      expect(interpreter.getResults.getStates.length, equals(1));
      expect(interpreter.getResults.getCommands.length, equals(1));
      expect(interpreter.getResults.completed, isFalse);
      expect(interpreter.board.move.column, equals(0));
      expect(interpreter.board.move.row, equals(3));
      expect(
          interpreter.board.getCross.getGrid,
          equals([
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
          ]));
      expect(
          interpreter
              .validateOnScheme(
                  "COPY({PAINT({yellow}, :, down)}, {D1, F3, D5}) COPY({PAINT({red}, :, down)}, {D2, F4, D6})",
                  3)
              .first
              .completed,
          isTrue);
    });
    test("4", () {
      interpreter.reset();
      expect(interpreter.getResults.getStates.length, equals(1));
      expect(interpreter.getResults.getCommands.length, equals(1));
      expect(interpreter.getResults.completed, isFalse);
      expect(interpreter.board.move.column, equals(0));
      expect(interpreter.board.move.row, equals(3));
      expect(
          interpreter.board.getCross.getGrid,
          equals([
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
          ]));
      expect(
          interpreter
              .validateOnScheme(
                  "PAINT({yellow}), GO(right), PAINT({red}), GO(right), PAINT({yellow}), GO(right), PAINT({red}), GO(right), PAINT({yellow}), GO(right), PAINT({red}), GO(D1), PAINT({yellow}), GO(right), PAINT({red}), GO(right), PAINT({yellow}), GO(right), PAINT({red}), GO(right), PAINT({yellow}), GO(right), PAINT({red}), GO(F3), PAINT({yellow}), GO(right), PAINT({red}), GO(diagonal down left), PAINT({yellow}), GO(right), PAINT({red}), GO(B3), PAINT({yellow}), GO(right), PAINT({red}), GO(diagonal down left), PAINT({yellow}), GO(right), PAINT({red})",
                  3)
              .first
              .completed,
          isTrue);
    });
    test("5", () {
      interpreter.reset();
      expect(interpreter.getResults.getStates.length, equals(1));
      expect(interpreter.getResults.getCommands.length, equals(1));
      expect(interpreter.getResults.completed, isFalse);
      expect(interpreter.board.move.column, equals(0));
      expect(interpreter.board.move.row, equals(3));
      expect(
          interpreter.board.getCross.getGrid,
          equals([
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
          ]));
      expect(
          interpreter
              .validateOnScheme(
                  "GO(D6), PAINT({red}, :, down),  GO(left), PAINT({yellow}, :, down), GO(F4), PAINT({red}, :, down), GO(left), PAINT({yellow}, :, down), GO(D2), PAINT({red}, :, down), GO(left), PAINT({yellow}, :, down)",
                  3)
              .first
              .completed,
          isTrue);
    });
  });
}

void schema_4() {
  group("Schema 4 algorithms", () {
    const json =
        '{"data":[{"index":4,"array":[[0,0,3,4,0,0],[0,0,3,4,0,0],[4,2,3,4,2,3],[4,2,3,4,2,3],[0,0,3,4,0,0],[0,0,3,4,0,0]]}]}';
    final CATInterpreter interpreter = CATInterpreter(json, Shape.cross);
    test("1", () {
      interpreter.reset();
      expect(interpreter.getResults.getStates.length, equals(1));
      expect(interpreter.getResults.getCommands.length, equals(1));
      expect(interpreter.getResults.completed, isFalse);
      expect(interpreter.board.move.column, equals(0));
      expect(interpreter.board.move.row, equals(3));
      expect(
          interpreter.board.getCross.getGrid,
          equals([
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
          ]));
      expect(
          interpreter
              .validateOnScheme(
                  "PAINT({yellow}), GO(right), PAINT({red}), GO(right), PAINT({blue}), GO(right), PAINT({yellow}), GO(right), PAINT({red}), GO(right), PAINT({blue}), GO(D1), PAINT({yellow}), GO(right), PAINT({red}), GO(right), PAINT({blue}), GO(right), PAINT({yellow}), GO(right), PAINT({red}), GO(right), PAINT({blue}), GO(F3), PAINT({blue}), GO(down), PAINT({blue}), GO(down), PAINT({blue}), GO(down), PAINT({blue}), GO(down), PAINT({blue}), GO(down), PAINT({blue}), GO(F4), PAINT({yellow}), GO(down), PAINT({yellow}), GO(down), PAINT({yellow}), GO(down), PAINT({yellow}), GO(down), PAINT({yellow}), GO(down), PAINT({yellow})",
                  4)
              .first
              .completed,
          isTrue);
    });
    test("2", () {
      interpreter.reset();
      expect(interpreter.getResults.getStates.length, equals(1));
      expect(interpreter.getResults.getCommands.length, equals(1));
      expect(interpreter.getResults.completed, isFalse);
      expect(interpreter.board.move.column, equals(0));
      expect(interpreter.board.move.row, equals(3));
      expect(
          interpreter.board.getCross.getGrid,
          equals([
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
          ]));
      expect(
          interpreter
              .validateOnScheme(
                  "PAINT({yellow}, :, down), GO(right), PAINT({red}, :, down),  GO(F3), PAINT({blue}, :, down),  GO(right), PAINT({yellow}, :, down), GO(right), PAINT({red}, :, down),  GO(right), PAINT({blue}, :, down)",
                  4)
              .first
              .completed,
          isFalse);
    });
    test("3", () {
      interpreter.reset();
      expect(interpreter.getResults.getStates.length, equals(1));
      expect(interpreter.getResults.getCommands.length, equals(1));
      expect(interpreter.getResults.completed, isFalse);
      expect(interpreter.board.move.column, equals(0));
      expect(interpreter.board.move.row, equals(3));
      expect(
          interpreter.board.getCross.getGrid,
          equals([
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
          ]));
      expect(
          interpreter
              .validateOnScheme(
                  "COPY({PAINT({yellow}, :, up), GO(right), PAINT({red}, :, up), GO(right), PAINT({blue}, :, up)}, {C1, A4})",
                  4)
              .first
              .completed,
          isTrue);
    });
    test("3", () {
      interpreter.reset();
      expect(interpreter.getResults.getStates.length, equals(1));
      expect(interpreter.getResults.getCommands.length, equals(1));
      expect(interpreter.getResults.completed, isFalse);
      expect(interpreter.board.move.column, equals(0));
      expect(interpreter.board.move.row, equals(3));
      expect(
          interpreter.board.getCross.getGrid,
          equals([
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
          ]));
      expect(
          interpreter
              .validateOnScheme(
                  "COPY({PAINT({yellow}, :, up), GO(right), PAINT({red}, :, up), GO(right), PAINT({blue}, :, up)}, {C1, A4})",
                  4)
              .first
              .completed,
          isTrue);
    });
  });
}

void other_schemas() {
  group("Other schemas algorithms", () {
    test("1", () {
      const json =
          '{"data":[{"index":1,"array":[[0, 0, 3, 3, 0, 0], [0, 0, 3, 3, 0, 0], [4, 2, 3, 3, 2, 4], [4, 2, 3, 3, 2, 4], [0, 0, 3, 3, 0, 0], [0, 0, 3, 3, 0, 0]]}]}';
      final CATInterpreter interpreter = CATInterpreter(json, Shape.cross);
      interpreter.reset();
      expect(interpreter.getResults.getStates.length, equals(1));
      expect(interpreter.getResults.getCommands.length, equals(1));
      expect(interpreter.getResults.completed, isFalse);
      expect(interpreter.board.move.column, equals(0));
      expect(interpreter.board.move.row, equals(3));
      expect(
          interpreter.board.getCross.getGrid,
          equals([
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
          ]));
      expect(
          interpreter
              .validateOnScheme(
                  "GO(up) PAINT({yellow}), GO(right), PAINT({red}), GO(right), PAINT({blue}, 3, up), MIRROR(horizontal) MIRROR(vertical)",
                  1)
              .first
              .completed,
          isTrue);
    });
    test("2", () {
      const json =
          '{"data":[{"index":1,"array":[[0, 0, 3, 3, 0, 0], [0, 0, 3, 3, 0, 0], [4, 2, 3, 3, 2, 4], [4, 2, 3, 3, 2, 4], [0, 0, 3, 3, 0, 0], [0, 0, 3, 3, 0, 0]]}]}';
      final CATInterpreter interpreter = CATInterpreter(json, Shape.cross);
      interpreter.reset();
      expect(interpreter.getResults.getStates.length, equals(1));
      expect(interpreter.getResults.getCommands.length, equals(1));
      expect(interpreter.getResults.completed, isFalse);
      expect(interpreter.board.move.column, equals(0));
      expect(interpreter.board.move.row, equals(3));
      expect(
          interpreter.board.getCross.getGrid,
          equals([
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
          ]));
      expect(
          interpreter
              .validateOnScheme(
                  "GO(C6) PAINT({yellow}), GO(left), PAINT({red}), GO(left), PAINT({blue}, 3, down),  MIRROR(vertical) MIRROR(horizontal)",
                  1)
              .first
              .completed,
          isTrue);
    });
  });
}

void valid_patters() {
  group("Valid cases", () {
    const json =
        '{"data":[{"index":1,"array":[[0,0,3,3,0,0],[0,0,3,3,0,0],[3,3,3,3,3,3],[3,3,3,3,3,3],[0,0,3,3,0,0],[0,0,3,3,0,0]]}]}';
    final CATInterpreter interpreter = CATInterpreter(json, Shape.cross);
    test("", () {
      interpreter.reset();
      var response = interpreter.validateOnScheme(
          "copy({paint({red,blue},:,diagonal down right)}, {f4,left,down,down,left,left,down})",
          1);
      expect(response.first.completed, isFalse);
      expect(response.second, equals(CatError.none));
    });
    test("", () {
      interpreter.reset();
      var response = interpreter.validateOnScheme(
          "copy({paint({red,blue},:,diagonal up right)}, {c6,left,down,down,left,left,down})",
          1);
      expect(response.first.completed, isFalse);
      expect(response.second, equals(CatError.none));
    });
    test("", () {
      interpreter.reset();
      var response = interpreter.validateOnScheme(
          "go(d1),paint({green,red},4,diagonal down right)", 1);
      expect(response.first.completed, isFalse);
      expect(response.second, equals(CatError.none));
    });
    test("", () {
      interpreter.reset();
      var response = interpreter.validateOnScheme(
          "go(d1),paint({green,red},4,diagonal down right),go(d1),paint({blue,red},:,right),go(down),paint({green},:,left)",
          1);
      expect(response.first.completed, isFalse);
      expect(response.second, equals(CatError.none));
    });
    test("", () {
      interpreter.reset();
      var response = interpreter.validateOnScheme(
          "paint({green},1,square),mirror(vertical),go(c4),paint({blue},1,square),mirror(vertical)",
          1);
      expect(response.first.completed, isFalse);
      expect(response.second, equals(CatError.none));
    });
    test("", () {
      interpreter.reset();
      var response = interpreter.validateOnScheme(
          "mirror({paint({green},1,square)},vertical),go(c4),mirror({paint({blue},1,square)},vertical)",
          1);
      expect(response.first.completed, isFalse);
      expect(response.second, equals(CatError.none));
    });
    test("", () {
      interpreter.reset();
      var response = interpreter.validateOnScheme(
          "go(right),go(right),paint({red,green,yellow,blue},:,right)", 1);
      expect(response.first.completed, isFalse);
      expect(response.second, equals(CatError.none));
    });
    test("", () {
      interpreter.reset();
      var response = interpreter.validateOnScheme(
          "go(right),go(right),paint({red,green,yellow,blue},:,right),mirror({c1,c3,c5},horizontal)",
          1);
      expect(response.first.completed, isFalse);
      expect(response.second, equals(CatError.none));
    });
    test("", () {
      interpreter.reset();
      var response = interpreter.validateOnScheme(
          "paint({red},1,square),mirror({c1,d1},vertical)", 1);
      expect(response.first.completed, isFalse);
      expect(response.second, equals(CatError.none));
    });
    test("", () {
      interpreter.reset();
      var response = interpreter.validateOnScheme(
          "go(e4),paint({red,blue},:,diagonal down right),paint({green,yellow},:,diagonal down left)",
          1);
      expect(response.first.completed, isFalse);
      expect(response.second, equals(CatError.none));
    });
    test("", () {
      interpreter.reset();
      var response = interpreter.validateOnScheme(
          "go(e4),paint({red,blue},:,diagonal up left),go(c6),go(left),paint({yellow},3,diagonal up left)",
          1);
      expect(response.first.completed, isFalse);
      expect(response.second, equals(CatError.none));
    });
    test("", () {
      interpreter.reset();
      var response = interpreter.validateOnScheme(
          "go(e3),paint({red,yellow},:,diagonal down left),go(c5),paint({red},3,diagonal down left)",
          1);
      expect(response.first.completed, isFalse);
      expect(response.second, equals(CatError.none));
    });
    test("", () {
      interpreter.reset();
      var response = interpreter.validateOnScheme(
          "go(e3),paint({red,yellow},:,diagonal up right),go(c5),paint({red},2,diagonal up right)",
          1);
      expect(response.first.completed, isFalse);
      expect(response.second, equals(CatError.none));
    });
    test("", () {
      interpreter.reset();
      var response = interpreter.validateOnScheme(
          "go(up),paint({red},1,L right up),go(a4),paint({blue},1,L up right),go(c1),paint({red,blue},1,L right down),go(f4),paint({blue,red},1,L down right)",
          1);
      expect(response.first.completed, isFalse);
      expect(response.second, equals(CatError.none));
    });
    test("", () {
      interpreter.reset();
      var response = interpreter.validateOnScheme(
          "go(a4),mirror({mirror({paint({red,blue,yellow},3,up)},horizontal)},vertical),go(c1),mirror({paint({blue},1,square)},vertical)",
          1);
      expect(response.first.completed, isFalse);
      expect(response.second, equals(CatError.none));
    });
    test("", () {
      interpreter.reset();
      var response = interpreter.validateOnScheme(
          "go(b3),paint({red},1,L up right),go(e4),paint({yellow},1,L down left),fill_empty(green)",
          1);
      expect(response.first.completed, isFalse);
      expect(response.second, equals(CatError.none));
    });
    test("", () {
      interpreter.reset();
      var response = interpreter.validateOnScheme(
          "mirror({go(e3),paint({red},3,diagonal down left)},vertical),mirror({go(b3),paint({yellow},3,diagonal up left)},vertical),fill_empty(blue)",
          1);
      expect(response.first.completed, isFalse);
      expect(response.second, equals(CatError.none));
    });
    test("", () {
      interpreter.reset();
      var response = interpreter.validateOnScheme(
          "paint({yellow,red,yellow},:,right),go(up),paint({red,yellow,yellow},:,right),go(a3),paint({yellow,yellow,red},1,square),go(e3),paint({yellow,red,yellow,red},1,square)",
          1);
      expect(response.first.completed, isFalse);
      expect(response.second, equals(CatError.none));
    });
    test("", () {
      interpreter.reset();
      var response = interpreter.validateOnScheme(
          "copy({paint({blue},:,right),go(up),paint({blue},:,right)},{c1,a3,e3})",
          1);
      expect(response.first.completed, isTrue);
      expect(response.second, equals(CatError.none));
    });
  });
}

void not_valid() {
  group("Not valid cases", () {
    const json =
        '{"data":[{"index":1,"array":[[0,0,3,3,0,0],[0,0,3,3,0,0],[3,3,3,3,3,3],[3,3,3,3,3,3],[0,0,3,3,0,0],[0,0,3,3,0,0]]}]}';
    final CATInterpreter interpreter = CATInterpreter(json, Shape.cross);
    test("Not valid cell position", () {
      interpreter.reset();
      expect(interpreter.getResults.getStates.length, equals(1));
      expect(interpreter.getResults.getCommands.length, equals(1));
      expect(interpreter.getResults.completed, isFalse);
      expect(interpreter.board.move.column, equals(0));
      expect(interpreter.board.move.row, equals(3));
      expect(
          interpreter.board.getCross.getGrid,
          equals([
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
          ]));
      var response = interpreter.validateOnScheme("GO(q3)", 1);
      expect(response.first.completed, isFalse);
      expect(response.second, equals(CatError.invalidCell));
    });
    test("Not valid color", () {
      interpreter.reset();
      expect(interpreter.getResults.getStates.length, equals(1));
      expect(interpreter.getResults.getCommands.length, equals(1));
      expect(interpreter.getResults.completed, isFalse);
      expect(interpreter.board.move.column, equals(0));
      expect(interpreter.board.move.row, equals(3));
      expect(
          interpreter.board.getCross.getGrid,
          equals([
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0],
          ]));
      var response = interpreter.validateOnScheme("FILL_EMPTY(orange)", 1);
      expect(response.first.completed, isFalse);
      expect(response.second, equals(CatError.invalidColor));
    });
    test("", () {
      interpreter.reset();
      var response = interpreter.validateOnScheme("go(right),go(5 right)", 1);
      expect(response.first.completed, isFalse);
      expect(response.second, equals(CatError.invalidCell));
    });
    test("", () {
      interpreter.reset();
      var response =
          interpreter.validateOnScheme("go(5 right),go(left),go(5 right)", 1);
      expect(response.first.completed, isFalse);
      expect(response.second, equals(CatError.invalidCell));
    });
  });
}
