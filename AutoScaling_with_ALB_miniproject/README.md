# 📝 **Professional Summary: Auto Scaling with ALB using Launch Template**

This mini project demonstrates how to configure **Auto Scaling in AWS** integrated with an **Application Load Balancer (ALB)** using a **Launch Template**. The goal is to create a scalable and resilient architecture that dynamically adjusts the number of EC2 instances based on demand.

The project walks through the entire process—from creating a Launch Template to configuring an Auto Scaling group, setting up scaling policies, attaching the group to an ALB, and finally testing the Auto Scaling behavior using stress tools. By completing this project, you gain practical experience in designing fault-tolerant and cost-efficient AWS infrastructure using automation and monitoring best practices. The knowledge gained is crucial for building scalable cloud applications that can respond to varying workloads without manual intervention.

---

## 🛠️ Step-by-Step Guidelines

### ✅ **Task 1: Create a Launch Template**

1. **Log in** to the AWS Management Console.
2. Navigate to **EC2**.
3. On the left panel, click **Launch Templates**.
4. Click **Create launch template**.

![createlt](img/createlt.png)
5. Provide the following:

   * **Name** for the template.
   * **AMI ID** (Amazon Machine Image).
   * **Instance type** (e.g., t2.micro).
   * **Key pair** (for SSH access).
   * In **Advanced details**, paste the **User Data script** if any (e.g., to install web server or monitoring tool).

![specslt](img/specslt.png)
![specslt](img/specslt1.png)
![specslt](img/specslt2.png)
![userlt](img/udlt.png)

6. Click **Create launch template**.

![createdlt](img/createdlt.png)

---

### 🔹**Task 2: Create an Auto Scaling Group (Attach to ALB & Target Group)**

1. Go to **EC2 → Auto Scaling Groups** → **Create Auto Scaling group**.

![ASG](img/createasg.png)

2. Select the **Launch Template** you created earlier.
3. Set:

   * Auto Scaling Group name
   * VPC and subnets (same as ALB)
4. Set desired, minimum, and maximum capacity.
5. Configure **scaling policies** (e.g., based on CPU utilization).
6. Click **Create Auto Scaling Group**.
7. Choose policy type (e.g., **Target Tracking Scaling Policy**).

    Configure:

   * Metric type (e.g., **Average CPU Utilization**).
   * Target value (e.g., 50%).
   * Cooldown period.
   
![specsasg](img/specsasg.png)
![specsasg1](img/specsasg1.png)
![specsasg2](img/specsasg2.png)
![specsasg3](img/specsasg2a.png)
![specsasg4](img/specsasg3.png)
![specsasg5](img/specsasg3a.png)
![specsasg6](img/specsasg4.png)
![specsasg7](img/specsasg5.png)
![specsasg8](img/specsasg6.png)
![specsasg9](img/specsasg6a.png)

8. Click **Create Auto Scaling group**.

![createdasg](img/createdasg.png)

*Note:* Ensure your Launch Template includes the necessary **security group** that allows traffic from the ALB.

---

### ✅ **Task 3 Test Auto Scaling**

1. **Connect to an EC2 instance** (via SSH) that’s part of your Auto Scaling group.
2. Install the stress tool:

   ```bash
   sudo yum install stress -y
   ```
3. Generate load to simulate high demand:

   ```bash
   stress -c 4
   ```
4. Go back to your AWS Console and monitor:

   * **Auto Scaling Group instance count**
   * **CloudWatch metrics (CPU Utilization)**
   * Confirm that new instances are launched as demand increases.

![ec2](img/ec2instance.png)
![ec21](img/ec2instance1.png)

### Before stress was activated:

![baseline](img/baseline2.png)

### After:

![result](img/asgresultbaseline.png)
![result4](img/alarms.png)
![result5](img/asgresult.png)
![result6](img/asgresult1.png)
![result7](img/asgresult2.png)

### If stress is left for a longer period:

![result1](img/asgresult3.png)
![result2](img/asgresult4.png)
![result3](img/asgresult5.png)

![cw](img/cw.png)

---
