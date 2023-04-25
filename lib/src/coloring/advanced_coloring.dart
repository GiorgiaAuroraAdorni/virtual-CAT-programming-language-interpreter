import "package:dartx/dartx.dart";
import "package:interpreter/src/coloring/basic_coloring.dart";
import "package:interpreter/src/models/basic_shape.dart";

/// It's a class that extends the BasicColoring class
/// and adds a bunch of methods that color the cross in different ways
class Coloring extends BasicColoring {
  /// Creating a new instance of the Coloring class, which is a subclass of the
  /// Coloring class.
  Coloring(BasicShape shape) : super(shape);

  /// Color with an L shape with direction down left from a starting position
  ///
  /// Requires a list of [colors].
  /// Return true on success.
  bool lDownLeft(List<int> colors, [int? n]) {
    if (!super.getCross.validatePosition(move.column, move.row + 2) ||
        !super.getCross.validatePosition(move.column - 2, move.row + 2)) {
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
  bool lDownRight(List<int> colors, [int? n]) {
    if (!super.getCross.validatePosition(move.column, move.row + 2) ||
        !super.getCross.validatePosition(move.column + 2, move.row + 2)) {
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
  bool lLeftDown(List<int> colors, [int? n]) {
    if (!super.getCross.validatePosition(move.column - 2, move.row) ||
        !super.getCross.validatePosition(move.column - 2, move.row + 2)) {
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
  bool lLeftUp(List<int> colors, [int? n]) {
    if (!super.getCross.validatePosition(move.column - 2, move.row) ||
        !super.getCross.validatePosition(move.column - 2, move.row - 2)) {
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
  bool lRightDown(List<int> colors, [int? n]) {
    if (!super.getCross.validatePosition(move.column + 2, move.row) ||
        !super.getCross.validatePosition(move.column + 2, move.row + 2)) {
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
  bool lRightUp(List<int> colors, [int? n]) {
    if (!super.getCross.validatePosition(move.column + 2, move.row) ||
        !super.getCross.validatePosition(move.column + 2, move.row - 2)) {
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
  bool lUpLeft(List<int> colors, [int? n]) {
    if (!super.getCross.validatePosition(move.column, move.row - 2) ||
        !super.getCross.validatePosition(move.column - 2, move.row - 2)) {
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
  bool lUpRight(List<int> colors, [int? n]) {
    if (!super.getCross.validatePosition(move.column, move.row - 2) ||
        !super.getCross.validatePosition(move.column + 2, move.row - 2)) {
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
  bool squareRightUpLeft(List<int> colors, [int? n]) {
    final int originalRow = move.row;
    final int originalColumn = move.column;
    if (move.right() && move.up() && move.left()) {
      move.toPosition(originalRow, originalColumn);
      color(colors[0 % colors.length]);
      move.right();
      color(colors[1 % colors.length]);
      move.up();
      color(colors[2 % colors.length]);
      move.left();
      color(colors[3 % colors.length]);

      return true;
    }
    move.toPosition(originalRow, originalColumn);

    return false;
  }

  /// Color with a square shape from the current position.
  ///
  /// Requires a list of [colors].
  bool squareUpRightDown(List<int> colors, [int? n]) {
    final int originalRow = move.row;
    final int originalColumn = move.column;
    if (move.up() && move.right() && move.down()) {
      move.toPosition(originalRow, originalColumn);
      color(colors[0 % colors.length]);
      move.up();
      color(colors[1 % colors.length]);
      move.right();
      color(colors[2 % colors.length]);
      move.down();
      color(colors[3 % colors.length]);

      return true;
    }
    move.toPosition(originalRow, originalColumn);

    return false;
  }

  /// Color with a square shape from the current position.
  ///
  /// Requires a list of [colors].
  bool squareUpLeftDown(List<int> colors, [int? n]) {
    final int originalRow = move.row;
    final int originalColumn = move.column;
    if (move.up() && move.left() && move.down()) {
      move.toPosition(originalRow, originalColumn);
      color(colors[0 % colors.length]);
      move.up();
      color(colors[1 % colors.length]);
      move.left();
      color(colors[2 % colors.length]);
      move.down();
      color(colors[3 % colors.length]);

      return true;
    }
    move.toPosition(originalRow, originalColumn);

    return false;
  }

  /// Color with a square shape from the current position.
  ///
  /// Requires a list of [colors].
  bool squareLeftUpRight(List<int> colors, [int? n]) {
    final int originalRow = move.row;
    final int originalColumn = move.column;
    if (move.left() && move.up() && move.right()) {
      move.toPosition(originalRow, originalColumn);
      color(colors[0 % colors.length]);
      move.left();
      color(colors[1 % colors.length]);
      move.up();
      color(colors[2 % colors.length]);
      move.right();
      color(colors[3 % colors.length]);

      return true;
    }
    move.toPosition(originalRow, originalColumn);

    return false;
  }

  /// Color with a square shape from the current position.
  ///
  /// Requires a list of [colors].
  bool squareDownRightUp(List<int> colors, [int? n]) {
    final int originalRow = move.row;
    final int originalColumn = move.column;
    if (move.down() && move.right() && move.up()) {
      move.toPosition(originalRow, originalColumn);
      color(colors[0 % colors.length]);
      move.down();
      color(colors[1 % colors.length]);
      move.right();
      color(colors[2 % colors.length]);
      move.up();
      color(colors[3 % colors.length]);

      return true;
    }
    move.toPosition(originalRow, originalColumn);

    return false;
  }

  /// Color with a square shape from the current position.
  ///
  /// Requires a list of [colors].
  bool squareRightDownLeft(List<int> colors, [int? n]) {
    final int originalRow = move.row;
    final int originalColumn = move.column;
    if (move.right() && move.down() && move.left()) {
      move.toPosition(originalRow, originalColumn);
      color(colors[0 % colors.length]);
      move.right();
      color(colors[1 % colors.length]);
      move.down();
      color(colors[2 % colors.length]);
      move.left();
      color(colors[3 % colors.length]);

      return true;
    }
    move.toPosition(originalRow, originalColumn);

    return false;
  }

  /// Color with a square shape from the current position.
  ///
  /// Requires a list of [colors].
  bool squareLeftDownRight(List<int> colors, [int? n]) {
    final int originalRow = move.row;
    final int originalColumn = move.column;
    if (move.left() && move.down() && move.right()) {
      move.toPosition(originalRow, originalColumn);
      color(colors[0 % colors.length]);
      move.left();
      color(colors[1 % colors.length]);
      move.down();
      color(colors[2 % colors.length]);
      move.right();
      color(colors[3 % colors.length]);

      return true;
    }
    move.toPosition(originalRow, originalColumn);

    return false;
  }

  /// Color with a square shape from the current position.
  ///
  /// Requires a list of [colors].
  bool squareDownLeftUp(List<int> colors, [int? n]) {
    final int originalRow = move.row;
    final int originalColumn = move.column;
    if (move.down() && move.left() && move.up()) {
      move.toPosition(originalRow, originalColumn);
      color(colors[0 % colors.length]);
      move.down();
      color(colors[1 % colors.length]);
      move.left();
      color(colors[2 % colors.length]);
      move.up();
      color(colors[3 % colors.length]);

      return true;
    }
    move.toPosition(originalRow, originalColumn);

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
    if (column != 3) {
      return false;
    }
    if (colors.isEmpty) {
      return false;
    }
    final int i = param % colors.length;
    final List<int> newColors = colors.sublist(i)..addAll(colors.sublist(0, i));
    if (param.isOdd && n == null) {
      move.toPosition(0, 2);

      return zigzagDownRightLeft(newColors, 6);
    }
    if (n == null) {
      move.toPosition(0, 3);

      return zigzagDownLeftRight(newColors, 6);
    }
    if (param < 3) {
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
    if (column != 2) {
      return false;
    }
    if (colors.isEmpty) {
      return false;
    }
    final List<int> newColors = buildOffset(colors, param);
    if (param.isOdd && n == null) {
      move.toPosition(0, 3);

      return zigzagDownLeftRight(newColors, 6);
    }
    if (n == null) {
      move.toPosition(0, 2);

      return zigzagDownRightLeft(newColors, 6);
    }
    if (param < 3) {
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
    if (row != 2) {
      return false;
    }
    if (colors.isEmpty) {
      return false;
    }
    final List<int> newColors = buildOffset(colors, param);
    if (param.isOdd && n == null) {
      move.toPosition(3, 5);

      return zigzagLeftUpDown(newColors, 6);
    }
    if (n == null) {
      move.toPosition(2, 5);

      return zigzagLeftDownUp(newColors, 6);
    }
    if (param < 3) {
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
    if (row != 3) {
      return false;
    }
    if (colors.isEmpty) {
      return false;
    }
    final List<int> newColors = buildOffset(colors, param);
    if (param.isOdd && n == null) {
      move.toPosition(2, 5);

      return zigzagLeftDownUp(newColors, 6);
    }
    if (n == null) {
      move.toPosition(3, 5);

      return zigzagLeftUpDown(newColors, 6);
    }
    if (param < 3) {
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
    if (row != 2) {
      return false;
    }
    if (colors.isEmpty) {
      return false;
    }
    final List<int> newColors = buildOffset(colors, param);
    if (param.isOdd && n == null) {
      move.toPosition(3, 0);

      return zigzagRightUpDown(newColors, 6);
    }
    if (n == null) {
      move.toPosition(2, 0);

      return zigzagRightDownUp(newColors, 6);
    }
    if (param < 3) {
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
    if (row != 3) {
      return false;
    }
    if (colors.isEmpty) {
      return false;
    }
    final List<int> newColors = buildOffset(colors, param);
    if (param.isOdd && n == null) {
      move.toPosition(2, 0);

      return zigzagRightDownUp(newColors, 6);
    }
    if (n == null) {
      move.toPosition(3, 0);

      return zigzagRightUpDown(newColors, 6);
    }
    if (param < 3) {
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
    if (column != 3) {
      return false;
    }
    if (colors.isEmpty) {
      return false;
    }
    final List<int> newColors = buildOffset(colors, param);
    if (param.isOdd && n == null) {
      move.toPosition(5, 2);

      return zigzagUpRightLeft(newColors, 6);
    }
    if (n == null) {
      move.toPosition(5, 3);

      return zigzagUpLeftRight(newColors, 6);
    }
    if (param < 3) {
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
    if (column != 2) {
      return false;
    }
    if (colors.isEmpty) {
      return false;
    }
    final List<int> newColors = buildOffset(colors, param);
    if (param.isOdd && n == null) {
      move.toPosition(5, 3);

      return zigzagUpLeftRight(newColors, 6);
    }
    if (n == null) {
      move.toPosition(5, 2);

      return zigzagUpRightLeft(newColors, 6);
    }
    if (param < 3) {
      return false;
    }

    return _zigzagHelper(
      param,
      colors,
      move.diagonalUpRight,
      move.diagonalUpLeft,
    );
  }

  /// If the row is less than or equal to 2,
  /// then mirror the piece horizontally up to down.
  /// Otherwise, mirror the piece horizontally down to up
  ///
  /// Returns:
  ///   A boolean value.
  bool mirrorHorizontal() {
    // if (move.row <= 2) {
    //   return mirrorHorizontalUpDown();
    // }
    mirrorHorizontalUpDown();

    return mirrorHorizontalDownUp();
  }

  /// If the column is less than or equal to 2,
  /// then mirror the piece left to right,
  /// otherwise mirror the piece right to left
  ///
  /// Returns:
  ///   A boolean value.
  bool mirrorVertical() {
    // if (move.column <= 2) {
    //   return
    // }
    mirrorVerticalLeftRight();

    return mirrorVerticalRightLeft();
  }

  bool _zigzagHelper(
    int param,
    List<int> colors,
    Function1<int, bool> function1,
    Function1<int, bool> function2,
  ) {
    int j = 0;
    if (!color(colors[j])) {
      return false;
    }
    for (int i = 1; i < param; i++) {
      j = (j + 1) % colors.length;
      if (!function1.call(1) || !color(colors[j])) {
        return false;
      }
      i++;
      j = (j + 1) % colors.length;
      if (i < param) {
        if (!function2.call(1) || !color(colors[j])) {
          return false;
        }
      }
    }

    return true;
  }
}
