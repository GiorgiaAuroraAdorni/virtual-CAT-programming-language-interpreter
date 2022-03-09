import 'package:colorize/colorize.dart';

class Cross {
  var colors = {
    0: Styles.WHITE,
    1: Styles.GREEN,
    2: Styles.RED,
    3: Styles.BLUE,
    4: Styles.YELLOW,
  };
  late final List<List<int>> cross;

  Cross() {
    cross = [
      [0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0],
    ];
  }

  Cross.fromList(this.cross);

  List<List<int>> get getCross => cross;

  @override
  int get hashCode => Object.hash(cross, colors);

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != Cross) {
      return false;
    }

    other as Cross;
    if (cross[0][2] != other.cross[0][2] || cross[0][3] != other.cross[0][3]) {
      return false;
    }
    if (cross[1][2] != other.cross[1][2] || cross[1][3] != other.cross[1][3]) {
      return false;
    }
    for (int i = 2; i < 4; i++) {
      for (int j = 0; j < 6; j++) {
        if (cross[i][j] != other.cross[i][j]) {
          return false;
        }
      }
    }
    if (cross[4][2] != other.cross[4][2] || cross[4][3] != other.cross[4][3]) {
      return false;
    }
    if (cross[5][2] != other.cross[5][2] || cross[0][3] != other.cross[5][3]) {
      return false;
    }

    return true;
  }

  Cross copy() => Cross.fromList(cross);

  @override
  String toString() {
    String toReturn = "";
    toReturn +=
        '      ${Colorize("o").apply(colors[cross[0][2]]!)} ${Colorize("o").apply(colors[cross[0][3]]!)}      \n'
        '      ${Colorize("o").apply(colors[cross[1][2]]!)} ${Colorize("o").apply(colors[cross[1][3]]!)}      \n';
    for (int i = 2; i < 4; i++) {
      toReturn += "  ";
      for (int j = 0; j < 6; j++) {
        toReturn += '${Colorize("o").apply(colors[cross[i][j]]!)} ';
      }
      toReturn += "\n";
    }
    toReturn +=
        '      ${Colorize("o").apply(colors[cross[4][2]]!)} ${Colorize("o").apply(colors[cross[4][3]]!)}      \n'
        '      ${Colorize("o").apply(colors[cross[5][2]]!)} ${Colorize("o").apply(colors[cross[5][3]]!)}      ';

    return toReturn;
  }
}
