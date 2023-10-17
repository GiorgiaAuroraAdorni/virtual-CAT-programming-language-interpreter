![Dart](https://img.shields.io/badge/dart-%230175C2.svg?logo=dart&logoColor=white&style=flat) 

# virtual-CAT-programming-language-interpreter

The virtual CAT Interpreter is a component of the [virtual Cross Array Task (CAT) platform](https://github.com/GiorgiaAuroraAdorni/virtual-CAT-app). 
It plays a crucial role in translating student actions, which include gesture interactions and arranged visual programming blocks, into executable machine-readable instructions. 
This interpreter analyses user input and converts these actions into a formal algorithm specified using the CAT programming language.

## Validation of Commands

Each command that makes up the algorithm, such as colour selections and other operations, undergoes a rigorous validation process. 
This process is designed to identify and address semantic errors. 
Notably, the platform's interface has been thoughtfully designed with predefined programming blocks and buttons. This design inherently eliminates the need for syntax checking, significantly streamlining the process. However, semantic errors can still occur during command execution. 
For example, they might occur when users attempt to move outside the board boundaries using invalid directions or apply an inappropriate pattern for a colouring command.

## Real-time Feedback

Once the validation process is complete and the code is deemed error-free, the interpreter executes it. 
The user is provided real-time feedback, including the current progress on the colouring cross and the CAT-score. If the interpreter detects errors during execution, it handles them by providing users with error notifications and potential suggestions for correction.

## Integration

The documentation of the Dart package is available here: [virtual-CAT-programming-language-interpreter Documentation]([link-to-documentation](https://giorgiaauroraadorni.github.io/virtual-CAT-programming-language-interpreter/)https://giorgiaauroraadorni.github.io/virtual-CAT-programming-language-interpreter/)
