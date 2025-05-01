# Error handling in shell scripting

---

### 🧱 1. **Basics of Error Handling in Shell Scripts**

Shell scripts handle errors primarily through **exit codes**. Each command returns a status code:

- `0` means success.
- Non-zero means an error occurred.

You can check the status of the **last executed command** using the special variable `$?`.

#### Example:
```bash
#!/bin/bash

mkdir /some/dir
if [ $? -ne 0 ]; then
  echo "Failed to create directory"
  exit 1
fi
```

---

### ⚙️ 2. **Better Error Handling Techniques**

#### A. `set -e`
Exit immediately if any command fails:
```bash
set -e
```

#### B. `set -u`
Treat unset variables as errors:
```bash
set -u
```

#### C. `trap`
Run cleanup code on error or exit:
```bash
trap 'echo "An error occurred. Exiting..."; exit 1' ERR
```

#### D. Functions for Consistent Error Logging
```bash
error_exit() {
  echo "[ERROR] $1" >&2
  exit 1
}
```

---

### ☁️ 3. **Handling S3 Bucket Existence Error**

To check if an S3 bucket exists, you can use the AWS CLI.

#### A. Check if an S3 bucket exists:
```bash
#!/bin/bash

BUCKET_NAME="my-bucket-name"

if aws s3 ls "s3://$BUCKET_NAME" 2>&1 | grep -q 'NoSuchBucket'; then
  echo "Bucket does not exist."
  exit 1
else
  echo "Bucket exists."
fi
```

#### B. A More Robust Method:
```bash
check_bucket_exists() {
  BUCKET_NAME=$1
  if aws s3api head-bucket --bucket "$BUCKET_NAME" 2>/dev/null; then
    echo "Bucket exists."
  else
    echo "Bucket does not exist or you lack permission."
    return 1
  fi
}
```

#### C. Handling Different Error Codes:
You can also inspect the AWS CLI exit code:
- `0`: Bucket exists and is accessible.
- `255`: Possibly permission denied or not found.

---

### ✅ Putting It All Together
```bash
#!/bin/bash

set -e
set -u
trap 'echo "An error occurred. Exiting..."; exit 1' ERR

BUCKET="my-bucket-name"

if ! aws s3api head-bucket --bucket "$BUCKET" 2>/dev/null; then
  echo "Bucket '$BUCKET' does not exist or is inaccessible"
  exit 1
else
  echo "Bucket '$BUCKET' exists."
fi
```

---
