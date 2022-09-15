///
/// Implementation of the CAT symbolic language.
/// Is an interpreter that validates and executes the CAT Symbolic language.
///
library cat_interpreter;

export "src/interpreter.dart" show CATInterpreter;
export "src/models/basic_shape.dart" show BasicShape;
export "src/models/cross.dart" show Cross;
export "src/models/schemes.dart";
export "src/models/square.dart" show Square;
export "src/results.dart" show Results;
export "src/utils/errors.dart" show CatError;
export "src/utils/helper.dart";
export "src/utils/shape.dart" show Shape;
