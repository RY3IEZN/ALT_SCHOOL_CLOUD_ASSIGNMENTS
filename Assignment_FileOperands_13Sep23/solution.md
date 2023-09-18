<!-- @format -->

1. **-o file**: Checks if the file is owned by the user running the script.

   - Explanation: This operator returns true if the specified file is owned by the user executing the script.
   - Example: `if [ -o "$file" ]; then echo "File is owned by the current user"; fi`

<br>

```bash
#! /bin/bash

if [ -o "$file" ];
then echo "File is owned by the current user";
fi
```

<br>

1. **-g file**: Checks if the file belongs to the same group as the user running the script.

   - Explanation: This operator returns true if the specified file belongs to the same group as the user executing the script.
   - Example: `if [ -g "$file" ]; then echo "File belongs to the user's group"; fi`

<br>

```bash

#! /bin/bash
if [ -g "$file" ]; then echo "File belongs to the user's group";
fi
```

<br>

1. **-e file**: Checks if the file exists.

   - Explanation: This operator returns true if the specified file exists, whether it's a regular file, directory, or any other type of file.
   - Example: `if [ -e "$file" ]; then echo "File exists"; fi`
     <br>

   ```bash
   #! /bin/bash

   if [ -e "$file" ];
   then echo "File exists";
   fi
   ```

<br>

1. **-h file**: Checks if the file is a symbolic link (alternative to -L).

   - Explanation: This operator returns true if the specified file is a symbolic link.
   - Example: `if [ -h "$link" ]; then echo "File is a symbolic link"; fi`
     <br>

   ```bash
   #! /bin/bash

   if [ -h "$link" ];
   then echo "File is a symbolic link";
   fi
   ```

<br>

1. **-d file**: Checks if the file is a directory.

   - Explanation: This operator returns true if the specified file is a directory.
   - Example: `if [ -d "$dir" ]; then echo "Directory exists"; fi`
     <br>

   ```bash
   #! /bin/bash

   if [ -d "$dir" ];
   then echo "Directory exists";
   fi
   ```

<br>

1. **-r file**: Checks if the file is readable.

   - Explanation: This operator returns true if the user executing the script has read permissions for the specified file.
   - Example: `if [ -r "$file" ]; then echo "File is readable"; fi`
     <br>

   ```bash
   #! /bin/bash

   if [ -r "$file" ];
   then echo "File is readable";
   fi
   ```

<br>

1. **-s file**: Checks if the file is not empty (size greater than zero).

   - Explanation: This operator returns true if the specified file is not empty, meaning its size is greater than zero.
   - Example: `if [ -s "$file" ]; then echo "File is not empty"; fi`
     <br>

   ```bash
   #! /bin/bash

   if [ -s "$file" ];
   then echo "File is not empty";
   fi
   ```

<br>

1. **-w file**: Checks if the file is writable.

   - Explanation: This operator returns true if the user executing the script has write permissions for the specified file.
   - Example: `if [ -w "$file" ]; then echo "File is writable"; fi`
     <br>

   ```bash
   #! /bin/bash

   if [ -w "$file" ];
   then echo "File is writable";
   fi
   ```

<br>

1. **-x file**: Checks if the file is executable.

   - Explanation: This operator returns true if the user executing the script has execute permissions for the specified file.
   - Example: `if [ -x "$file" ]; then echo "File is executable"; fi`
     <br>

   ```bash
   #! /bin/bash

   if [ -x "$file" ];
   then echo "File is executable";
   fi
   ```

<br>

1. **-c file**: Checks if the file is a character device file.

   - Explanation: This operator returns true if the specified file is a character device file, typically used for character-oriented input/output.
   - Example: `if [ -c "$device" ]; then echo "File is a character device file"; fi`
     <br>

   ```bash
   #! /bin/bash

   if [ -c "$device" ];
   then echo "File is a character device file";
   fi
   ```

<br>

1. **-L file**: Checks if the file is a symbolic link.

   - Explanation: This operator returns true if the specified file is a symbolic link.
   - Example: `if [ -L "$link" ]; then echo "File is a symbolic link"; fi`
     <br>

   ```bash
   #! /bin/bash

   if [ -L "$link" ];
   then echo "File is a symbolic link";
   fi
   ```

      <br>

1. **-b file**: Checks if the file is a block device file.

   - Explanation: This operator returns true if the specified file is a block device file, often used for block-oriented input/output.
   - Example: `if [ -b "$blockdevice" ]; then echo "File is a block device file"; fi`
     <br>

   ```bash
   #! /bin/bash

   if [ -b "$blockdevice" ];
   then echo "File is a block device file";
   fi
   ```

      <br>

1. **-u file**: Checks if the file has the setuid permission.

   - Explanation: This operator returns true if the specified file has the setuid (Set User ID) permission set, which allows the file to run with the permissions of its owner.
   - Example: `if [ -u "$file" ]; then echo "File has setuid permission"; fi`
     <br>

   ```bash
   #! /bin/bash

   if [ -u "$file" ];
   then echo "File has setuid permission";
   fi
   ```

      <br>

1. **-N file**: Checks if the file has been modified since it was last read.

   - Explanation: This operator returns true if the specified file has been modified since it was last read or checked.
   - Example: `if [ -N "$file" ]; then echo "File has been modified"; fi`
     <br>

   ```bash
   #! /bin/bash

   if [ -N "$file" ];
   then echo "File has been modified";
   fi
   ```

<br>

1. **-k file**: Checks if the file has the sticky bit set.

   - Explanation: This operator returns true if the specified file has the sticky bit set, which is often used to prevent unauthorized deletion of files in directories.
   - Example: `if [ -k "$file" ]; then echo "File has sticky bit set"; fi`
     <br>

   ```bash
   #! /bin/bash

   if [ -k "$file" ];
   then echo "File has sticky bit set";
   fi
   ```
