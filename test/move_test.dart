import 'package:test/test.dart';

import '../bin/move.dart';

void main() {
  creation();
  arbitraryPosition();
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

void creation() {
  test('Move object', () {
    Move move = Move();
    expect(move, isNotNull);
    expect(move.column, equals(0));
    expect(move.row, equals(3));
  });
}

void arbitraryPosition() {
  test('0 0 position', () {
    Move move = Move();
    expect(move.toPosition(0, 0), isFalse);
    expect(move.column, equals(0));
    expect(move.row, equals(3));
  });
  test('5 5 position', () {
    Move move = Move();
    expect(move.toPosition(5, 5), isFalse);
    expect(move.column, equals(0));
    expect(move.row, equals(3));
  });
  test('3 5 position', () {
    Move move = Move();
    expect(move.toPosition(3, 5), isTrue);
    expect(move.column, equals(5));
    expect(move.row, equals(3));
  });
  test('5 3 position', () {
    Move move = Move();
    expect(move.toPosition(5, 3), isTrue);
    expect(move.column, equals(3));
    expect(move.row, equals(5));
  });
  test('Out of the board 6 6', () {
    Move move = Move();
    expect(move.toPosition(6, 6), isFalse);
    expect(move.column, equals(0));
    expect(move.row, equals(3));
  });
  test('Out of the board 5 6', () {
    Move move = Move();
    expect(move.toPosition(5, 6), isFalse);
    expect(move.column, equals(0));
    expect(move.row, equals(3));
  });
  test('Out of the board 6 5', () {
    Move move = Move();
    expect(move.toPosition(6, 5), isFalse);
    expect(move.column, equals(0));
    expect(move.row, equals(3));
  });
}

void up() {
  test('Move up from starting position', () {
    Move move = Move();
    expect(move.up(), isTrue);
    expect(move.column, equals(0));
    expect(move.row, equals(2));
  });
  test('Move up 2 from starting position', () {
    Move move = Move();
    expect(move.up(2), isFalse);
    expect(move.column, equals(0));
    expect(move.row, equals(3));
  });
  test('Move up out of the board', () {
    Move move = Move();
    expect(move.up(4), isFalse);
    expect(move.column, equals(0));
    expect(move.row, equals(3));
  });
}

void down() {
  test('Move down from starting position', () {
    Move move = Move();
    expect(move.down(), isFalse);
    expect(move.column, equals(0));
    expect(move.row, equals(3));
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
}

void right() {
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
}

void left() {
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
}

void diagonalUpRight() {
  test("Move in diagonal up right from starting position", () {
    Move move = Move();
    expect(move.diagonalUpRight(), isTrue);
    expect(move.column, equals(1));
    expect(move.row, equals(2));
  });
  test("Move in diagonal up right from starting position by 2", () {
    Move move = Move();
    expect(move.diagonalUpRight(2), isTrue);
    expect(move.column, equals(2));
    expect(move.row, equals(1));
  });
  test("Move in diagonal up right from starting position outside of the board",
      () {
    Move move = Move();
    expect(move.diagonalUpRight(5), isFalse);
    expect(move.column, equals(0));
    expect(move.row, equals(3));
  });
}

void diagonalUpLeft() {
  test("Move in diagonal up left from starting position outside of the board",
      () {
    Move move = Move();
    expect(move.diagonalUpLeft(), isFalse);
    expect(move.column, equals(0));
    expect(move.row, equals(3));
  });
  test("Move in diagonal up left from position 3 5", () {
    Move move = Move();
    expect(move.toPosition(3, 5), isTrue);
    expect(move.column, equals(5));
    expect(move.row, equals(3));
    expect(move.diagonalUpLeft(), isTrue);
    expect(move.column, equals(4));
    expect(move.row, equals(2));
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
    expect(move.diagonalDownRight(), isFalse);
    expect(move.column, equals(0));
    expect(move.row, equals(3));
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

  test("Move in diagonal down right from starting position outside of the board", () {
    Move move = Move();
    expect(move.diagonalDownRight(4), isFalse);
    expect(move.column, equals(0));
    expect(move.row, equals(3));
  });
}

void diagonalDownLeft(){
  test("Move in diagonal up left from starting position outside of the board", () {
        Move move = Move();
        expect(move.diagonalDownLeft(), isFalse);
        expect(move.column, equals(0));
        expect(move.row, equals(3));
      });
  test("Move in diagonal up left from position 3 5", () {
    Move move = Move();
    expect(move.toPosition(3, 5), isTrue);
    expect(move.column, equals(5));
    expect(move.row, equals(3));
    expect(move.diagonalDownLeft(), isFalse);
    expect(move.column, equals(5));
    expect(move.row, equals(3));
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

void toString(){
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