import "package:dartx/dartx.dart";

import "cross_basic_coloring.dart";
import "cross_basic_moves.dart";

class CrossColoring extends CrossBasicColoring {
  /// Color with an L shape with direction down left from a starting position
  ///
  /// Requires a list of [colors].
  /// Return true on success.
  bool lDownLeft(List<int> colors) {
    if (!CrossBasicMoves.validatePosition(move.column, move.row + 3) ||
        !CrossBasicMoves.validatePosition(move.column - 2, move.row + 3)) {
      return false;
    }
    down(
      <int>[
        colors[0 % colors.length],
        colors[1 % colors.length],
        colors[2 % colors.length],
      ],
      3,
    );
    move.left();
    left(<int>[colors[3 % colors.length], colors[4 % colors.length]], 2);

    return true;
  }

  /// Color with an L shape with direction down right from a starting position
  ///
  /// Requires a list of [colors].
  /// Return true on success.
  bool lDownRight(List<int> colors) {
    if (!CrossBasicMoves.validatePosition(move.column, move.row + 3) ||
        !CrossBasicMoves.validatePosition(move.column + 2, move.row + 3)) {
      return false;
    }
    down(
      <int>[
        colors[0 % colors.length],
        colors[1 % colors.length],
        colors[2 % colors.length],
      ],
      3,
    );
    move.right();
    right(<int>[colors[3 % colors.length], colors[4 % colors.length]], 2);

    return true;
  }

  /// Color with an L shape with direction left down from a starting position
  ///
  /// Requires a list of [colors].
  /// Return true on success.
  bool lLeftDown(List<int> colors) {
    if (!CrossBasicMoves.validatePosition(move.column - 3, move.row) ||
        !CrossBasicMoves.validatePosition(move.column - 3, move.row + 2)) {
      return false;
    }
    left(
      <int>[
        colors[0 % colors.length],
        colors[1 % colors.length],
        colors[2 % colors.length],
      ],
      3,
    );
    move.down();
    down(<int>[colors[3 % colors.length], colors[4 % colors.length]], 2);

    return true;
  }

  /// Color with an L shape with direction left up from a starting position
  ///
  /// Requires a list of [colors].
  /// Return true on success.
  bool lLeftUp(List<int> colors) {
    if (!CrossBasicMoves.validatePosition(move.column - 3, move.row) ||
        !CrossBasicMoves.validatePosition(move.column - 3, move.row - 2)) {
      return false;
    }
    left(
      <int>[
        colors[0 % colors.length],
        colors[1 % colors.length],
        colors[2 % colors.length],
      ],
      3,
    );
    move.up();
    up(<int>[colors[3 % colors.length], colors[4 % colors.length]], 2);

    return true;
  }

  /// Color with an L shape with direction right down from a starting position
  ///
  /// Requires a list of [colors].
  /// Return true on success.
  bool lRightDown(List<int> colors) {
    if (!CrossBasicMoves.validatePosition(move.column + 3, move.row) ||
        !CrossBasicMoves.validatePosition(move.column + 3, move.row + 2)) {
      return false;
    }
    right(
      <int>[
        colors[0 % colors.length],
        colors[1 % colors.length],
        colors[2 % colors.length],
      ],
      3,
    );
    move.down();
    down(<int>[colors[3 % colors.length], colors[4 % colors.length]], 2);

    return true;
  }

  /// Color with an L shape with direction right up from a starting position
  ///
  /// Requires a list of [colors].
  /// Return true on success.
  bool lRightUp(List<int> colors) {
    if (!CrossBasicMoves.validatePosition(move.column + 3, move.row) ||
        !CrossBasicMoves.validatePosition(move.column + 3, move.row - 2)) {
      return false;
    }
    right(
      <int>[
        colors[0 % colors.length],
        colors[1 % colors.length],
        colors[2 % colors.length],
      ],
      3,
    );
    move.up();
    up(<int>[colors[3 % colors.length], colors[4 % colors.length]], 2);

    return true;
  }

  /// Color with an L shape with direction up left from a starting position
  ///
  /// Requires a list of [colors].
  /// Return true on success.
  bool lUpLeft(List<int> colors) {
    if (!CrossBasicMoves.validatePosition(move.column, move.row - 3) ||
        !CrossBasicMoves.validatePosition(move.column - 2, move.row - 3)) {
      return false;
    }
    up(
      <int>[
        colors[0 % colors.length],
        colors[1 % colors.length],
        colors[2 % colors.length],
      ],
      3,
    );
    move.left();
    left(<int>[colors[3 % colors.length], colors[4 % colors.length]], 2);

    return true;
  }

  /// Color with an L shape with direction up right from a starting position
  ///
  /// Requires a list of [colors].
  /// Return true on success.
  bool lUpRight(List<int> colors) {
    if (!CrossBasicMoves.validatePosition(move.column, move.row - 3) ||
        !CrossBasicMoves.validatePosition(move.column + 2, move.row - 3)) {
      return false;
    }
    up(
      <int>[
        colors[0 % colors.length],
        colors[1 % colors.length],
        colors[2 % colors.length],
      ],
      3,
    );
    move.right();
    right(<int>[colors[3 % colors.length], colors[4 % colors.length]], 2);

    return true;
  }

  /// Color with a square shape from the current position.
  ///
  /// Requires a list of [colors].
  bool square(List<int> colors, [int? n]) {
    if (CrossBasicMoves.validatePosition(move.row, move.column + 1) &&
        CrossBasicMoves.validatePosition(move.row - 1, move.column) &&
        CrossBasicMoves.validatePosition(move.row, move.column)) {
      final int row = move.row;
      final int column = move.column;
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

  /// Color with an zig-zag pattern with direction down left right
  /// from a starting position
  ///
  /// Requires a list of [colors] and a number [n] of cells to color.
  /// If no number [n] of cells is passed all the cells
  /// that fits in the patter are colored.
  /// Return true on success.
  bool zigzagDownLeftRight(List<int> colors, [int? n]) {
    int? param = n;
    final int column = move.column;
    final int row = move.row;
    param ??= 6 - row;
    if (param < 3) {
      return false;
    }
    if (column != 3 || !color(colors[0])) {
      return false;
    }

    return _zigzagHelper(
      param,
      colors,
      move.diagonalDownLeft,
      move.diagonalDownRight,
    );
  }

  /// Color with an zig-zag pattern with direction down right left
  /// from a starting position
  ///
  /// Requires a list of [colors] and a number [n] of cells to color.
  /// If no number [n] of cells is passed all the cells
  /// that fits in the patter are colored.
  /// Return true on success.
  bool zigzagDownRightLeft(List<int> colors, [int? n]) {
    int? param = n;
    final int column = move.column;
    final int row = move.row;
    param ??= 6 - row;
    if (param < 3) {
      return false;
    }
    if (column != 2 || !color(colors[0])) {
      return false;
    }

    return _zigzagHelper(
      param,
      colors,
      move.diagonalDownRight,
      move.diagonalDownLeft,
    );
  }

  /// Color with an zig-zag pattern with direction left down up
  /// from a starting position
  ///
  /// Requires a list of [colors] and a number [n] of cells to color.
  /// If no number [n] of cells is passed all the cells
  /// that fits in the patter are colored.
  /// Return true on success.
  bool zigzagLeftDownUp(List<int> colors, [int? n]) {
    int? param = n;
    final int column = move.column;
    final int row = move.row;
    param ??= column + 1;
    if (param < 3) {
      return false;
    }
    if (row != 2 || !color(colors[0])) {
      return false;
    }

    return _zigzagHelper(
      param,
      colors,
      move.diagonalDownLeft,
      move.diagonalUpLeft,
    );
  }

  /// Color with an zig-zag pattern with direction left up down
  /// from a starting position
  ///
  /// Requires a list of [colors] and a number [n] of cells to color.
  /// If no number [n] of cells is passed all the cells
  /// that fits in the patter are colored.
  /// Return true on success.
  bool zigzagLeftUpDown(List<int> colors, [int? n]) {
    int? param = n;
    final int column = move.column;
    final int row = move.row;
    param ??= column + 1;
    if (param < 3) {
      return false;
    }
    if (row != 3 || !color(colors[0])) {
      return false;
    }

    return _zigzagHelper(
      param,
      colors,
      move.diagonalUpLeft,
      move.diagonalDownLeft,
    );
  }

  /// Color with an zig-zag pattern with direction right down up
  /// from a starting position
  ///
  /// Requires a list of [colors] and a number [n] of cells to color.
  /// If no number [n] of cells is passed all the cells
  /// that fits in the patter are colored.
  /// Return true on success.
  bool zigzagRightDownUp(List<int> colors, [int? n]) {
    int? param = n;
    final int column = move.column;
    final int row = move.row;
    param ??= 6 - column;
    if (param < 3) {
      return false;
    }
    if (row != 2 || !color(colors[0])) {
      return false;
    }

    return _zigzagHelper(
      param,
      colors,
      move.diagonalDownRight,
      move.diagonalUpRight,
    );
  }

  /// Color with an zig-zag pattern with direction right up down
  /// from a starting position
  ///
  /// Requires a list of [colors] and a number [n] of cells to color.
  /// If no number [n] of cells is passed all the cells
  /// that fits in the patter are colored.
  /// Return true on success.
  bool zigzagRightUpDown(List<int> colors, [int? n]) {
    int? param = n;
    final int column = move.column;
    final int row = move.row;
    param ??= 6 - column;
    if (param < 3) {
      return false;
    }
    if (row != 3 || !color(colors[0])) {
      return false;
    }

    return _zigzagHelper(
      param,
      colors,
      move.diagonalUpRight,
      move.diagonalDownRight,
    );
  }

  /// Color with an zig-zag pattern with direction up left right
  /// from a starting position
  ///
  /// Requires a list of [colors] and a number [n] of cells to color.
  /// If no number [n] of cells is passed all the cells
  /// that fits in the patter are colored.
  /// Return true on success.
  bool zigzagUpLeftRight(List<int> colors, [int? n]) {
    int? param = n;
    final int column = move.column;
    final int row = move.row;
    param ??= row + 1;
    if (param < 3) {
      return false;
    }
    if (column != 3 || !color(colors[0])) {
      return false;
    }

    return _zigzagHelper(
      param,
      colors,
      move.diagonalUpLeft,
      move.diagonalUpRight,
    );
  }

  /// Color with an zig-zag pattern with direction up right left
  /// from a starting position
  ///
  /// Requires a list of [colors] and a number [n] of cells to color.
  /// If no number [n] of cells is passed all the cells
  /// that fits in the patter are colored.
  /// Return true on success.
  bool zigzagUpRightLeft(List<int> colors, [int? n]) {
    int? param = n;
    final int column = move.column;
    final int row = move.row;
    param ??= row + 1;
    if (param < 3) {
      return false;
    }
    if (column != 2 || !color(colors[0])) {
      return false;
    }

    return _zigzagHelper(
      param,
      colors,
      move.diagonalUpRight,
      move.diagonalUpLeft,
    );
  }

  /// If the row is less than or equal to 2, then mirror the piece horizontally up
  /// to down. Otherwise, mirror the piece horizontally down to up
  ///
  /// Returns:
  ///   A boolean value.
  bool mirrorHorizontal() {
    if (move.row <= 2) {
      return mirrorHorizontalUpDown();
    }

    return mirrorHorizontalDownUp();
  }

  /// If the column is less than or equal to 2, then mirror the piece left to right,
  /// otherwise mirror the piece right to left
  ///
  /// Returns:
  ///   A boolean value.
  bool mirrorVertical() {
    if (move.column <= 2) {
      return mirrorVerticalLeftRight();
    }

    return mirrorVerticalRightLeft();
  }

  bool _zigzagHelper(
    int param,
    List<int> colors,
    Function1<int, bool> function1,
    Function1<int, bool> function2,
  ) {
    int j = 0;
    for (int i = 1; i < param; i++) {
      j = (j + 1) % colors.length;
      if (!function1.call(1) || !color(colors[j])) {
        return false;
      }
      j = (j + 1) % colors.length;
      i++;
      if (i < param) {
        if (!function2.call(1) || !color(colors[j])) {
          return false;
        }
      }
    }

    return true;
  }
}
