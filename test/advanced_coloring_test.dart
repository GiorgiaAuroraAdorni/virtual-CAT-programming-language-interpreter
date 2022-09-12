import "package:test/expect.dart";
import "package:test/scaffolding.dart";

import "../lib/src/coloring/cross_coloring.dart";

void main() {
  lRightDown();
  lRightUp();
  lLeftDown();
  lLeftUp();
  lDownLeft();
  lDownRight();
  lUpLeft();
  lUpRight();
  zigzagRightUpDown();
  zigzagDownRightLeft();
  zigzagDownLeftRight();
  zigzagRightDownUp();
  zigzagLeftUpDown();
  zigzagLeftDownUp();
  zigzagUpLeftRight();
  zigzagUpRightLeft();
}

void lDownLeft() {
  test("Color L down left from starting position", () {
    Coloring board = Coloring();
    expect(board.lDownLeft([1]), isFalse);
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
  test("Color L down left from position 0 2", () {
    Coloring board = Coloring();
    expect(board.move.toPosition(0, 2), isTrue);
    expect(board.lDownLeft([1]), isTrue);
    expect(
      board.getBoard,
      equals([
        [0, 0, 1, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
        [1, 1, 1, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(0));
    expect(board.move.row, equals(2));
  });
  test("Color L down left from position 2 2", () {
    Coloring board = Coloring();
    expect(board.move.toPosition(2, 2), isTrue);
    expect(board.lDownLeft([1]), isFalse);
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
    expect(board.move.row, equals(2));
  });
  test("Color L down left from position 0 2 alternating colors", () {
    Coloring board = Coloring();
    expect(board.move.toPosition(0, 2), isTrue);
    expect(board.lDownLeft([1, 2]), isTrue);
    expect(
      board.getBoard,
      equals([
        [0, 0, 1, 0, 0, 0],
        [0, 0, 2, 0, 0, 0],
        [1, 2, 1, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(0));
    expect(board.move.row, equals(2));
  });
  test("Color L down left from position 5 3", () {
    Coloring board = Coloring();
    expect(board.move.toPosition(5, 3), isTrue);
    expect(board.lDownLeft([1]), isFalse);
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
    expect(board.move.column, equals(3));
    expect(board.move.row, equals(5));
  });
  test("Color L down left from position 5 2", () {
    Coloring board = Coloring();
    expect(board.move.toPosition(5, 2), isTrue);
    expect(board.lDownLeft([1]), isFalse);
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
  test("Color L down left from position 4 2", () {
    Coloring board = Coloring();
    expect(board.move.toPosition(4, 2), isTrue);
    expect(board.lDownLeft([1]), isFalse);
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
    expect(board.move.row, equals(4));
  });
}

void lDownRight() {
  test("Color L down right from starting position", () {
    Coloring board = Coloring();
    expect(board.lDownRight([1]), isFalse);
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
  test("Color L down left from position 0 2", () {
    Coloring board = Coloring();
    expect(board.move.toPosition(0, 2), isTrue);
    expect(board.lDownRight([1]), isTrue);
    expect(
      board.getBoard,
      equals([
        [0, 0, 1, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
        [0, 0, 1, 1, 1, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(4));
    expect(board.move.row, equals(2));
  });
  test("Color L down left from position 2 2", () {
    Coloring board = Coloring();
    expect(board.move.toPosition(2, 2), isTrue);
    expect(board.lDownRight([1]), isFalse);
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
    expect(board.move.row, equals(2));
  });
  test("Color L down left from position 0 2 alternating colors", () {
    Coloring board = Coloring();
    expect(board.move.toPosition(0, 2), isTrue);
    expect(board.lDownRight([1, 2]), isTrue);
    expect(
      board.getBoard,
      equals([
        [0, 0, 1, 0, 0, 0],
        [0, 0, 2, 0, 0, 0],
        [0, 0, 1, 2, 1, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(4));
    expect(board.move.row, equals(2));
  });
  test("Color L down left from position 3 0", () {
    Coloring board = Coloring();
    expect(board.move.toPosition(3, 0), isTrue);
    expect(board.lDownRight([1]), isFalse);
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
}

void lLeftDown() {
  test("Color L left down from position 5 3", () {
    Coloring board = Coloring();
    expect(board.move.right(5), isTrue);
    expect(board.lLeftDown([1]), isTrue);
    expect(
      board.getBoard,
      equals([
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 1, 1, 1],
        [0, 0, 0, 1, 0, 0],
        [0, 0, 0, 1, 0, 0],
      ]),
    );
    expect(board.move.column, equals(3));
    expect(board.move.row, equals(5));
  });
  test("Color L left down from starting position", () {
    Coloring board = Coloring();
    expect(board.lLeftDown([1]), isFalse);
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
  test("Color L left down from position 5 3 alternating", () {
    Coloring board = Coloring();
    expect(board.move.right(5), isTrue);
    expect(board.lLeftDown([1, 2]), isTrue);
    expect(
      board.getBoard,
      equals([
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 1, 2, 1],
        [0, 0, 0, 2, 0, 0],
        [0, 0, 0, 1, 0, 0],
      ]),
    );
    expect(board.move.column, equals(3));
    expect(board.move.row, equals(5));
  });
  test("Color L left down from position 5 3 alternating", () {
    Coloring board = Coloring();
    expect(board.move.right(3), isTrue);
    expect(board.lLeftDown([1, 2]), isFalse);
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
    expect(board.move.column, equals(3));
    expect(board.move.row, equals(3));
  });
}

void lLeftUp() {
  test("Color L left up from position 5 3", () {
    Coloring board = Coloring();
    expect(board.move.right(5), isTrue);
    expect(board.lLeftUp([1]), isTrue);
    expect(
      board.getBoard,
      equals([
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 1, 0, 0],
        [0, 0, 0, 1, 0, 0],
        [0, 0, 0, 1, 1, 1],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(3));
    expect(board.move.row, equals(1));
  });
  test("Color L left down from starting position", () {
    Coloring board = Coloring();
    expect(board.lLeftUp([1]), isFalse);
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
  test("Color L left down from position 5 3 alternating", () {
    Coloring board = Coloring();
    expect(board.move.right(5), isTrue);
    expect(board.lLeftUp([1, 2]), isTrue);
    expect(
      board.getBoard,
      equals([
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 1, 0, 0],
        [0, 0, 0, 2, 0, 0],
        [0, 0, 0, 1, 2, 1],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(3));
    expect(board.move.row, equals(1));
  });
  test("Color L left down from position 5 3 alternating", () {
    Coloring board = Coloring();
    expect(board.move.right(3), isTrue);
    expect(board.lLeftUp([1, 2]), isFalse);
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
    expect(board.move.column, equals(3));
    expect(board.move.row, equals(3));
  });
}

void lRightDown() {
  test("Color L right down from starting position", () {
    Coloring board = Coloring();
    expect(board.lRightDown([1]), isTrue);
    expect(
      board.getBoard,
      equals([
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [1, 1, 1, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(2));
    expect(board.move.row, equals(5));
  });
  test("Color L right down from starting position alternating", () {
    Coloring board = Coloring();
    expect(board.lRightDown([1, 2]), isTrue);
    expect(
      board.getBoard,
      equals([
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [1, 2, 1, 0, 0, 0],
        [0, 0, 2, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(2));
    expect(board.move.row, equals(5));
  });
  test("Color L right down from starting position", () {
    Coloring board = Coloring();
    expect(board.move.right(2), isTrue);
    expect(board.lRightDown([1]), isFalse);
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
    expect(board.move.row, equals(3));
  });
}

void lRightUp() {
  test("Color L right up from starting position", () {
    Coloring board = Coloring();
    expect(board.lRightUp([1]), isTrue);
    expect(
      board.getBoard,
      equals([
        [0, 0, 0, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
        [1, 1, 1, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(2));
    expect(board.move.row, equals(1));
  });
  test("Color L right up from starting position alternating", () {
    Coloring board = Coloring();
    expect(board.lRightUp([1, 2]), isTrue);
    expect(
      board.getBoard,
      equals([
        [0, 0, 0, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
        [0, 0, 2, 0, 0, 0],
        [1, 2, 1, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(2));
    expect(board.move.row, equals(1));
  });
  test("Color L right up from starting position", () {
    Coloring board = Coloring();
    expect(board.move.right(2), isTrue);
    expect(board.lRightUp([1]), isFalse);
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
    expect(board.move.row, equals(3));
  });
}

void lUpLeft() {
  test("Color L up left from starting position", () {
    Coloring board = Coloring();
    expect(board.lUpLeft([1]), isFalse);
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
  test("Color L up left from position 5 2", () {
    Coloring board = Coloring();
    expect(board.move.toPosition(5, 2), isTrue);
    expect(board.lUpLeft([1]), isTrue);
    expect(
      board.getBoard,
      equals([
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [1, 1, 1, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(0));
    expect(board.move.row, equals(3));
  });
  test("Color L up left from position 3 2", () {
    Coloring board = Coloring();
    expect(board.move.toPosition(3, 2), isTrue);
    expect(board.lUpLeft([1]), isFalse);
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
    expect(board.move.row, equals(3));
  });
  test("Color L up left from position 5 2 alternated colors", () {
    Coloring board = Coloring();
    expect(board.move.toPosition(5, 2), isTrue);
    expect(board.lUpLeft([1, 2]), isTrue);
    expect(
      board.getBoard,
      equals([
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [1, 2, 1, 0, 0, 0],
        [0, 0, 2, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(0));
    expect(board.move.row, equals(3));
  });
}

void lUpRight() {
  test("Color L up right from starting position", () {
    Coloring board = Coloring();
    expect(board.lUpRight([1]), isFalse);
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
  test("Color L up right from position 5 2", () {
    Coloring board = Coloring();
    expect(board.move.toPosition(5, 2), isTrue);
    expect(board.lUpRight([1]), isTrue);
    expect(
      board.getBoard,
      equals([
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 1, 1, 1, 0],
        [0, 0, 1, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(4));
    expect(board.move.row, equals(3));
  });
  test("Color L up right from position 3 2", () {
    Coloring board = Coloring();
    expect(board.move.toPosition(3, 2), isTrue);
    expect(board.lUpRight([1]), isFalse);
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
    expect(board.move.row, equals(3));
  });
  test("Color L up right from position 5 2 alternated colors", () {
    Coloring board = Coloring();
    expect(board.move.toPosition(5, 2), isTrue);
    expect(board.lUpRight([1, 2]), isTrue);
    expect(
      board.getBoard,
      equals([
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 1, 2, 1, 0],
        [0, 0, 2, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(4));
    expect(board.move.row, equals(3));
  });
}

void zigzagRightUpDown() {
  group("zig-zag left up down", () {
    test("starting position", () {
      Coloring board = Coloring();
      expect(board.zigzagRightUpDown([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 1, 0, 1, 0, 1],
          [1, 0, 1, 0, 1, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
    });
    test("starting position 3 point", () {
      Coloring board = Coloring();
      expect(board.zigzagRightUpDown([1], 3), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 1, 0, 0, 0, 0],
          [1, 0, 1, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
    });
    test("starting position 2 point", () {
      Coloring board = Coloring();
      expect(board.zigzagRightUpDown([1], 2), isFalse);
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
    });
    test("starting position alternating", () {
      Coloring board = Coloring();
      expect(board.zigzagRightUpDown([1, 2]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 2, 0, 2, 0, 2],
          [1, 0, 1, 0, 1, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
    });
    test("position 3 1", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(3, 1), isTrue);
      expect(board.zigzagRightUpDown([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [1, 0, 1, 0, 1, 0],
          [0, 1, 0, 1, 0, 1],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
    });
    test("position 3 1 alternating", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(3, 1), isTrue);
      expect(board.zigzagRightUpDown([1, 2]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [2, 0, 2, 0, 2, 0],
          [0, 1, 0, 1, 0, 1],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
    });
    test("position 1 2", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(1, 2), isTrue);
      expect(board.zigzagRightUpDown([1]), isFalse);
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
    });
    test("position 3 3", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(3, 3), isTrue);
      expect(board.zigzagRightUpDown([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [1, 0, 1, 0, 1, 0],
          [0, 1, 0, 1, 0, 1],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
    });
    test("position 3 2 points 4", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(3, 2), isTrue);
      expect(board.zigzagRightUpDown([1], 4), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 1, 0, 1],
          [0, 0, 1, 0, 1, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
    });
    test("position 3 4", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(3, 4), isTrue);
      expect(board.zigzagRightUpDown([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 1, 0, 1, 0, 1],
          [1, 0, 1, 0, 1, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
    });
    test("position 5 2", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(5, 2), isTrue);
      expect(board.zigzagRightUpDown([1]), isFalse);
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
    });
  });
}

void zigzagDownRightLeft() {
  group("zig-zag down right left", () {
    test("starting position", () {
      Coloring board = Coloring();
      expect(board.zigzagDownRightLeft([1]), isFalse);
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
    });
    test("position 0 2", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(0, 2), isTrue);
      expect(board.zigzagDownRightLeft([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
        ]),
      );
    });
    test("position 0 2 cells 4", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(0, 2), isTrue);
      expect(board.zigzagDownRightLeft([1], 4), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
    });
    test("position 0 2 alternating", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(0, 2), isTrue);
      expect(board.zigzagDownRightLeft([1, 2]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 2, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 2, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 2, 0, 0],
        ]),
      );
    });
    test("position 1 2", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(1, 2), isTrue);
      expect(board.zigzagDownRightLeft([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
        ]),
      );
    });
    test("position 1 2 cells 3", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(1, 2), isTrue);
      expect(board.zigzagDownRightLeft([1], 3), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
    });
    test("position 1 2 alternating", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(1, 2), isTrue);
      expect(board.zigzagDownRightLeft([1, 2]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 2, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 2, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 2, 0, 0],
          [0, 0, 1, 0, 0, 0],
        ]),
      );
    });
    test("position 4 2 to short", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(4, 2), isTrue);
      expect(board.zigzagDownRightLeft([1, 2]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 2, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 2, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 2, 0, 0],
        ]),
      );
    });
  });
}

void zigzagDownLeftRight() {
  group("zig-zag down left right", () {
    test("starting position", () {
      Coloring board = Coloring();
      expect(board.zigzagDownLeftRight([1]), isFalse);
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
    });
    test("position 0 3", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(0, 3), isTrue);
      expect(board.zigzagDownLeftRight([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
        ]),
      );
    });
    test("position 0 3 cells 4", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(0, 3), isTrue);
      expect(board.zigzagDownLeftRight([1], 4), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
    });
    test("position 0 3 alternating", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(0, 3), isTrue);
      expect(board.zigzagDownLeftRight([1, 2]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 1, 0, 0],
          [0, 0, 2, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 2, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 2, 0, 0, 0],
        ]),
      );
    });
    test("position 1 3", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(1, 3), isTrue);
      expect(board.zigzagDownLeftRight([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
        ]),
      );
    });
    test("position 1 3 cells 3", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(1, 3), isTrue);
      expect(board.zigzagDownLeftRight([1], 3), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
    });
    test("position 1 3 alternating", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(1, 3), isTrue);
      expect(board.zigzagDownLeftRight([1, 2]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 2, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 2, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 2, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
        ]),
      );
    });
    test("position 4 3 to short", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(4, 3), isTrue);
      expect(board.zigzagDownLeftRight([1, 2]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 1, 0, 0],
          [0, 0, 2, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 2, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 2, 0, 0, 0]
        ]),
      );
    });
  });
}

void zigzagRightDownUp() {
  group("zig-zag right down up", () {
    test("starting position", () {
      Coloring board = Coloring();
      expect(board.zigzagRightDownUp([1]), isFalse);
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
    });
    test("position 2 0", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(2, 0), isTrue);
      expect(board.zigzagRightDownUp([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [1, 0, 1, 0, 1, 0],
          [0, 1, 0, 1, 0, 1],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
    });
    test("position 2 0 cells 4", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(2, 0), isTrue);
      expect(board.zigzagRightDownUp([1], 4), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [1, 0, 1, 0, 0, 0],
          [0, 1, 0, 1, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
    });
    test("position 2 0 alternating", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(2, 0), isTrue);
      expect(board.zigzagRightDownUp([1, 2]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [1, 0, 1, 0, 1, 0],
          [0, 2, 0, 2, 0, 2],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
    });
    test("position 2 1", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(2, 1), isTrue);
      expect(board.zigzagRightDownUp([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 1, 0, 1, 0, 1],
          [1, 0, 1, 0, 1, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
    });
    test("position 2 1 cells 3", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(2, 1), isTrue);
      expect(board.zigzagRightDownUp([1], 3), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 1, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
    });
    test("position 2 1 alternating", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(2, 1), isTrue);
      expect(board.zigzagRightDownUp([1, 2]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 1, 0, 1, 0, 1],
          [2, 0, 2, 0, 2, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
    });
    test("position 2 4 to short", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(2, 4), isTrue);
      expect(board.zigzagRightDownUp([1, 2]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [1, 0, 1, 0, 1, 0],
          [0, 2, 0, 2, 0, 2],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0]
        ]),
      );
    });
  });
}

void zigzagLeftUpDown() {
  group("zig-zag left up down", () {
    test("starting position", () {
      Coloring board = Coloring();
      expect(board.zigzagLeftUpDown([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 1, 0, 1, 0, 1],
          [1, 0, 1, 0, 1, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0]
        ]),
      );
    });
    test("position 3 5", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(3, 5), isTrue);
      expect(board.zigzagLeftUpDown([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [1, 0, 1, 0, 1, 0],
          [0, 1, 0, 1, 0, 1],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
    });
    test("position 3 5 cells 4", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(3, 5), isTrue);
      expect(board.zigzagLeftUpDown([1], 4), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 1, 0, 1, 0],
          [0, 0, 0, 1, 0, 1],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
    });
    test("position 3 5 alternating", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(3, 5), isTrue);
      expect(board.zigzagLeftUpDown([1, 2]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [2, 0, 2, 0, 2, 0],
          [0, 1, 0, 1, 0, 1],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
    });
    test("position 3 4", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(3, 4), isTrue);
      expect(board.zigzagLeftUpDown([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 1, 0, 1, 0, 1],
          [1, 0, 1, 0, 1, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
    });
    test("position 3 4 cells 3", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(3, 4), isTrue);
      expect(board.zigzagLeftUpDown([1], 3), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 1, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
    });
    test("position 3 4 alternating", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(3, 4), isTrue);
      expect(board.zigzagLeftUpDown([1, 2]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 2, 0, 2, 0, 2],
          [1, 0, 1, 0, 1, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
    });
    test("position 3 2 to short", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(3, 1), isTrue);
      expect(board.zigzagLeftUpDown([1, 2]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [2, 0, 2, 0, 2, 0],
          [0, 1, 0, 1, 0, 1],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0]
        ]),
      );
    });
  });
}

void zigzagLeftDownUp() {
  group("zig-zag left down up", () {
    test("starting position", () {
      Coloring board = Coloring();
      expect(board.zigzagLeftDownUp([1]), isFalse);
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
    });
    test("position 2 5", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(2, 5), isTrue);
      expect(board.zigzagLeftDownUp([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 1, 0, 1, 0, 1],
          [1, 0, 1, 0, 1, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
    });
    test("position 2 5 cells 4", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(2, 5), isTrue);
      expect(board.zigzagLeftDownUp([1], 4), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 1, 0, 1],
          [0, 0, 1, 0, 1, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
    });
    test("position 2 5 alternating", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(2, 5), isTrue);
      expect(board.zigzagLeftDownUp([1, 2]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 1, 0, 1, 0, 1],
          [2, 0, 2, 0, 2, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
    });
    test("position 2 4", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(2, 4), isTrue);
      expect(board.zigzagLeftDownUp([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [1, 0, 1, 0, 1, 0],
          [0, 1, 0, 1, 0, 1],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
    });
    test("position 2 4 cells 3", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(2, 4), isTrue);
      expect(board.zigzagLeftDownUp([1], 3), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 1, 0, 1, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
    });
    test("position 2 4 alternating", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(2, 4), isTrue);
      expect(board.zigzagLeftDownUp([1, 2]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [1, 0, 1, 0, 1, 0],
          [0, 2, 0, 2, 0, 2],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
    });
    test("position 2 1 to short", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(2, 1), isTrue);
      expect(board.zigzagLeftDownUp([1, 2]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 1, 0, 1, 0, 1],
          [2, 0, 2, 0, 2, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0]
        ]),
      );
    });
  });
}

void zigzagUpLeftRight() {
  group("zig-zag up left right", () {
    test("starting position", () {
      Coloring board = Coloring();
      expect(board.zigzagUpLeftRight([1]), isFalse);
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
    });
    test("position 5 3", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(5, 3), isTrue);
      expect(board.zigzagUpLeftRight([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
        ]),
      );
    });
    test("position 5 3 cells 4", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(5, 3), isTrue);
      expect(board.zigzagUpLeftRight([1], 4), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
        ]),
      );
    });
    test("position 5 3 alternating", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(5, 3), isTrue);
      expect(board.zigzagUpLeftRight([1, 2]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 2, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 2, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 2, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
        ]),
      );
    });
    test("position 4 2", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(4, 3), isTrue);
      expect(board.zigzagUpLeftRight([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
        ]),
      );
    });
    test("position 4 3 cells 3", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(4, 3), isTrue);
      expect(board.zigzagUpLeftRight([1], 3), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
    });
    test("position 4 3 alternating", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(4, 3), isTrue);
      expect(board.zigzagUpLeftRight([1, 2]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 1, 0, 0],
          [0, 0, 2, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 2, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 2, 0, 0, 0],
        ]),
      );
    });
    test("position 1 3 to short", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(1, 3), isTrue);
      expect(board.zigzagUpLeftRight([1, 2]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 2, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 2, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 2, 0, 0, 0],
          [0, 0, 0, 1, 0, 0]
        ]),
      );
    });
  });
}

void zigzagUpRightLeft() {
  group("zig-zag up left right", () {
    test("starting position", () {
      Coloring board = Coloring();
      expect(board.zigzagUpRightLeft([1]), isFalse);
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
    });
    test("position 5 2", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(5, 2), isTrue);
      expect(board.zigzagUpRightLeft([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
        ]),
      );
    });
    test("position 5 2 cells 4", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(5, 2), isTrue);
      expect(board.zigzagUpRightLeft([1], 4), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
        ]),
      );
    });
    test("position 5 2 alternating", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(5, 2), isTrue);
      expect(board.zigzagUpRightLeft([1, 2]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 2, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 2, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 2, 0, 0],
          [0, 0, 1, 0, 0, 0],
        ]),
      );
    });
    test("position 4 2", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(4, 2), isTrue);
      expect(board.zigzagUpRightLeft([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
        ]),
      );
    });
    test("position 4 2 cells 3", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(4, 2), isTrue);
      expect(board.zigzagUpRightLeft([1], 3), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
    });
    test("position 4 2 alternating", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(4, 2), isTrue);
      expect(board.zigzagUpRightLeft([1, 2]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 2, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 2, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 2, 0, 0],
        ]),
      );
    });
    test("position 1 2 to short", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(1, 2), isTrue);
      expect(board.zigzagUpRightLeft([1, 2]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 2, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 2, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 2, 0, 0],
          [0, 0, 1, 0, 0, 0]
        ]),
      );
    });
    test("position 1 2 to short", () {
      Coloring board = Coloring();
      expect(board.move.toPosition(1, 2), isTrue);
      expect(board.zigzagUpRightLeft([1, 2, 3]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 2, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 3, 0, 0],
          [0, 0, 2, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 3, 0, 0, 0]
        ]),
      );
    });
  });
}