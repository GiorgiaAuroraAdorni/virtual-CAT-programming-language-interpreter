import "package:dartx/dartx.dart";

List<String> splitCommand(String command) {
  final int position = command.indexOf("(");
  final List<String> splitted = <String>[command.slice(0, position - 1)];
  final String secondPart =
      command.slice(position).removeSurrounding(prefix: "(", suffix: ")");
  final RegExpMatch? match = RegExp(r"\[[^\]]*]").firstMatch(secondPart);
  if (match != null) {
    splitted
      ..add(secondPart.slice(match.start, match.end - 1))
      ..addAll(
        secondPart.slice(match.end + 1).split(","),
      );
  } else {
    splitted.add(secondPart);
  }

  return splitted;
}

List<String> splitCommands(String command) =>
    ((String modified) => RegExp(r"[a-zA-Z]+\([^)]*\)")
        .allMatches(modified)
        .map((Match e) => modified.substring(e.start, e.end))
        .toList())(command.replaceAll("\n", " ").toLowerCase().trim());

List<String> splitBySquare(String command) => command
    .removeSurrounding(prefix: "[", suffix: "]")
    .split(",")
    .where((String element) => element.isNotNullOrEmpty)
    .map((String e) => e.replaceAll(" ", ""))
    .toList();
