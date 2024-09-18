import os
import re

counter = 0
pattern = re.compile(r"§([^§]+)§")
pattern_map = {}

def main():
    global counter
    global pattern
    global pattern_map

    # Read all files recursively within the current directory
    for root, dirs, files in os.walk("."):
        # Loop through all folders. If the folder is empty, delete it
        for dir in dirs:
            if not os.listdir(os.path.join(root, dir)):
                os.rmdir(os.path.join(root, dir))

        for file in files:
            if not file.endswith(".as"):
                continue

            # Open the file and read its contents with explicit encoding
            with open(os.path.join(root, file), "r", encoding="utf-8") as f:
                content = f.read()
                # Match all obfuscated strings and add them to a unique mapping
                for match in pattern.finditer(content):
                    # Use the entire match as the key
                    key = match.group(0)
                    value = ""
                    if key not in pattern_map:
                        value = f"Renamed{counter}"
                        pattern_map[key] = value
                        counter += 1
                    else:
                        value = pattern_map[key]
                    # Replace the obfuscated string with the new value
                    content = content.replace(key, value)
                # Write the new content to the file with explicit encoding
                with open(os.path.join(root, file), "w", encoding="utf-8") as f:
                    f.write(content)
                
            # Match the file name with the pattern, if it matches, rename the file
            # If file name starts and ends with § then we further match the file name with the pattern
            match = pattern.match(file)
            if not match:
                continue

            key = match.group(0)
            if key not in pattern_map:
                # Add to the pattern map
                value = f"Renamed{counter}"
                pattern_map[key] = value
                counter += 1
            
            new_file = file.replace(key, pattern_map[key])
            os.rename(os.path.join(root, file), os.path.join(root, new_file))
                        
        # Match all directories with the pattern, if it matches, rename the directory
        for dir in dirs:
            match = pattern.match(dir)
            if not match:
                continue

            key = match.group(0)
            if key not in pattern_map:
                # Add to the pattern map
                value = f"Renamed{counter}"
                pattern_map[key] = value
                counter += 1
            
            new_dir = dir.replace(key, pattern_map[key])
            os.rename(os.path.join(root, dir), new_dir)
        

if __name__ == "__main__":
    main()