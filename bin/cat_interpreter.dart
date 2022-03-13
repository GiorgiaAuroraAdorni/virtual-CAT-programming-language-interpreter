import "package:colorize/colorize.dart";

import "cross.dart";
import "cross_coloring.dart";
import "helper.dart";
import "schemes.dart";

class CATInterpreter {
  CATInterpreter(String json) {
    schemes = schemesFromJson(json);
  }

  CrossColoring board = CrossColoring();

  final Map<String, int> _boardColors = <String, int>{
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
    board = CrossColoring();
  }

  void validateOnScheme(String code, int schemeIndex) {
    final Cross? toValidate = schemes.schemas[schemeIndex];
    _parse(code);
    print(board.getCross == toValidate);
  }

  void _move(List<String> command) {
    final List<String> splited = command[0].split(" ");
    int repetitions;
    try {
      repetitions = int.parse(splited[0]);
      splited.removeAt(0);
    } on FormatException {
      repetitions = 1;
    }
    Function toExecute = () => <bool>{};
    if (_directions.containsKey(splited[0])) {
      dynamic found = _directions[splited[0]];
      int i = 1;
      while (found is Map) {
        found = found[splited[i]];
        i++;
      }
      if (found is Function) {
        toExecute = () => found(repetitions);
      }
    } else {
      final List<String> coordinates = splited[0].split("");
      toExecute = () => board.move
          .toPosition(_rows[coordinates[0]]!, _columns[coordinates[1]]!);
    }
    if (!toExecute.call()) {
      color("Invalid move", front: Styles.RED);
    }
  }

  void _paint(List<String> command) {
    final List<int> colors = <int>[];
    splitBySquare(command[0]).forEach((String e) {
      colors.add(_boardColors[e]!);
    });
    final List<String> splited = command[2].split(" ");
    Function toExecute = () => <void>{};
    dynamic found = _coloring[splited[0]];
    try {
      final int repetitions = int.parse(command[1]);
      int i = 1;
      while (found is Map) {
        found = found[splited[i]];
        i++;
      }
      if (found is Function) {
        toExecute = () => found(colors, repetitions);
      }
    } on FormatException {
      int i = 1;
      while (found is Map) {
        found = found[splited[i]];
        i++;
      }
      if (found is Function) {
        toExecute = () => found(colors);
      }
    }
    if (!toExecute.call()) {
      color("Invalid coloring", front: Styles.RED);
    }
  }

  void _parse(String command) {
    final List<String> commands = normalize(command);
    final List<List<String>> parsed = <List<String>>[];
    for (int i = 0; i < commands.length; i++) {
      parsed.add(commandSplit(commands[i]));
    }
    for (final List<String> el in parsed) {
      switch (el.removeAt(0)) {
        case "paint":
          {
            _paint(el);
          }
          break;
        case "move":
          {
            _move(el);
          }
          break;
        case "fill_empty":
          {
            board.fillEmpty(_boardColors[el.first]!);
          }
          break;
        default:
          {
            color("Command not implemented", front: Styles.RED);
          }
          break;
      }
      print(board);
    }
  }
}
