/// A class that contains the basic moves of the CAT
class BasicMoves {
  /// A constructor that receives a function as a parameter.
  BasicMoves(this.validatePosition);

  /// The line `int _column = 0;` is declaring a private instance variable `_column`
  /// of type `int` and initializing it with a value of 0. This variable represents
  /// the column position of the CAT.
  int _column = 0;
  /// The line `int _row = 3;` is declaring a private instance variable `_row` of
  /// type `int` and initializing it with a value of 3. This variable represents the
  /// row position of the CAT.
  int _row = 3;

  /// A flag that indicates if the CAT is in copy mode.
  bool copyMode = false;

  /// A getter of the column position.
  int get column => _column;

  /// A getter of the row position.
  int get row => _row;

  /// A function that receives two parameters and returns a boolean.
  Function(int, int) validatePosition;

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
  bool down([int n = 1, bool alternate = true]) {
    if (n <= 0) {
      return false;
    }
    final int newRow = _row + n;
    if (validatePosition(newRow, _column)) {
      _row = newRow;

      return true;
    }

    return copyMode && _alternativePosition(newRow, true) && alternate;
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
  bool left([int n = 1, bool alternate = true]) {
    if (n <= 0) {
      return false;
    }
    final int newColumn = _column - n;
    if (validatePosition(_row, newColumn)) {
      _column = newColumn;

      return true;
    }

    return copyMode && _alternativePosition(newColumn, false) && alternate;
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
  bool right([int n = 1, bool alternate = true]) {
    if (n <= 0) {
      return false;
    }
    final int newColumn = _column + n;
    if (validatePosition(_row, newColumn)) {
      _column = newColumn;

      return true;
    }

    return copyMode && _alternativePosition(newColumn, false) && alternate;
  }


  /// The function `toPosition` sets the row and column values if they are valid and
  /// returns true, otherwise it returns false.
  ///
  /// Args:
  ///   row (int): The row parameter represents the row number of a position in a
  /// grid or matrix.
  ///   column (int): The "column" parameter represents the column index of a
  /// position in a grid or matrix.
  ///
  /// Returns:
  ///   a boolean value. It returns true if the position (row, column) is valid and
  /// successfully sets the internal variables _row and _column to the given values.
  /// It returns false if the position is not valid.
  bool toPosition(int row, int column) {
    if (validatePosition(row, column)) {
      _row = row;
      _column = column;

      return true;
    }

    return false;
  }

  /// The function returns a string representation of the row and column positions.
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
  bool up([int n = 1, bool alternate = true]) {
    if (n <= 0) {
      return false;
    }
    final int newRow = _row - n;
    if (validatePosition(newRow, _column)) {
      _row = newRow;

      return true;
    }

    return copyMode && _alternativePosition(newRow, true) && alternate;
  }

  /// The function `_alternativePosition` checks if a given value can be assigned to
  /// a specific position on a grid, and updates the position accordingly.
  ///
  /// Args:
  ///   val (int): The parameter `val` is an integer value that represents the
  /// position on either the row or column axis.
  ///   axis (bool): The "axis" parameter is a boolean value that determines whether
  /// the alternative position should be calculated along the column axis (if true)
  /// or the row axis (if false).
  ///
  /// Returns:
  ///   a boolean value. It returns true if the position is successfully validated
  /// and updated, and false otherwise.
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
