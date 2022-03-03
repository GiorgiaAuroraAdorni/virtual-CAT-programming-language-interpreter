import 'package:test/test.dart';

import '../bin/move.dart';

void main() {
  creation();
  movementsInput();
  coordinateMovement();
  up();
  down();
  right();
  left();
  diagonalUpRight();
  diagonalUpLeft();
  diagonalDownRight();
  diagonalDownLeft();
  toString();
}

void movementsInput() {
  group("Input to movements", () {
    Move move = Move();
    test("up", () {
      expect(move.up(0), isFalse);
      expect(move.up(-1), isFalse);
    });
    test("down", () {
      expect(move.down(0), isFalse);
      expect(move.down(-1), isFalse);
    });
    test("left", () {
      expect(move.left(0), isFalse);
      expect(move.left(-1), isFalse);
    });
    test("right", () {
      expect(move.left(0), isFalse);
      expect(move.left(-1), isFalse);
    });
    test("diagonal up right", () {
      expect(move.diagonalUpRight(0), isFalse);
      expect(move.diagonalUpRight(-1), isFalse);
    });
    test("diagonal up left", () {
      expect(move.diagonalUpLeft(0), isFalse);
      expect(move.diagonalUpLeft(-1), isFalse);
    });
    test("diagonal down right", () {
      expect(move.diagonalDownRight(0), isFalse);
      expect(move.diagonalDownRight(-1), isFalse);
    });
    test("diagonal down left", () {
      expect(move.diagonalDownLeft(0), isFalse);
      expect(move.diagonalDownLeft(-1), isFalse);
    });
  });
}

void creation() {
  test('Move object', () {
    Move move = Move();
    expect(move, isNotNull);
    expect(move.column, equals(0));
    expect(move.row, equals(3));
  });
}

void coordinateMovement() {
  group("By coordinate movement", () {
    Move move = Move();
    test('-1 -1 position', () {
      expect(move.toPosition(-1, -1), isFalse);
    });
    test('-1 0 position', () {
      expect(move.toPosition(-1, 0), isFalse);
    });
    test('0 0 position', () {
      expect(move.toPosition(0, 0), isFalse);
    });
    test('0 1 position', () {
      expect(move.toPosition(0, 1), isFalse);
    });
    test('0 2 position', () {
      expect(move.toPosition(0, 2), isTrue);
    });
    test('0 3 position', () {
      expect(move.toPosition(0, 3), isTrue);
    });
    test('0 4 position', () {
      expect(move.toPosition(0, 4), isFalse);
    });
    test('0 5 position', () {
      expect(move.toPosition(0, 5), isFalse);
    });
    test('0 6 position', () {
      expect(move.toPosition(0, 5), isFalse);
    });

    test('1 0 position', () {
      expect(move.toPosition(1, 0), isFalse);
    });
    test('1 1 position', () {
      expect(move.toPosition(1, 1), isFalse);
    });
    test('1 2 position', () {
      expect(move.toPosition(1, 2), isTrue);
    });
    test('1 3 position', () {
      expect(move.toPosition(1, 3), isTrue);
    });
    test('1 4 position', () {
      expect(move.toPosition(1, 4), isFalse);
    });
    test('1 5 position', () {
      expect(move.toPosition(1, 5), isFalse);
    });
    test('1 6 position', () {
      expect(move.toPosition(1, 5), isFalse);
    });

    test('2 -1 position', () {
      expect(move.toPosition(2, -1), isFalse);
    });
    test('2 0 position', () {
      expect(move.toPosition(2, 0), isTrue);
    });
    test('2 1 position', () {
      expect(move.toPosition(2, 1), isTrue);
    });
    test('2 2 position', () {
      expect(move.toPosition(2, 2), isTrue);
    });
    test('2 3 position', () {
      expect(move.toPosition(2, 3), isTrue);
    });
    test('2 4 position', () {
      expect(move.toPosition(2, 4), isTrue);
    });
    test('2 5 position', () {
      expect(move.toPosition(2, 5), isTrue);
    });
    test('2 6 position', () {
      expect(move.toPosition(2, 6), isFalse);
    });

    test('3 -1 position', () {
      expect(move.toPosition(3, -1), isFalse);
    });
    test('3 0 position', () {
      expect(move.toPosition(3, 0), isTrue);
    });
    test('3 1 position', () {
      expect(move.toPosition(3, 1), isTrue);
    });
    test('3 2 position', () {
      expect(move.toPosition(3, 2), isTrue);
    });
    test('3 3 position', () {
      expect(move.toPosition(3, 3), isTrue);
    });
    test('3 4 position', () {
      expect(move.toPosition(3, 4), isTrue);
    });
    test('3 5 position', () {
      expect(move.toPosition(3, 5), isTrue);
    });
    test('3 6 position', () {
      expect(move.toPosition(3, 6), isFalse);
    });

    test('4 0 position', () {
      expect(move.toPosition(4, 0), isFalse);
    });
    test('4 1 position', () {
      expect(move.toPosition(4, 1), isFalse);
    });
    test('4 2 position', () {
      expect(move.toPosition(4, 2), isTrue);
    });
    test('4 3 position', () {
      expect(move.toPosition(4, 3), isTrue);
    });
    test('4 4 position', () {
      expect(move.toPosition(4, 4), isFalse);
    });
    test('4 5 position', () {
      expect(move.toPosition(4, 5), isFalse);
    });
    test('4 6 position', () {
      expect(move.toPosition(4, 5), isFalse);
    });

    test('5 0 position', () {
      expect(move.toPosition(5, 0), isFalse);
    });
    test('5 1 position', () {
      expect(move.toPosition(5, 1), isFalse);
    });
    test('5 2 position', () {
      expect(move.toPosition(5, 2), isTrue);
    });
    test('5 3 position', () {
      expect(move.toPosition(5, 3), isTrue);
    });
    test('5 4 position', () {
      expect(move.toPosition(5, 4), isFalse);
    });
    test('5 5 position', () {
      expect(move.toPosition(5, 5), isFalse);
    });
    test('5 6 position', () {
      expect(move.toPosition(5, 5), isFalse);
    });

    test('6 0 position', () {
      expect(move.toPosition(6, 0), isFalse);
    });
    test('6 1 position', () {
      expect(move.toPosition(6, 1), isFalse);
    });
    test('6 2 position', () {
      expect(move.toPosition(6, 2), isFalse);
    });
    test('6 3 position', () {
      expect(move.toPosition(6, 3), isFalse);
    });
    test('6 4 position', () {
      expect(move.toPosition(6, 4), isFalse);
    });
    test('6 5 position', () {
      expect(move.toPosition(6, 5), isFalse);
    });
    test('6 6 position', () {
      expect(move.toPosition(6, 5), isFalse);
    });
  });
}

void up() {
  group("Up movement", () {
    test('Move up from starting position', () {
      Move move = Move();
      expect(move.up(), isTrue);
      expect(move.column, equals(0));
      expect(move.row, equals(2));
    });
    test('Move up 2 from starting position', () {
      Move move = Move();
      expect(move.up(2), isTrue);
      expect(move.column, equals(2));
      expect(move.row, equals(1));
    });
    test('Move up out of the board', () {
      Move move = Move();
      expect(move.up(4), isFalse);
      expect(move.column, equals(0));
      expect(move.row, equals(3));
    });
  });
}

void down() {
  test('Move down from starting position', () {
    Move move = Move();
    expect(move.down(), isTrue);
    expect(move.column, equals(2));
    expect(move.row, equals(4));
  });
  test('Move down 2 from 0 2', () {
    Move move = Move();
    expect(move.toPosition(0, 2), isTrue);
    expect(move.down(2), isTrue);
    expect(move.column, equals(2));
    expect(move.row, equals(2));
  });
  test('Move down from 0 2', () {
    Move move = Move();
    expect(move.toPosition(0, 2), isTrue);
    expect(move.down(), isTrue);
    expect(move.column, equals(2));
    expect(move.row, equals(1));
  });
  test('Move down from 3 5', () {
    Move move = Move();
    expect(move.toPosition(3, 5), isTrue);
    expect(move.down(), isTrue);
    expect(move.column, equals(3));
    expect(move.row, equals(4));
  });
}

void right() {
  group("Move right", () {
    test('Move right from starting position', () {
      Move move = Move();
      expect(move.right(), isTrue);
      expect(move.column, equals(1));
      expect(move.row, equals(3));
    });
    test('Move right 2 from starting position', () {
      Move move = Move();
      expect(move.right(2), isTrue);
      expect(move.column, equals(2));
      expect(move.row, equals(3));
    });
    test('Move right out of the board', () {
      Move move = Move();
      expect(move.right(7), isFalse);
      expect(move.column, equals(0));
      expect(move.row, equals(3));
    });
    test('Move left from position 5 3', () {
      Move move = Move();
      expect(move.toPosition(5, 3), isTrue);
      expect(move.right(), isTrue);
      expect(move.row, equals(3));
      expect(move.column, equals(4));
    });
    test('Move left 2 from position 5 3', () {
      Move move = Move();
      expect(move.toPosition(5, 3), isTrue);
      expect(move.right(2), isTrue);
      expect(move.row, equals(3));
      expect(move.column, equals(5));
    });
    test('Move left from position 4 3', () {
      Move move = Move();
      expect(move.toPosition(4, 3), isTrue);
      expect(move.right(), isTrue);
      expect(move.row, equals(3));
      expect(move.column, equals(4));
    });
    test('Move left from position 0 3', () {
      Move move = Move();
      expect(move.toPosition(0, 3), isTrue);
      expect(move.right(), isTrue);
      expect(move.row, equals(2));
      expect(move.column, equals(4));
    });
    test('Move left 2 from position 1 2', () {
      Move move = Move();
      expect(move.toPosition(1, 2), isTrue);
      expect(move.right(), isTrue);
      expect(move.row, equals(1));
      expect(move.column, equals(3));
    });
  });
}

void left() {
  group("Move left", () {
    test('Move left from starting position', () {
      Move move = Move();
      expect(move.left(), isFalse);
      expect(move.column, equals(0));
      expect(move.row, equals(3));
    });
    test('Move left from an other position starting position', () {
      Move move = Move();
      expect(move.toPosition(2, 2), isTrue);
      expect(move.left(), isTrue);
      expect(move.column, equals(1));
      expect(move.row, equals(2));
    });
    test('Move left from position 5 2', () {
      Move move = Move();
      expect(move.toPosition(5, 2), isTrue);
      expect(move.left(), isTrue);
      expect(move.row, equals(3));
      expect(move.column, equals(1));
    });
    test('Move left 2 from position 5 2', () {
      Move move = Move();
      expect(move.toPosition(5, 2), isTrue);
      expect(move.left(2), isTrue);
      expect(move.row, equals(3));
      expect(move.column, equals(0));
    });
    test('Move left from position 4 2', () {
      Move move = Move();
      expect(move.toPosition(4, 2), isTrue);
      expect(move.left(), isTrue);
      expect(move.row, equals(3));
      expect(move.column, equals(1));
    });
    test('Move left from position 0 2', () {
      Move move = Move();
      expect(move.toPosition(0, 2), isTrue);
      expect(move.left(), isTrue);
      expect(move.row, equals(2));
      expect(move.column, equals(1));
    });
    test('Move left 2 from position 0 2', () {
      Move move = Move();
      expect(move.toPosition(0, 2), isTrue);
      expect(move.left(2), isTrue);
      expect(move.row, equals(2));
      expect(move.column, equals(0));
    });
  });
}

void diagonalUpRight() {
  test("Move in diagonal up right from starting position", () {
    Move move = Move();
    expect(move.diagonalUpRight(), isTrue);
    expect(move.column, equals(1));
    expect(move.row, equals(2));
  });
  test("Move in diagonal 0 2", () {
    Move move = Move();
    expect(move.up(), isTrue);
    expect(move.diagonalUpRight(), isTrue);
    expect(move.column, equals(2));
    expect(move.row, equals(0));
  });
  test("Move in diagonal up right from starting position by 2", () {
    Move move = Move();
    expect(move.diagonalUpRight(2), isTrue);
    expect(move.column, equals(2));
    expect(move.row, equals(1));
  });
  test(
    "Move in diagonal up right from starting position outside of the board",
    () {
      Move move = Move();
      expect(move.diagonalUpRight(5), isFalse);
      expect(move.column, equals(0));
      expect(move.row, equals(3));
    },
  );
}

void diagonalUpLeft() {
  test(
    "Move in diagonal up left from starting position outside of the board",
    () {
      Move move = Move();
      expect(move.diagonalUpLeft(), isFalse);
      expect(move.column, equals(0));
      expect(move.row, equals(3));
    },
  );
  test("Move in diagonal up left from position 3 5", () {
    Move move = Move();
    expect(move.toPosition(3, 5), isTrue);
    expect(move.column, equals(5));
    expect(move.row, equals(3));
    expect(move.diagonalUpLeft(), isTrue);
    expect(move.column, equals(4));
    expect(move.row, equals(2));
  });
  test("Move in diagonal up left from position 2 5", () {
    Move move = Move();
    expect(move.toPosition(2, 5), isTrue);
    expect(move.diagonalUpLeft(), isTrue);
    expect(move.column, equals(3));
    expect(move.row, equals(0));
  });
  test("Move in diagonal up left from position 3 5 by 2", () {
    Move move = Move();
    expect(move.toPosition(3, 5), isTrue);
    expect(move.column, equals(5));
    expect(move.row, equals(3));
    expect(move.diagonalUpLeft(2), isTrue);
    expect(move.column, equals(3));
    expect(move.row, equals(1));
  });
}

void diagonalDownRight() {
  test("Move in diagonal down right from starting position", () {
    Move move = Move();
    expect(move.diagonalDownRight(), isTrue);
    expect(move.column, equals(2));
    expect(move.row, equals(5));
  });
  test("Move in diagonal down right from position 0 2", () {
    Move move = Move();
    expect(move.up(), isTrue);
    expect(move.column, equals(0));
    expect(move.row, equals(2));
    expect(move.diagonalDownRight(), isTrue);
    expect(move.column, equals(1));
    expect(move.row, equals(3));
  });
  test("Move in diagonal down right from position 0 2 by 2", () {
    Move move = Move();
    expect(move.up(), isTrue);
    expect(move.column, equals(0));
    expect(move.row, equals(2));
    expect(move.diagonalDownRight(2), isTrue);
    expect(move.column, equals(2));
    expect(move.row, equals(4));
  });

  test(
    "Move in diagonal down right from starting position outside of the board",
    () {
      Move move = Move();
      expect(move.diagonalDownRight(4), isFalse);
      expect(move.column, equals(0));
      expect(move.row, equals(3));
    },
  );
}

void diagonalDownLeft() {
  test(
    "Move in diagonal up left from starting position outside of the board",
    () {
      Move move = Move();
      expect(move.diagonalDownLeft(), isFalse);
      expect(move.column, equals(0));
      expect(move.row, equals(3));
    },
  );
  test("Move in diagonal up left from position 3 5", () {
    Move move = Move();
    expect(move.toPosition(3, 5), isTrue);
    expect(move.column, equals(5));
    expect(move.row, equals(3));
    expect(move.diagonalDownLeft(), isTrue);
    expect(move.column, equals(3));
    expect(move.row, equals(5));
  });
  test("Move in diagonal up left from position 3 5 by 2", () {
    Move move = Move();
    expect(move.toPosition(3, 5), isTrue);
    expect(move.column, equals(5));
    expect(move.row, equals(3));
    expect(move.diagonalDownLeft(2), isTrue);
    expect(move.column, equals(3));
    expect(move.row, equals(5));
  });
}

void toString() {
  test("Default position", () {
    Move move = Move();
    expect(move.toString(), equals('Row position: 3\nColumn position:0'));
  });
  test("Position 3 5", () {
    Move move = Move();
    expect(move.toPosition(3, 5), isTrue);
    expect(move.toString(), equals('Row position: 3\nColumn position:5'));
  });
  test("Position 5 2", () {
    Move move = Move();
    expect(move.toPosition(5, 2), isTrue);
    expect(move.toString(), equals('Row position: 5\nColumn position:2'));
  });
}
