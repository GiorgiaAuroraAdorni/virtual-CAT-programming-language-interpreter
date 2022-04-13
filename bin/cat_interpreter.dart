import "package:colorize/colorize.dart";
import "package:dartx/dartx.dart";

import "src/cross.dart";
import "src/cross_coloring.dart";
import "src/helper.dart";
import "src/schemes.dart";

class CATInterpreter {
  CATInterpreter(String json) {
    schemes = schemesFromJson(json);
  }

  CrossColoring board = CrossColoring();

  final Map<String, int> _boardColors = <String, int>{
    "white": 0,
    "green": 1,
    "red": 2,
    "blue": 3,
    "yellow": 4,
  };

  final Map<String, int> _rows = <String, int>{
    "f": 0,
    "e": 1,
    "d": 2,
    "c": 3,
    "b": 4,
    "a": 5,
  };

  final Map<String, int> _columns = <String, int>{
    "1": 0,
    "2": 1,
    "3": 2,
    "4": 3,
    "5": 4,
    "6": 5,
  };

  late final Map<String, Object> _directions = <String, Object>{
    "up": board.move.up,
    "down": board.move.down,
    "left": board.move.left,
    "right": board.move.right,
    "diagonal": <String, Object>{
      "up": <String, Function>{
        "left": board.move.diagonalUpLeft,
        "right": board.move.diagonalUpRight,
      },
      "down": <String, Function>{
        "left": board.move.diagonalDownLeft,
        "right": board.move.diagonalDownRight,
      },
    },
  };

  late final Map<String, Object> _coloring = <String, Object>{
    "up": board.up,
    "down": board.down,
    "left": board.left,
    "right": board.right,
    "square": board.square,
    "diagonal": <String, Object>{
      "up": <String, Function>{
        "left": board.diagonalUpLeft,
        "right": board.diagonalUpRight,
      },
      "down": <String, Function>{
        "left": board.diagonalDownLeft,
        "right": board.diagonalDownRight,
      },
    },
    "l": <String, Object>{
      "up": <String, Function>{
        "left": board.lUpLeft,
        "right": board.lUpRight,
      },
      "down": <String, Function>{
        "left": board.lDownLeft,
        "right": board.lDownRight,
      },
      "left": <String, Function>{
        "up": board.lLeftUp,
        "down": board.lLeftDown,
      },
      "right": <String, Function>{
        "up": board.lRightUp,
        "down": board.lRightDown,
      },
    },
    "zig-zag": <String, Object>{
      "left": <String, Object>{
        "up": <String, Function>{
          "down": board.zigzagLeftUpDown,
        },
        "down": <String, Function>{
          "up": board.zigzagLeftDownUp,
        },
      },
      "right": <String, Object>{
        "up": <String, Function>{
          "down": board.zigzagRightUpDown,
        },
        "down": <String, Function>{
          "up": board.zigzagRightDownUp,
        },
      },
      "up": <String, Object>{
        "left": <String, Function>{
          "right": board.zigzagUpLeftRight,
        },
        "right": <String, Function>{
          "left": board.zigzagUpRightLeft,
        },
      },
      "down": <String, Object>{
        "left": <String, Function>{
          "right": board.zigzagDownLeftRight,
        },
        "right": <String, Function>{
          "left": board.zigzagDownRightLeft,
        },
      },
    },
  };

  late final Schemes schemes;

  List<Cross> _states = <Cross>[];

  List<Cross> get getStates => _states;

  void reset() {
    _states = <Cross>[];
    board.reset();
  }

  bool validateOnScheme(String code, int schemeIndex) {
    final Cross? toValidate = schemes.schemas[schemeIndex];
    _parse(code);

    return board.getCross == toValidate;
  }

  void _go(List<String> command) {
    final List<String> splited = command[0].split(" ");
    int repetitions;
    try {
      repetitions = splited[0].toInt();
      splited.removeAt(0);
    } on FormatException {
      repetitions = 1;
    }
    Function0<bool> toExecute = () => false;
    if (_directions.containsKey(splited[0])) {
      dynamic found = _directions[splited[0]];
      for (final int i in 1.rangeTo(splited.length - 1)) {
        if (found is Map) {
          found = found.getOrElse(splited[i], () => toExecute);
        } else {
          break;
        }
      }
      if (found is Function) {
        toExecute = (found as Function1<int, bool>).partial(repetitions);
      }
    } else {
      final List<String> coordinates = splited[0].split("");
      if (coordinates.length == 2 &&
          _rows.containsKey(coordinates[0]) &&
          _columns.containsKey(coordinates[1])) {
        toExecute = () => board.move
            .toPosition(_rows[coordinates[0]]!, _columns[coordinates[1]]!);
      } else {
        color("Invalid position", front: Styles.RED);

        return;
      }
    }
    if (!toExecute.call()) {
      color("Invalid move", front: Styles.RED);
    }
  }

  void _paint(List<String> command) {
    final List<int> colors = <int>[];
    for (final String e in splitByCurly(command[0])) {
      if (_boardColors.containsKey(e)) {
        colors.add(_boardColors[e]!);
      } else {
        color("Invalid color", front: Styles.RED);

        return;
      }
    }
    if (command.length == 1) {
      board.color(colors[0]);

      return;
    }
    final List<String> splited = command[2]
        .split(" ")
        .where((String element) => element.isNotNullOrEmpty)
        .toList();
    Function0<bool> toExecute = () => false;
    dynamic found = _coloring[splited[0]];
    for (final int i in 1.rangeTo(splited.length - 1)) {
      if (found is Map) {
        found = found.getOrElse(splited[i], () => toExecute);
      } else {
        break;
      }
    }
    if (found is Function) {
      try {
        final int repetitions = command[1].toInt();
        toExecute = (found as Function2<List<int>, int, bool>)
            .partial2(colors, repetitions);
      } on FormatException {
        toExecute = (found as Function1<List<int>, bool>).partial(colors);
      }
    }
    if (!toExecute.call()) {
      color("Invalid coloring command", front: Styles.RED);
    }
  }

  void _copy(List<String> command) {
    final List<String> toExecute =
        splitCommands(command[0].removeSurrounding(prefix: "{", suffix: "}"));
    final List<String> movements = splitByCurly(command[1]);
    final StringBuffer buffer = StringBuffer();
    for (final String move in movements) {
      buffer
        ..write(" go($move) ")
        ..writeAll(toExecute, " ");
    }
    _parse(buffer.toString(), false);
  }

  void _mirror(List<String> command) {
    if (command.length == 1) {
      switch (command.first) {
        case "horizontal":
          {
            board.mirrorHorizontal();
          }
          break;
        case "vertical":
          {
            board.mirrorVertical();
          }
          break;
        default:
          {
            color("Command not implemented", front: Styles.RED);
          }
          break;
      }
    }
  }

  void _parse(String command, [bool states = true]) {
    final List<String> commands = splitCommands(command);
    final List<List<String>> parsed = <List<String>>[];
    for (final int i in 0.rangeTo(commands.length - 1)) {
      parsed.add(splitCommand(commands[i]));
    }
    for (final List<String> el in parsed) {
      switch (el.removeAt(0)) {
        case "paint":
          {
            _paint(el);
          }
          break;
        case "go":
          {
            _go(el);
          }
          break;
        case "fill_empty":
          {
            if (_boardColors.containsKey(el.first)) {
              board.fillEmpty(_boardColors[el.first]!);
            } else {
              color("Invalid color", front: Styles.RED);

              return;
            }
          }
          break;
        case "copy":
          {
            _copy(el);
          }
          break;
        case "mirror":
          {
            _mirror(el);
          }
          break;
        default:
          {
            color("Command not implemented", front: Styles.RED);
          }
          break;
      }
      if (states) {
        _states.add(board.getCross.copy());
      }
    }
  }
}
