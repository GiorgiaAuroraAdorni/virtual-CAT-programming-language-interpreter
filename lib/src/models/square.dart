import "package:colorize/colorize.dart";
import "package:interpreter/src/models/basic_shape.dart";

/// Basic square for the CAT interpreter
class Square implements BasicShape {
  /// It creates a 6x6 matrix of zeros
  Square() {
    grid = <List<int>>[
      <int>[0, 0, 0, 0, 0, 0],
      <int>[0, 0, 0, 0, 0, 0],
      <int>[0, 0, 0, 0, 0, 0],
      <int>[0, 0, 0, 0, 0, 0],
      <int>[0, 0, 0, 0, 0, 0],
      <int>[0, 0, 0, 0, 0, 0],
    ];
  }

  /// Construct cross from an existing 6x6 matrix.
  Square.fromList(this.grid);

  /// A map that maps the numbers to the colors.
  Map<int, Styles> colors = <int, Styles>{
    0: Styles.WHITE,
    1: Styles.GREEN,
    2: Styles.RED,
    3: Styles.BLUE,
    4: Styles.YELLOW,
  };

  @override
  late List<List<int>> grid;

  @override
  Square copy() => Square.fromList(
        grid.map((List<int> e) => <int>[...e]).toList(),
      );

  @override
  List<List<int>> get getGrid => grid;

  @override
  bool validatePosition(int row, int column) =>
      row < 6 && row >= 0 && column < 6 && column >= 0;

  @override
  String toString() {
    final StringBuffer buffer = StringBuffer();
    for (final List<int> i in grid) {
      for (final int j in i) {
        buffer.write("${Colorize("o").apply(colors[j]!)} ");
      }
    }

    return buffer.toString();
  }
}
