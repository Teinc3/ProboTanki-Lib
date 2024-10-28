import os
import re

counter = 0
pattern = re.compile(r"§([^§]+)§")
pattern_map = {}


def rename_if_pattern_matches(path, item_name):
    """Rename file or directory if it matches the pattern."""
    global counter, pattern, pattern_map

    match = pattern.match(item_name)
    if match:
        key = match.group(0)
        if key not in pattern_map:
            pattern_map[key] = f"Renamed{counter}"
            counter += 1

        new_name = item_name.replace(key, pattern_map[key])
        os.rename(path, os.path.join(os.path.dirname(path), new_name))


def main():
    global counter, pattern, pattern_map

    # Read all files recursively within the current directory
    for root, directories, files in os.walk("."):
        # Loop through all directories. If the directory is empty, delete it
        for directory in directories:
            dir_path = os.path.join(root, directory)
            if not os.listdir(dir_path):
                os.rmdir(dir_path)
            else:
                rename_if_pattern_matches(dir_path, directory)

        for file in files:
            if not file.endswith(".as"):
                continue

            file_path = os.path.join(root, file)

            # Open the file and read its contents with explicit encoding
            with open(file_path, "r", encoding="utf-8") as file_reader:
                content = file_reader.read()

                # Replace obfuscated strings
                for match in pattern.finditer(content):
                    key = match.group(0)
                    if key not in pattern_map:
                        pattern_map[key] = f"Renamed{counter}"
                        counter += 1
                    content = content.replace(key, pattern_map[key])

            # Write the updated content back to the file
            with open(file_path, "w", encoding="utf-8") as file_writer:
                file_writer.write(content)

            # Rename the file if it matches the pattern
            rename_if_pattern_matches(file_path, file)


if __name__ == "__main__":
    main()
