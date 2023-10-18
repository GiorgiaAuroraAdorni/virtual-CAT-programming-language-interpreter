![Dart](https://img.shields.io/badge/dart-%230175C2.svg?logo=dart&logoColor=white&style=flat) 

# virtual CAT programming language interpreter
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.10016536.svg)](https://doi.org/10.5281/zenodo.10016536)

The virtual CAT programming language interpreter is a software component of the [virtual Cross Array Task (CAT) platform](https://github.com/GiorgiaAuroraAdorni/virtual-CAT-app).
Its primary role is translating user actions, including gesture interactions and arranged visual programming blocks, into executable machine-readable instructions, a formal algorithm specified using the CAT programming language.

Before executing these commands, the interpreter meticulously validates them to identify potential semantic errors.

While the design of the interface inherently prevents syntax errors, semantic discrepancies, such as attempting to move beyond board boundaries or using incorrect patterns, are addressed by the interpreter.

It executes the code upon successful validation, offering users real-time feedback on their progress, including visual updates on the colouring cross and the CAT-score.

In cases where errors are detected during execution, the interpreter adeptly manages them, promptly notifying users and even providing suggestions for corrections.

The interpreter acts as a bridge, ensuring seamless communication between the user's input and the application's core functionalities.


## Integration

The documentation of the Dart package is available here: [virtual-CAT-programming-language-interpreter Documentation](https://giorgiaauroraadorni.github.io/virtual-CAT-programming-language-interpreter/)
