import "package:dartx/dartx.dart";
import "package:interpreter/src/basic_moves.dart";
import "package:interpreter/src/models/basic_shape.dart";

/// It's a class that allows you to color a shape
class BasicColoring {

  /// Creating a constructor for the class BasicColoring.
  BasicColoring(BasicShape shape) : _shape = shape;

  final BasicShape _shape;

  /// Creating a new instance of the BasicMoves class, and passing in the
  /// validatePosition function as a parameter.
  late final BasicMoves move = BasicMoves(_shape.validatePosition);

  final int _defaultColor = 0;

  /// It's a getter that returns the cross.
  List<List<int>> get getBoard => _shape.getGrid;

  /// It's a getter that returns the cross object.
  BasicShape get getCross => _shape;

  /// Color the current position.
  bool color(int color) {
    if (_shape.validatePosition(move.column, move.row)) {
      _shape.grid[move.row][move.column] = color;

      return true;
    }

    return false;
  }

  /// It takes a list of colors and an offset,
  /// and returns a new list of colors with the offset applied
  ///
  /// Args:
  ///   colors (List<int>): A list of colors to be used in the gradient.
  ///   offset (int): The offset of the color list.
  ///
  /// Returns:
  ///   A new list of colors that is offset by the offset parameter.
  List<int> buildOffset(List<int> colors, int offset) {
    final int i = offset % colors.length;
    final List<int> newColors = colors.sublist(i)..addAll(colors.sublist(0, i));

    return newColors;
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
    int offset = 0;
    bool once = false;
    if (param == null) {
      while (move.diagonalUpRight()) {
        offset++;
      }
      final List<int> newColors = buildOffset(colors, offset);
      while (color(newColors[j]) && move.diagonalDownLeft()) {
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
    int offset = 0;
    bool once = false;
    if (param == null) {
      while (move.diagonalUpLeft()) {
        offset++;
      }
      final List<int> newColors = buildOffset(colors, offset);
      while (color(newColors[j]) && move.diagonalDownRight()) {
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
    int offset = 0;
    bool once = false;
    if (param == null) {
      while (move.diagonalDownRight()) {
        offset++;
      }
      final List<int> newColors = buildOffset(colors, offset);
      while (color(newColors[j]) && move.diagonalUpLeft()) {
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
    int offset = 0;
    bool once = false;
    if (param == null) {
      while (move.diagonalDownLeft()) {
        offset++;
      }
      final List<int> newColors = buildOffset(colors, offset);
      while (color(newColors[j]) && move.diagonalUpRight()) {
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
    List<int> newColors = colors;
    int offset = 0;
    int j = 0;
    if (param == null) {
      final bool prev = move.copyMode;
      move.copyMode = false;
      while (move.up()) {
        offset++;
      }
      newColors = buildOffset(colors, -offset);
      while (color(newColors[j]) && move.down()) {
        j = (j + 1) % newColors.length;
      }
      move.copyMode = prev;

      return true;
    } else {
      param--;
    }
    if (param < 1 ||
        !_shape.validatePosition(move.column, move.row + param) ||
        !color(newColors[j])) {
      return false;
    }
    for (int i = 0; i < param; i++) {
      j = (j + 1) % newColors.length;
      move.down();
      color(newColors[j]);
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
    for (final List<int> line in _shape.grid) {
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
    List<int> newColors = colors;
    int offset = 0;
    int j = 0;
    if (param == null) {
      final bool prev = move.copyMode;
      move.copyMode = false;
      while (move.right()) {
        offset++;
      }
      newColors = buildOffset(colors, offset);
      while (color(newColors[j]) && move.left()) {
        j = (j + 1) % colors.length;
      }
      move.copyMode = prev;

      return true;
    } else {
      param--;
    }
    if (param < 1 ||
        !_shape.validatePosition(move.column - param, move.row) ||
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
    List<int> newColors = colors;
    int offset = 0;
    int j = 0;
    if (param == null) {
      final bool prev = move.copyMode;
      move.copyMode = false;
      while (move.left()) {
        offset++;
      }
      newColors = buildOffset(colors, -offset);
      while (color(newColors[j]) && move.right()) {
        j = (j + 1) % colors.length;
      }
      move.copyMode = prev;

      return true;
    } else {
      param--;
    }
    if (param < 1 ||
        !_shape.validatePosition(move.column + param, move.row) ||
        !color(newColors[j])) {
      return false;
    }
    for (int i = 0; i < param; i++) {
      j = (j + 1) % newColors.length;
      move.right();
      color(newColors[j]);
    }

    return true;
  }

  @override
  String toString() => _shape.toString();

  /// Color up from a current position defined by the movement.
  ///
  /// Requires a list of [colors] and a number [n] of cells to color.
  /// If no number [n] of cells is passed all the column is colored.
  /// Return true on success.
  bool up(List<int> colors, [int? n]) {
    int? param = n;
    List<int> newColors = colors;
    int j = 0;
    int offset = 0;
    if (param == null) {
      final bool prev = move.copyMode;
      move.copyMode = false;
      while (move.down()) {
        offset++;
      }
      newColors = buildOffset(colors, offset);
      while (color(newColors[j]) && move.up()) {
        j = (j + 1) % colors.length;
      }
      move.copyMode = prev;

      return true;
    } else {
      param--;
    }

    if (param < 1 ||
        !_shape.validatePosition(move.column, move.row - param) ||
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
        if(_shape.grid[i][j] != 0){
          _shape.grid[5 - i][j] = _shape.grid[i][j];
        }
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
        if(_shape.grid[i][j] != 0) {
          _shape.grid[5 - i][j] = _shape.grid[i][j];
        }
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
        if(_shape.grid[j][i] != 0) {
          _shape.grid[j][5 - i] = _shape.grid[j][i];
        }
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
        if(_shape.grid[j][i] != 0) {
          _shape.grid[j][5 - i] = _shape.grid[j][i];
        }
      }
    }

    return true;
  }

  /// It mirrors a current cell vertically
  ///
  /// Returns:
  ///   If mirroring succeeded
  bool mirrorCellVertical() {
    final int toMirror = _shape.grid[move.row][move.column];
    move.toPosition(move.row, 5 - move.column);

    return color(toMirror);
  }

  /// It mirrors a current cell horizontally
  ///
  /// Returns:
  ///   If mirroring succeeded
  bool mirrorCellHorizontal() {
    final int toMirror = _shape.grid[move.row][move.column];
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
  bool joinBoards(BasicShape shape) {
    for (int i = 0; i < 6; i++) {
      for (int j = 0; j < 6; j++) {
        if (shape.grid[i][j] != 0) {
          _shape.grid[i][j] = shape.grid[i][j];
        }
      }
    }

    return true;
  }
}
