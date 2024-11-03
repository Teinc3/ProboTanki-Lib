import importlib
import os

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
        importlib.import_module(package_name)

        # # Import all modules within the package
        # package_dir = os.path.join(root, dir_name)
        # for filename in os.listdir(package_dir):
        #     if filename.endswith('.py') and filename not in ['abstractpacket.py', 'packets.py'] and not filename.startswith('__'):
        #         module_name, _ = os.path.splitext(filename)
        #         full_module_name = f"{package_name}.{module_name}"
        #         importlib.import_module(full_module_name)
