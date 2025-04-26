# Shell scripting (Comments)

---

### ✏️ **Adding Comments in Bash Scripts**

**Comments** are lines in your script that are ignored by the Bash interpreter. They are meant for **humans** to read, not the computer. You use them to explain what your code is doing, why you're doing it a certain way, or to temporarily disable code during testing.

---

### 📍 **How to Write a Comment**

- In Bash, a comment starts with the `#` symbol.
- Everything after `#` on that line is treated as a comment.

Example:

```bash
#!/bin/bash
# This is a comment
echo "Hello, world!"  # This will print Hello, world! to the terminal
```

---

### 📘 **Types of Comments**

1. **Single-line Comments**

```bash
# This is a single-line comment
echo "Learning Bash scripting!"
```

2. **Inline Comments**

You can add comments at the end of a command line:

```bash
mkdir new_folder  # Create a new folder
```

3. **Multi-line Comments (Kind of)**

Bash doesn’t officially have multi-line comments, but you can use `#` on each line:

```bash
# This script creates a folder
# and then navigates into it
mkdir project
cd project
```

Or use a trick with `: '` (colon with a quoted string) to comment out a block:

```bash
: '
This is a multi-line comment.
It will not be executed.
Useful for large explanations or disabling blocks of code.
'
```

*(Note: This is technically a no-op command that ignores the text inside.)*

## Practice

### Single line and Multiple single-line comments

```bash
#!/bin/bash
# commented_script.sh
# This script demonstrates the use of comments in Bash.
# It performs tasks like printing messages, creating directories, listing files, and more.

# ---- Script Starts ----

# Print a welcome message
echo "Welcome to the commented Bash script!"

# Create a directory named 'demo_directory'
mkdir demo_directory  # Inline comment: mkdir creates a directory

# List all files and directories in the current location
echo "Listing contents of the current directory:"
ls -l    # List files in long format

# Change into the newly created directory
cd demo_directory

# Create a few sample files
touch file1.txt file2.txt file3.txt
echo "Sample files created inside demo_directory."

# Display the newly created files
echo "Here are the files created:"
ls

# Go back to the original directory
cd ..

# Clean up by removing the demo_directory and its contents
rm -r demo_directory
echo "Clean up done. demo_directory removed."

# This is another way to create
# a multi-line comment. Each line
# is prefixed with a # symbol.
echo "Here is an actual code that gets executed" #this will be shown instead

: '
This is a multi-line comment.
The script ends here.
Thank you for running it!
'

# ---- Script Ends ----
```
![Output2](img/check.png)
![commented_script.sh](img/check2.png)
```bash
#!/bin/bash
# This is a single-line comment in Bash
echo "Hello, you are learning Bash Scripting on DAREY.IO!" # This is also a comment, following a command

# This is another way to create
# a multi-line comment. Each line
# is prefixed with a # symbol.
echo "Here is an actual code that gets executed" #this will be shown instead
```
![Output](img/comm3.png)

### N/B: to save a file using `vi`, use the `esc key` to exit the typing mode and use `:wq `to save and exit.
---


### ✅ **Good Practices for Comments**

- **Explain *why*, not just *what*.**
  - Bad: `# Create folder`
  - Better: `# Create a folder for storing backup files`

- **Keep comments updated**. Old, misleading comments are worse than none.
  
- **Don’t over-comment obvious stuff.** If a line is self-explanatory, no need to comment.

- **Use comments to organize sections** of long scripts:

```bash
# -----------------------
# Step 1: Backup database
# -----------------------
```

---

### 🚀 Quick Example Putting It Together

```bash
#!/bin/bash

# Set backup folder name
backup_folder="backup_$(date +%F)"

# Create the backup folder
mkdir "$backup_folder"

# Move important files into backup
mv *.txt "$backup_folder"  # Move all text files
```

---
