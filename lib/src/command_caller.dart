import "dart:core";

import "coloring/cross_coloring.dart";

/// It creates two lists of methods, one for the board and one for the move, and if
/// the method name is in the list of methods, call the method
class CommandCaller {
  late final Map<String, Object> _directions = <String, Object>{
    "up": board.move.up,
    "down": board.move.down,
    "left": board.move.left,
    "right": board.move.right,
    "diagonalUpLeft": board.move.diagonalUpLeft,
    "diagonalUpRight": board.move.diagonalUpRight,
    "diagonalDownLeft": board.move.diagonalDownLeft,
    "diagonalDownRight": board.move.diagonalDownRight,
    "toPosition": board.move.toPosition,
  };

  late final Map<String, Object> _coloring = <String, Object>{
    "up": board.up,
    "down": board.down,
    "left": board.left,
    "right": board.right,
    "square": board.square,
    "diagonalUpLeft": board.diagonalUpLeft,
    "diagonalUpRight": board.diagonalUpRight,
    "diagonalDownLeft": board.diagonalDownLeft,
    "diagonalDownRight": board.diagonalDownRight,
    "lUpLeft": board.lUpLeft,
    "lUpRight": board.lUpRight,
    "lDownLeft": board.lDownLeft,
    "lDownRight": board.lDownRight,
    "lLeftUp": board.lLeftUp,
    "lLeftDown": board.lLeftDown,
    "lRightUp": board.lRightUp,
    "lRightDown": board.lRightDown,
    "zigzagLeftUpDown": board.zigzagLeftUpDown,
    "zigzagLeftDownUp": board.zigzagLeftDownUp,
    "zigzagRightUpDown": board.zigzagRightUpDown,
    "zigzagRightDownUp": board.zigzagRightDownUp,
    "zigzagUpLeftRight": board.zigzagUpLeftRight,
    "zigzagUpRightLeft": board.zigzagUpRightLeft,
    "zigzagDownLeftRight": board.zigzagDownLeftRight,
    "zigzagDownRightLeft": board.zigzagDownRightLeft,
    "mirrorVertical": board.mirrorVertical,
    "mirrorHorizontal": board.mirrorHorizontal,
    "fillEmpty": board.fillEmpty,
    "color": board.color,
  };

  /// It's creating a new instance of the `CrossColoring` class.
  CrossColoring board = CrossColoring();

  /// If the name of the function is in the _coloring map, call the function and
  /// return the result
  ///
  /// Args:
  ///   name (String): The name of the color function.
  ///   arg (List<dynamic>): The arguments passed to the color function.
  ///
  /// Returns:
  ///   A boolean value.
  bool color(String name, List<dynamic> arg) {
    if (_coloring.containsKey(name)) {
      return _callColorFunction(name, arg);
    }

    return false;
  }

  /// If the name of the move is in the _directions map, call the function
  /// associated with that name
  ///
  /// Args:
  ///   name (String): The name of the direction to move in.
  ///   arg (List<int>): The argument list for the move function.
  ///
  /// Returns:
  ///   A boolean value.
  bool move(String name, List<int> arg) {
    if (_directions.containsKey(name)) {
      return _callMoveFunction(name, arg);
    }

    return false;
  }

  /// It takes a function name and a list of arguments, and calls the function with
  /// the given arguments
  ///
  /// Args:
  ///   memberName (String): The name of the function to call.
  ///   positionalArguments (List<dynamic>): The arguments passed to the function.
  bool _callColorFunction(
    String memberName,
    List<dynamic> positionalArguments,
  ) =>
      Function.apply(_coloring[memberName]! as Function, positionalArguments);

  /// If the member name is a key in the _directions map, call the function
  /// associated with that key with the positional arguments.
  ///
  /// Args:
  ///   memberName (String): The name of the function that was called.
  ///   positionalArguments (List<dynamic>): The arguments passed to the function.
  bool _callMoveFunction(
    String memberName,
    List<dynamic> positionalArguments,
  ) =>
      Function.apply(_directions[memberName]! as Function, positionalArguments);
}
