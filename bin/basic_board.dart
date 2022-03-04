import 'move.dart';

class BasicBoard {
  final List<List<int>> _board = [
    [0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0],
  ];

  final Move move = Move();

  final int _defaultColor = 0;

  List<List<int>> get getBoard => _board;

  /// Color the current position.
  bool color(int color) {
    if (move.validatePosition(move.column, move.row)) {
      _board[move.row][move.column] = color;

      return true;
    }

    return false;
  }

  bool diagonalDownLeft(List<int> colors, [int? n]) {
    if (n == null) {
      while (move.diagonalUpRight());
      n = ((move.row == 3 && move.column == 5) ||
          (move.row == 0 && move.column == 2))
          ? 1
          : move.column - move.row;
    } else {
      n = n - 1;
    }
    int j = 0;
    if (n! < 1 || !color(colors[j])) {
      return false;
    }
    for (int i = 0; i < n; i++) {
      j = (j + 1) % colors.length;
      if (!move.diagonalDownLeft() || !color(colors[j])) {
        return false;
      }
    }

    return true;
  }

  bool diagonalDownRight(List<int> colors, [int? n]) {
    if (n == null) {
      while (move.diagonalUpLeft());
      n = ((move.row == 0 && move.column == 3) ||
          (move.row == 3 && move.column == 0))
          ? 1
          : move.column + 3;
    } else {
      n = n - 1;
    }
    int j = 0;
    if (n! < 1 || !color(colors[j])) {
      return false;
    }
    for (int i = 0; i < n; i++) {
      j = (j + 1) % colors.length;
      if (!move.diagonalDownRight() || !color(colors[j])) {
        return false;
      }
    }

    return true;
  }

  bool diagonalUpLeft(List<int> colors, [int? n]) {
    if (n == null) {
      while (move.diagonalDownRight());
      n = ((move.row == 2 && move.column == 5) ||
          (move.row == 5 && move.column == 2))
          ? 1
          : move.row - 2;
    } else {
      n = n - 1;
    }
    int j = 0;
    if (n! < 1 || !color(colors[j])) {
      return false;
    }
    for (int i = 0; i < n; i++) {
      j = (j + 1) % colors.length;
      if (!move.diagonalUpLeft() || !color(colors[j])) {
        return false;
      }
    }

    return true;
  }

  bool diagonalUpRight(List<int> colors, [int? n]) {
    if (n == null) {
      while (move.diagonalDownLeft());
      n = ((move.row == 2 && move.column == 0) ||
          (move.row == 5 && move.column == 3))
          ? 1
          : move.row - move.column;
    } else {
      n = n - 1;
    }
    int j = 0;
    if (n! < 1 || !color(colors[j])) {
      return false;
    }
    for (int i = 0; i < n; i++) {
      j = (j + 1) % colors.length;
      if (!move.diagonalUpRight() || !color(colors[j])) {
        return false;
      }
    }

    return true;
  }

  bool down(List<int> colors, [int? n]) {
    if (n == null) {
      if (move.column == 2 || move.column == 3) {
        move.toPosition(0, move.column);
        n = 5;
      } else {
        move.toPosition(2, move.column);
        n = 1;
      }
    } else {
      n = n - 1;
    }
    int j = 0;
    if (n < 1 ||
        !move.validatePosition(move.column, move.row + n) ||
        !color(colors[j])) {
      return false;
    }
    for (int i = 0; i < n; i++) {
      j = (j + 1) % colors.length;
      !move.down();
      color(colors[j]);
    }

    return true;
  }

  /// Color all the cells that has the default color.
  void fillEmpty(int color) {
    for (var line in _board) {
      for (int i = 0; i < 6; i++) {
        line[i] = line[i] == _defaultColor ? color : line[i];
      }
    }
  }

  bool left(List<int> colors, [int? n]) {
    if (n == null) {
      if (move.row == 2 || move.row == 3) {
        move.toPosition(move.row, 5);
        n = 5;
      } else {
        move.toPosition(move.row, 3);
        n = 1;
      }
    } else {
      n = n - 1;
    }
    int j = 0;
    if (n < 1 ||
        !move.validatePosition(move.column - n, move.row) ||
        !color(colors[j])) {
      return false;
    }
    for (int i = 0; i < n; i++) {
      j = (j + 1) % colors.length;
      move.left();
      color(colors[j]);
    }

    return true;
  }

  bool right(List<int> colors, [int? n]) {
    if (n == null) {
      if (move.row == 2 || move.row == 3) {
        move.toPosition(move.row, 0);
        n = 5;
      } else {
        move.toPosition(move.row, 2);
        n = 1;
      }
    } else {
      n = n - 1;
    }
    int j = 0;
    if (n < 1 ||
        !move.validatePosition(move.column + n, move.row) ||
        !color(colors[j])) {
      return false;
    }
    for (int i = 0; i < n; i++) {
      j = (j + 1) % colors.length;
      move.right();
      color(colors[j]);
    }

    return true;
  }

  @override
  String toString() => '[      ${_board[0][2]}, ${_board[0][3]}      ]\n'
      '[      ${_board[1][2]}, ${_board[1][3]}      ]\n'
      '${_board[2]}\n'
      '${_board[3]}\n'
      '[      ${_board[4][2]}, ${_board[4][3]}      ]\n'
      '[      ${_board[5][2]}, ${_board[5][3]}      ]';

  bool up(List<int> colors, [int? n]) {
    if (n == null) {
      if (move.column == 2 || move.column == 3) {
        move.toPosition(5, move.column);
        n = 5;
      } else {
        move.toPosition(3, move.column);
        n = 1;
      }
    } else {
      n = n - 1;
    }
    int j = 0;
    if (n < 1 ||
        !move.validatePosition(move.column, move.row - n) ||
        !color(colors[j])) {
      return false;
    }
    for (int i = 0; i < n; i++) {
      j = (j + 1) % colors.length;
      move.up();
      color(colors[j]);
    }

    return true;
  }
}
