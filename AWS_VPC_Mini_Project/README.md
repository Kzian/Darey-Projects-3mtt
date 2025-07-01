# 🛠️ Network Mastery with AWS VPC – Mini Project Walkthrough

**⏱️ Duration:** 3 hours  
**🎯 Objective:** Deploy and configure a secure, scalable, and functional network architecture on AWS using VPCs, subnets, gateways, route tables, VPC peering, and VPC endpoints. || Imagine building your own *private neighborhood on the internet*. You get to decide which houses (servers) can talk to outsiders (the internet), and which ones stay invisible for safety. That’s what we’re doing here with **AWS Virtual Private Cloud (VPC)** — creating a secure space in the cloud for computers to communicate, share resources, and access the internet securely when needed.

---

## 📘 What You’ll Learn

- Core concepts: VPC, Subnet, Internet Gateway, NAT Gateway, Route Table, CIDR, IP Address
- Difference between Internet Gateway and NAT Gateway
- Secure Internet connectivity and outbound access
- VPC Peering and its use case
- How VPC Endpoints provide secure access to AWS services

---

## 🧠 Key Concepts Explained (Simple Terms)

| Concept | Explanation | Analogy
|--------|-------------|-------------|
| **VPC** | A private network in the cloud, like your company's virtual office. | Like your fenced private estate in the cloud          
| **Subnet** | A segmented zone in your VPC (like HR, IT departments). | Rooms within your house (VPC) – some face the street (public), others are interior (private)    |
| **Internet Gateway** | A door that lets your network access the internet. | A front door – lets people from outside reach the house (internet access)                       |
| **NAT Gateway** | A one-way window: internal systems can browse out, but can’t be accessed from outside. | A peephole – your house can see out, but outsiders can't see 
| **CIDR** | Shorthand notation to define IP ranges (e.g. `10.0.0.0/16`). |
| **IP Address** | A unique digital address like a phone number for devices. | Like a phone number for each device in your network                           
| **Route Table** | A GPS that decides where traffic should go. | GPS/map that tells data where to go                                                             |
| **VPC Peering** | A bridge between two private networks. | Bridge between two private estates so they can talk directly                                    |
| **VPC Endpoint** | A private tunnel from your VPC to AWS services like S3. | Private shortcut from your house to the library (S3, DynamoDB, etc.) without leaving the estate |
| **Gateway + Route Table**  | Route table tells data to use gateway when leaving the estate                                   |

---

## 📈 Network Architecture Diagram (SKETCH)
![NetArchiDiagram](img/netarchidiagram.png)

---

## 🚀 Step-by-Step Practical Walkthrough

### ✅ Part 1: Setting Up a Virtual Private Cloud (VPC)

1. Go to the AWS Console and search for **"VPC"**

![searchupc](img/searchvpc.png)
2. Click on **"Create VPC"**

![vpc](img/createvpc.png)
3. Choose **"VPC only"**
4. Specify the IPv4 CIDR block (e.g. `10.0.0.0/16`)

![specsvpc](img/specs.png)
5. Click **Create VPC**

![createdvpc](img/createdvpc.png)

---

### ✅ Part 2: Configuring Subnets within the VPC

1. Navigate to **Subnets** on the left panel.
2. Click **Create subnet**

![subnet](img/createsubnet.png)
3. Select your VPC ID.
4. Add:
   - **Public Subnet** (e.g. `10.0.1.0/24`) – choose Availability Zone
   - **Private Subnet** (e.g. `10.0.2.0/24`) – choose another AZ

![specsub](img/specssub1.png)
![specsub1](img/specssub2.png)
5. Click **Create subnet**

![createdsub](img/createdsubnets.png)

---

### ✅ Part 3: Create and Attach an Internet Gateway

1. Go to **Internet Gateways**
2. Click **Create internet gateway**

![igw](img/createigw.png)
3. Name it, then **Create**

![specsigw](img/specsigw.png)
4. It will appear as "Detached" → click **Attach to VPC**

![createdigw](img/createdigw.png)
![a2vpc](img/attach2vpc.png)
![a2vpc2](img/attach2vpc2.png)
5. Select the VPC and confirm

![createda2vpc](img/createdattach2vpc.png)

---

### ✅ Part 4: Setup Routing Table for Public Subnet

1. Go to **Route Tables**
2. Click **Create route table**

![rt](img/creatert.png)
3. Name it (e.g., `public-route-table`) and select your VPC

![specsrt](img/specsrt.png)
4. After creation:
   - Go to **Subnet Associations** → click **Edit subnet associations**

   ![createdrt](img/createdrt-edit.png)

   - Select **Public Subnet**

   ![specseditrt](img/specseditrt.png)

   - Go to **Routes** → click **Edit routes**
   
   ![editroute](img/editrtroutes.png)

   - Add:
     - Destination: `0.0.0.0/0`
     - Target: **Internet Gateway**
      ![editroute1](img/editrtroutes1.png)
      ![specsroute](img/specsrtroutes.png)
5. Save the route

![createdroute](img/createdrtroute4pub.png)

---

### ✅ Part 5: Enable Outbound Internet Access with NAT Gateway

1.	Navigate to the "NAT Gateways" section, then click on "Create NAT Gateway."

![natgw](img/createnatgw.png)

2.	Then mention the name of the NAT Gateway
3.	Select the **Private Subnet** for the NAT
4. Now select the connectivity type as Private.

![specsnatgw](img/specsnatgw.png)

5. Create

![creatednatgw](img/creatednatgw.png)

🧠 **Why NAT?**

> Allows private subnet instances to access the internet (e.g., for software updates) *without being exposed*.

6.	Select your NAT Gateway.
7.	Then navigate to the "Details" tab.
8.	From there, locate the subnet ID and click on it.

![editnatgw](img/editnatgw.png)

9.	In the subnet page, navigate to the "Route Table" section.

![natprirt](img/editnatgwprirt.png)

10.	Then click on the "route table ID "

![npr1](img/editnatgwprirt1.png)

11.	Proceed to the "Routes" section, then click on "Edit routes."

![npr2](img/editnatgwprirt2.png)

12.	Then click on “Add routes.”

![npr3](img/editnatgwprirt3.png)

- Select "Destination" as "0.0.0.0/0."
- In the "Target" field, choose "NAT Gateway,"
- Then select the NAT Gateway you created.

![specsnpr](img/specsnatgwprirt.png)

- Finally, save the changes.
13. On the subnet association section, click on edit subnet association.

![creatednpr](img/creatednatgwpritr-edit.png)

- Choose the private subnet and click on “Save associations”

![creatednpr1](img/creatednatgwpritr-edit1.png)

### 🆚 Internet Gateway vs NAT Gateway

| Feature | Internet Gateway | NAT Gateway |
|--------|------------------|-------------|
| Access Direction | Inbound + Outbound | Outbound only |
| For Public/Private Subnets | Public | Private |
| Needs Public IP? | Yes | NAT holds public IP, not EC2s |

---

### ✅ Part 6: Establishing VPC Peering

1. Go to **Peering Connections**
2. Click **Create Peering Connection**

![pc](img/creatpc.png)

3. Create **two VPCs** (e.g. `10.0.0.0/16` and `192.168.0.0/16`)

![vpc1](img/vpc1prt6.png)
![vpc2](img/vpc2prt6.png)

4.	Now, provide a name for the VPC peering connection.
- Select the requester VPC.
- Choose the account "My account" since the VPCs are in our own AWS account.
- Ensure to use the same region, "This Region," as the VPCs were created in the same region.
-  Next, select the accepter VPC.
- Proceed by clicking on the "Create Peering Connection" button.

![specspc](img/specspc.png)

4. After creation, go to **Actions > Accept Request** (In the Peering Connection page, locate the "Actions" option on the right side.
- Click on it, then select "Accept Request.")

![createdpcedit](img/createdpc-edit.png)
![accept](img/acceptpc.png)

#### ➕ Configure Route Tables for Peering

1. Go to **VPC-A Route Table**

![vpc1rt](img/editvpc1.png)  

   - Click on "Edit route."

   ![editr](img/editvpc11.png)

   - Click on add route.
   
   ![editr1](img/editvpc12.png)

      - Go to the VPC page
         - select the requester VPC.
         - In the details tab, you'll find the IPv4 CIDR. (in this case - 192.168.0.0/16)
         - Copy this CIDR and paste it in the "Destination" field when adding a route.

   ![editr2](img/editvpc13.png)
   ![editr3](img/editvpc14.png)

   ![createdvpc1](img/createdvpc14.png)

2. Repeat for **VPC-B**, adding VPC-A’s CIDR

![vpc2rt](img/editvpc2.png)  

   - Click on "Edit route."

   ![editr4](img/editvpc21.png)

   - Click on add route.
   
   ![editr5](img/editvpc22.png)

      - Go to the VPC page
         - select the accepter VPC.
         - In the details tab, you'll find the IPv4 CIDR. (in this case - 172.16.0.0/16)
         - Copy this CIDR and paste it in the "Destination" field when adding a route.

   ![editr6](img/editvpc23.png)
   ![editr7](img/editvpc24.png)

   ![createdvpc2](img/createdvpc24.png)

🧠 **Why VPC Peering?**

> To enable secure, private communication between resources in different VPCs (e.g., Dev ↔ Prod environments)
---

### ✅ Part 7: Add VPC Endpoint for Private S3 Access

1. Go to **Endpoints > Create Endpoint**

![](img/createep.png)
2. **Type**: `AWS services`
      -  **Service name**: Search for and select `com.amazonaws.<region>.s3` (e.g., `com.amazonaws.eu-west-1.s3`)

![specep](img/specep.png)

3. Select **VPC (Select the VPC where your private subnet reside)**
4. Choose **Route Table** for private subnet
      * You can:

         * Use the **default** policy (full access to S3)
         * Or define a **custom policy** to restrict access to specific buckets

         For most projects, **default is fine**.
5. Create

![specep1](img/specep1.png)

🧠 Why?  
→ Keeps S3 traffic off the internet. Good for backups, secure data transfers from private instances. A **VPC Endpoint** allows private, secure connectivity between your VPC and AWS services (like S3), without using the public internet.

---

## ✅ Project Reflection & Takeaways

- Gained hands-on AWS VPC configuration skills
- Understood real-world cloud network setups
- Learned to control traffic using NAT, route tables, and endpoints
- Saw how peering enables collaboration between cloud environments
- Strengthened cloud security awareness

---

## 📁 Additional Notes

- Always ensure **CIDR blocks don’t overlap** in VPC peering
- Route tables and security groups are essential for connectivity
- Use **Draw.io** or **Lucidchart** for AWS network diagrams
- Keep **naming conventions consistent** for clarity in real-world projects

---

> 👩‍💻 *This walkthrough was part of a mini project to master AWS networking by setting up a secure and connected VPC infrastructure.*

## 🎓 **Final Reflection**

This mini project provided foundational skills in AWS networking. By combining theory with practical tasks, I gained confidence in architecting secure and scalable networks. The structured setup mimics real-world architectures used in production environments.

---
