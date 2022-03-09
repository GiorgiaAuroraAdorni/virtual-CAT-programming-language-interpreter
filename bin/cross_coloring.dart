import 'cross_basic_coloring.dart';

class CrossColoring extends CrossBasicColoring {
  bool lDownLeft(List<int> colors) {
    if (!move.validatePosition(move.column, move.row + 3) ||
        !move.validatePosition(move.column - 2, move.row + 3)) {
      return false;
    }
    down(
      [
        colors[0 % colors.length],
        colors[1 % colors.length],
        colors[2 % colors.length],
      ],
      3,
    );
    move.left();
    left([colors[3 % colors.length], colors[4 % colors.length]], 2);

    return true;
  }

  bool lDownRight(List<int> colors) {
    if (!move.validatePosition(move.column, move.row + 3) ||
        !move.validatePosition(move.column + 2, move.row + 3)) {
      return false;
    }
    down(
      [
        colors[0 % colors.length],
        colors[1 % colors.length],
        colors[2 % colors.length],
      ],
      3,
    );
    move.right();
    right([colors[3 % colors.length], colors[4 % colors.length]], 2);

    return true;
  }

  bool lLeftDown(List<int> colors) {
    if (!move.validatePosition(move.column - 3, move.row) ||
        !move.validatePosition(move.column - 3, move.row + 2)) {
      return false;
    }
    left(
      [
        colors[0 % colors.length],
        colors[1 % colors.length],
        colors[2 % colors.length],
      ],
      3,
    );
    move.down();
    down([colors[3 % colors.length], colors[4 % colors.length]], 2);

    return true;
  }

  bool lLeftUp(List<int> colors) {
    if (!move.validatePosition(move.column - 3, move.row) ||
        !move.validatePosition(move.column - 3, move.row - 2)) {
      return false;
    }
    left(
      [
        colors[0 % colors.length],
        colors[1 % colors.length],
        colors[2 % colors.length],
      ],
      3,
    );
    move.up();
    up([colors[3 % colors.length], colors[4 % colors.length]], 2);

    return true;
  }

  bool lRightDown(List<int> colors) {
    if (!move.validatePosition(move.column + 3, move.row) ||
        !move.validatePosition(move.column + 3, move.row + 2)) {
      return false;
    }
    right(
      [
        colors[0 % colors.length],
        colors[1 % colors.length],
        colors[2 % colors.length],
      ],
      3,
    );
    move.down();
    down([colors[3 % colors.length], colors[4 % colors.length]], 2);

    return true;
  }

  bool lRightUp(List<int> colors) {
    if (!move.validatePosition(move.column + 3, move.row) ||
        !move.validatePosition(move.column + 3, move.row - 2)) {
      return false;
    }
    right(
      [
        colors[0 % colors.length],
        colors[1 % colors.length],
        colors[2 % colors.length],
      ],
      3,
    );
    move.up();
    up([colors[3 % colors.length], colors[4 % colors.length]], 2);

    return true;
  }

  bool lUpLeft(List<int> colors) {
    if (!move.validatePosition(move.column, move.row - 3) ||
        !move.validatePosition(move.column - 2, move.row - 3)) {
      return false;
    }
    up(
      [
        colors[0 % colors.length],
        colors[1 % colors.length],
        colors[2 % colors.length],
      ],
      3,
    );
    move.left();
    left([colors[3 % colors.length], colors[4 % colors.length]], 2);

    return true;
  }

  bool lUpRight(List<int> colors) {
    if (!move.validatePosition(move.column, move.row - 3) ||
        !move.validatePosition(move.column + 2, move.row - 3)) {
      return false;
    }
    up(
      [
        colors[0 % colors.length],
        colors[1 % colors.length],
        colors[2 % colors.length],
      ],
      3,
    );
    move.right();
    right([colors[3 % colors.length], colors[4 % colors.length]], 2);

    return true;
  }

  /// Color with a square shape from the current position.
  bool square(List<int> colors) {
    if (move.validatePosition(move.row, move.column + 1) &&
        move.validatePosition(move.row - 1, move.column) &&
        move.validatePosition(move.row, move.column)) {
      int row = move.row;
      int column = move.column;
      color(colors[0 % colors.length]);
      move.toPosition(row, column + 1);
      color(colors[1 % colors.length]);
      move.toPosition(row - 1, column + 1);
      color(colors[2 % colors.length]);
      move.toPosition(row - 1, column);
      color(colors[3 % colors.length]);

      return true;
    }

    return false;
  }

  bool zigzagDownLeftRight(List<int> colors, [int? n]) {
    return false;
  }

  bool zigzagDownRightLeft(List<int> colors, [int? n]) {
    return false;
  }

  bool zigzagLeftDownUp(List<int> colors, [int? n]) {
    return false;
  }

  bool zigzagLeftUpDown(List<int> colors, [int? n]) {
    return false;
  }

  bool zigzagRightDownUp(List<int> colors, [int? n]) {
    return false;
  }

  bool zigzagRightUpDown(List<int> colors, [int? n]) {
    return false;
  }

  bool zigzagUpLeftRight(List<int> colors, [int? n]) {
    return false;
  }

  bool zigzagUpRightLeft(List<int> colors, [int? n]) {
    return false;
  }
}
