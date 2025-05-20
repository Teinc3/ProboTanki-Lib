import setuptools
from setuptools import Extension, find_packages
import os
import sys

# --- Cython Setup ---
try:
    from Cython.Build import cythonize
except ImportError:
    print("ERROR: Cython is not installed. Cython is required to build the 'cprotection' extension.", file=sys.stderr)
    print("Please install Cython (e.g., 'pip install cython') and try again.", file=sys.stderr)
    sys.exit(1) # Exit the setup process with an error code


# Paths are relative to this setup.py (i.e., inside pbtlib/)
cprotection_pyx_path = os.path.join('modules', 'security', 'cprotection.pyx')

# The extension name must reflect the final import path: pbtlib.modules.security.cprotection
PKG_NAME = 'pbtlib'
extension_full_name = f"{PKG_NAME}.modules.security.cprotection"

extensions_to_cythonize = [
    Extension(
        name=extension_full_name,
        sources=[cprotection_pyx_path],
    )
]
ext_modules = [
    *cythonize(extensions_to_cythonize, compiler_directives={'language_level': "3"})
]

# --- Packaging ---
# We are inside the 'pbtlib' directory. We want to package its contents
# such that it's installed as a top-level 'pbtlib' package.
packages_to_install = [PKG_NAME] + [(PKG_NAME + '.' + pkg) for pkg in find_packages(where='.')]

with open('requirements.txt', 'r') as f:
    requirements = [line.strip() for line in f if line.strip() and not line.startswith('#')]

setuptools.setup(
    # name, version, description, etc. are defined in pyproject.toml
    package_dir={PKG_NAME: '.'},
    packages=packages_to_install,
    install_requires=requirements,
    ext_modules=ext_modules,
    include_package_data=True, # To include files specified in MANIFEST.in (like README.md, .pyi, .pyx)
    zip_safe=False, # Recommended for packages with C extensions
)
