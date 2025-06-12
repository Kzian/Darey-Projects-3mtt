## ✅ AWS IAM Implementation for Zappy e-Bank

### 🧩 **Objective:**

To implement secure and role-specific access control for a fintech startup (Zappy e-Bank) using AWS Identity and Access Management (IAM). The goal was to ensure secure management of cloud resources by applying IAM best practices.

---

### 🔐 **Key Concepts Implemented:**

1. **IAM Users** – Individual identities with specific access permissions.
2. **IAM Groups** – Logical collections of users with similar roles.
3. **IAM Policies** – JSON-defined rules determining permissions.
4. **MFA (Multi-Factor Authentication)** – An extra layer of security requiring a time-based code during login.

---

### 🔐 **Role of IAM in AWS**

Identity and Access Management (IAM) in Amazon Web Services (AWS) is a foundational service that enables organizations to manage **secure access** to AWS resources. It allows the creation and control of user identities, assignment of roles, and enforcement of fine-grained permissions across services.

For Zappy e-Bank, IAM ensures that sensitive financial and customer data is accessed only by authorized personnel, helping the company meet compliance requirements and maintain robust security postures. IAM supports security best practices such as **least privilege**, **multi-factor authentication (MFA)**, and **auditable access logs**, making it critical for protecting cloud infrastructure.

---

### 👥 **Difference Between IAM Users and Groups**

* **IAM Users** are individual entities created to represent a person or an application that interacts with AWS resources. Each user has unique credentials and permissions.

  *Example:* John and Mary were created as individual IAM users to access AWS services based on their roles.

* **IAM Groups** are collections of IAM users that share the same permissions. Assigning permissions to a group allows for scalable and consistent access control.

  *Example:* Instead of configuring permissions individually for 10 developers, they were added to a `Development-Team` group that had an EC2 access policy attached.

Using groups enhances manageability and reduces administrative overhead, especially as the organization scales.

---

### 📜 **Process of Creating IAM Policies**

Creating an IAM policy involves defining specific permissions for AWS services and resources in JSON format. The steps include:

1. **Navigate to IAM > Policies > Create Policy**.
2. **Select a service** (e.g., EC2 or S3).
3. **Choose actions** (e.g., “All EC2 actions” or “ListBucket”).
4. **Define resources** the policy should apply to.
5. **Name and describe** the policy for easy identification.
6. **Attach the policy** to a user, group, or role.

For example, a `developers` policy was created to grant EC2 access and was attached to the Development-Team group. This provided consistent permissions to backend developers while avoiding manual duplication.

---

### 🔐 **Significance of the Principle of Least Privilege**

The **Principle of Least Privilege** dictates that users should be granted only the permissions necessary to perform their job functions—no more, no less. This approach reduces the potential attack surface by limiting access to sensitive or irrelevant services.

In the context of this project:

* John was granted access to EC2 only, not S3 or other AWS services.
* Mary could access S3 but not EC2 or administrative functions.

This strategy ensures that even if an account is compromised, the potential damage is minimized. It also supports compliance with security standards such as ISO 27001, SOC 2, and PCI-DSS, which require strong access controls.

### 👥 **Scenario Setup:**

Two roles were identified in the organization:

* **John** – Backend Developer (requires access to EC2)
* **Mary** – Data Analyst (requires access to S3)

---
### 🧩 **Scenario with John and Mary**

The project involved creating two users:

* **John** (Backend Developer)

  * Added to the `Development-Team` group.
  * Granted EC2 access through the `developers` policy.
  * MFA was enabled for enhanced security.

* **Mary** (Data Analyst)

  * Added to the `Analyst-Team` group.
  * Granted S3 access through the `analyst` policy.
  * MFA was also enabled.

This configuration demonstrated best practices in AWS IAM:

* Use of groups for scalable permission management.
* Role-based access aligned with job functions.
* Implementation of least privilege.
* Application of MFA for secure authentication.

Both users were tested to confirm that their access was limited to the services relevant to their roles, thereby achieving **security**, **efficiency**, and **compliance**.

---

### 🔧 **Implementation Steps:**

#### 1. **Custom IAM Policies Created**

* `developers`: Grants full access to **EC2**.
* `analyst`: Grants full access to **S3**.

#### 2. **Groups Created**

* `Development-Team`: Attached `developers` policy.
* `Analyst-Team`: Attached `analyst` policy.

#### 3. **Users Created**

* **John**:

  * Added to `Development-Team`.
  * Granted EC2 access only.
  * Console access enabled.
* **Mary**:

  * Added to `Analyst-Team`.
  * Granted S3 access only.
  * Console access enabled.

#### 4. **Multi-Factor Authentication Setup**

* Enabled **MFA** for both John and Mary using an authenticator app (e.g., Google Authenticator).
* This ensured secure logins beyond username/password.

---

### 🔍 **Validation & Testing:**

* John successfully accessed **EC2 Dashboard**, confirming his permissions.
* Mary successfully accessed **S3 Dashboard**, confirming hers.
* Neither user could access services outside their assigned roles — validating the **principle of least privilege**.


## 🚀 **Walkthrough: AWS IAM Implementation for Zappy e-Bank**

### 🧭 **Step-by-Step Guide**

### **1. Log in to AWS Console**

* Use the root or admin credentials to access the AWS Management Console.
* Navigate to **IAM (Identity and Access Management)** from the services menu.

---

### **2. Create IAM Policies**

#### ✅ Developer Policy (EC2 Access)

1. Go to **IAM > Policies > Create Policy**.
2. Choose **EC2** under services.
3. Select **“All EC2 actions”** under actions.
4. In the resources section, choose **All**.
5. Click **Next**, then add:

   * **Name**: `developers`
   * **Description**: Policy to grant EC2 access to backend developers.
6. Click **Create Policy**.

![Policy](img/iampo.png)
![1](img/createpolicy.png)
![2](img/ec2.png)
![3](img/ec21.png)
![4](img/ec22.png)


#### ✅ Analyst Policy (S3 Access)

1. Repeat the process above.
2. Choose **S3** as the service.
3. Select **“All S3 actions”**.
4. Choose **All resources**.
5. Click **Next**, then add:

   * **Name**: `analyst`
   * **Description**: Policy to grant S3 access to data analysts.
6. Click **Create Policy**.

![Policy](img/iampo.png)
![1](img/createpolicy1.png)
![2](img/s3.png)
![3](img/s31.png)
![4](img/s32.png)


---

### **3. Create IAM Groups**

#### ✅ Development-Team Group

1. Navigate to **IAM > User groups > Create group**.
2. Group Name: `Development-Team`
3. Attach the `developers` policy.
4. Create the group.

![1](img/group.png)
![2](img/creategroup.png)
![3](img/addpolicy.png)

#### ✅ Analyst-Team Group

1. Repeat the above steps.
2. Group Name: `Analyst-Team`
3. Attach the `analyst` policy.
4. Create the group.

![1](img/group.png)
![2](img/creategroup1.png)
![3](img/addpolicy1.png)

---

### **4. Create IAM Users**

#### 👤 John (Backend Developer)

1. Go to **IAM > Users > Add user**.
2. Username: `John`
3. Enable **AWS Management Console access**.
4. Set a custom password or auto-generate.
5. Assign user to group: `Development-Team`.
6. Skip tags (optional), then review and create the user.
7. Download John's credentials for testing.

![1](img/users.png)
![2](img/createuser.png)
![3](img/userdetails.png)
![4](img/userdetails1.png)
![5](img/userdetails2.png)
![6](img/logindetails.png)

#### 👤 Mary (Data Analyst)

1. Repeat the above steps.
2. Username: `Mary`
3. Assign to group: `Analyst-Team`.
4. Download Mary’s credentials.

![1](img/users.png)
![2](img/createuser1.png)
![3](img/userdetails3.png)
![4](img/userdetails4.png)
![5](img/userdetails5.png)
![6](img/logindetails1.png)

---

### **5. Test Access Permissions**

#### 🔧 Test John’s EC2 Access

1. Log in as John using the downloaded credentials.
2. Navigate to **EC2 Dashboard**.
3. Launch a test EC2 instance or modify an existing one.
4. Verify access to EC2 but **no access** to unrelated services like S3.

![1](img/iamlogin.png)
![2](img/pwchange.png)
![3](img/ec2confirmed.png)
![](img/bucketfailure.png)

#### 📊 Test Mary’s S3 Access

1. Log in as Mary.
2. Navigate to **S3 Dashboard**.
3. Create or upload data to an S3 bucket.
4. Verify access to S3 but **no access** to services like EC2.

![1](img/iamlogin.png)
![2](img/iamloginmary.png)
![3](img/s3confirmed.png)
![](img/ec2failure.png)

---

### **6. Enable Multi-Factor Authentication (MFA)**

#### 🔐 For John:

1. Go to **IAM > Users > John > Security credentials**.
2. Click **Assign MFA device**.
3. Choose **Authenticator App** (e.g., Google Authenticator).
4. Scan the QR code using your app.
5. Enter two consecutive OTP codes to verify.
6. MFA setup is complete.

![1](img/service.png)
![2](img/mfa1.png)
![3](img/mfa2.png)
![4](img/mfa3.png)
![5](img/mfa4.png)
![6](img/mfa5.png)

#### 🔐 For Mary:

1. Repeat the same process via **IAM > Users > Mary**.
2. Use your authenticator app to configure.

![1](img/mfamary.png)

---

### ✅ **Validation Checklist**

| User | Group            | Permissions | MFA Enabled | Access Validated |
| ---- | ---------------- | ----------- | ----------- | ---------------- |
| John | Development-Team | EC2 Only    | ✅           | ✅                |
| Mary | Analyst-Team     | S3 Only     | ✅           | ✅                |

## ✅ Final Takeaway:

This IAM walkthrough for Zappy e-Bank clearly demonstrated how to:

* Secure AWS accounts,
* Enforce role-based access,
* Use IAM groups and policies for scalability,
* Apply MFA for enhanced security.

---
