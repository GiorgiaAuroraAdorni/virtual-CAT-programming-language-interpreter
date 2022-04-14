import "package:dartx/dartx.dart";

final RegExp validCharacters = RegExp(r"^[a-zA-Z0-9_]+$");

List<String> splitCommand(String command) {
  final List<String> splitted = <String>[];
  int start = 0;
  bool square = false;
  for (int i = 0; i < command.length; i++) {
    if ((command[i] == "(" || command[i] == ")" || command[i] == ",") &&
        !square) {
      splitted.add(command.substring(start, i).trim());
      start = i + 1;
    }
    if (command[i] == "{" || command[i] == "}") {
      square = !square;
    }
  }

  return splitted.where((String element) => element.isNotEmpty).toList();
}

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

List<String> splitByCurly(String command) => command
    .removeSurrounding(prefix: "{", suffix: "}")
    .split(",")
    .where((String element) => element.isNotNullOrEmpty)
    .map((String e) => e.replaceAll(" ", ""))
    .toList();
