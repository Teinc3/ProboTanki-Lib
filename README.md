
# ProboTanki-Lib
[![Latest Release](https://img.shields.io/github/v/release/Teinc3/ProboTanki-Lib?display_name=tag&sort=semver)](https://github.com/Teinc3/ProboTanki-Lib/releases/latest)
[![PyPI version](https://badge.fury.io/py/probotanki-lib.svg)](https://badge.fury.io/py/probotanki-lib)
[![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/Teinc3/ProboTanki-Lib)

A core library for ProboTanki providing networking modules and packet handling utilities.

*Last Updated: 08 November, 2025*

## Dependencies

- Python >=3.9 (Developed in 3.11)

### Dev Dependencies
- Any C++ Compiler for building native extensions

### External Dependencies
- `pysocks`
- `aiosocks`

## Installation
This library is available on PyPI! You can now access it at https://pypi.org/project/probotanki-lib/

Like any other Python package, you can install it using pip:
```bash
pip install probotanki-lib
```

Note that the namespace used for the package would be `pbtlib`.

### Development Version

To install it, clone the repository to a local directory in your project.
```bash
cd /path/to/your/project
mkdir -p pbtlib
git clone https://github.com/Teinc3/ProboTanki-Lib.git
```
*OR*
```bash
git clone git@github.com:Teinc3/ProboTanki-Lib.git
```

Then, add the path to your requirements:
```pip-requirements
-e ./pbtlib

# Other requirements you might need...
```
*OR*
```bash
pip install -e ./pbtlib
```

This will install the library in your Python environment in Editable Mode,
allowing you to make changes to the library without needing to reinstall it every time.

## License and Contributing
This library is not licensed as it is subject to the terms of ProTanki Online. It is instead marked as "Proprietary".

If you want to contribute to this library, please fork the repository and create a pull request with your changes.
Please make sure to follow the coding style and conventions used in the library.

If you have any questions or suggestions, feel free to open an issue in the repository.