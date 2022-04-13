import "package:test/expect.dart";
import "package:test/scaffolding.dart";

import '../bin/cat_interpreter.dart';

void main() {
  schema_1();
  schema_2();
  schema_3();
  schema_4();
  other_schemas();
}

void schema_1() {
  group("Schema 1 algorithms", () {
    const json =
        '{"data":[{"index":1,"array":[[0,0,3,3,0,0],[0,0,3,3,0,0],[3,3,3,3,3,3],[3,3,3,3,3,3],[0,0,3,3,0,0],[0,0,3,3,0,0]]}]}';
    final CATInterpreter interpreter = CATInterpreter(json);
    test("1", () {
      interpreter.reset();
      expect(interpreter.getResults.getStates.length, equals(0));
      expect(interpreter.getResults.getCommands.length, equals(0));
      expect(interpreter.getResults.completed, isFalse);
      expect(interpreter.board.move.column, equals(0));
      expect(interpreter.board.move.row, equals(3));
      expect(
          interpreter.board.getCross.getCross,
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
      expect(interpreter.getResults.getStates.length, equals(0));
      expect(interpreter.getResults.getCommands.length, equals(0));
      expect(interpreter.getResults.completed, isFalse);
      expect(interpreter.board.move.column, equals(0));
      expect(interpreter.board.move.row, equals(3));
      expect(
          interpreter.board.getCross.getCross,
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
    final CATInterpreter interpreter = CATInterpreter(json);
    test("1", () {
      interpreter.reset();
      expect(interpreter.getResults.getStates.length, equals(0));
      expect(interpreter.getResults.getCommands.length, equals(0));
      expect(interpreter.getResults.completed, isFalse);
      expect(interpreter.board.move.column, equals(0));
      expect(interpreter.board.move.row, equals(3));
      expect(
          interpreter.board.getCross.getCross,
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
      expect(interpreter.getResults.getStates.length, equals(0));
      expect(interpreter.getResults.getCommands.length, equals(0));
      expect(interpreter.getResults.completed, isFalse);
      expect(interpreter.board.move.column, equals(0));
      expect(interpreter.board.move.row, equals(3));
      expect(
          interpreter.board.getCross.getCross,
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
      expect(interpreter.getResults.getStates.length, equals(0));
      expect(interpreter.getResults.getCommands.length, equals(0));
      expect(interpreter.getResults.completed, isFalse);
      expect(interpreter.board.move.column, equals(0));
      expect(interpreter.board.move.row, equals(3));
      expect(
          interpreter.board.getCross.getCross,
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
    final CATInterpreter interpreter = CATInterpreter(json);
    test("1", () {
      interpreter.reset();
      expect(interpreter.getResults.getStates.length, equals(0));
      expect(interpreter.getResults.getCommands.length, equals(0));
      expect(interpreter.getResults.completed, isFalse);
      expect(interpreter.board.move.column, equals(0));
      expect(interpreter.board.move.row, equals(3));
      expect(
          interpreter.board.getCross.getCross,
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
      expect(interpreter.getResults.getStates.length, equals(0));
      expect(interpreter.getResults.getCommands.length, equals(0));
      expect(interpreter.getResults.completed, isFalse);
      expect(interpreter.board.move.column, equals(0));
      expect(interpreter.board.move.row, equals(3));
      expect(
          interpreter.board.getCross.getCross,
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
      expect(interpreter.getResults.getStates.length, equals(0));
      expect(interpreter.getResults.getCommands.length, equals(0));
      expect(interpreter.getResults.completed, isFalse);
      expect(interpreter.board.move.column, equals(0));
      expect(interpreter.board.move.row, equals(3));
      expect(
          interpreter.board.getCross.getCross,
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
      expect(interpreter.getResults.getStates.length, equals(0));
      expect(interpreter.getResults.getCommands.length, equals(0));
      expect(interpreter.getResults.completed, isFalse);
      expect(interpreter.board.move.column, equals(0));
      expect(interpreter.board.move.row, equals(3));
      expect(
          interpreter.board.getCross.getCross,
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
      expect(interpreter.getResults.getStates.length, equals(0));
      expect(interpreter.getResults.getCommands.length, equals(0));
      expect(interpreter.getResults.completed, isFalse);
      expect(interpreter.board.move.column, equals(0));
      expect(interpreter.board.move.row, equals(3));
      expect(
          interpreter.board.getCross.getCross,
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
    final CATInterpreter interpreter = CATInterpreter(json);
    test("1", () {
      interpreter.reset();
      expect(interpreter.getResults.getStates.length, equals(0));
      expect(interpreter.getResults.getCommands.length, equals(0));
      expect(interpreter.getResults.completed, isFalse);
      expect(interpreter.board.move.column, equals(0));
      expect(interpreter.board.move.row, equals(3));
      expect(
          interpreter.board.getCross.getCross,
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
      expect(interpreter.getResults.getStates.length, equals(0));
      expect(interpreter.getResults.getCommands.length, equals(0));
      expect(interpreter.getResults.completed, isFalse);
      expect(interpreter.board.move.column, equals(0));
      expect(interpreter.board.move.row, equals(3));
      expect(
          interpreter.board.getCross.getCross,
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
          isTrue);
    });
    test("3", () {
      interpreter.reset();
      expect(interpreter.getResults.getStates.length, equals(0));
      expect(interpreter.getResults.getCommands.length, equals(0));
      expect(interpreter.getResults.completed, isFalse);
      expect(interpreter.board.move.column, equals(0));
      expect(interpreter.board.move.row, equals(3));
      expect(
          interpreter.board.getCross.getCross,
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
      expect(interpreter.getResults.getStates.length, equals(0));
      expect(interpreter.getResults.getCommands.length, equals(0));
      expect(interpreter.getResults.completed, isFalse);
      expect(interpreter.board.move.column, equals(0));
      expect(interpreter.board.move.row, equals(3));
      expect(
          interpreter.board.getCross.getCross,
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
      final CATInterpreter interpreter = CATInterpreter(json);
      interpreter.reset();
      expect(interpreter.getResults.getStates.length, equals(0));
      expect(interpreter.getResults.getCommands.length, equals(0));
      expect(interpreter.getResults.completed, isFalse);
      expect(interpreter.board.move.column, equals(0));
      expect(interpreter.board.move.row, equals(3));
      expect(
          interpreter.board.getCross.getCross,
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
      final CATInterpreter interpreter = CATInterpreter(json);
      interpreter.reset();
      expect(interpreter.getResults.getStates.length, equals(0));
      expect(interpreter.getResults.getCommands.length, equals(0));
      expect(interpreter.getResults.completed, isFalse);
      expect(interpreter.board.move.column, equals(0));
      expect(interpreter.board.move.row, equals(3));
      expect(
          interpreter.board.getCross.getCross,
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