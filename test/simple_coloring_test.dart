import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../lib/src/coloring/advanced_coloring.dart';
import "../lib/src/utils/shape.dart";

void main() {
  // test("Creation and toString", () {
  //   Coloring board = Coloring(Shape.cross.build);
  //   expect(board, isNotNull);
  //   expect(
  //     board.toString(),
  //     equals("[      0, 0      ]\n"
  //         "[      0, 0      ]\n"
  //         "[0, 0, 0, 0, 0, 0]\n"
  //         "[0, 0, 0, 0, 0, 0]\n"
  //         "[      0, 0      ]\n"
  //         "[      0, 0      ]"),
  //   );
  // });
  color();
  fillEmpty();
  down();
  up();
  left();
  right();
  square();
  diagonalUpRight();
  diagonalUpLeft();
  diagonalDownRight();
  diagonalDownLeft();
}

void color() {
  group("Basic color command", () {
    test("Color default cell", () {
      Coloring board = Coloring(Shape.cross.build);
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
    Coloring board = Coloring(Shape.cross.build);
    expect(board.down([1]), isTrue);
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
    expect(board.move.row, equals(3));
  });
  test("Color down from position 0 2", () {
    Coloring board = Coloring(Shape.cross.build);
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
  test("Color down from position 0 2", () {
    Coloring board = Coloring(Shape.cross.build);
    expect(board.move.toPosition(0, 2), isTrue);
    expect(board.move.down(), isTrue);
    expect(board.down([1, 2]), isTrue);
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
    expect(board.move.row, equals(5));
  });
  test("Color down from position 0 2 out of the map", () {
    Coloring board = Coloring(Shape.cross.build);
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
    Coloring board = Coloring(Shape.cross.build);
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
  test("Color down from position 0 2 alternate colors", () {
    Coloring board = Coloring(Shape.cross.build);
    expect(board.move.toPosition(0, 2), isTrue);
    expect(board.move.down(), isTrue);
    expect(board.down([1, 2]), isTrue);
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
    expect(board.move.row, equals(5));
  });
  test("Color down from position 0 2 alternate colors", () {
    Coloring board = Coloring(Shape.cross.build);
    expect(board.move.toPosition(0, 2), isTrue);
    expect(board.move.down(), isTrue);
    expect(board.down([1, 2, 3]), isTrue);
    expect(
      board.getBoard,
      equals([
        [0, 0, 3, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
        [0, 0, 2, 0, 0, 0],
        [0, 0, 3, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
        [0, 0, 2, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(2));
    expect(board.move.row, equals(5));
  });
  test("Color down from position 0 2 alternate colors", () {
    Coloring board = Coloring(Shape.cross.build);
    expect(board.move.toPosition(0, 2), isTrue);
    expect(board.move.down(2), isTrue);
    expect(board.down([1, 2, 3, 4]), isTrue);
    expect(
      board.getBoard,
      equals([
        [0, 0, 3, 0, 0, 0],
        [0, 0, 4, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
        [0, 0, 2, 0, 0, 0],
        [0, 0, 3, 0, 0, 0],
        [0, 0, 4, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(2));
    expect(board.move.row, equals(5));
  });
  test("Color down from position 0 2 color 3 cells", () {
    Coloring board = Coloring(Shape.cross.build);
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
    Coloring board = Coloring(Shape.cross.build);
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
    Coloring board = Coloring(Shape.cross.build);
    board.fillEmpty(1);
    expect(
      board.getBoard,
      equals([
        [0, 0, 1, 1, 0, 0],
        [0, 0, 1, 1, 0, 0],
        [1, 1, 1, 1, 1, 1],
        [1, 1, 1, 1, 1, 1],
        [0, 0, 1, 1, 0, 0],
        [0, 0, 1, 1, 0, 0],
      ]),
    );
    expect(board.move.column, equals(0));
    expect(board.move.row, equals(3));
  });
  test("Fill empty cells", () {
    Coloring board = Coloring(Shape.cross.build);
    expect(board.right([2]), isTrue);
    board.fillEmpty(1);
    expect(
      board.getBoard,
      equals([
        [0, 0, 1, 1, 0, 0],
        [0, 0, 1, 1, 0, 0],
        [1, 1, 1, 1, 1, 1],
        [2, 2, 2, 2, 2, 2],
        [0, 0, 1, 1, 0, 0],
        [0, 0, 1, 1, 0, 0],
      ]),
    );
    expect(board.move.column, equals(5));
    expect(board.move.row, equals(3));
  });
  test("Fill empty cells", () {
    Coloring board = Coloring(Shape.cross.build);
    expect(board.right([2]), isTrue);
    expect(board.lLeftUp([3]), isTrue);
    board.fillEmpty(1);
    expect(
      board.getBoard,
      equals([
        [0, 0, 1, 1, 0, 0],
        [0, 0, 1, 3, 0, 0],
        [1, 1, 1, 3, 1, 1],
        [2, 2, 2, 3, 3, 3],
        [0, 0, 1, 1, 0, 0],
        [0, 0, 1, 1, 0, 0],
      ]),
    );
    expect(board.move.column, equals(3));
    expect(board.move.row, equals(1));
  });
}

void square() {
  test("Color square from starting position", () {
    Coloring board = Coloring(Shape.cross.build);
    expect(board.squareRightUpLeft([1]), isTrue);
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
    Coloring board = Coloring(Shape.cross.build);
    expect(board.squareRightUpLeft([1, 2]), isTrue);
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
    Coloring board = Coloring(Shape.cross.build);
    expect(board.squareRightUpLeft([1, 2, 3]), isTrue);
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
    Coloring board = Coloring(Shape.cross.build);
    expect(board.squareRightUpLeft([1, 2, 3, 4]), isTrue);
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
    Coloring board = Coloring(Shape.cross.build);
    expect(board.move.up(), isTrue);
    expect(board.squareRightUpLeft([1, 2, 3, 4]), isFalse);
    expect(board.move.column, equals(0));
    expect(board.move.row, equals(2));
  });
  test("Color square from starting position alternate", () {
    Coloring board = Coloring(Shape.cross.build);
    expect(board.move.up(), isTrue);
    expect(board.squareDownRightUp([1, 2, 3, 4]), isTrue);
    expect(
      board.getBoard,
      equals([
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [1, 4, 0, 0, 0, 0],
        [2, 3, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(1));
    expect(board.move.row, equals(2));
  });
  test("Color square from starting position alternate", () {
    Coloring board = Coloring(Shape.cross.build);
    expect(board.move.right(), isTrue);
    expect(board.squareUpLeftDown([1, 2, 3, 4]), isTrue);
    expect(
      board.getBoard,
      equals([
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [3, 2, 0, 0, 0, 0],
        [4, 1, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(0));
    expect(board.move.row, equals(3));
  });
  test("Color square from starting position alternate", () {
    Coloring board = Coloring(Shape.cross.build);
    expect(board.move.diagonalUpRight(), isTrue);
    expect(board.squareLeftDownRight([1, 2, 3, 4]), isTrue);
    expect(
      board.getBoard,
      equals([
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [2, 1, 0, 0, 0, 0],
        [3, 4, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
      ]),
    );
    expect(board.move.column, equals(1));
    expect(board.move.row, equals(3));
  });
  test("Color square from starting position alternate", () {
    Coloring board = Coloring(Shape.cross.build);
    expect(board.move.diagonalUpRight(), isTrue);
    expect(board.squareRightUpLeft([1, 2, 3, 4]), isFalse);
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
    Coloring board = Coloring(Shape.cross.build);
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
    Coloring board = Coloring(Shape.cross.build);
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
    Coloring board = Coloring(Shape.cross.build);
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
    Coloring board = Coloring(Shape.cross.build);
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
    Coloring board = Coloring(Shape.cross.build);
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
    Coloring board = Coloring(Shape.cross.build);
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
    Coloring board = Coloring(Shape.cross.build);
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
  test("Color up from position 3 2 color", () {
    Coloring board = Coloring(Shape.cross.build);
    expect(board.move.toPosition(3, 2), isTrue);
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
  test("Color up from position 3 2 color alternated", () {
    Coloring board = Coloring(Shape.cross.build);
    expect(board.move.toPosition(3, 2), isTrue);
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
}

void left() {
  group("Color direction left", () {
    test("Color left from starting position", () {
      Coloring board = Coloring(Shape.cross.build);
      expect(board.left([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [1, 1, 1, 1, 1, 1],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
      expect(board.move.column, equals(0));
      expect(board.move.row, equals(3));
    });
    test("Color left from starting position", () {
      Coloring board = Coloring(Shape.cross.build);
      expect(board.move.down(), isFalse);
      expect(board.left([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [1, 1, 1, 1, 1, 1],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
      expect(board.move.column, equals(0));
      expect(board.move.row, equals(3));
    });
    test("Color left from starting position", () {
      Coloring board = Coloring(Shape.cross.build);
      expect(board.move.down(), isFalse);
      expect(board.left([1], 2), isFalse);
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
    test("Color left from starting position", () {
      Coloring board = Coloring(Shape.cross.build);
      expect(board.move.toPosition(3, 5), isTrue);
      expect(board.left([1, 2]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [2, 1, 2, 1, 2, 1],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
      expect(board.move.column, equals(0));
      expect(board.move.row, equals(3));
    });
    test("Color left from starting position", () {
      Coloring board = Coloring(Shape.cross.build);
      expect(board.left([1, 2, 3]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [2, 1, 3, 2, 1, 3],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
      expect(board.move.column, equals(0));
      expect(board.move.row, equals(3));
    });
  });
}

void right() {
  group("Color direction right", () {
    test("Color right from starting position", () {
      Coloring board = Coloring(Shape.cross.build);
      expect(board.right([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [1, 1, 1, 1, 1, 1],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
      expect(board.move.column, equals(5));
      expect(board.move.row, equals(3));
    });
    test("Color right from position 3 5", () {
      Coloring board = Coloring(Shape.cross.build);
      expect(board.move.toPosition(3, 5), isTrue);
      expect(board.right([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [1, 1, 1, 1, 1, 1],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
      expect(board.move.column, equals(5));
      expect(board.move.row, equals(3));
    });
    test("Color right from starting position", () {
      Coloring board = Coloring(Shape.cross.build);
      expect(board.move.down(), isFalse);
      expect(board.right([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [1, 1, 1, 1, 1, 1],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
      expect(board.move.column, equals(5));
      expect(board.move.row, equals(3));
    });
    test("Color right from starting position", () {
      Coloring board = Coloring(Shape.cross.build);
      expect(board.move.down(), isFalse);
      expect(board.right([1], 3), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [1, 1, 1, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
      expect(board.move.column, equals(2));
      expect(board.move.row, equals(3));
    });
    test("Color right from starting position", () {
      Coloring board = Coloring(Shape.cross.build);
      expect(board.move.down(), isFalse);
      expect(board.move.right(), isTrue);
      expect(board.right([1, 2]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [2, 1, 2, 1, 2, 1],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
      expect(board.move.column, equals(5));
      expect(board.move.row, equals(3));
    });
    test("Color right from starting position", () {
      Coloring board = Coloring(Shape.cross.build);
      expect(board.move.right(), isTrue);
      expect(board.right([1, 2, 3]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [3, 1, 2, 3, 1, 2],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
      expect(board.move.column, equals(5));
      expect(board.move.row, equals(3));
    });
  });
}

void diagonalUpRight() {
  group("Diagonal up right coloring", () {
    test("Starting position invalid input", () {
      Coloring board = Coloring(Shape.cross.build);
      expect(board.diagonalUpRight([1], -1), isFalse);
      expect(board.move.row, equals(3));
      expect(board.move.column, equals(0));
      expect(board.diagonalUpRight([1], 0), isFalse);
      expect(board.move.row, equals(3));
      expect(board.move.column, equals(0));
      expect(board.diagonalUpRight([1], 1), isFalse);
      expect(board.move.row, equals(3));
      expect(board.move.column, equals(0));
    });
    test("Start position color all diagonal", () {
      Coloring board = Coloring(Shape.cross.build);
      expect(board.diagonalUpRight([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 1, 0, 0, 0, 0],
          [1, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
      expect(board.move.row, equals(0));
      expect(board.move.column, equals(3));
    });
    test("Position 2 1 color all diagonal", () {
      Coloring board = Coloring(Shape.cross.build);
      expect(board.move.diagonalUpRight(), isTrue);
      expect(board.diagonalUpRight([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 1, 0, 0, 0, 0],
          [1, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
      expect(board.move.row, equals(0));
      expect(board.move.column, equals(3));
    });
    test("Position 2 0 color all diagonal", () {
      Coloring board = Coloring(Shape.cross.build);
      expect(board.move.up(), isTrue);
      expect(board.diagonalUpRight([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [1, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
      expect(board.move.row, equals(0));
      expect(board.move.column, equals(2));
    });
    test("Position 5 3 color all diagonal", () {
      Coloring board = Coloring(Shape.cross.build);
      expect(board.move.toPosition(5, 3), isTrue);
      expect(board.diagonalUpRight([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 1],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
        ]),
      );
      expect(board.move.row, equals(3));
      expect(board.move.column, equals(5));
    });
  });
}

void diagonalUpLeft() {
  group("Diagonal up left coloring", () {
    test("Starting position invalid input", () {
      Coloring board = Coloring(Shape.cross.build);
      expect(board.diagonalUpLeft([1], -1), isFalse);
      expect(board.move.row, equals(3));
      expect(board.move.column, equals(0));
      expect(board.diagonalUpLeft([1], 0), isFalse);
      expect(board.move.row, equals(3));
      expect(board.move.column, equals(0));
      expect(board.diagonalUpLeft([1], 1), isFalse);
      expect(board.move.row, equals(3));
      expect(board.move.column, equals(0));
    });
    test("Start position color all diagonal", () {
      Coloring board = Coloring(Shape.cross.build);
      expect(board.diagonalUpLeft([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [1, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 1, 0, 0, 0],
        ]),
      );
      expect(board.move.row, equals(3));
      expect(board.move.column, equals(0));
    });
    test("Position 2 1 color all diagonal", () {
      Coloring board = Coloring(Shape.cross.build);
      expect(board.move.diagonalUpRight(), isTrue);
      expect(board.diagonalUpLeft([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 1, 0, 0, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
      expect(board.move.row, equals(2));
      expect(board.move.column, equals(1));
    });
    test("Position 2 5 color all diagonal", () {
      Coloring board = Coloring(Shape.cross.build);
      expect(board.move.toPosition(2, 5), isTrue);
      expect(board.diagonalUpLeft([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 1, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 1],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
      expect(board.move.row, equals(0));
      expect(board.move.column, equals(3));
    });
    test("Position 5 3 color all diagonal", () {
      Coloring board = Coloring(Shape.cross.build);
      expect(board.move.toPosition(0, 2), isTrue);
      expect(board.diagonalUpLeft([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 0, 0, 1, 0],
          [0, 0, 0, 0, 0, 1],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
      expect(board.move.row, equals(0));
      expect(board.move.column, equals(2));
    });
    test("Position 5 3 color all diagonal", () {
      Coloring board = Coloring(Shape.cross.build);
      expect(board.move.toPosition(5, 3), isTrue);
      expect(board.diagonalUpLeft([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [1, 0, 0, 0, 0, 0],
          [0, 1, 0, 0, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
        ]),
      );
      expect(board.move.row, equals(2));
      expect(board.move.column, equals(0));
    });
  });
}

void diagonalDownRight(){
  group("Diagonal down right coloring", () {
    test("Starting position invalid input", () {
      Coloring board = Coloring(Shape.cross.build);
      expect(board.diagonalDownRight([1], -1), isFalse);
      expect(board.move.row, equals(3));
      expect(board.move.column, equals(0));
      expect(board.diagonalDownRight([1], 0), isFalse);
      expect(board.move.row, equals(3));
      expect(board.move.column, equals(0));
      expect(board.diagonalDownRight([1], 1), isFalse);
      expect(board.move.row, equals(3));
      expect(board.move.column, equals(0));
    });
    test("Start position color all diagonal", () {
      Coloring board = Coloring(Shape.cross.build);
      expect(board.diagonalDownRight([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [1, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 1, 0, 0, 0],
        ]),
      );
      expect(board.move.row, equals(5));
      expect(board.move.column, equals(2));
    });
    test("Position 2 1 color all diagonal", () {
      Coloring board = Coloring(Shape.cross.build);
      expect(board.move.diagonalUpRight(), isTrue);
      expect(board.diagonalDownRight([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 1, 0, 0, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
      expect(board.move.row, equals(4));
      expect(board.move.column, equals(3));
    });
    test("Position 2 5 color all diagonal", () {
      Coloring board = Coloring(Shape.cross.build);
      expect(board.move.toPosition(2, 5), isTrue);
      expect(board.diagonalDownRight([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 1, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 1],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
      expect(board.move.row, equals(2));
      expect(board.move.column, equals(5));
    });
    test("Position 5 3 color all diagonal", () {
      Coloring board = Coloring(Shape.cross.build);
      expect(board.move.toPosition(3, 5), isTrue);
      expect(board.diagonalDownRight([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 0, 0, 1, 0],
          [0, 0, 0, 0, 0, 1],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
      expect(board.move.row, equals(3));
      expect(board.move.column, equals(5));
    });
    test("Position 5 3 color all diagonal", () {
      Coloring board = Coloring(Shape.cross.build);
      expect(board.move.toPosition(5, 3), isTrue);
      expect(board.diagonalDownRight([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [1, 0, 0, 0, 0, 0],
          [0, 1, 0, 0, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
        ]),
      );
      expect(board.move.row, equals(5));
      expect(board.move.column, equals(3));
    });
  });
}

void diagonalDownLeft() {
  group("Diagonal down left coloring", () {
    test("Starting position invalid input", () {
      Coloring board = Coloring(Shape.cross.build);
      expect(board.diagonalDownLeft([1], -1), isFalse);
      expect(board.move.row, equals(3));
      expect(board.move.column, equals(0));
      expect(board.diagonalDownLeft([1], 0), isFalse);
      expect(board.move.row, equals(3));
      expect(board.move.column, equals(0));
      expect(board.diagonalDownLeft([1], 1), isFalse);
      expect(board.move.row, equals(3));
      expect(board.move.column, equals(0));
    });
    test("Start position color all diagonal", () {
      Coloring board = Coloring(Shape.cross.build);
      expect(board.diagonalDownLeft([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 1, 0, 0, 0, 0],
          [1, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
      expect(board.move.row, equals(3));
      expect(board.move.column, equals(0));
    });
    test("Start position color all diagonal", () {
      Coloring board = Coloring(Shape.cross.build);
      expect(board.diagonalDownLeft([1, 2]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 2, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 2, 0, 0, 0, 0],
          [1, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
      expect(board.move.row, equals(3));
      expect(board.move.column, equals(0));
    });
    test("Position 2 1 color all diagonal", () {
      Coloring board = Coloring(Shape.cross.build);
      expect(board.move.diagonalUpRight(), isTrue);
      expect(board.diagonalDownLeft([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 1, 0, 0, 0, 0],
          [1, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
      expect(board.move.row, equals(3));
      expect(board.move.column, equals(0));
    });
    test("Position 2 1 color all diagonal", () {
      Coloring board = Coloring(Shape.cross.build);
      expect(board.move.diagonalUpRight(), isTrue);
      expect(board.diagonalDownLeft([1, 2]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 1, 0, 0],
          [0, 0, 2, 0, 0, 0],
          [0, 1, 0, 0, 0, 0],
          [2, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
      expect(board.move.row, equals(3));
      expect(board.move.column, equals(0));
    });
    test("Position 2 0 color all diagonal", () {
      Coloring board = Coloring(Shape.cross.build);
      expect(board.move.up(), isTrue);
      expect(board.diagonalDownLeft([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [1, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
        ]),
      );
      expect(board.move.row, equals(2));
      expect(board.move.column, equals(0));
    });
    test("Position 5 3 color all diagonal", () {
      Coloring board = Coloring(Shape.cross.build);
      expect(board.move.toPosition(5, 3), isTrue);
      expect(board.diagonalDownLeft([1]), isTrue);
      expect(
        board.getBoard,
        equals([
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 1],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
        ]),
      );
      expect(board.move.row, equals(5));
      expect(board.move.column, equals(3));
    });
  });
}