import "package:dartx/dartx.dart";
import "package:interpreter/src/cross.dart";
import "package:interpreter/src/cross_basic_moves.dart";

/// It's a class that allows you to color a cross
class CrossBasicColoring {
  final Cross _cross = Cross();

  final CrossBasicMoves move = CrossBasicMoves();

  final int _defaultColor = 0;

  /// It's a getter that returns the cross.
  List<List<int>> get getBoard => _cross.getCross;

  /// It's a getter that returns the cross object.
  Cross get getCross => _cross;

  /// Color the current position.
  bool color(int color) {
    if (CrossBasicMoves.validatePosition(move.column, move.row)) {
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
    int j = 0;
    bool once = false;
    if (param == null) {
      while (move.diagonalUpRight()) {
        continue;
      }
      while (color(colors[j]) && move.diagonalDownLeft()) {
        j = (j + 1) % colors.length;
        once = true;
      }
      if (once) {
        return true;
      }

      return false;
    } else {
      param--;
    }
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
    int j = 0;
    bool once = false;
    if (param == null) {
      while (move.diagonalUpLeft()) {
        continue;
      }
      while (color(colors[j]) && move.diagonalDownRight()) {
        j = (j + 1) % colors.length;
        once = true;
      }
      if (once) {
        return true;
      }

      return false;
    } else {
      param--;
    }
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
    int j = 0;
    bool once = false;
    if (param == null) {
      while (move.diagonalDownRight()) {
        continue;
      }
      while (color(colors[j]) && move.diagonalUpLeft()) {
        j = (j + 1) % colors.length;
        once = true;
      }
      if (once) {
        return true;
      }

      return false;
    } else {
      param--;
    }

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
    int j = 0;
    bool once = false;
    if (param == null) {
      while (move.diagonalDownLeft()) {
        continue;
      }
      while (color(colors[j]) && move.diagonalUpRight()) {
        j = (j + 1) % colors.length;
        once = true;
      }
      if (once) {
        return true;
      }

      return false;
    } else {
      param--;
    }
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
        !CrossBasicMoves.validatePosition(move.column, move.row + param) ||
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

  /// If the color of the cell is the default color, then change it to the color
  /// passed in.
  ///
  /// Args:
  ///   color (int): The color to fill the empty spaces with.
  ///
  /// Returns:
  ///   A boolean value.
  bool fillEmpty(int color) {
    for (final List<int> line in _cross.cross) {
      for (int i = 0; i < 6; i++) {
        line[i] = line[i] == _defaultColor ? color : line[i];
      }
    }

    return true;
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
        !CrossBasicMoves.validatePosition(move.column - param, move.row) ||
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
        !CrossBasicMoves.validatePosition(move.column + param, move.row) ||
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
        !CrossBasicMoves.validatePosition(move.column, move.row - param) ||
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

  /// It takes the top half of the cross and mirrors it to the bottom half
  ///
  /// Returns:
  ///   A boolean value.
  bool mirrorHorizontalUpDown() {
    for (final int i in 0.rangeTo(2)) {
      for (final int j in 0.rangeTo(5)) {
        _cross.cross[5 - i][j] = _cross.cross[i][j];
      }
    }

    return true;
  }

  /// It takes the bottom half of the cross and mirrors it to the top half
  ///
  /// Returns:
  ///   A boolean value.
  bool mirrorHorizontalDownUp() {
    for (final int i in 3.rangeTo(5)) {
      for (final int j in 0.rangeTo(5)) {
        _cross.cross[5 - i][j] = _cross.cross[i][j];
      }
    }

    return true;
  }

  /// It takes the first three columns of the cross and mirrors them to the last
  /// three columns
  ///
  /// Returns:
  ///   A boolean value.
  bool mirrorVerticalLeftRight() {
    for (final int i in 0.rangeTo(2)) {
      for (final int j in 0.rangeTo(5)) {
        _cross.cross[j][5 - i] = _cross.cross[j][i];
      }
    }

    return true;
  }

  /// It takes the last three columns of the cross and mirrors them to the first
  /// three columns
  ///
  /// Returns:
  ///   A boolean value.
  bool mirrorVerticalRightLeft() {
    for (final int i in 3.rangeTo(5)) {
      for (final int j in 0.rangeTo(5)) {
        _cross.cross[j][5 - i] = _cross.cross[j][i];
      }
    }

    return true;
  }

  /// It mirrors a current cell vertically
  ///
  /// Returns:
  ///   If mirroring succeeded
  bool mirrorCellVertical() {
    final int toMirror = _cross.cross[move.row][move.column];
    move.toPosition(move.row, 5 - move.column);

    return color(toMirror);
  }

  /// It mirrors a current cell horizontally
  ///
  /// Returns:
  ///   If mirroring succeeded
  bool mirrorCellHorizontal() {
    final int toMirror = _cross.cross[move.row][move.column];
    move.toPosition(5 - move.row, move.column);

    return color(toMirror);
  }

  /// It copies the cross from the parameter to the global variable.
  ///
  /// Args:
  ///   cross (Cross): The cross that will be joined to the current cross.
  ///
  /// Returns:
  ///   A boolean value.
  bool joinCrosses(Cross cross) {
    for (int i = 0; i < 6; i++) {
      for (int j = 0; j < 6; j++) {
        if (cross.cross[i][j] != 0) {
          _cross.cross[i][j] = cross.cross[i][j];
        }
      }
    }

    return true;
  }
}
