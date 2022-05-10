import "package:colorize/colorize.dart";

/// Basic cross for the CAT interpreter
class Cross {
  /// It creates a 6x6 matrix of zeros
  Cross() {
    cross = <List<int>>[
      <int>[0, 0, 0, 0, 0, 0],
      <int>[0, 0, 0, 0, 0, 0],
      <int>[0, 0, 0, 0, 0, 0],
      <int>[0, 0, 0, 0, 0, 0],
      <int>[0, 0, 0, 0, 0, 0],
      <int>[0, 0, 0, 0, 0, 0],
    ];
  }

  /// Construct cross from an existing 6x6 matrix.
  Cross.fromList(this.cross);

  /// A map that maps the numbers to the colors.
  Map<int, Styles> colors = <int, Styles>{
    0: Styles.WHITE,
    1: Styles.GREEN,
    2: Styles.RED,
    3: Styles.BLUE,
    4: Styles.YELLOW,
  };

  /// A getter for the cross.
  late final List<List<int>> cross;

  /// A getter for the cross.
  List<List<int>> get getCross => cross;

  @override
  int get hashCode => Object.hash(cross, colors);

  /// Overriding the `==` operator.
  @override
  bool operator ==(Object other) {
    if (other is Cross) {
      if (cross[0][2] != other.cross[0][2] ||
          cross[0][3] != other.cross[0][3]) {
        return false;
      }
      if (cross[1][2] != other.cross[1][2] ||
          cross[1][3] != other.cross[1][3]) {
        return false;
      }
      for (int i = 2; i < 4; i++) {
        for (int j = 0; j < 6; j++) {
          if (cross[i][j] != other.cross[i][j]) {
            return false;
          }
        }
      }
      if (cross[4][2] != other.cross[4][2] ||
          cross[4][3] != other.cross[4][3]) {
        return false;
      }
      if (cross[5][2] != other.cross[5][2] ||
          cross[0][3] != other.cross[5][3]) {
        return false;
      }
    } else {
      return false;
    }

    return true;
  }

  /// Copy the cross by mapping each row to a new list containing the same elements.
  Cross copy() => Cross.fromList(
        cross.map((List<int> e) => <int>[...e]).toList(),
      );

  /// It prints the cross
  ///
  /// Returns:
  ///   A string representation of the cross.
  @override
  String toString() {
    final StringBuffer buffer = StringBuffer(
      '\n      ${Colorize("o").apply(colors[cross[0][2]]!)}'
      ' ${Colorize("o").apply(colors[cross[0][3]]!)}      \n'
      '      ${Colorize("o").apply(colors[cross[1][2]]!)}'
      ' ${Colorize("o").apply(colors[cross[1][3]]!)}      \n',
    );
    for (int i = 2; i < 4; i++) {
      buffer.write("  ");
      for (int j = 0; j < 6; j++) {
        buffer.write('${Colorize("o").apply(colors[cross[i][j]]!)} ');
      }
      buffer.write("\n");
    }
    buffer.write(
      '      ${Colorize("o").apply(colors[cross[4][2]]!)} '
      '${Colorize("o").apply(colors[cross[4][3]]!)}      \n'
      '      ${Colorize("o").apply(colors[cross[5][2]]!)}'
      ' ${Colorize("o").apply(colors[cross[5][3]]!)}      \n',
    );

    return buffer.toString();
  }
}
