class CrossBasicMoves {
  int _column = 0;
  int _row = 3;

  int get column => _column;

  int get row => _row;

  /// Change position in diagonal down left position by [n] cells.
  ///
  /// Default value of [n] is 1.
  /// Return true on success.
  /// ```dart
  /// diagonalDownLeft();
  /// diagonalDownLeft(2);
  /// ...
  /// ```
  bool diagonalDownLeft([int n = 1]) {
    if (n <= 0) {
      return false;
    }
    final int newRow = _row + n;
    final int newColumn = _column - n;
    if (validatePosition(newRow, newColumn)) {
      _column = newColumn;
      _row = newRow;

      return true;
    }

    if (_column == 5 && _row == 3 && n == 1) {
      _column = 3;
      _row = 5;

      return true;
    } else if (_column == 2 && _row == 0 && n == 1) {
      _column = 0;
      _row = 2;

      return true;
    }

    return false;
  }

  /// Change position in diagonal down right position by [n] cells.
  ///
  /// Default value of [n] is 1.
  /// Return true on success.
  /// ```dart
  /// diagonalDownRight();
  /// diagonalDownRight(2);
  /// ...
  /// ```
  bool diagonalDownRight([int n = 1]) {
    if (n <= 0) {
      return false;
    }
    final int newRow = _row + n;
    final int newColumn = _column + n;
    if (validatePosition(newRow, newColumn)) {
      _column = newColumn;
      _row = newRow;

      return true;
    }

    if (_column == 0 && _row == 3 && n == 1) {
      _column = 2;
      _row = 5;

      return true;
    } else if (_column == 3 && _row == 0 && n == 1) {
      _column = 5;
      _row = 2;

      return true;
    }

    return false;
  }

  /// Change position in diagonal up left position by [n] cells.
  ///
  /// Default value of [n] is 1.
  /// Return true on success.
  /// ```dart
  /// diagonalUpLeft();
  /// diagonalUpLeft(2);
  /// ...
  /// ```
  bool diagonalUpLeft([int n = 1]) {
    if (n <= 0) {
      return false;
    }
    final int newRow = _row - n;
    final int newColumn = _column - n;
    if (validatePosition(newRow, newColumn)) {
      _column = newColumn;
      _row = newRow;

      return true;
    }

    if (_column == 5 && row == 2 && n == 1) {
      _column = 3;
      _row = 0;

      return true;
    } else if (_column == 2 && row == 5 && n == 1) {
      _column = 0;
      _row = 3;

      return true;
    }

    // if (n == 1) {
    //   return _alternativePosition(_column - 2, true);
    // }

    return false;
  }

  /// Change position in diagonal up right position by [n] cells.
  ///
  /// Default value of [n] is 1.
  /// Return true on success.
  /// ```dart
  /// diagonalUpRight();
  /// diagonalUpRight(2);
  /// ...
  /// ```
  bool diagonalUpRight([int n = 1]) {
    if (n <= 0) {
      return false;
    }
    final int newRow = _row - n;
    final int newColumn = _column + n;
    if (validatePosition(newRow, newColumn)) {
      _column = newColumn;
      _row = newRow;

      return true;
    }

    if (_column == 0 && _row == 2 && n == 1) {
      _column = 2;
      _row = 0;

      return true;
    } else if (_column == 3 && _row == 5 && n == 1) {
      _column = 5;
      _row = 3;

      return true;
    }

    return false;
  }

  /// Change position down position by [n] cells.
  ///
  /// Default value of [n] is 1.
  /// Return true on success.
  /// ```dart
  /// down();
  /// down(2);
  /// ...
  /// ```
  bool down([int n = 1]) {
    if (n <= 0) {
      return false;
    }
    final int newRow = _row + n;
    if (validatePosition(newRow, _column)) {
      _row = newRow;

      return true;
    }

    return _alternativePosition(newRow, true);
  }

  /// Change position left position by [n] cells.
  ///
  /// Default value of [n] is 1.
  /// Return true on success.
  /// ```dart
  /// left();
  /// left(2);
  /// ...
  /// ```
  bool left([int n = 1]) {
    if (n <= 0) {
      return false;
    }
    final int newColumn = _column - n;
    if (validatePosition(_row, newColumn)) {
      _column = newColumn;

      return true;
    }

    return _alternativePosition(newColumn, false);
  }

  /// Change position right position by [n] cells.
  ///
  /// Default value of [n] is 1.
  /// Return true on success.
  /// ```dart
  /// right();
  /// right(2);
  /// ...
  /// ```
  bool right([int n = 1]) {
    if (n <= 0) {
      return false;
    }
    final int newColumn = _column + n;
    if (validatePosition(_row, newColumn)) {
      _column = newColumn;

      return true;
    }

    return _alternativePosition(newColumn, false);
  }

  /// Move to an arbitrary position [row,column].
  ///
  /// Return true on success.
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
  String toString() => "Row position: $_row\nColumn position:$_column";

  /// Change position up position by [n] cells.
  ///
  /// Default value of [n] is 1.
  /// Return true on success.
  /// ```dart
  /// up();
  /// up(2);
  /// ...
  /// ```
  bool up([int n = 1]) {
    if (n <= 0) {
      return false;
    }
    final int newRow = _row - n;
    if (validatePosition(newRow, _column)) {
      _row = newRow;

      return true;
    }

    return _alternativePosition(newRow, true);
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

  bool _alternativePosition(int val, bool axis) {
    if (axis) {
      if (_column > 3) {
        if (validatePosition(val, 3)) {
          _column = 3;
          _row = val;

          return true;
        }
      }

      if (_column < 2) {
        if (validatePosition(val, 2)) {
          _column = 2;
          _row = val;

          return true;
        }
      }
    } else {
      if (_row > 3) {
        if (validatePosition(3, val)) {
          _column = val;
          _row = 3;

          return true;
        }
      }

      if (_row < 2) {
        if (validatePosition(2, val)) {
          _column = val;
          _row = 2;

          return true;
        }
      }
    }

    return false;
  }
}
