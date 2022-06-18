import "package:dartx/dartx.dart";

/// A regular expression that matches any string that contains only letters,
/// numbers, and underscores.
final RegExp validCharacters = RegExp(r"^[a-zA-Z0-9_]+$");

/// It splits a string into a list of strings, but it ignores commas and parentheses
/// that are inside curly braces
///
/// Args:
///   command (String): The command to be split.
///
/// Returns:
///   A list of strings.
List<String> splitCommand(String command) {
  final List<String> splitted = <String>[];
  int start = 0;
  int open = 0;
  bool square = false;
  for (int i = 0; i < command.length; i++) {
    if (open == 0) {
      square = false;
    }
    if ((command[i] == "(" || command[i] == ")" || command[i] == ",") &&
        !square) {
      splitted.add(command.substring(start, i).trim());
      start = i + 1;
    }
    if (command[i] == "{") {
      open++;
      square = true;
    } else if (command[i] == "}") {
      open--;
    }
  }

  return splitted.where((String element) => element.isNotEmpty).toList();
}

/// It splits a string into a list of strings, where each string is a command
///
/// Args:
///   command (String): The command to be split.
///
/// Returns:
///   A list of strings that are the commands.
List<String> splitCommands(String command) {
  final String modified = command.replaceAll("\n", " ").toLowerCase().trim();
  final List<String> collection = <String>[];
  int open = 0;
  int start = 0;
  bool found = false;
  for (int i = 0; i < modified.length; i++) {
    if (modified[i] == "(" && !found) {
      found = !found;
      open++;
    } else if (modified[i] == "(") {
      open++;
    } else if (modified[i] == ")") {
      open--;
    } else if (!validCharacters.hasMatch(modified[i]) && open == 0) {
      start++;
      continue;
    }
    if (found && open == 0) {
      found = !found;
      collection.add(modified.substring(start, i + 1));
      start = i + 1;
    }
  }

  return collection.where((String element) => element.isNotEmpty).toList();
}

/// It removes the curly braces from the command, splits the command by commas,
/// removes empty strings, and returns the result as a list
///
/// Args:
///   command (String): The command to split.
List<String> splitByCurly(String command) => command
    .removeSurrounding(prefix: "{", suffix: "}")
    .split(",")
    .where((String element) => element.isNotNullOrEmpty)
    .toList();
