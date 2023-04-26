import "package:colorize/colorize.dart";
import "package:interpreter/src/models/basic_shape.dart";

/// Basic cross for the CAT interpreter
class Cross implements BasicShape {
  /// It creates a 6x6 matrix of zeros
  Cross() {
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
  Cross.fromList(this.grid);

  /// A map that maps the numbers to the colors.
  Map<int, Styles> colors = <int, Styles>{
    0: Styles.WHITE,
    1: Styles.GREEN,
    2: Styles.RED,
    3: Styles.BLUE,
    4: Styles.YELLOW,
  };

  /// A getter for the cross.
  @override
  late final List<List<int>> grid;

  /// A getter for the cross.
  @override
  List<List<int>> get getGrid => grid;

  @override
  int get hashCode => Object.hash(grid, colors);

  /// Overriding the `==` operator.
  @override
  bool operator ==(Object other) {
    if (other is! Cross) {
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

  /// Copy the cross by mapping each row to a new list
  /// containing the same elements.
  @override
  Cross copy() => Cross.fromList(
        grid.map((List<int> e) => <int>[...e]).toList(),
      );

  /// It prints the cross
  ///
  /// Returns:
  ///   A string representation of the cross.
  @override
  String toString() {
    final StringBuffer buffer = StringBuffer(
      '\n      ${Colorize("o").apply(colors[grid[0][2]]!)}'
      ' ${Colorize("o").apply(colors[grid[0][3]]!)}      \n'
      '      ${Colorize("o").apply(colors[grid[1][2]]!)}'
      ' ${Colorize("o").apply(colors[grid[1][3]]!)}      \n',
    );
    for (int i = 2; i < 4; i++) {
      buffer.write("  ");
      for (int j = 0; j < 6; j++) {
        buffer.write('${Colorize("o").apply(colors[grid[i][j]]!)} ');
      }
      buffer.write("\n");
    }
    buffer.write(
      '      ${Colorize("o").apply(colors[grid[4][2]]!)} '
      '${Colorize("o").apply(colors[grid[4][3]]!)}      \n'
      '      ${Colorize("o").apply(colors[grid[5][2]]!)}'
      ' ${Colorize("o").apply(colors[grid[5][3]]!)}      \n',
    );

    return buffer.toString();
  }

  /// Validate [row, column] position.
  /// ```dart
  /// validatePosition(0,0);
  /// validatePosition(2,3);
  /// validatePosition(6,7);
  /// ...
  /// ```
  @override
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
