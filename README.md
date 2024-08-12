![Dart](https://img.shields.io/badge/dart-%230175C2.svg?logo=dart&logoColor=white&style=flat) 

# virtual CAT programming language interpreter

### Citation
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.10016535.svg)](https://doi.org/10.5281/zenodo.10016535)

If you use the materials provided in this repository, please cite the following work:

```bibtex
   @misc{adorni_virtualCATinterpreter_2023,
     author = {Adorni, Giorgia and Karpenko, Volodymyr},
     doi = {10.5281/zenodo.10016535},
     month = oct,
     title = {{virtual CAT programming language interpreter}},
     note = {Zenodo Software. \url{https://doi.org/10.5281/zenodo.10016535}},
     year = {2023}
   }
```

### Overview

The virtual CAT programming language interpreter is a software component of the [virtual Cross Array Task (CAT) platform](https://github.com/GiorgiaAuroraAdorni/virtual-CAT-app).
Its primary role is translating user actions, including gesture interactions and arranged visual programming blocks, into executable machine-readable instructions, a formal algorithm specified using the CAT programming language.

Before executing these commands, the interpreter meticulously validates them to identify potential semantic errors.

While the design of the interface inherently prevents syntax errors, semantic discrepancies, such as attempting to move beyond board boundaries or using incorrect patterns, are addressed by the interpreter.

It executes the code upon successful validation, offering users real-time feedback on their progress, including visual updates on the colouring cross and the CAT-score.

In cases where errors are detected during execution, the interpreter adeptly manages them, promptly notifying users and even providing suggestions for corrections.

The interpreter acts as a bridge, ensuring seamless communication between the user's input and the application's core functionalities.


## Integration

The documentation of the Dart package is available here: [virtual-CAT-programming-language-interpreter Documentation](https://giorgiaauroraadorni.github.io/virtual-CAT-programming-language-interpreter/)

##### REFERENCES

**[1]** A. Piatti, G. Adorni, L. El-Hamamsy, L. Negrini, D. Assaf, L. Gambardella & F. Mondada. (2022). The CT-cube: A framework for the design and the assessment of computational thinking activities. Computers in Human Behavior Reports, 5, 100166. https://doi.org/10.1016/j.chbr.2021.100166

**[2]** Adorni, G. (2023). Dataset for algorithmic thinking skills assessment: Results from the virtual CAT pilot study in Swiss compulsory education. Zenodo Dataset. https://doi.org/10.5281/zenodo.10018292

**[3]** Adorni, G., & Piatti, S., & Karpenko, V. (2023). virtual CAT: An app for algorithmic thinking assessment within Swiss compulsory education. Zenodo Software. https://doi.org/10.5281/zenodo.10027851
On GitHub: https://github.com/GiorgiaAuroraAdorni/virtual-CAT-app/

**[4]** Adorni, G., & Karpenko, V. (2023). virtual CAT data infrastructure. Zenodo Software. https://doi.org/10.5281/zenodo.10015011
On GitHub: https://github.com/GiorgiaAuroraAdorni/virtual-CAT-data-infrastructure
