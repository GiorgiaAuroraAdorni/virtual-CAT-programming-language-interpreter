import 'package:colorize/colorize.dart';

import 'cross.dart';
import 'cross_coloring.dart';
import 'helper.dart';
import 'schemes.dart';

class CATInterpreter {
  CrossColoring board = CrossColoring();

  final _boardColors = {
    'green': 1,
    'red': 2,
    'blue': 3,
    'yellow': 4,
  };

  final _rows = {
    'f': 0,
    'e': 1,
    'd': 2,
    'c': 3,
    'b': 4,
    'a': 5,
  };

  final _columns = {
    '1': 0,
    '2': 1,
    '3': 2,
    '4': 3,
    '5': 4,
    '6': 5,
  };

  late final _directions = {
    "up": board.move.up,
    "down": board.move.down,
    "left": board.move.left,
    "right": board.move.right,
    "diagonal": {
      "up": {
        "left": board.move.diagonalUpLeft,
        "right": board.move.diagonalUpRight,
      },
      "down": {
        "left": board.move.diagonalDownLeft,
        "right": board.move.diagonalDownRight,
      },
    },
  };

  late final _coloring = {
    "up": board.up,
    "down": board.down,
    "left": board.left,
    "right": board.right,
    "square": board.square,
    "diagonal": {
      "up": {
        "left": board.diagonalUpLeft,
        "right": board.diagonalUpRight,
      },
      "down": {
        "left": board.diagonalDownLeft,
        "right": board.diagonalDownRight,
      },
    },
    "l": {
      "up": {
        "left": board.lUpLeft,
        "right": board.lUpRight,
      },
      "down": {
        "left": board.lDownLeft,
        "right": board.lDownRight,
      },
      "left": {
        "up": board.lLeftUp,
        "down": board.lLeftDown,
      },
      "right": {
        "up": board.lRightUp,
        "down": board.lRightDown,
      },
    },
    "zig-zag": {
      "left": {
        "up": {
          "down": board.zigzagLeftUpDown,
        },
        "down": {
          "up": board.zigzagLeftDownUp,
        },
      },
      "right": {
        "up": {
          "down": board.zigzagRightUpDown,
        },
        "down": {
          "up": board.zigzagRightDownUp,
        },
      },
      "up": {
        "left": {
          "right": board.zigzagUpLeftRight,
        },
        "right": {
          "left": board.zigzagUpRightLeft,
        },
      },
      "down": {
        "left": {
          "right": board.zigzagDownLeftRight,
        },
        "right": {
          "left": board.zigzagDownRightLeft,
        },
      },
    },
  };

  late final Schemes schemes;

  List<Cross> _states = <Cross>[];

  CATInterpreter(String json) {
    schemes = schemesFromJson(json);
  }

  List<Cross> get getStates => _states;

  void reset() {
    _states = <Cross>[];
    board = CrossColoring();
  }

  void validateOnScheme(String code, int schemeIndex) {
    Cross? toValidate = schemes.schemas[schemeIndex];
    _parse(code);
    print(board.getCross == toValidate);
  }

  void _move(List<String> command) {
    List<String> splited = command[0].split(" ");
    int repetitions;
    try {
      repetitions = int.parse(splited[0]);
      splited.removeAt(0);
    } on FormatException {
      repetitions = 1;
    }
    Function toExecute = () => {};
    if (_directions.containsKey(splited[0])) {
      dynamic found = _directions[splited[0]];
      int i = 1;
      while (found is! Function) {
        found = found[splited[i]];
        i++;
      }
      toExecute = () => found(repetitions);
    } else {
      var coordinates = splited[0].split("");
      toExecute = () => board.move
          .toPosition(_rows[coordinates[0]]!, _columns[coordinates[1]]!);
    }
    if (!toExecute.call()) {
      color("Invalid move", front: Styles.RED);
    }
  }

  void _paint(List<String> command) {
    List<int> colors = [];
    splitBySquare(command[0]).forEach((e) {
      colors.add(_boardColors[e]!);
    });
    List<String> splited = command[2].split(" ");
    Function toExecute = () => {};
    dynamic found = _coloring[splited[0]];
    try {
      int repetitions = int.parse(command[1]);
      int i = 1;
      while (found is! Function) {
        found = found[splited[i]];
        i++;
      }
      toExecute = () => found(colors, repetitions);
    } on FormatException {
      int i = 1;
      while (found is! Function) {
        found = found[splited[i]];
        i++;
      }
      toExecute = () => found(colors);
    }
    if (!toExecute.call()) {
      color("Invalid coloring", front: Styles.RED);
    }
  }

  void _parse(String command) {
    List<String> commands = normalize(command);
    List<List<String>> parsed = <List<String>>[];
    for (int i = 0; i < commands.length; i++) {
      parsed.add(commandSplit(commands[i]));
    }
    for (var el in parsed) {
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
