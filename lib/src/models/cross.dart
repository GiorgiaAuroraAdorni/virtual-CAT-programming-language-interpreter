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
  /// `Cross.fromList(this.grid);` is a constructor in the `Cross` class that takes
  /// a 2D list `grid` as a parameter. It creates a new instance of the `Cross`
  /// class by assigning the `grid` parameter to the `grid` property of the new
  /// instance. This allows you to create a `Cross` object from an existing 2D list.
  Cross.fromList(this.grid);

  /// The code `Map<int, Styles> colors = <int, Styles>{...};` is creating a map
  /// called `colors` that maps integers to `Styles` objects. The keys of the map
  /// are integers, and the values are `Styles` objects. Each integer represents a
  /// color code, and the corresponding `Styles` object represents the color
  /// associated with that code.
  Map<int, Styles> colors = <int, Styles>{
    0: Styles.WHITE,
    1: Styles.GREEN,
    2: Styles.RED,
    3: Styles.BLUE,
    4: Styles.YELLOW,
  };

  /// The `@override late final List<List<int>> grid;` is declaring a late final
  /// variable `grid` of type `List<List<int>>`. The `@override` annotation
  /// indicates that this variable is overriding a property from a superclass or
  /// implementing an interface. In this case, it is overriding the `grid` property
  /// from the `BasicShape` interface. The `late` keyword indicates that the
  /// variable will be initialized at a later point before it is accessed. The
  /// `final` keyword indicates that the variable cannot be reassigned once it is
  /// initialized.
  @override
  late final List<List<int>> grid;

  /// The `@override List<List<int>> get getGrid => grid;` is a getter method that
  /// overrides the `getGrid` getter method from the `BasicShape` interface. It
  /// returns the `grid` property, which is a 2D list representing the cross. This
  /// allows other classes that implement the `BasicShape` interface to access the
  /// `grid` property of the `Cross` class.
  @override
  List<List<int>> get getGrid => grid;

  /// The `@override int get hashCode => Object.hash(grid, colors);` is overriding
  /// the `hashCode` getter method from the `Object` class.
  @override
  int get hashCode => Object.hash(grid, colors);

  /// Overriding the `==` operator.
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


  /// The function validates if a given position is within a specific range.
  ///
  /// Args:
  ///   row (int): The "row" parameter represents the row index of a position in a
  /// grid or matrix. It is used to check if the given row is within a valid range
  /// and if it falls within a specific region of the grid.
  ///   column (int): The "column" parameter represents the column index of a
  /// position in a grid or matrix.
  ///
  /// Returns:
  ///   The method is returning a boolean value. It returns true if the given
  /// position (row, column) is valid, and false otherwise.
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
