///
/// Implementation of the CAT symbolic language.
/// Is an interpreter that validates and executes the CAT Symbolic language.
///
library cat_interpreter;

export "src/interpreter.dart" show CATInterpreter;
export 'src/models/cross.dart' show Cross;
export "src/models/schemes.dart";
export "src/results.dart" show Results;
export "src/utils/errors.dart" show CatError;
export "src/utils/helper.dart";
