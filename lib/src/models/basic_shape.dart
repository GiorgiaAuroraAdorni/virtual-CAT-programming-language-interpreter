/// It's an abstract class that defines the basic properties of a shape
abstract class BasicShape {
  /// It's a late final variable that is initialized in the constructor.
  late final List<List<int>> grid;

  /// It's a method that returns a copy of the current shape.
  BasicShape copy();

  /// It's a method that checks if the position is valid.
  bool validatePosition(int row, int column);

  /// It's a getter that returns the grid.
  List<List<int>> get getGrid;

  @override
  bool operator ==(Object other) {
    if (other is! BasicShape) {
      return false;
    }
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[i].length; j++) {
        if (validatePosition(i, j)) {
          if (other.grid[i][j] != grid[i][j]) {
            return false;
          }
        }
      }
    }

    return true;
  }

}
