import "cross.dart";
import "cross_basic_moves.dart";

class CrossBasicColoring {
  Cross _cross = Cross();

  final CrossBasicMoves move = CrossBasicMoves();

  final int _defaultColor = 0;

  List<List<int>> get getBoard => _cross.getCross;

  Cross get getCross => _cross;

  void reset() {
    _cross = Cross();
    move.toPosition(3, 0);
  }

  /// Color the current position.
  bool color(int color) {
    if (move.validatePosition(move.column, move.row)) {
      _cross.cross[move.row][move.column] = color;

      return true;
    }

    return false;
  }

  /// Color in diagonal with a direction down left from
  /// a current position defined by the movement.
  ///
  /// Requires a list of [colors] and a number [n] of cells to color.
  /// If no number [n] of cells is passed all the diagonal is colored.
  /// Return true on success.
  bool diagonalDownLeft(List<int> colors, [int? n]) {
    int? param = n;
    if (param == null) {
      while (move.diagonalUpRight()) {
        continue;
      }
      param = ((move.row == 3 && move.column == 5) ||
              (move.row == 0 && move.column == 2))
          ? 1
          : move.column - move.row;
    } else {
      param--;
    }
    int j = 0;
    if (param < 1 || !color(colors[j])) {
      return false;
    }
    for (int i = 0; i < param; i++) {
      j = (j + 1) % colors.length;
      if (!move.diagonalDownLeft() || !color(colors[j])) {
        return false;
      }
    }

    return true;
  }

  /// Color in diagonal with a direction down right from
  /// a current position defined by the movement.
  ///
  /// Requires a list of [colors] and a number [n] of cells to color.
  /// If no number [n] of cells is passed all the diagonal is colored.
  /// Return true on success.
  bool diagonalDownRight(List<int> colors, [int? n]) {
    int? param = n;
    if (param == null) {
      while (move.diagonalUpLeft()) {
        continue;
      }
      param = ((move.row == 0 && move.column == 3) ||
              (move.row == 3 && move.column == 0))
          ? 1
          : move.column + 3;
    } else {
      param--;
    }
    int j = 0;
    if (param < 1 || !color(colors[j])) {
      return false;
    }
    for (int i = 0; i < param; i++) {
      j = (j + 1) % colors.length;
      if (!move.diagonalDownRight() || !color(colors[j])) {
        return false;
      }
    }

    return true;
  }

  /// Color in diagonal with a direction up left from
  /// a current position defined by the movement.
  ///
  /// Requires a list of [colors] and a number [n] of cells to color.
  /// If no number [n] of cells is passed all the diagonal is colored.
  /// Return true on success.
  bool diagonalUpLeft(List<int> colors, [int? n]) {
    int? param = n;
    if (param == null) {
      while (move.diagonalDownRight()) {
        continue;
      }
      param = ((move.row == 2 && move.column == 5) ||
              (move.row == 5 && move.column == 2))
          ? 1
          : move.row - 2;
    } else {
      param--;
    }
    int j = 0;
    if (param < 1 || !color(colors[j])) {
      return false;
    }
    for (int i = 0; i < param; i++) {
      j = (j + 1) % colors.length;
      if (!move.diagonalUpLeft() || !color(colors[j])) {
        return false;
      }
    }

    return true;
  }

  /// Color in diagonal with a direction up right from
  /// a current position defined by the movement.
  ///
  /// Requires a list of [colors] and a number [n] of cells to color.
  /// If no number [n] of cells is passed all the diagonal is colored.
  /// Return true on success.
  bool diagonalUpRight(List<int> colors, [int? n]) {
    int? param = n;
    if (param == null) {
      while (move.diagonalDownLeft()) {
        continue;
      }
      param = ((move.row == 2 && move.column == 0) ||
              (move.row == 5 && move.column == 3))
          ? 1
          : move.row - move.column;
    } else {
      param--;
    }
    int j = 0;
    if (param < 1 || !color(colors[j])) {
      return false;
    }
    for (int i = 0; i < param; i++) {
      j = (j + 1) % colors.length;
      if (!move.diagonalUpRight() || !color(colors[j])) {
        return false;
      }
    }

    return true;
  }

  /// Color down from a current position defined by the movement.
  ///
  /// Requires a list of [colors] and a number [n] of cells to color.
  /// If no number [n] of cells is passed all the column is colored.
  /// Return true on success.
  bool down(List<int> colors, [int? n]) {
    int? param = n;
    if (param == null) {
      if (move.column == 2 || move.column == 3) {
        move.toPosition(0, move.column);
        param = 5;
      } else {
        move.toPosition(2, move.column);
        param = 1;
      }
    } else {
      param--;
    }
    int j = 0;
    if (param < 1 ||
        !move.validatePosition(move.column, move.row + param) ||
        !color(colors[j])) {
      return false;
    }
    for (int i = 0; i < param; i++) {
      j = (j + 1) % colors.length;
      move.down();
      color(colors[j]);
    }

    return true;
  }

  /// Colors with a [color] all the cells that has the default color.
  void fillEmpty(int color) {
    for (final List<int> line in _cross.cross) {
      for (int i = 0; i < 6; i++) {
        line[i] = line[i] == _defaultColor ? color : line[i];
      }
    }
  }

  /// Color left from a current position defined by the movement.
  ///
  /// Requires a list of [colors] and a number [n] of cells to color.
  /// If no number [n] of cells is passed all the row is colored.
  /// Return true on success.
  bool left(List<int> colors, [int? n]) {
    int? param = n;
    if (param == null) {
      if (move.row == 2 || move.row == 3) {
        move.toPosition(move.row, 5);
        param = 5;
      } else {
        move.toPosition(move.row, 3);
        param = 1;
      }
    } else {
      param--;
    }
    int j = 0;
    if (param < 1 ||
        !move.validatePosition(move.column - param, move.row) ||
        !color(colors[j])) {
      return false;
    }
    for (int i = 0; i < param; i++) {
      j = (j + 1) % colors.length;
      move.left();
      color(colors[j]);
    }

    return true;
  }

  /// Color right from a current position defined by the movement.
  ///
  /// Requires a list of [colors] and a number [n] of cells to color.
  /// If no number [n] of cells is passed all the row is colored.
  /// Return true on success.
  bool right(List<int> colors, [int? n]) {
    int? param = n;
    if (param == null) {
      if (move.row == 2 || move.row == 3) {
        move.toPosition(move.row, 0);
        param = 5;
      } else {
        move.toPosition(move.row, 2);
        param = 1;
      }
    } else {
      param--;
    }
    int j = 0;
    if (param < 1 ||
        !move.validatePosition(move.column + param, move.row) ||
        !color(colors[j])) {
      return false;
    }
    for (int i = 0; i < param; i++) {
      j = (j + 1) % colors.length;
      move.right();
      color(colors[j]);
    }

    return true;
  }

  @override
  String toString() => _cross.toString();

  /// Color up from a current position defined by the movement.
  ///
  /// Requires a list of [colors] and a number [n] of cells to color.
  /// If no number [n] of cells is passed all the column is colored.
  /// Return true on success.
  bool up(List<int> colors, [int? n]) {
    int? param = n;
    if (param == null) {
      if (move.column == 2 || move.column == 3) {
        move.toPosition(5, move.column);
        param = 5;
      } else {
        move.toPosition(3, move.column);
        param = 1;
      }
    } else {
      param--;
    }
    int j = 0;
    if (param < 1 ||
        !move.validatePosition(move.column, move.row - param) ||
        !color(colors[j])) {
      return false;
    }
    for (int i = 0; i < param; i++) {
      j = (j + 1) % colors.length;
      move.up();
      color(colors[j]);
    }

    return true;
  }
}
