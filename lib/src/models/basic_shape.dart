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
}
