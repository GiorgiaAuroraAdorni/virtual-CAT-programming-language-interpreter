import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../bin/board.dart';

void main() {
  color();
  fillEmpty();
  down();
  up();
  square();
}

void color() {
  group("Basic color command",(){
    test("Color default cell", () {
      Board board = Board();
      expect(board.color(1), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [1, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
      expect(board.move.column, equals(0));
      expect(board.move.row, equals(3));
    });
  });
}

void down() {
  test("Color down from starting position", () {
    Board board = Board();
    expect(board.down([1]), isFalse);
    expect(
      board.getBoard,
      equals([
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(0));
    expect(board.move.row, equals(3));
  });
  test("Color down from position 0 2", () {
    Board board = Board();
    expect(board.move.toPosition(0, 2), isTrue);
    expect(board.down([1]), isTrue);
    expect(
      board.getBoard,
      equals([
        [0, 0, 1, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(2));
    expect(board.move.row, equals(5));
  });
  test("Color down from position 0 2 out of the map", () {
    Board board = Board();
    expect(board.move.toPosition(0, 2), isTrue);
    expect(board.down([1], 7), isFalse);
    expect(
      board.getBoard,
      equals([
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(2));
    expect(board.move.row, equals(0));
  });
  test("Color down from position 0 2 alternate colors", () {
    Board board = Board();
    expect(board.move.toPosition(0, 2), isTrue);
    expect(board.down([1, 2]), isTrue);
    expect(
      board.getBoard,
      equals([
        [0, 0, 1, 0, 0, 0],
        [0, 0, 2, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
        [0, 0, 2, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
        [0, 0, 2, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(2));
    expect(board.move.row, equals(5));
  });
  test("Color down from position 0 2 color 3 cells", () {
    Board board = Board();
    expect(board.move.toPosition(0, 2), isTrue);
    expect(board.down([1], 3), isTrue);
    expect(
      board.getBoard,
      equals([
        [0, 0, 1, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(2));
    expect(board.move.row, equals(2));
  });
  test("Color down from position 0 2 color 3 cells alternate colors", () {
    Board board = Board();
    expect(board.move.toPosition(0, 2), isTrue);
    expect(board.down([1, 2], 3), isTrue);
    expect(
      board.getBoard,
      equals([
        [0, 0, 1, 0, 0, 0],
        [0, 0, 2, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(2));
    expect(board.move.row, equals(2));
  });
}

void fillEmpty() {
  test("Fill empty cells", () {
    Board board = Board();
    board.fillEmpty(1);
    expect(
      board.getBoard,
      equals([
        [1, 1, 1, 1, 1, 1],
        [1, 1, 1, 1, 1, 1],
        [1, 1, 1, 1, 1, 1],
        [1, 1, 1, 1, 1, 1],
        [1, 1, 1, 1, 1, 1],
        [1, 1, 1, 1, 1, 1],
      ]),
    );
    expect(board.move.column, equals(0));
    expect(board.move.row, equals(3));
  });
  test("Fill empty cells", () {
    Board board = Board();
    expect(board.right([2]), isTrue);
    board.fillEmpty(1);
    expect(
      board.getBoard,
      equals([
        [1, 1, 1, 1, 1, 1],
        [1, 1, 1, 1, 1, 1],
        [1, 1, 1, 1, 1, 1],
        [2, 2, 2, 2, 2, 2],
        [1, 1, 1, 1, 1, 1],
        [1, 1, 1, 1, 1, 1],
      ]),
    );
    expect(board.move.column, equals(5));
    expect(board.move.row, equals(3));
  });
  test("Fill empty cells", () {
    Board board = Board();
    expect(board.right([2]), isTrue);
    expect(board.lLeftUp([3]), isTrue);
    board.fillEmpty(1);
    expect(
      board.getBoard,
      equals([
        [1, 1, 1, 1, 1, 1],
        [1, 1, 1, 3, 1, 1],
        [1, 1, 1, 3, 1, 1],
        [2, 2, 2, 3, 3, 3],
        [1, 1, 1, 1, 1, 1],
        [1, 1, 1, 1, 1, 1],
      ]),
    );
    expect(board.move.column, equals(3));
    expect(board.move.row, equals(1));
  });
}

void square() {
  test("Color square from starting position", () {
    Board board = Board();
    expect(board.square([1]), isTrue);
    expect(
      board.getBoard,
      equals([
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [1, 1, 0, 0, 0, 0],
        [1, 1, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(0));
    expect(board.move.row, equals(2));
  });
  test("Color square from starting position alternate", () {
    Board board = Board();
    expect(board.square([1, 2]), isTrue);
    expect(
      board.getBoard,
      equals([
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [2, 1, 0, 0, 0, 0],
        [1, 2, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(0));
    expect(board.move.row, equals(2));
  });
  test("Color square from starting position alternate", () {
    Board board = Board();
    expect(board.square([1, 2, 3]), isTrue);
    expect(
      board.getBoard,
      equals([
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [1, 3, 0, 0, 0, 0],
        [1, 2, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(0));
    expect(board.move.row, equals(2));
  });
  test("Color square from starting position alternate", () {
    Board board = Board();
    expect(board.square([1, 2, 3, 4]), isTrue);
    expect(
      board.getBoard,
      equals([
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [4, 3, 0, 0, 0, 0],
        [1, 2, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(0));
    expect(board.move.row, equals(2));
  });
  test("Color square from starting position alternate", () {
    Board board = Board();
    expect(board.move.diagonalUpRight(), isTrue);
    expect(board.square([1, 2, 3, 4]), isFalse);
    expect(
      board.getBoard,
      equals([
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(1));
    expect(board.move.row, equals(2));
  });
}

void up() {
  test("Color up from starting position", () {
    Board board = Board();
    expect(board.up([1]), isTrue);
    expect(
      board.getBoard,
      equals([
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [1, 0, 0, 0, 0, 0],
        [1, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(0));
    expect(board.move.row, equals(2));
  });
  test("Color up 1 cell from starting position", () {
    Board board = Board();
    expect(board.up([1], 1), isFalse);
    expect(
      board.getBoard,
      equals([
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(0));
    expect(board.move.row, equals(3));
  });
  test("Color up from position 5 2", () {
    Board board = Board();
    expect(board.move.toPosition(5, 2), isTrue);
    expect(board.up([1]), isTrue);
    expect(
      board.getBoard,
      equals([
        [0, 0, 1, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(2));
    expect(board.move.row, equals(0));
  });
  test("Color up from position 5 2 alternate colors", () {
    Board board = Board();
    expect(board.move.toPosition(5, 2), isTrue);
    expect(board.up([1, 2]), isTrue);
    expect(
      board.getBoard,
      equals([
        [0, 0, 2, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
        [0, 0, 2, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
        [0, 0, 2, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(2));
    expect(board.move.row, equals(0));
  });
  test("Color up from position 5 2 color 3 cells", () {
    Board board = Board();
    expect(board.move.toPosition(5, 2), isTrue);
    expect(board.up([1], 3), isTrue);
    expect(
      board.getBoard,
      equals([
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(2));
    expect(board.move.row, equals(3));
  });
  test("Color up from position 5 2 color 3 cells alternate colors", () {
    Board board = Board();
    expect(board.move.toPosition(5, 2), isTrue);
    expect(board.up([1, 2], 3), isTrue);
    expect(
      board.getBoard,
      equals([
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
        [0, 0, 2, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(2));
    expect(board.move.row, equals(3));
  });
  test("Color up from position 5 2 color 7 cells", () {
    Board board = Board();
    expect(board.move.toPosition(5, 2), isTrue);
    expect(board.up([1], 7), isFalse);
    expect(
      board.getBoard,
      equals([
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(2));
    expect(board.move.row, equals(5));
  });
}
