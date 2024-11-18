import importlib
import os

from .abstractpacket import AbstractPacket

# Get the directory of the current file
packets_dir = os.path.dirname(__file__)

# Iterate over all subdirectories in the packets directory
for root, dirs, files in os.walk(packets_dir):
    for dir_name in dirs:
        # Skip directories starting with double underscores
        if dir_name.startswith('__'):
            continue

        # Construct the full package name
        relative_path = os.path.relpath(os.path.join(root, dir_name), packets_dir)
        package_name = f"packets.{relative_path.replace(os.sep, '.')}"

        # Import the package dynamically
        try:
            importlib.import_module(package_name)
        except ImportError as e:
            print(f"Error importing {package_name}: {e}")

# Also make AbstractPacket available at package level
__all__ = [AbstractPacket]
