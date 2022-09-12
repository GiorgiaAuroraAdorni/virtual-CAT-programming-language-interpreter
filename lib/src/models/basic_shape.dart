abstract class BasicShape {
  late final List<List<int>> grid;

  BasicShape copy();

  bool validatePosition(int row, int column);

  List<List<int>> get getGrid;
}
