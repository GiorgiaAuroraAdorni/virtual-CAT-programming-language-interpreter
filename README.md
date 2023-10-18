![Dart](https://img.shields.io/badge/dart-%230175C2.svg?logo=dart&logoColor=white&style=flat) 

# virtual CAT programming language interpreter
[![DOI](https://zenodo.org/badge/605107045.svg)](https://zenodo.org/badge/latestdoi/605107045)

The virtual CAT programming language interpreter is a software component of the [virtual Cross Array Task (CAT) platform](https://github.com/GiorgiaAuroraAdorni/virtual-CAT-app).
Its primary role is to translate user actions, including gesture interactions and arranged visual programming blocks, into executable machine-readable instructions, a formal algorithm specified using the CAT programming language.

Before executing these commands, the interpreter meticulously validates them to identify potential semantic errors. 
While the design of the interface inherently prevents syntax errors, semantic discrepancies, such as attempting to move beyond board boundaries or using incorrect patterns, are addressed by the interpreter. 
Upon successful validation, it executes the code, offering users real-time feedback on their progress, including visual updates on the colouring cross and the CAT-score. 
In cases where errors are detected during execution, the interpreter adeptly manages them, promptly notifying users and even providing suggestions for corrections. 
In essence, the interpreter acts as a bridge, ensuring seamless communication between the user's input and the application's core functionalities.


## Integration

The documentation of the Dart package is available here: [virtual-CAT-programming-language-interpreter Documentation]([link-to-documentation](https://giorgiaauroraadorni.github.io/virtual-CAT-programming-language-interpreter/)https://giorgiaauroraadorni.github.io/virtual-CAT-programming-language-interpreter/)
