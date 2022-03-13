import "package:test/expect.dart";
import "package:test/scaffolding.dart";

import "../bin/cross_coloring.dart";

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
}

void lDownLeft() {
  test("Color L down left from starting position", () {
    CrossColoring board = CrossColoring();
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
    CrossColoring board = CrossColoring();
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
    CrossColoring board = CrossColoring();
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
    CrossColoring board = CrossColoring();
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
    CrossColoring board = CrossColoring();
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
    CrossColoring board = CrossColoring();
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
    CrossColoring board = CrossColoring();
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
    CrossColoring board = CrossColoring();
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
    CrossColoring board = CrossColoring();
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
    CrossColoring board = CrossColoring();
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
    CrossColoring board = CrossColoring();
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
    CrossColoring board = CrossColoring();
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
    CrossColoring board = CrossColoring();
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
    CrossColoring board = CrossColoring();
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
    CrossColoring board = CrossColoring();
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
    CrossColoring board = CrossColoring();
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
    CrossColoring board = CrossColoring();
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
    CrossColoring board = CrossColoring();
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
    CrossColoring board = CrossColoring();
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
    CrossColoring board = CrossColoring();
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
    CrossColoring board = CrossColoring();
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
    CrossColoring board = CrossColoring();
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
    CrossColoring board = CrossColoring();
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
    CrossColoring board = CrossColoring();
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
    CrossColoring board = CrossColoring();
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
    CrossColoring board = CrossColoring();
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
    CrossColoring board = CrossColoring();
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
    CrossColoring board = CrossColoring();
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
    CrossColoring board = CrossColoring();
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
    CrossColoring board = CrossColoring();
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
    CrossColoring board = CrossColoring();
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
    CrossColoring board = CrossColoring();
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
    CrossColoring board = CrossColoring();
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
    CrossColoring board = CrossColoring();
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

void zigzagRightUpDown(){
  group("zig-zag left up down",() {
    test("starting position",() {
      CrossColoring board = CrossColoring();
      expect(board.zigzagRightUpDown([1]), isFalse);
    });
  });
}
