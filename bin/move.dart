class Move {

  int _column = 0;
  int _row = 3;

  get column => _column;

  get row => _row;

  /// Change position in diagonal down left position by [n] cells.
  ///
  /// Default value of [n] is 1.
  /// ```dart
  /// diagonalDownLeft();
  /// diagonalDownLeft(2);
  /// ...
  /// ```
  bool diagonalDownLeft([int n = 1]) {
    int newRow = _row + n;
    int newColumn = _column - n;
    if (validatePosition(newRow, newColumn)) {
      _column = newColumn;
      _row = newRow;

      return true;
    }

    return false;
  }

  /// Change position in diagonal down right position by [n] cells.
  ///
  /// Default value of [n] is 1.
  /// ```dart
  /// diagonalDownRight();
  /// diagonalDownRight(2);
  /// ...
  /// ```
  bool diagonalDownRight([int n = 1]) {
    int newRow = _row + n;
    int newColumn = _column + n;
    if (validatePosition(newRow, newColumn)) {
      _column = newColumn;
      _row = newRow;

      return true;
    }

    return false;
  }

  /// Change position in diagonal up left position by [n] cells.
  ///
  /// Default value of [n] is 1.
  /// ```dart
  /// diagonalUpLeft();
  /// diagonalUpLeft(2);
  /// ...
  /// ```
  bool diagonalUpLeft([int n = 1]) {
    int newRow = _row - n;
    int newColumn = _column - n;
    if (validatePosition(newRow, newColumn)) {
      _column = newColumn;
      _row = newRow;

      return true;
    }

    return false;
  }

  /// Change position in diagonal up right position by [n] cells.
  ///
  /// Default value of [n] is 1.
  /// ```dart
  /// diagonalUpRight();
  /// diagonalUpRight(2);
  /// ...
  /// ```
  bool diagonalUpRight([int n = 1]) {
    int newRow = _row - n;
    int newColumn = _column + n;
    if (validatePosition(newRow, newColumn)) {
      _column = newColumn;
      _row = newRow;

      return true;
    }

    return false;
  }

  /// Change position down position by [n] cells.
  ///
  /// Default value of [n] is 1.
  /// ```dart
  /// down();
  /// down(2);
  /// ...
  /// ```
  bool down([int n = 1]) {
    int newRow = _row + n;
    if (validatePosition(newRow, _column)) {
      _row = newRow;

      return true;
    }

    return false;
  }

  /// Change position left position by [n] cells.
  ///
  /// Default value of [n] is 1.
  /// ```dart
  /// left();
  /// left(2);
  /// ...
  /// ```
  bool left([int n = 1]) {
    int newColumn = _column - n;
    if (validatePosition(_row, newColumn)) {
      _column = newColumn;

      return true;
    }

    return false;
  }

  /// Change position right position by [n] cells.
  ///
  /// Default value of [n] is 1.
  /// ```dart
  /// right();
  /// right(2);
  /// ...
  /// ```
  bool right([int n = 1]) {
    int newColumn = _column + n;
    if (validatePosition(_row, newColumn)) {
      _column = newColumn;

      return true;
    }

    return false;
  }

  /// Move to an arbitrary position [row,column].
  ///
  /// ```dart
  /// toPosition(0,0);
  /// toPosition(3,5);
  /// ...
  /// ```
  bool toPosition(int row, int column) {
    if (validatePosition(row, column)) {
      _row = row;
      _column = column;

      return true;
    }

    return false;
  }

  @override
  String toString() => 'Row position: $_row\nColumn position:$_column';

  /// Change position up position by [n] cells.
  ///
  /// Default value of [n] is 1.
  /// ```dart
  /// up();
  /// up(2);
  /// ...
  /// ```
  bool up([int n = 1]) {
    int newRow = _row - n;
    if (validatePosition(newRow, _column)) {
      _row = newRow;

      return true;
    }

    return false;
  }

  /// Validate [row, column] position.
  /// ```dart
  /// validatePosition(0,0);
  /// validatePosition(2,3);
  /// validatePosition(6,7);
  /// ...
  /// ```
  bool validatePosition(int row, int column) {
    if (row > 5 || row < 0 || column > 5 || column < 0) {
      return false;
    }

    if ((row < 2 || row > 3) && (column < 2 || column > 3)) {
      return false;
    }

    return true;
  }
}
