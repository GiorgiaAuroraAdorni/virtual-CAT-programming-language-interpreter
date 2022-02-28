import 'move.dart';

class Board {
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
    // 2 5 -> 5 2 = 4
    // 3 4 -> 5 2 = 4
    n = (n == null) ? move.column : n - 1;
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
    // 1 3 -> 3 5 = 3
    // 0 2 -> 3 5 = 4
    n = (n == null) ? (5 - move.row) as int? : n - 1;
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
    // 3 5 -> 1 3 = 4
    // 2 4 -> 1 3 = 3
    n = (n == null) ? move.row : n - 1;
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
    // 1 2 -> 0 3 = 2
    // 2 1 -> 0 3 = 3
    // 3 0 -> 0 3 = 4
    n = (n == null) ? (5 - move.column) as int? : n - 1;
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
    n = (n == null)
        ? (((move.column == 2 || move.column == 3) ? 5 : 3) - move.row) as int?
        : n - 1;
    int j = 0;
    if (n! < 1 ||
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

  bool left(List<int> colors, [int? n]) {
    n = (n == null) ? move.column : n - 1;
    int j = 0;
    if (n! < 1 ||
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

  bool right(List<int> colors, [int? n]) {
    n = (n == null)
        ? (((move.row == 2 || move.row == 3) ? 5 : 3) - move.column) as int?
        : n - 1;
    int j = 0;
    if (n! < 1 ||
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

  /// Color with a square shape from the current position.
  bool square(List<int> colors) {
    if (move.validatePosition(move.row, move.column + 1) &&
        move.validatePosition(move.row - 1, move.column) &&
        move.validatePosition(move.row, move.column)) {
      _board[move.row][move.column] = colors[0 % colors.length];
      _board[move.row][move.column + 1] = colors[1 % colors.length];
      _board[move.row - 1][move.column + 1] = colors[2 % colors.length];
      _board[move.row - 1][move.column] = colors[3 % colors.length];
      move.up();

      return true;
    }

    return false;
  }

  @override
  String toString() => '[      ${_board[0][2]}, ${_board[0][3]}      ]\n'
      '[      ${_board[1][2]}, ${_board[1][3]}      ]\n'
      '${_board[2]}\n'
      '${_board[3]}\n'
      '[      ${_board[4][2]}, ${_board[4][3]}      ]\n'
      '[      ${_board[5][2]}, ${_board[5][3]}      ]\n';

  bool up(List<int> colors, [int? n]) {
    n = (n == null)
        ? ((move.column == 2 || move.column == 2) ? move.row : move.row - 2)
        : n - 1;
    int j = 0;
    if (n! < 1 ||
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
