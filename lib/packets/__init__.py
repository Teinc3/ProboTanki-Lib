import importlib
import pkgutil

from .abstractpacket import AbstractPacket

__all__ = ['AbstractPacket']

# Dynamically import all submodules in the 'packets' package
for loader, module_name, is_pkg in pkgutil.walk_packages(__path__, f"{__name__}."):
    importlib.import_module(module_name)