





# 课程总结   从密码学基础 → 云安全机制 → 云基础设施 → 治理合规

# \# 🌸CSEC5615 Week 1 — 云安全导论<span style="color: red;">第一周：基础概念</span> 🌸

**云计算（Cloud Computing）** 通过互联网按需提供计算资源（服务器、存储、数据库、网络）的服务模式，分为 IaaS / PaaS / SaaS 三层。

**安全（Security）** 保护系统、网络和数据免受攻击、损害或未授权访问的实践总称，涵盖机密性、完整性、可用性（CIA 三要素）。

------

## ✅1. 什么是云计算 What is Cloud Computing

## 

**云计算 Cloud Computing**

**简单定义 · Simple Definition** 通过互联网按需租用计算资源，无需购买硬件。 Rent computing resources on demand over the internet — no hardware needed.

------

**NIST 正式定义 · Formal Definition**

- 按需访问 On-demand access
- 共享资源池 Shared resource pool
- 网络、服务器、存储、应用 Networks, servers, storage, apps
- 快速弹性扩缩 Rapid elasticity
- 最小管理介入 Minimal management effort

------

**主要服务类型 · Service Types**

- 存储 Storage — S3, Google Drive, Dropbox
- 计算 Computing — EC2, Azure VM, Google Compute
- 数据库 Databases — RDS, MongoDB Atlas
- 网络 Networking — AWS VPC, Cloudflare, Azure LB
- 应用程序 Applications — Salesforce, Microsoft 365, Zoom

------

## ✅2. 云计算的五大核心特征 Five Key Characteristics of Cloud Computing

18:17

**NIST 五大核心特征 · Five Essential Characteristics**

这五大特征是区分云计算与传统IT基础设施的根本标志。 These five characteristics fundamentally distinguish cloud computing from traditional IT infrastructure.

------

**1. 按需自助服务 On-Demand Self-Service**

- 无需人工干预，自主配置资源 Self-provision without manual intervention
- 示例：AWS（亚马逊云服务 Amazon Web Services）控制台点击启动服务器
- 大幅降低资源获取时间成本 Drastically reduces time to obtain resources

------

**2. 广泛网络访问 Broad Network Access**

- 通过标准网络协议访问 Accessible via standard network protocols
- 支持设备：笔记本、手机、平板 Laptops, smartphones, tablets
- 不受地理位置限制 No geographic restrictions

------

**3. 资源池化 Resource Pooling**

- 多租户模型 Multi-tenancy（多个用户共享同一套基础设施 multiple users sharing the same infrastructure）
- 不同用户共享物理硬件，虚拟化隔离 Shared hardware, isolated via virtualization
- 提高硬件利用率、降低成本 Improves utilization, reduces costs
- ⚠️ 安全挑战：租户间数据必须完全隔离 Tenant data must be fully isolated

------

**4. 快速弹性 Rapid Elasticity**

- 资源按需自动扩缩 Auto scale up/down on demand
- 示例：电商"双11"数千台服务器 e.g. thousands of servers for peak sales
- 全程自动化，分钟级生效 Automated, takes effect within minutes

------

**5. 按量计费 Measured Service**

- 按实际使用量付费 Pay-as-you-go
- 计算按小时、存储按GB（吉字节 Gigabyte，约10亿字节）
- CapEx（资本支出 Capital Expenditure，购买硬件等一次性大额投入）→ OpEx（运营支出 Operational Expenditure，按使用持续付费）

## ✅3. 云服务三大模型 · Three Cloud Service Models

云服务按服务层级从低到高分为三种模型，核心区别在于用户与服务商各自负责哪些层次。 The core difference is which infrastructure layers the user vs. provider manages.

------

### **1. IaaS — 基础设施即服务 Infrastructure as a Service**

- 服务商提供：虚拟机、存储、网络 Provider manages: VMs, storage, networking
- 用户负责：操作系统（OS）、运行时、应用、数据 User manages: OS, runtime, apps, data
- 类比：租用空白虚拟机，从头自己配置 Like renting a blank VM
- 代表产品：AWS EC2、Google Compute Engine、Azure Virtual Machines
- 适用：需要完全控制底层环境、运行遗留应用、高性能计算

------

### **2. PaaS — 平台即服务 Platform as a Service**

- 服务商提供：IaaS + 操作系统 + 运行时 + 中间件 Provider manages: everything in IaaS + OS + runtime + middleware
- 用户负责：应用代码和数据 User manages: app code and data only
- 类比：拎包入住，只需专注写代码 Focus on code, not infrastructure
- 代表产品：Google App Engine、Azure Functions、Heroku
- 适用：快速部署 Web 应用、微服务、无服务器函数（Serverless Functions，无需管理服务器的函数运行方式）

------

### **3. SaaS — 软件即服务 Software as a Service**

- 服务商提供：完整可用的应用程序 Provider manages: everything
- 用户负责：自己的数据和账户 User manages: data and account only
- 类比：直接用，无需安装或维护 Just use it — no setup needed
- 代表产品：Google Workspace、Microsoft 365、Salesforce CRM（客户关系管理 Customer Relationship Management）、Zoom
- 适用：企业邮件、办公协作、客户管理

------

### **扩展分类 · Finer Classifications**

- CaaS — 容器即服务 Containers as a Service（如 Google Kubernetes Engine，介于 IaaS 和 PaaS 之间）
- FaaS — 函数即服务 Function as a Service（如 AWS Lambda，按函数调用计费，极细粒度的无服务器计算）

------

### **责任边界 · Responsibility Summary**

| 层次 Layer       | 本地部署 On-Premises | IaaS   | PaaS   | SaaS   |
| ---------------- | -------------------- | ------ | ------ | ------ |
| 硬件 Hardware    | 用户                 | 服务商 | 服务商 | 服务商 |
| 操作系统 OS      | 用户                 | 用户   | 服务商 | 服务商 |
| 运行时 Runtime   | 用户                 | 用户   | 服务商 | 服务商 |
| 应用 Application | 用户                 | 用户   | 用户   | 服务商 |
| 数据 Data        | 用户                 | 用户   | 用户   | 用户   |

------

## ✅4. 共同责任模型 Shared Responsibility Model

### **共同责任模型 · Shared Responsibility Model**

云安全由服务商与客户共同承担：

- 服务商负责：**云本身的安全** Security OF the cloud
- 客户负责：**云中内容的安全** Security IN the cloud

------

### ❗️❗️❗️**责任分配 · Responsibility Breakdown**

| 责任层                      | 本地部署 | IaaS   | PaaS   | SaaS   |
| --------------------------- | -------- | ------ | ------ | ------ |
| 数据与信息 Data             | 客户     | 客户   | 客户   | 客户   |
| 终端设备 Endpoints          | 客户     | 客户   | 客户   | 客户   |
| 账户与身份 Identity         | 客户     | 客户   | 客户   | 客户   |
| 应用安全 App security       | 客户     | 客户   | 共担   | 服务商 |
| 网络控制 Network controls   | 客户     | 客户   | 共担   | 服务商 |
| 操作系统 OS                 | 客户     | 客户   | 服务商 | 服务商 |
| 物理基础设施 Physical infra | 客户     | 服务商 | 服务商 | 服务商 |

------

### **三类固定责任 · Fixed Responsibilities**

#### 始终由客户负责 Always customer's:

- 数据与信息保护 Data and information protection
- 终端设备安全 Endpoint device security（手机、PC）
- 账户与身份管理 Account and identity management

#### 随服务模型变化 Varies by model:

- 身份目录基础设施 Identity & directory infrastructure
- 应用程序安全 Application security
- 网络控制 Network controls
- 操作系统安全 OS security

#### 始终由服务商负责 Always provider's:

- 物理主机 Physical hosts
- 物理网络 Physical network
- 物理数据中心 Physical datacenter

------

#### **常见客户侧安全失误 · Common Customer-Side Failures**

- S3 存储桶（Amazon 对象存储单元 Amazon object storage bucket）配置错误 Misconfigured S3 buckets
- 弱密码管理 Weak password management
- 敏感数据未加密 Unencrypted sensitive data

> ⚠️ 云安全故障往往不是服务商基础设施被攻破，而是客户未履行自己的责任。 Cloud security failures are often not provider breaches — they stem from customers neglecting their own responsibilities.

------

## ✅5. 云安全为何重要 Why Cloud Security Matters

### **规模与增长 · Scale & Growth**

云服务采用现状（2022–2023）：

- 💰 IT 服务收入预计超过 $5000 亿 Revenue exceeding $500B
- 🏢 94% 企业使用云服务 Enterprises using cloud
- 🖥️ 67% 企业基础设施已迁移云端 Infrastructure now cloud-based
- 📦 60% 企业数据存储在云中（2015 年仅 30%）Corporate data in cloud (vs. 30% in 2015)
- 🔀 混合云（Hybrid Cloud，同时使用私有云和公有云）使用率从 25% 升至 42.5%

> 敏感数据加速迁移云端 → 云安全重要性指数级增长 **More sensitive data in the cloud** → cloud security importance grows exponentially

------

### **真实安全事件 · Real Incidents**

**Capital One 数据泄露（2019）**

- 影响用户：1 亿 100 million users affected
- 根本原因：
  1. WAF（Web 应用防火墙 Web Application Firewall）配置错误
  2. 攻击者利用 SSRF（服务端请求伪造 Server-Side Request Forgery）发起攻击
  3. 获取 AWS IAM（身份与访问管理 Identity and Access Management）凭证
  4. 访问 S3 存储桶（Amazon 对象存储单元）中的大量敏感数据

其他受影响企业：Facebook、Uber 等大型科技公司均有类似云安全事故。

------

### **数据泄露的代价 · Financial Cost**

- 📈 2024 年平均泄露成本：**$488 万**（历史最高，同比 +10%）Average breach cost: $4.88M (all-time high)
- 🏥 医疗行业（Healthcare）：每天平均发生 **1.99 起** 泄露事件（每起涉及 500 条以上记录）
- 医疗数据因含 PHI（个人健康信息 Personal Health Information）高度敏感，是攻击者主要目标

------

## ✅6. 良好架构框架与安全设计原则 Well-Architected Frameworks & Security by Design

18:19

------

### **核心理念 · Core Philosophy**

> 云安全失败通常是**架构失败**，而非某个具体技术的失败。 Cloud security failures are often **architecture failures**, not technology failures.

常见架构级失败 Common architecture-level failures:

- 身份管理不当 Improper identity management
- 网络边界模糊 Unclear network boundaries
- 日志记录缺失 Missing logging
- 密钥管理混乱 Chaotic key management

✅ 安全设计优先 Security by Design ❌ 事后补救安全 Security as an Afterthought

------

### **AWS 良好架构框架 · AWS Well-Architected Framework**

六大支柱 Six pillars:

- 卓越运营 Operational Excellence
- 🔒 安全性 Security
- 可靠性 Reliability
- 性能效率 Performance Efficiency
- 成本优化 Cost Optimization
- 可持续性 Sustainability

------

### **Azure 良好架构框架 · Azure Well-Architected Framework**

五大支柱 Five pillars:

- 可靠性 Reliability
- 🔒 安全性 Security
- 成本优化 Cost Optimization
- 卓越运营 Operational Excellence
- 性能效率 Performance Efficiency

------

### **两框架共同的安全支柱内容 · Common Security Pillar**

目标：保护 CIA 三元组（Triad）：

- **C** — 机密性 Confidentiality
- **I** — 完整性 Integrity
- **A** — 可用性 Availability

实现手段 How:

- 强 IAM（身份与访问管理 Identity and Access Management）
- 数据保护：加密 + 密钥管理 Encryption & key management
- 网络分段 + 纵深防御（Defense-in-Depth，多层防御，单层被突破不导致整体失陷）
- 日志记录、威胁检测与响应准备 Logging, threat detection & response readiness

------

## ✅✅7. 云安全挑战分类 Cloud Security Challenges

### ✅**机密性挑战 · Confidentiality Challenges**

- ❌ 错误实现加密算法 Incorrect crypto implementation — 错误的 IV（初始化向量 Initialization Vector）处理、密钥硬编码等；应使用成熟密码学库
- ❌ 自创加密算法 Roll your own crypto — 未经社区审查，几乎必然有漏洞；永远不要自制密码（Never roll your own crypto）
- ❌ 弱密钥管理 Weak key management — 密钥与数据同地存储、明文保存、不定期轮换；应使用 KMS（密钥管理服务 Key Management Service，如 AWS KMS、Azure Key Vault）或 HSM（硬件安全模块 Hardware Security Module）
- ⚠️ 后量子准备 Post-quantum preparation — RSA、ECC 等公钥算法将被量子计算机上的 Shor 算法破解；"现在收集、以后解密"（Harvest Now, Decrypt Later）已是现实威胁；NIST 已于 2024 年发布首批后量子密码标准
- ⚠️ 勒索软件攻击备份 Ransomware targeting backups — 攻击者同时加密生产数据与备份；防御措施：
  - 离线备份 Air-gapped backups（物理断网的备份）
  - 不可变备份 Immutable backups（写入后无法修改）
  - 3-2-1 策略（3 份副本、2 种介质、1 份离线）

------

### ✅**身份验证挑战 · Authentication Challenges**

- ❌ 中间人攻击 Man-in-the-Middle (MitM) — 攻击者拦截并篡改通信；防御：强制 TLS（传输层安全协议 Transport Layer Security）+ 正确验证证书
- ❌ 自制认证密码学 Custom auth crypto — 同上，应使用经验证的协议：OAuth 2.0、OpenID Connect、SAML（安全断言标记语言 Security Assertion Markup Language）
- ❌ 密码保护不达标 Weak password protection：
  - 允许弱密码
  - 不加盐哈希（应使用 bcrypt、Argon2 等专用密码哈希算法）
  - 不强制 MFA（多因素认证 Multi-Factor Authentication）

------

### ✅**授权挑战 · Authorization Challenges**

- ❌ 误解共同责任模型 Shared responsibility misunderstanding — 误以为迁移云端后安全全由服务商负责，忽视自身 IAM 配置、数据加密等义务
- ❌ 权限过宽 Overly permissive access — 违反最小权限原则（Principle of Least Privilege，每个账户只拥有完成工作所需的最低权限）；应实施 RBAC（基于角色的访问控制 Role-Based Access Control）+ 定期访问审查
- ⚠️ 合规与监管 Compliance & regulatory challenges — 云中数据可能同时受多种法规约束：
  - GDPR（通用数据保护条例 General Data Protection Regulation，欧盟）
  - APP（澳大利亚隐私原则 Australian Privacy Principles）
  - HIPAA（健康保险携带和责任法案 Health Insurance Portability and Accountability Act，美国医疗）
  - 涉及数据主权（Data Sovereignty，数据必须存储在特定地理范围内）、保留期限、访问日志等要求；违规面临巨额罚款

------

## ✅8. 案例分析 Case Study

**背景 Background**：某公司迁移公有云后，攻击者成功解密了部分敏感数据。 A mid-sized company moved to public cloud; attackers successfully decrypted sensitive data.

------

### 1. 根本原因 Root Causes

- **自定义加密算法 Custom encryption**：未经审查，存在设计漏洞 / Unvetted, potentially flawed
- **密钥与数据同地存储 Co-located keys and data**：一次入侵即可同时获取两者 / One breach exposes both

------

### 2. 机密性失效 Confidentiality Failure

加密算法不可信 + 密钥管理失败 → 数据被解密 Untrustworthy algorithm + failed key management → data decrypted

**改进 Improvements**：

- 使用 AES-256-GCM（标准算法，兼具加密与完整性保护）/ Standard algorithm with authenticated encryption
- 使用 AWS KMS / Azure Key Vault 将密钥与数据分离 / Separate keys from data

------

### 3. 权限配置失误 Misconfigured Access Control

```
权限错误 → 访问密钥 → 解密数据
Misconfigured permissions → Key access → Data decrypted
```

**改进 Improvements**：最小权限原则 + MFA + 审计日志 + 定期权限审查 Least privilege + MFA + audit logs + regular access review

> IAM 配置是**客户责任**，非云服务商自动处理。 IAM configuration is the **customer's responsibility**, not the cloud provider's.

------

### 4. 后量子风险 Post-Quantum Risk

| 量子算法 Quantum Algorithm | 威胁目标 Target                                      |
| -------------------------- | ---------------------------------------------------- |
| Shor's algorithm           | RSA、ECC → 直接破解 / Directly broken                |
| Grover's algorithm         | AES → 有效密钥长度减半 / Effective key length halved |

- AES-128 → 量子环境下安全余量不足 / Insufficient security margin
- AES-256 → 仍相对安全 / Remains relatively secure ✓

**"现收后解" Harvest Now, Decrypt Later**：攻击者现在存储密文，等量子计算机成熟后再解密。医疗、金融、身份数据风险最高。 Attackers store ciphertext now and decrypt later once quantum computers mature. Medical, financial, and identity data are highest risk.

**迁移方向 Migration (NIST 2024)**：

- **Kyber** → 替代 RSA/ECC 密钥交换 / Replaces RSA/ECC key exchange
- **Dilithium** → 替代 RSA/ECDSA 数字签名 / Replaces RSA/ECDSA signatures

------

### 总结 Conclusion

| 维度 Dimension          | 正确做法 Correct Practice                     |
| ----------------------- | --------------------------------------------- |
| 加密算法 Encryption     | AES-256-GCM                                   |
| 密钥管理 Key management | KMS，密钥与数据分离 / Separate keys from data |
| 权限控制 Access control | 最小权限 + MFA + IAM                          |
| 审计 Auditing           | CloudTrail / Azure Monitor                    |
| 后量子 Post-quantum     | 迁移至 Kyber / Dilithium                      |

> 加密是算法、密钥、权限、审计与后量子迁移共同构成的体系，而非单一技术点。 Encryption is a system built from algorithms, key management, access control, auditing, and post-quantum migration — not an isolated technique.

# ❤️ **Week 1：云安全总览 Cloud Security Overview**

# 云计算与安全导论 / Intro, cloud computing, security

# 核心问题：云计算为什么会带来新的安全风险？云端数据、服务和基础设施需要保护什么？

------

# 🌸CSEC5615 Week 2 — 数据安全：传输中、静止中、使用中数据保护与加密🌸

**数据保护基础（Data Protection Fundamentals）** 包括数据分类、访问控制、备份、传输加密等，确保数据在存储、传输、使用三个状态下的安全。

**加密（Encryption）** 将明文转换为密文的过程，分为：

- **对称加密**：加解密用同一密钥（如 AES）
- **非对称加密**：公钥加密、私钥解密（如 RSA）

![image-20260609151644661](/Users/tangjun/Library/Application Support/typora-user-images/image-20260609151644661.png)



------

## ✅1. 数据的三种状态 Three States of Data

云环境中数据始终处于三种状态之一，每种状态面临不同安全挑战。

### **1.1. 传输中数据 Data in Transit**

数据在客户端、服务器、设备之间传输时。 例：发送邮件、下载文件、API 调用

主要威胁：

- 中间人攻击 MITM（Man-in-the-Middle）— 拦截传输中的数据
- 数据包嗅探 Packet sniffing — 读取明文传输内容

具体风险：

- 明文 HTTP 传输时截获登录凭证
- API 调用中暴露敏感信息

✅ 防御：强制 TLS（传输层安全协议）加密所有通信

------

### **1.2. 静止中数据 Data at Rest**

数据存储在数据库、文件系统、云存储中时。 例：备份文件、归档文件、S3 存储桶

主要威胁：

- 未授权访问 Unauthorized access — 数据泄露
- 内部威胁 Insider threats — 内部人员滥用权限

具体风险：

- S3 存储桶配置错误导致文件公开暴露
- 丢失/被盗硬盘含未加密备份数据

✅ 防御：静态加密 + 严格 IAM 策略 + 存储桶访问控制

------

### **1.3. 使用中数据 Data in Use**

数据被应用程序主动处理时。 例：正在编辑的文档、数据库查询、CPU 寄存器中的数据

主要威胁：

- 内存转储 Memory dump — 从内存中提取明文数据
- 侧信道攻击 Side-channel attacks — 通过功耗、时序等间接信息推断数据内容
- 内部人员访问 Insider access

具体风险：

- 实时处理金融交易时数据暴露
- ML（机器学习 Machine Learning）模型在无保护措施下处理用户敏感数据

✅ 防御：机密计算（Confidential Computing，在受保护的可信执行环境 TEE 中处理数据）

------

# 数学保护基础

## ✅2. 密码学工具与三种数据状态的对应关系 Cryptographic Primitives for Each State

**数据三态密码学保护 · Cryptographic Protection by Data State**

### 2.1**传输中 In Transit**

- 机密性 — TLS/SSL + AES 或 RSA
- 认证性 — 数字签名 Digital Signature（验证发送方身份）
- 完整性 — HMAC（基于哈希的消息认证码 Hash-based Message Authentication Code）

------

### 2.2 **静止中 At Rest**

- 机密性 — AES（高级加密标准 Advanced Encryption Standard）
- 认证性 — 数字签名（确保文件来源可信）
- 完整性 — SHA-256（安全哈希算法 Secure Hash Algorithm，256位输出）

------

### 2.3 **使用中 In Use**

- 机密性 — 同态加密 Homomorphic Encryption（无需解密即可对加密数据直接计算）
- 认证性 — 数字签名（审计敏感操作）
- 完整性 — 哈希 Hash（检测处理过程中的篡改）

------

**对照总结 · Summary**

| 状态   | 机密性            | 认证性   | 完整性   |
| ------ | ----------------- | -------- | -------- |
| 传输中 | TLS/SSL + AES/RSA | 数字签名 | **HMAC** |
| 静止中 | AES               | 数字签名 | SHA-256  |
| 使用中 | 同态加密          | 数字签名 | Hash     |

------

## 3.  密码学历史 · History of Cryptography

**密码学历史 · History of Cryptography**

------

### **3.1 古典密码 · Classical Ciphers**

- **~前500年** 斯巴达密码棒 Scytale — 羊皮纸绕特定直径木棒书写；最早的转置密码（Transposition Cipher，改变字符位置而非替换）
- **~前44年** 凯撒密码 Caesar Cipher — 字母固定位移（A→D），最早的替换密码（Substitution Cipher）；安全性极低，仅26种可能密钥
- **~1600年** Vigenère 密码 — 关键词作密钥的多字母替换；曾被称"无法破解"，19世纪被 Kasiski 分析法攻破
- **1942年** Enigma 机器 — 纳粹德国机电加密设备；图灵（Alan Turing）领导团队在布莱切
- 利庄园（Bletchley Park）破解，对二战结局产生决定性影响

------

### 3.2 **核心原则 · Core Principle**

**~1900年 Kerckhoff 原则 Kerckhoff's Principle**

> 即使除密钥外的所有信息公开，密码系统也应该是安全的。 A cryptosystem should be secure even if everything except the key is public.

- ✅ 安全性来自**密钥保密** Security from key secrecy
- ❌ 不依赖**算法保密** Not from algorithm secrecy

------

### 3.3 **现代密码学时间线 · Modern Cryptography Timeline**

- **1949** Shannon 信息论 — 奠定一次性密码本 OTP（One-Time Pad，每次使用随机密钥且只用一次，理论上完美安全）的理论基础
- **1976** Diffie-Hellman-Merkle — 提出公钥密码学（Public-key Cryptography）与密钥交换协议；解决了密钥分发难题（Key Distribution Problem，如何在不安全信道上安全传递密钥）
- **1978** RSA（Rivest-Shamir-Adleman）— 第一个实用公钥密码系统；至今仍广泛使用
- **1979** Rabin 方案 — 提出可证明安全（Provable Security，用数学证明破解难度等价于某已知难题）密码学先河

对称加密发展：OTP → DES → AES

AES 模式发展：ECB → CBC → GCM

公钥密码发展：DH → RSA → ECC

Plain RSA → Padded RSA → Hybrid Encryption

Hash 发展：MD5 → SHA-1 → SHA-2 → SHA-3

数字签名发展：RSA Signature → DSA → ECDSA

安全标准发展：IND-CPA / IND-CCA / EUF-CMA

公钥密码学出现之后
→ 新问题：怎么确认这个公钥真的属于某个人或某个网站？

PKI / CA / Fingerprint

后量子密码发展：RSA/ECC → PQC





**对称加密 Symmetric Encryption**

- OTP（一次性密码本 One-Time Pad，1949）— 完美安全但不实用
- ↓ 需要实用标准 Need practical standard
- DES（数据加密标准 Data Encryption Standard，1977）— 56位密钥
- ↓ 密钥太短，可被暴力破解 Key too short, brute-forceable
- AES（高级加密标准 Advanced Encryption Standard，2001）— 至今仍用 ✅
- AES 模式：ECB ❌ → CBC → GCM ✅

------

**公钥加密 Public-Key Encryption**

- ↓ 对称加密无法解决初次密钥共享 Can't solve initial key sharing
- DH（Diffie-Hellman，1976）— 解决密钥分发问题
- RSA（Rivest-Shamir-Adleman，1978）— 第一个实用公钥系统
- ↓ RSA 慢且 Plain RSA 不安全 Slow and insecure without padding
- Padded RSA / OAEP（最优非对称加密填充 Optimal Asymmetric Encryption Padding）
- ECC（椭圆曲线密码学 Elliptic Curve Cryptography，1985）— 更短密钥，更高效
- ↓ RSA 加密大文件太慢 Too slow for large data
- 混合加密 Hybrid Encryption — RSA 传密钥 + AES 加数据 ✅

------

**哈希函数 Hash Functions**

- MD5（消息摘要5 Message Digest 5，1991）❌
- ↓ 碰撞攻击 Collision attacks found
- SHA-1（安全哈希算法1 Secure Hash Algorithm 1，1995）❌
- ↓ SHAttered 碰撞攻击（2017）Real collision demonstrated
- SHA-2（2001，SHA-256/512）✅ 仍广泛使用
- ↓ 需要结构不同的备选 Need structurally different alternative
- SHA-3 / Keccak（海绵构造 Sponge Construction，2015）✅

------

**数字签名 Digital Signatures**

- RSA Signature（1978）— 签名大、速度慢
- ↓ 需要更高效的专用签名算法
- DSA（数字签名算法 Digital Signature Algorithm，1991）
- ↓ 需要更短密钥、更高效
- ECDSA（椭圆曲线数字签名算法 Elliptic Curve Digital Signature Algorithm，1990s）✅
- ↓ 需要更简洁的数学结构
- Schnorr 签名（比特币 Taproot 核心）✅

------

**后量子 Post-Quantum Cryptography**

- ↓ Shor 算法（1994）证明量子计算机可破解 RSA 和 ECC
- PQC（后量子密码 Post-Quantum Cryptography）NIST 2024 标准：
  - CRYSTALS-Kyber — 密钥交换 Key exchange
  - CRYSTALS-Dilithium — 数字签名 Digital signatures

------

## ✅4. 现代密码学的三大原则 Three Principles of Modern Cryptography

**现代密码学三大原则 · Three Principles of Modern Cryptography**

------

### 4.1 **原则一：形式化定义 Formal Definitions**

> "如果你不清楚你想要实现什么，你怎么知道你是否已经实现了它？" "If you don't understand what you want to achieve, how can you know when you've achieved it?" — Katz & Lindell

形式化定义包含两部分：

**1. 安全保证 Security Guarantee**

- 回答：什么是成功的攻击？What is a successful attack?
- 加密目标：关于明文的任何信息都不应泄露
- 需精确数学化 → 引出不可区分性实验（Indistinguishability Experiment）

**2. 威胁模型 Threat Model**

- 规定攻击者的能力边界，不规定攻击者如何使用这些能力
- 按攻击者能力从弱到强：

| 模型                                         | 攻击者拥有                          | 强度 |
| -------------------------------------------- | ----------------------------------- | ---- |
| COA 仅密文攻击 Ciphertext-Only Attack        | 密文 c                              | 最弱 |
| KPA 已知明文攻击 Known-Plaintext Attack      | 明文-密文对 {(m, c)} + 新密文 c     | 中   |
| **CPA 选择明文攻击 Chosen-Plaintext Attack** | 可自选任意明文获得密文 + 挑战密文 c | 最强 |

⚠️ CPA 是现代加密方案必须满足的**最低安全要求**。 能抵抗强攻击 → 自动抵抗弱攻击；反之不成立。

### 4.2 **原则二：精确假设 Precise Assumptions**

大多数密码方案无法实现无条件安全（Unconditional Security，对计算能力无限的攻击者也安全），而是依赖计算难题假设（Computational Hardness Assumptions）。

常见假设：

- 大数分解困难 Factoring is hard（RSA 的基础）
- 离散对数困难 Discrete log is hard（Diffie-Hellman 的基础）

为何必须明确陈述假设：

- 有效性验证 — 只有明确假设才能判断方案是否真正安全
- 方案比较 — 不同方案依赖不同假设，便于比较保守程度与风险
- 理解必要条件 — 明确哪些难题必须成立，某类安全方案才能存在

------

### 4.3 **原则三：安全性证明 Proofs of Security**

在形式化定义（原则一）+ 精确假设（原则二）的基础上，给出严格数学证明。

核心方法：归约 Reduction

逻辑链条：

```
假设存在攻击者能攻破方案
        ↓
利用该攻击者构造算法解决底层难题（如大数分解）
        ↓
底层难题被假设是困难的 → 矛盾
        ↓
∴ 攻击者不存在 → 方案安全
```

> 现代密码学不说"我们相信这个方案是安全的"，而是说"如果大数分解是困难的，则这个方案是安全的"。 Modern cryptography doesn't say "we believe this is secure" — it says "if factoring is hard, then this scheme is secure."



------

## ✅5. 私钥加密方案 Private-Key Encryption

**私钥加密方案定义 · Private-Key Encryption Scheme**

也称对称加密 Symmetric Encryption（加密与解密使用同一密钥）。

------

**组成 · Components**

消息空间 Message space **M** + 三个算法：

**1. KGen(λ) — 密钥生成 Key Generation**

- 输入：安全参数 λ（Security Parameter，控制密钥长度等安全相关参数）
- 输出：随机密钥 k
- λ 越大 → 安全性越高，效率越低

**2. Enc(k, m) — 加密 Encryption**

- 输入：密钥 k + 消息 m
- 输出：密文 c
- ⚠️ 现代安全方案通常是**概率性的** Probabilistic — 同一 (k, m) 多次加密产生不同密文
- 概率性是 CPA 安全性的**必要条件**

**3. Dec(k, c) — 解密 Decryption**

- 输入：密钥 k + 密文 c
- 输出：消息 m
- 通常是**确定性的** Deterministic

------

**正确性要求 · Correctness**

对所有合法密钥 k ← KGen(λ) 和所有消息 m ∈ M：

> **Dec(k, Enc(k, m)) = m**

加密后再解密必须还原原始消息 — 加密方案最基本的功能要求。

------

## ✅6.私钥加密的 CPA 安全性不可区分性实验Adversarial Indistinguishability

**不可区分性安全 · Indistinguishability Security**

------

### **6.1 直觉理解 · Intuition**

#### 攻击者无法区分一条明文的加密结果与另一条的加密结果。 The adversary cannot distinguish the encryption of one plaintext from another.

例 Example：投票系统只有"Yes"或"No"

- 攻击者知道只有两种可能 Adversary knows only two options exist
- 若能以 > 1/2 概率判断出哪张票 → 保密性被破坏 If guess > ½ → confidentiality is compromised

------

### 6.2 **安全实验 · Indistinguishability Game**

#### 6.2.1 攻击者 Adversary vs. 挑战者 Challenger：

##### **挑战者 Challenger**

扮演"系统"的角色，代表我们想要证明安全的加密方案。 Represents the system — the encryption scheme we want to prove secure.

- 持有密钥 Holds the secret key
- 负责加密 Performs encryption
- 不作弊，严格按实验规则行动 Follows experiment rules strictly, never cheats

###### 类比 Analogy：银行的保险箱系统 A bank's vault system

------

##### **攻击者 Adversary**

扮演"黑客"的角色，尝试破解加密方案。 Represents the hacker — tries to break the encryption scheme.

- 没有密钥 Has no secret key
- 只能看到密文 Can only see ciphertext
- 可以使用任意策略 Can use any strategy
- 计算能力有限（计算意义上的安全）Computationally bounded (for computational security)

###### 类比 Analogy：试图破解保险箱的小偷 A thief trying to crack the vault

##### 

##### **两者的关系 · Their Relationship**

这是一个**思想实验** Thought experiment，不是真实的攻击：

- 挑战者和攻击者都是**理论上的角色** Both are theoretical constructs
- 目的是严格定义"安全"的含义 Purpose: formally define what "secure" means
- 如果即使面对最强的攻击者，方案也能保持安全 → 方案才算真正安全
- If the scheme stays secure against the strongest possible adversary → it is truly secure

> 本质上是在问：最聪明的黑客，在最有利的条件下，能破解这个方案吗？ Essentially asking: can the smartest possible hacker, under the most favorable conditions, break this scheme?

![](/Users/tangjun/Library/Application Support/typora-user-images/image-20260606190657658.png)



```
攻击者 Adversary                 挑战者 Challenger
  |                               |
  |── 提交 m₀, m₁（等长）──────→ | Submit equal-length m₀, m₁
  |                               | 生成 k ← KGen(λ)  Generate key
  |                               | 计算 Compute c₀ = Enc(k, m₀)
  |                               |               c₁ = Enc(k, m₁)
  |                               | 随机抛硬币 Flip coin: b ∈ {0,1}
  | ←────────── 发送 c_b ──────── | Send c_b
  |                               |
  | 输出猜测 b*  Output guess b*  |
  |                               |
  获胜条件 Win condition：b* = b
```



#### 6.2.2 窃听者安全试验 私钥加密的

$PrivK^eav_（A,Π）$ — 窃听者安全实验 Eavesdropper Security Experiment

------

#### 6.2.3 **实验步骤 · Experiment Steps**

1. 攻击者 A 输出两条等长消息 Adversary outputs two equal-length messages `(m₀, m₁) ← A,   m₀, m₁ ∈ M,   |m₀| = |m₁|`
2. 挑战者生成密钥 Challenger generates key `k ← Gen`
3. 挑战者随机选位 Challenger picks random bit `b ← {0, 1}`
4. 挑战者加密选中消息 Challenger encrypts chosen message `c ← Enc(mᵦ)`
5. 攻击者猜测 Adversary guesses `b' ← A(c)`
6. 判定 Outcome
   - `if b' = b` → 返回 1，攻击者获胜 Adversary wins
   - `else` → 返回 0，攻击者失败 Adversary loses

## ✅**7.安全定义 · Security Definition**

方案 Π 是安全的，当且仅当对所有攻击者 A： Scheme Π is secure iff for all adversaries A:

> **Pr[PrivK^eav_(A,Π) = 1] ≤ 1/2 + negl(λ)**

- 攻击者赢得实验的概率不超过随机猜测 1/2 加上可忽略量
- Adversary's winning probability cannot exceed random guessing ½ by more than a negligible amount

------

### 

#### 7.1 **完美不可区分性 Perfect Indistinguishability**

> Pr[b* = b] = 1/2

- 密文对攻击者完全没有提供任何有用信息 Ciphertext provides no useful information
- 最优策略仅为随机猜测 Optimal strategy is pure random guessing
- ✅ OTP（一次性密码本 One-Time Pad）满足此定义 satisfies this definition

#### 7.2 **计算意义上的安全性 Computational Security**（实际方案如 AES）

> Pr[b* = b] ≤ 1/2 + negl(λ)

- negl(λ)：可忽略函数（Negligible Function，关于 λ 增长极慢，实际中可忽略）a negligible function of λ — grows so slowly it's practically zero
- 允许计算资源有限的攻击者存在极小优势 Allows negligible advantage for computationally bounded adversaries
- λ 越大 → negl(λ) 越小 → 安全性越高 Larger λ → smaller negl(λ) → higher security

------

## ✅8. 一次性密码本的安全性证明 Why OTP is Secure



22:22

### 8.1 怎么加密？

**OTP 完美安全性 · OTP Perfect Security**

OTP（一次性密码本 One-Time Pad）：c = m ⊕ k，其中 ⊕ 为异或 XOR（相同→0，不同→1）



- ------

  **三个算法 · Three Algorithms**

  - 密钥生成 KeyGen：`k ← {0,1}^l`（随机均匀选取 l 位密钥 Uniformly random l-bit key）
  - 加密 Encrypt：`c = m ⊕ k`
  - 解密 Decrypt：`m = c ⊕ k`（因为 `(m ⊕ k) ⊕ k = m`，密钥 XOR 两次抵消 Key cancels out）

------

### 8.2 **为何安全 · Why Secure（l = 1 示例）**

  攻击者提交 m₀ = 0，m₁ = 1，挑战者发送 c_b = m_b ⊕ k

  | 看到 See | 可能情况 Possibilities        | 概率 Probability |
  | -------- | ----------------------------- | ---------------- |
  | c = 0    | m₀=0, k=0 **或 or** m₁=1, k=1 | 各 1/2 each      |
  | c = 1    | m₀=0, k=1 **或 or** m₁=1, k=0 | 各 1/2 each      |

  → 无论看到什么密文，两种明文概率完全相同 → 攻击者无法区分 → Whatever ciphertext is seen, both plaintexts are equally likely → adversary cannot distinguis

------

**一般性证明 · General Proof**

对任意 m₀、m₁、c For any m₀, m₁, c：

- 唯一密钥使 m₀ → c Unique key mapping m₀ to c：`k = c ⊕ m₀`
- 唯一密钥使 m₁ → c Unique key mapping m₁ to c：`k = c ⊕ m₁`

密钥均匀随机 → 两种情况概率完全相同 Key is uniform → both equally likely

> **∴ Pr[b' = b] = 1/2，完美不可区分性成立 Perfect indistinguishability holds**

------

**密钥重用的危险 · Danger of Key Reuse**

```
c₁ = m₁ ⊕ k
c₂ = m₂ ⊕ k
─────────────────────────
c₁ ⊕ c₂ = m₁ ⊕ m₂   ← 密钥消去！Key cancels out!
```

攻击者直接获得 m₁ ⊕ m₂ → 安全性崩溃 Security collapses

------

**OTP 三个必要条件 · Three Requirements**

- 密钥完全随机 Truly random key
- 密钥长度 = 消息长度 |k| = |m|
- 密钥只能使用一次 Never reuse the key

------

# 🌸CSEC5615 Week 3 — 云数据安全技术签名与哈希🌸

如何用密码学工具（AES、RSA、Hash、签名）系统性地保护云端数据的**机密性、完整性和认证性**（CIA 三元组）。

![image-20260609153009649](/Users/tangjun/Library/Application Support/typora-user-images/image-20260609153009649.png)



------

## ✅ 1. 一次性密码本 One-Time Pad (OTP)

**定义 · Definition**

`消息空间 M = 密钥空间 K = 密文空间 C = {0,1}^n `密钥 k 从` {0,1}^n` 中均匀随机选取 Key k chosen uniformly at random

------

**加密与解密 · Encryption & Decryption**

- 加密 Encrypt：`c = m ⊕ k`（消息 XOR 密钥 message XOR key）
- 解密 Decrypt：`m = c ⊕ k`（密文 XOR 密钥 ciphertext XOR key）

------

**核心特性 · Properties**

- ✅ 完美安全 Perfect security — 即使攻击者计算能力无限也无法获得任何明文信息 Even unlimited computing power reveals nothing
- ❌ 密钥与消息等长 Key = message length — 极不实用 Very impractical
- ❌ 只能用一次 Single use only — 重用密钥安全性完全崩溃 Reuse completely breaks security

------

**为何不适合云存储 · Why OTP Fails for Cloud**

- 每次上传文件需要等大的随机密钥 Every file upload needs a fresh key of equal size
- 密钥管理代价极高、完全不可扩展 Key management becomes impossibly expensive and unscalable
- 例 Example：1GB 文件需要 1GB 密钥 A 1GB file requires a 1GB key



------

## ✅ 2. AES 高级加密标准 Advanced Encryption Standard

### 2.1 对称加密**AES（高级加密标准 Advanced Encryption Standard）定义**

------

#### **历史背景 · History**

1997年，NIST（美国国家标准与技术研究院 National Institute of Standards and Technology）宣布竞赛，取代 DES（数据加密标准 Data Encryption Standard）

15个候选算法 candidate algorithms 提交，经两轮研讨会 workshop 筛选

- 2000年10月胜者：**Rijndael**，由比利时密码学家 Joan Daemen 和 Vincent Rijmen 设计

**有界攻击者安全**：AES 的安全性假设攻击者计算能力有限 computationally bounded，经典计算机 classical computer 下这一假设成立，实践中足够

**量子安全悬而未决**：量子计算机 quantum computer 可能打破这一假设，Grover 算法 Grover's algorithm 可将密钥搜索复杂度从 $2^{256} $ 降至 $2^{128}$ ，是否仍"足够安全"尚无定论$2^{256}$ 

#### **AES 优于 OTP 的三大原因 · Why AES Beats OTP**

- 密钥紧凑 Compact keys — 256位密钥可加密数 TB 数据 One 256-bit key encrypts terabytes
- 运行高效 Efficiency — 硬件和软件均深度优化，速度约为 RSA 的 100 倍 ~100× faster than RSA
- 密钥管理简单 Key management — 云端 KMS（密钥管理服务 Key Management Service）可安全生成、存储、分发密钥，可扩展性强

------

### 2.2 AES 是如何工作的？ mode

**块长 block length**：固定 128 位 bits

**密钥长度 key length**：128 / 192 / 256 位

**本质**：替换-置换网络 SPN（Substitution-Permutation Network），交替进行字节替换 byte substitution 和位置置换 permutation

#### 核心优势 · Key Advantages

**紧凑密钥 compact key**：一个 256 位 AES 密钥可安全加密 TB 级数据

**高效率 efficiency**：针对硬件 hardware 和软件 software 均有优化，计算开销 computational overhead 极小

**密钥管理 key management**：云环境中，KMS（密钥管理系统 Key Management System）负责安全地生成 generate、存储 store 和分发 distribute AES 密钥，具备可扩展性 scalability 与实用性 practicality



------

### **2.3 ECB 模式的危险 · Danger of ECB Mode**

#### ECB（电子密码本模式 Electronic Codebook）：

- ❌ 相同明文块 → 相同密文块 Identical plaintext blocks → identical ciphertext blocks
- ❌ 泄露数据模式信息 Leaks pattern information（加密图像后仍能看出轮廓）
- ✅ 实际应用必须使用 CBC（密码块链接模式 Cipher Block Chaining）或 GCM（伽罗瓦/计数器模式 Galois/Counter Mode）





------

### 2.4 **云端应用场景 · Cloud Use Cases**

静止数据 Data at rest：

- Amazon S3、Microsoft Azure Storage、Google Cloud Storage

传输数据 Data in transit：

- TLS（传输层安全协议）握手、云 API 通信

其他 Others：

加密虚拟机 encrypted VMs（AWS EC2、Azure Disk Encryption）、数据库加密 database encryption（AWS RDS、Google Cloud SQL）、安全备份 secure backup（AWS Glacier、Azure Backup）、文件共享 file sharing（Dropbox、Google Drive）

![image-20260609173501149](/Users/tangjun/Library/Application Support/typora-user-images/image-20260609173501149.png)

------

## ✅3. 公钥加密与RSA Public-Key Encryption & RSA

------

**核心问题 · The Central Problem**

对称加密的根本难题：通信双方如何在第一次通信时安全共享密钥？ How do two parties securely share a key in the first place?

公钥加密 Public-Key Encryption 正是为解决此**密钥分发问题 Key Distribution Problem** 而生。

------

### 3.1 **三个算法 · Three Algorithms**

- KeyGen(λ) → (PK, SK) — 生成公钥 Public Key + 私钥 Secret Key 对
- Enc(PK, m) → c — 用接收方**公钥**加密 Encrypt with receiver's public key
- Dec(SK, c) → m — 用接收方**私钥**解密 Decrypt with receiver's secret key
- 正确性 Correctness：`Dec(SK, Enc(PK, m)) = m`



### 3.2 公钥加密的 CPA 安全性不可区分性实验

这是**公钥加密的 CPA 安全性实验**

**PubK^cpa 实验流程 · Experiment**

```
攻击者 Adversary              挑战者 Challenger
     |                              |
     | ←────────── PK ──────────── | Gen(λ) → (SK, PK)
     |                              |
     | ──── m₀, m₁（等长）────────→ | b ← {0,1}
     |                              | cᵦ ← Enc(PK, mᵦ)
     | ←────────── cᵦ ──────────── |
     |                              |
     | 猜测 b' guess b'             |
     攻击者获胜 if b' = b
```

方案安全 if：Pr[b' = b] ≤ 1/2 + negl(λ)

------

### **3.3 与私钥加密实验的关键区别1  · Key Difference from Private-key**

|                | 私钥加密 PrivK^eav | 公钥加密 PubK^cpa          |
| -------------- | ------------------ | -------------------------- |
| 攻击者拿到     | 只有密文 c         | **公钥 PK + 密文 c**       |
| 攻击者能做什么 | 只能看密文         | **可以自己加密任意消息！** |
| 为何更难       | —                  | 攻击者有 PK 可主动攻击     |

------

### **核心思想 · Key Insight**

> 公钥加密天生面临更强的攻击者——因为 PK 是公开的，攻击者可以自己加密任意消息来辅助攻击。 Public-key encryption faces a stronger adversary by default — since PK is public, the attacker can encrypt anything themselves.

###  这就是为什么公钥加密**必须是概率性的** Probabilistic：

- 若加密是确定性的 → 攻击者直接用 PK 加密 m₀ 和 m₁，与 cᵦ 比对，立刻获胜
- If deterministic → attacker encrypts both messages themselves and compares → wins instantly



------

### **3.4 RSA 数学原理 · RSA Mathematics**

安全基础：大数分解难题 Factoring Problem

- 给定 N = p × q（两个大质数），计算上极难分解回 p 和 q
- 无高效经典算法，但 Shor 算法（量子计算机）可破解 → RSA 面临的最大威胁

密钥 Keys：

- 公钥 Public key：(N, e)
- 私钥 Secret key：d，满足 `e × d ≡ 1 (mod φ(N))`，其中 φ(N) 为欧拉函数（Euler's Totient Function，小于N且与N互质的正整数个数）
- ![image-20260607213021500](/Users/tangjun/Library/Application Support/typora-user-images/image-20260607213021500.png)





------

### 3.5 RSA 弱点 



#### **Plain RSA 四大攻击弱点 · Attacks on Plain RSA**

- RSA 假设只保证**随机消息**无法被恢复 RSA assumption only guarantees security for random messages
- ❌ 短消息可直接恢复 Short message recovery — 短消息非随机，可直接被恢复 Short messages are not random → can be fully recovered
- ❌ 相关消息攻击 Related message attack — 加密多条关联消息时安全性崩溃 Encrypting related messages breaks security
- ❌ 广播攻击 Broadcast attack — 同一消息加密给多个接收者，攻击者可通过 CRT（中国剩余定理 Chinese Remainder Theorem）恢复明文 Same message to multiple receivers → recoverable via CRT
- **RSA 假设 RSA assumption** 只保证随机消息 random message 无法被恢复

  若消息 m 不是随机的，则无任何安全保证——

  

  

------

#### **解决方案 · Solution**

✅ **Padded RSA（填充RSA）**，如 OAEP（最优非对称加密填充 Optimal Asymmetric Encryption Padding）

- 加密前为消息添加**随机填充** Add random padding before encryption
- 使相同消息每次加密结果不同 Same message → different ciphertext each time
- 本质上把非随机消息变成随机消息 Essentially randomizes non-random messages

------

### 3.6 **混合加密 · Hybrid Encryption**

RSA 慢 + AES 快 → 结合两者 Combine both：

```
① 随机生成 AES 会话密钥 k  Generate random AES session key k
② ct_key  = RSA_Enc(PK, k)  用 RSA 加密会话密钥
③ ct_data = AES_Enc(k, data) 用 AES 加密实际数据
④ 发送 Send (ct_key, ct_data)
─────────────────────────────────────────
接收方 Receiver：
⑤ k    = RSA_Dec(SK, ct_key)  先用 RSA 解出会话密钥
⑥ data = AES_Dec(k, ct_data)  再用 AES 解密数据
```

> 这是 TLS（传输层安全协议）及几乎所有现代安全协议的基础。 This is the foundation of TLS and virtually all modern security protocols.

------

### 3. 7 **私钥 vs 公钥加密 · Private vs Public Key Encryption 2 **

| 特性 Feature         | 私钥/对称 Private/Symmetric                                  | 公钥/非对称 Public/Asymmetric                                |
| -------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| 密钥共享 Key Sharing | ❌ 需要安全信道预先共享 Requires secure channel               | ✅ 公钥可公开分发 PK freely distributable                     |
| 速度 Speed           | ✅ 快，适合大数据 Fast, efficient for large data              | ❌ 慢，适合小数据 Slow, efficient for small data              |
| 适用场景 Use Cases   | 文件加密、VPN（虚拟私人网络 Virtual Private Network）、数据库加密 File encryption, VPNs, database security | TLS 握手、密钥交换、邮件加密 TLS handshakes, key exchange, email encryption |
| 类比 Analogy         | 房门钥匙 House key（同一把开关）                             | 邮箱 Mailbox（任何人可投信，只有你能取）                     |
| Fun Fact             | AES 比 RSA 快约 100 倍 AES is ~100× faster than RSA          | RSA 可被量子算法（Shor算法）破解 RSA broken by quantum algorithms |

------

**结论 · Conclusion**

两者结合 → 混合加密 Hybrid Encryption：

- 公钥加密 解决密钥分发 Solves key distribution
- 私钥加密 解决大数据效率 Solves large data efficiency
- 这正是 TLS 等所有现代协议的做法 This is what TLS and all modern protocols do

## ✅ 4. 哈希函数 Hash Functions

### 4.1 **哈希函数 · Hash Functions$**


$H:\{0,1\}^{*}\rightarrow \{0,1\}^{\ell}$


任意长度输入 → 固定 l 位输出，确定性 Any-length input → fixed l-bit output, deterministic

------

### 4.2 **三大安全性质 · Three Security Properties**

- 抗碰撞性 Collision Resistance — 无法找到 x₀ ≠ x₁ 使得 H(x₀) = H(x₁)；碰撞必然存在但计算上不可行 Cannot find two distinct inputs with the same hash — collisions exist but are infeasible to find
- 原像抵抗 Pre-image Resistance（单向性 One-wayness）— 给定 y，无法反推 x 使得 H(x) = y；只能正向计算，无法逆向还原 Given output y, cannot find any input x — easy forward, impossible to reverse
- 第二原像抵抗 Second Pre-image Resistance — 给定固定输入 x，无法找到 w ≠ x 使得 H(w) = H(x)；与抗碰撞性区别：目标输入固定 Given fixed input x, cannot find different w with same hash — target input is fixed

强度关系 Strength ordering：

> 抗碰撞性 → 第二原像抵抗 → 原像抵抗（最强 → 最弱 Strongest → Weakest）
>
> **Collision**：找两个不同的 $x$
>
> **Pre-image**：给 hash，找原文.  (不可逆)
>
> **Second pre-image**：给原文，找另一个同 hash 的原文

------

### 4.3 **算法演进 · Algorithm History**

- MD5（1991，Ronald Rivest）— ❌ 已多次被攻破，不应用于安全场景 Broken, do not use
- SHA-1（1995，NSA，160位）— ❌ 已不安全；2017年谷歌展示 SHAttered 碰撞攻击；采用 Merkle-Damgård 构造 Deprecated; Google demonstrated real collision attack (SHAttered) in 2017
- SHA-2（2001，NSA，256/512位等）— ✅ 目前仍广泛用于云计算、TLS Still widely used in cloud and TLS
- SHA-3 / Keccak（2012）— ✅ 海绵构造 Sponge Construction（与 Merkle-Damgård 完全不同 Entirely different design）；量子抵抗性更好 Better quantum resistance

### 4.4 **应用：GnuPG 公钥指纹验证 Application: GnuPG Key Fingerprints**

**应用：公钥指纹验证 · Key Fingerprints (GnuPG)**

------

#### **问题 · Problem**

RSA-2048 公钥有 2048 位，无法通过电话直接比对 Public keys are too long to compare directly over the phone

→ 风险：攻击者可伪造公钥，发动 MITM（中间人攻击 Man-in-the-Middle） → Risk: attacker can substitute a fake public key

------

#### **解决方案 · Solution**

- 双方各自计算 H(pk) → 得到短"指纹" Both compute short fingerprint H(pk)
- 通过带外信道 Out-of-band Channel（与主通信信道分离的独立渠道，如电话、当面）比对指纹 Compare over phone or in person
- 指纹一致 → 公钥可信，排除中间人攻击 Fingerprints match → key is authentic

------

#### **为何有效 · Why It Works**

哈希的原像抵抗性 Pre-image Resistance 保证：

- 攻击者无法伪造一个不同的公钥使其哈希值与真实公钥相同
- Attacker cannot forge a different key that produces the same fingerprint

------

## ✅5. 数字签名 Digital Signatures

------

### 5.1 **三个算法 · Three Algorithms**

- KeyGen(λ) → (SK, PK) — 生成签名私钥 SK（签名者持有）+ 验证公钥 PK（公开） Generates signing key SK (secret) and verification key PK (public)
- Sign(SK, m) → σ — 用私钥对消息 m 签名，产生签名 σ Signer uses SK to produce signature σ on message m
- Verify(PK, m, σ) → Valid/Invalid — 任何人用公钥验证签名 Anyone uses PK to verify whether σ is valid

正确性 Correctness：`Verify(PK, m, Sign(SK, m)) = Valid`

------

### 5.2 **三重保证 · Three Guarantees**

- 身份认证 Authentication — 只有持有 SK 的人才能生成有效签名 Only SK holder can sign
- 公开可验证性 Public verifiability — 任何人持有 PK 即可独立验证，无需与签名者交互 Anyone with PK can verify independently
- 不可否认性 Non-repudiation — 签名者事后无法否认，签名与私钥唯一绑定 Signer cannot deny having signed

> ⚠️ 若只需特定接收方验证 → 用 MAC（消息认证码 Message Authentication Code），不需要数字签名 If only private verifiability needed → use MAC, not digital signatures

------

### **5.3 重要澄清 · Important Clarification**

数字签名 ≠ 加密方案的逆操作 Digital signature ≠ reverse of encryption

- RSA 虽可同时用于加密和签名，但两者安全模型完全不同，不可混淆
- Same algorithm, completely different security models — do not conflate

------

## ✅7. 数字签名的不可伪造性 Existential Unforgeability under Chosen-Message Attack实验

### **安全性定义 · EUF-CMA Security**

#### 不可伪造性 Existential Unforgeability under Chosen-Message Attack（在选择消息攻击下存在不可伪造性）

##### 实验流程 Experiment：

```
挑战者生成 (SK, PK)，将 PK 交给攻击者
Challenger generates keys, gives PK to adversary
        ↓
攻击者可自适应请求任意消息的签名
Adversary adaptively queries signatures on any messages
        ↓
攻击者提交从未请求过的新消息 + 伪造签名
Adversary outputs valid signature on a fresh message
        ↓
若成功概率可忽略 → 方案不可伪造
If success probability is negligible → scheme is unforgeable
```



```
攻击者 Adversary              挑战者 Challenger
     |                              |
     | ←────────── PK ──────────── | kGen(λ) → (SK, PK)
     |                              |
     | ──── msg = mᵢ ────────────→ | σᵢ ← Sign(SK, mᵢ)
     | ←────────── σᵢ ──────────── | 可重复多次 Repeat many times
     |                              |
     | 输出 returns (m*, σ*)        |
```

攻击者获胜条件 Attacker wins if：

1. `Verify(PK, m*, σ*) = 1` — 伪造签名有效 Forged signature is **valid**
2. `(m*, σ*)` must be **fresh** — m* 从未被请求过签名 m* was never previously signed

#### 和前面的加密方案安全实验的对比

**三个安全实验总览 · Three Security Experiments**

|                           | PrivK^eav                     | PubK^cpa                       | Sig^euf-cma                          |
| ------------------------- | ----------------------------- | ------------------------------ | ------------------------------------ |
| 针对 For                  | 私钥加密 Symmetric encryption | 公钥加密 Public-key encryption | 数字签名 Digital signature           |
| 攻击者拿到 Adversary gets | 只有密文 c                    | PK + 密文 c                    | PK + 任意消息的签名                  |
| 攻击者能做 Adversary can  | 只能看密文 Only see c         | 用 PK 自己加密 Encrypt with PK | 请求任意签名 Query any signature     |
| 攻击者目标 Goal           | 猜 b' = b                     | 猜 b' = b                      | 伪造新消息签名 Forge fresh signature |
| 安全条件 Secure if        | Pr[b'=b] ≤ 1/2 + negl(λ)      | Pr[b'=b] ≤ 1/2 + negl(λ)       | Pr[forge] ≤ negl(λ)                  |

**攻击者能力递增 · Increasing Adversary Power**

```
PrivK^eav          PubK^cpa           Sig^euf-cma
（最弱 Weakest）                      （最强 Strongest）
只看密文    →    有PK可自加密    →    可请求任意签名
See c only      Has PK, can          Can query any
                encrypt freely       signature
```

> 攻击者能力越强 → 安全要求越高 → 方案设计越复杂 Stronger adversary → higher security requirement → more complex scheme design



### **主流签名方案 · Signature Schemes**

- RSA-FDH（全域哈希 Full Domain Hash）— 安全性有严格证明 Provably secure；签名大、速度慢，实际部署较少 Large signatures, slow
- ECDSA（椭圆曲线数字签名算法 Elliptic Curve Digital Signature Algorithm）— 256位密钥 = RSA-2048 同等安全；速度更快 Much faster；广泛用于：比特币 Bitcoin、TLS/SSL 证书、AWS Signature v4 API 认证、Google Kubernetes Engine 容器签名
- Schnorr 签名 Schnorr Signatures — 数学结构更简洁，安全性证明更优雅 Cleaner math, better proofs；曾因专利问题采用缓慢 Slow adoption due to patents；现为比特币 Taproot 升级核心方案 Now basis of Bitcoin Taproot

------

## ✅8. 课堂问题详解 Key Questions Explained

#### **Q1：半加密认证方案是否安全？** **Is half-RSA-encrypted auth secure?**

A cloud-based authentication service decides to use an **RSA-like scheme** for encrypting login credentials. However, to improve efficiency, it **only encrypts the first half of the password** using RSA and leaves the second half in plaintext.

Given password `P = P_1 || P_2`, where `P_1` and `P_2` are halves of the password, the encryption works as:
$$
C = (RSA(P_1), P_2)
$$
The server decrypts $P_1$ using its private key and reconstructs $P$ to verify authentication.

**Question:** Does this scheme provide secure encryption for login authentication? Why or why not?

方案 Scheme：`c = (RSA_Enc(PK, p₁), p₂)` 其中 p₁ = 密码前半段，p₂ = 密码后半段明文 Where p₁ = first half, p₂ = second half in plaintext

❌ **不安全 Not secure**，原因：

- p₂ 明文传输 p₂ in plaintext — 攻击者直接读取 Directly readable
- 知道 p₂ → 搜索空间大幅缩小 → 只需暴力破解 p₁ Knowing p₂ drastically reduces attack space
- 只加密一半 → 本质违反 CPA 安全性（选择明文攻击安全性 Chosen-Plaintext Attack security）Partial encryption fundamentally violates CPA security

------

#### **Q2：数字签名验证失败的可能原因？** **Why might signature verification fail?**

场景 Scenario：Bob 声称 Alice 签署了某文件，但用 Alice 公钥验证失败 Bob claims Alice signed a document, but verification with Alice's PK fails

✅ 答案 Answer：**4. Both (1) and (2)**

- 原因1 — Bob 修改了文件 Bob modified the document
  - 签名绑定原始消息 Signature bound to exact original message
  - 任何修改哪怕一个字节 → `Verify(PK, m', σ) = Invalid`
  - Even one byte changed → verification fails
- 原因2 — Bob 使用了伪造私钥 Bob used a fake private key
  - 伪造的 SK 与 Alice 的 PK 数学上不对应 Fake SK doesn't correspond to Alice's PK
  - `Verify(PK, m, σ) = Invalid`
- ❌ 原因3 不正确 Reason 3 is wrong — Alice 密钥被攻破 Alice's key compromised
  - 密钥泄露 ≠ 验证失败 Compromised key ≠ verification failure
  - 若攻击者用 Alice 真实 SK 签名 → 验证反而**成功** If attacker uses Alice's real SK → verification would actually **pass**
  - 密钥泄露是安全问题，但不导致验证失败 Key compromise is a security issue, not a cause of failure

## Lecture Summary

##### 加密、哈希函数、数字签名的安全性定义 Security definitions of encryption, hash functions, and digital signatures

- 加密 Encryption → IND-CPA（不可区分性 Indistinguishability）
- 哈希 Hash → 抗碰撞性、原像抵抗、第二原像抵抗 Collision resistance, pre-image, second pre-image
- 签名 Signatures → EUF-CMA（不可伪造性 Unforgeability）

##### 加密方案 Encryption schemes → AES、RSA、混合加密 Hybrid Encryption

- AES — 对称加密，快速 Symmetric, fast
- RSA — 公钥加密，慢 Public-key, slow
- 混合加密 — RSA 传递 AES 密钥，AES 加密数据 RSA wraps AES key, AES encrypts data

##### 主流签名方案 Signature schemes in use

- RSA-FDH — 安全性有严格证明，但慢 Provably secure but slow
- ECDSA（椭圆曲线数字签名算法）— 快速，广泛用于比特币、TLS Fast, widely used
- Schnorr — 数学更简洁，比特币 Taproot 核心 Cleaner math, Bitcoin Taproot







# ❤️Week 2–3：密码学 Cryptography--------------------

**Week 2–3 总结 · Cryptography**

核心问题：如何用密码学工具保护云端数据？ Core question: How to use cryptographic tools to protect cloud data?

------

# **怎么保密 · Confidentiality**

- OTP — 完美安全但不实用
- AES — 对称加密，快，加密大数据
- RSA — 公钥加密，慢，解决密钥分发
- 混合加密 Hybrid — RSA 传密钥 + AES 加数据 ✅

------

# **怎么验证完整性 · Integrity**

- Hash 哈希函数（SHA-256、SHA-3）— 验证数据未被篡改
- 三大性质：抗碰撞、原像抵抗、第二原像抵抗

------

# **怎么证明是你发的 · Authentication**

- 数字签名 Digital Signatures（ECDSA、Schnorr）
- 三重保证：认证性、公开可验证性、不可否认性

------

# **怎么定义"安全" · Security Definitions**

- IND-CPA — 加密方案的机密性标准
- EUF-CMA — 签名方案的不可伪造性标准
- 现代三原则：形式化定义 → 精确假设 → 安全性证明

# \- 数据保护基础、加密、数字签名、哈希 / Encryption, signatures, hashing

# 如何用密码学工具（AES、RSA、Hash、签名）系统性地保护云端数据的**机密性、完整性和认证性**（CIA 三元组）。❤️



> 云端存储了大量敏感数据，我们怎么保护它？ How do we protect sensitive data in the cloud?

------

**逻辑主线 · The Logic Thread**

**第一步：定义"安全"是什么意思** Before building anything, we need to define what "secure" means.

- 形式化定义 Formal definition + 威胁模型 Threat model（COA → KPA → CPA）
- 安全实验 Security experiment（挑战者 vs 攻击者）
- 现代密码学三原则：形式化定义 → 精确假设 → 安全性证明

------

**第二步：保护数据机密性 Confidentiality**

数据不能被偷看 Data must stay secret.

- OTP — 完美安全但不实用 Perfect but impractical（密钥与数据等长）
- AES — 实用的对称加密 Practical symmetric encryption（快速，密钥短）
- RSA — 公钥加密 Public-key encryption（解决密钥分发问题，但慢）
- 混合加密 Hybrid — RSA 传密钥 + AES 加数据（两全其美 Best of both）

------

**第三步：保护数据完整性 Integrity**

数据不能被篡改 Data must not be tampered with.

- 哈希函数 Hash functions（SHA-256、SHA-3）
- 三大性质：抗碰撞、原像抵抗、第二原像抵抗
- 应用：公钥指纹验证、文件完整性校验

------

**第四步：保护身份认证 Authentication**

你怎么证明"是你签的"？How do you prove "you signed it"?

- 数字签名 Digital signatures（Sign + Verify）
- 三重保证：认证性、公开可验证性、不可否认性
- 安全定义：EUF-CMA 不可伪造性

------

# 🌸CSEC5615 Week 4 – Application Security in Cloud: Information Retrieval🌸

**信息检索（Information Retrieval）** 从大规模数据集中高效找到相关信息的技术，在云安全中涉及**加密数据上的可搜索加密**（Searchable Encryption），在不解密的前提下检索密文。



------

## ✅一、核心问题：查询隐私

从云端检索数据时，查询本身可能泄露敏感信息。 Retrieving data from the cloud can leak sensitive information through the query itself.

### 1.1**典型场景 Examples**：

| 查询行为 Query                                      | 泄露信息 Leaked Information                |
| --------------------------------------------------- | ------------------------------------------ |
| 患者查询特定检验结果 / Patient queries test results | 暴露健康状况 / Reveals health condition    |
| 投资者查询股价 / Investor queries stock price       | 暴露投资策略 / Reveals investment strategy |
| 用户查询附近餐厅 / User queries nearby restaurants  | 暴露精确位置 / Reveals precise location    |

### **1.2 核心局限 Key Limitation**：

传统加密只保护**数据静态存储**，无法隐藏**访问模式**（查询了哪条记录）。 Traditional encryption protects data **at rest**, but cannot hide **access patterns** (which record was queried).

------

## ✅二、私有信息检索（PIR）**Private Information Retrieval**



### 2.1 定义 Definition

#### 

数据库 D = (x₁, ..., xₙ)，PIR 方案由三个算法组成。 A PIR scheme over database D = (x₁, ..., xₙ) consists of three algorithms:

| 算法 Algorithm                     | 输入 Input                                                 | 输出 Output           |
| ---------------------------------- | ---------------------------------------------------------- | --------------------- |
| **Q**（查询生成 Query generation） | 索引 i，随机数 r / index i, random r                       | 查询 q / query q      |
| **A**（服务器应答 Server answer）  | 数据库 D，查询 q / database D, query q                     | 答案 ans / answer ans |
| **R**（重构 Reconstruction）       | 索引 i，随机数 r，答案 ans / index i, random r, answer ans | D[i]                  |

![image-20260610151936630](/Users/tangjun/Library/Application Support/typora-user-images/image-20260610151936630.png)

------

### 2.2 两个核心性质 Two Core Properties

------

#### 正确性（Correctness）

$$
R(i, r, A(D, Q(i,r))) = x_i
$$

**直觉**：不管数据库 $D $、想查的index $i $、随机数 $r $ 怎么选，整个流程跑完之后，用户一定能拿回正确的 $x_i $。

流程拆解：

- $Q(i, r) $ → 用户生成查询（query），$r $ 是随机数保证隐私
- $A(D, Q(i,r)) $ → 服务器用数据库 $D $ 回答这个查询
- $R(\cdots) $ → 用户重建（reconstruct）出答案，必须等于 $x_i $

------

#### 隐私性（Privacy）

$$
\Pr[Q(i,r) = q] = \Pr[Q(j,r) = q]
$$

**直觉**：服务器看到的查询 $q $，无法区分用户到底在查 index $i $ 还是 $j $——两个index产生同一个查询的概率完全相等。

手写注释 "NOT PRIVATE" 那个例子说的是：如果查询直接暴露 $q_i $（比如直接发 $i $），服务器一眼就知道你要哪个，隐私性不成立。

------

最后一行提到：等号 $= $ 是很强的要求（**完美隐私**），可以放松为 $\approx $（**计算不可区分性**），即服务器在计算上无法区分，这就是**计算PIR**的出发点。



正确性 = 查得到，隐私性 = 查什么别人不知道。





------

## ✅三、单服务器 PIR  Trivial→同态加密PIR→压缩PIR（SimplePIR）



### 2.3 Trivial PIR：最蠢但满足隐私性的方案   所有的数据库

------

#### 问题：能否立刻构造一个满足隐私定义的PIR？

手写答案：$q = $ "Give me the full database"

**即：用户直接问服务器要整个数据库。**

为什么这满足隐私性？
$$
\Pr[Q(i,r) = q] = \Pr[Q(j,r) = q]
$$
因为不管你想查 $i $ 还是 $j $，查询 $q $ 永远都是"给我全部数据"——两边概率显然相等，服务器完全无法从查询内容推断你要哪个index。✅

------

#### 问题在哪？——Succinctness（简洁性）

手写：$\text{sizeof}(q) + \text{sizeof}(\text{Ans}) \ll \text{sizeof}(\text{Database}) $

这是PIR的第三个要求：查询大小 + 回答大小 应该**远小于**数据库大小。

但trivial方案里，$\text{Ans} $ 就是整个数据库，所以：
$$
\text{sizeof}(\text{Ans}) = \text{sizeof}(\text{Database})
$$
**完全不满足简洁性**，通信开销等于直接下载整个数据库，毫无意义。

------

#### 一句话总结

> Trivial PIR（要全库）隐私性完美，但通信代价最大——真正有意义的PIR研究就是：**在保持隐私的前提下，把通信量压下来**。

这也是SimplePIR等方案要解决的核心问题。

### 问题

一个基于云的医学研究平台将匿名患者数据存储在数据库中。一名研究员查询数据库，想找参与了某个特定临床试验的患者。有两种查询方式：

1. **标准云查询**：研究员直接把查询语句（`SELECT * FROM patients WHERE trial_id = 123`）发给云数据库，云数据库处理后返回结果。
2. **基于PIR的查询**：研究员在**不暴露自己感兴趣的trial ID**的情况下，取回相关患者记录。

------



1. 标准云查询方式存在哪些隐私风险？
2. PIR如何在这个场景中防止信息泄露？
3. 如果数据已经静态加密（encrypted at rest），PIR还有必要吗？为什么？

##### 问题1：标准云查询的隐私风险

服务器直接看到 `trial_id = 123`，所以知道：

- 研究员在研究哪个试验
- 查询频率（某个trial被查了多少次）
- 甚至可以推断研究员的研究方向

> 风险：**查询内容本身就是敏感信息**，即使返回的患者数据是匿名的。
>
##### 问题2：PIR如何防止泄露
>
> 用PIR的话，研究员发出的查询 $q $ 对服务器来说看起来完全随机——服务器无法判断你到底在查 `trial_id = 123` 还是其他任何ID。
>
> 满足隐私性定义：
> $$
> \Pr[Q(123, r) = q] = \Pr[Q(456, r) = q]
> $$
>
> > 服务器只知道"有人查了某些东西"，但不知道查的是什么。

##### 问题3：静态加密够了吗？

**不够，PIR仍然有必要。**

静态加密（encrypted at rest）只保护**数据存储**不被偷，但：

- 查询时数据必须解密才能处理
- 服务器仍然能看到你的查询内容
- `trial_id = 123` 这个信息照样暴露

> 类比：银行保险箱锁得再好，但你每次去取钱，银行员工都能看到你取了哪个格子。

**静态加密 ≠ 查询隐私**，两者保护的是不同层面。



### 3.1 基于同态加密的 PIR HE-Based PIR 基本思路 Core Idea  用加密隐藏查询向量

####    3.1.1 用点积实现精准检索 / Use dot product to retrieve a specific entry:

- 构造查询向量 q = (0, 0, 1, 0, ..., 0)，仅目标位置为 1 / Only the target position is 1
- 服务器计算 q · D，返回 D[i] / Server computes q · D and returns D[i]
- **但这没有隐私 No privacy**：服务器直接看到查询向量，知道你要哪条 / Server sees the query vector and knows which record is requested

**场景**：数据库 $db = (7, 5, 8, \ldots, 1) $，客户想查 $db[2] = 8 $

------

##### 方法：用点积（Dot Product）

客户构造一个查询向量 $Q(2, r) $：
$$
Q = [0, 0, 1, 0, \ldots, 0]
$$
就是在想查的位置（index 2）放 $1 $，其他全放 $0 $。

然后服务器计算点积：
$$
Q \cdot db = 0 \times 7 + 0 \times 5 + 1 \times 8 + 0 \times \ldots + 0 \times 1 = 8
$$
返回结果 $8 $ ✅

##### 为什么**没有隐私性**？

服务器直接看到查询向量 $[0,0,1,0,\ldots,0] $，一眼就知道你在查 index 2。
$$
\Pr[Q(2,r)=q] \neq \Pr[Q(3,r)=q]
$$
完全不满足隐私性定义。

------

##### 构建高效PIR的**第一步**——先实现正确性，后续再想办法把查询向量"藏起来"（加噪声/加密），在保持正确性的同时获得隐私性。



#### 3.1.2 **加入同态加密  adding homomorphic encryption**：computing over encrypted data  

**核心思想**：在加密数据上直接计算，不需要先解密。 **Core idea**: Compute directly on encrypted data without decrypting first.

- 客户端发送加密查询 / Client sends encrypted query：(Enc(0), Enc(0), Enc(1), ..., Enc(0))
- 服务器利用**同态乘法 Homomorphic multiplication**：Enc(m) × k = Enc(m×k)
- 服务器利用**同态加法 Homomorphic addition**：Enc(m₁) + Enc(m₂) = Enc(m₁+m₂)
- 服务器返回 Enc(D[i])，客户端解密得到 D[i] / Server returns Enc(D[i]); client decrypts to obtain D[i]
- 服务器**全程不知道** i 是多少 / The server **never learns** the value of i



------

##### 基本流程 | Basic Flow

- $\text{Enc}(k, m) \rightarrow ct $ — 用密钥 $k $ 加密消息 $m $，得到密文 $ct $
- $\text{Eval}(f, ct) \rightarrow ct^* $ — 在密文上执行函数 $f $，得到新密文 $ct^* $
- $\text{Dec}(k, ct^*) \rightarrow f(m) $ — 解密后得到的是 $f(m) $，即函数作用在原始数据上的结果

**例子**：$f $ = "检查消息里有没有'Attack'，有则返回1"

- 服务器在密文上跑这个函数，自己看不到内容，但你解密后能得到正确答案。

##### 两种类型 | Two Types

  **加法同态 | Additively Homomorphic**（如 Paillier）
$$
  \text{Eval}(+,\ \text{Enc}(4),\ \text{Enc}(10)) = \text{Enc}(4+10) = \text{Enc}(14)
$$

  > 密文相"加"，解密后等于明文之和。

  **乘法同态 | Multiplicatively Homomorphic**（如 El Gamal）
$$
  \text{Eval}(\times,\ \text{Enc}(4),\ \text{Enc}(10)) = \text{Enc}(4 \times 10) = \text{Enc}(40)
$$

  > 密文相"乘"，解密后等于明文之积。

------

##### 查询是点积（加法+乘法）。如果用同态加密把查询向量加密，服务器在密文上算点积，就无法知道向量里哪个位置是1——**隐私性由此实现**

#### 3.1.3 同时满足正确性和隐私性的PIR 示例| PIR with Correctness and Privacy

------

##### 关键改动：加密查询向量 | Encrypt the Query Vector

之前查询向量是明文 $[0, 0, 1, 0, \ldots, 0] $，服务器一眼看穿。

现在改成：
$$
[\text{Enc}(0),\ \text{Enc}(0),\ \text{Enc}(1),\ \text{Enc}(0),\ \ldots,\ \text{Enc}(0)]
$$
服务器只看到一堆密文，**无法知道哪个位置是1**。✅

------

##### 计算过程 | Computation

点积涉及两种运算：

- **乘法**：$\text{Enc}(q_i) \times db[i] $（密文乘以明文常数）
- **加法**：把所有结果加起来

$$
\text{Enc}(0)\times7 + \text{Enc}(0)\times5 + \text{Enc}(1)\times8 + \ldots + \text{Enc}(0)\times1
$$

服务器返回 $\text{Enc}(8) $，客户用自己的密钥解密得到 $8 $。✅

------

##### 为什么隐私性成立 | Why Privacy Holds

服务器全程只看到加密的查询向量和加密的结果，**从未接触任何明文**——不知道你查的是index 2还是其他任何位置。

------

##### 这就是PIR的核心思路

> 用同态加密把"指示向量"藏起来，服务器在密文上算点积，客户解密得答案。
>
> 

------

#### 3.1.4 服务器端的具体计算封装 | Server-Side Computation

------

##### 第一步：逐元素同态乘法 | Homomorphic Multiply Component-wise

服务器用的公式：
$$
\text{Enc}(m) \times k = \text{Enc}(m \times k)
$$
即：密文乘以一个明文常数，结果还是密文。

具体计算：

| 查询向量（密文） | ×    | 数据库（明文） | =    | 结果（密文）     |
| ---------------- | ---- | -------------- | ---- | ---------------- |
| $\text{Enc}(0) $ | ×    | 7              | =    | $\text{Enc}(0) $ |
| $\text{Enc}(0) $ | ×    | 5              | =    | $\text{Enc}(0) $ |
| $\text{Enc}(1) $ | ×    | 8              | =    | $\text{Enc}(8) $ |
| $\vdots $        |      | $\vdots $      |      | $\vdots $        |
| $\text{Enc}(0) $ | ×    | 1              | =    | $\text{Enc}(0) $ |

------

##### 第二步：同态加法 | Homomorphic Add Components

服务器用的公式：
$$
\text{Enc}(m_1) + \text{Enc}(m_2) + \text{Enc}(m_3) + \ldots = \text{Enc}(m_1 + m_2 + m_3 + \ldots)
$$
所有结果加起来：
$$
\text{Enc}(0) + \text{Enc}(0) + \text{Enc}(8) + \ldots + \text{Enc}(0) = \text{Enc}(8)
$$

------

##### 第三步：返回给客户 | Return to Client

服务器把 $\text{Enc}(8) $ 发回给客户，客户用自己的私钥解密：
$$
\text{Dec}(k,\ \text{Enc}(8)) = 8\ ✅
$$

------

##### 全程服务器看到的 | What Server Sees

- 查询：一堆密文，**不知道哪个是1**
- 计算：在密文上操作，**看不到任何中间明文**
- 结果：$\text{Enc}(8) $，**不知道答案是8**

> 正确性 ✅ 隐私性 ✅ ——这就是基于同态加密的PIR完整流程。
>
> ![image-20260610161056886](/Users/tangjun/Library/Application Support/typora-user-images/image-20260610161056886.png)



#### 3.1.5 两个关键问题 | Two Key Questions

------

##### 问题1：查询的大小是多少？如何扩展？

手写答案：数据库大小为 $n $，查询也是大小 $n $（$n $ 个密文）

**问题在哪：**

- 数据库有 $n $ 条记录
- 查询向量就有 $n $ 个元素
- 每个元素都要加密 → 查询大小 = $n $ 个密文

每个密文比明文**大得多**（同态加密的密文通常比明文大几百倍），所以：
$$
\text{查询大小} \gg \text{数据库大小}
$$
**完全不满足 Succinctness简洁性**——这是同态加密PIR的主要瓶颈。

------

##### 问题2：为什么不用AES代替同态加密？

手写答案：**AES is not homomorphic!**

AES可以加密数据，但：

- 服务器无法在AES密文上直接做加法和乘法
- 要计算就必须先解密
- 一解密服务器就看到明文查询向量，隐私性立刻崩溃

> 同态加密的核心价值就是"**加密状态下可计算**"，AES根本不具备这个性质。

------

##### 小结

| 问题      | 现状                |
| --------- | ------------------- |
| 查询大小  | $n $ 个密文，太大 ❌ |
| 用AES替代 | 不支持同态运算 ❌    |

##### 这就是为什么需要 **SimplePIR** 这类更高效的方案——用LWE噪声代替完整同态加密，把查询压缩下来。



### 3.2 SimplePIR 通信开销优化 Reducing Communication Cost

| 方案 Scheme                          | 查询大小 Query Size        |
| ------------------------------------ | -------------------------- |
| 平凡方案（下载全库）Trivial solution | O(n)                       |
| 基础 HE-PIR Basic                    | O(n) 个密文 / ciphertexts  |
| **2D 矩阵方案 2D Matrix**            | O(√n) 个密文 / ciphertexts |
| **3D 立方体方案 3D Cube**            | O(∛n) 个密文 / ciphertexts |

**2D 方案 2D Scheme**：将数据库视为 √n × √n 矩阵，行查询选行，列查询选元素，共 2√n 个密文。 Treat the database as a √n × √n matrix; one query selects the row, another selects the element — total 2√n ciphertexts.

**3D 方案 3D Scheme**：推广到三维，共 3·∛n 个密文，查询开销进一步降低。 Extended to three dimensions — total 3·∛n ciphertexts, further reducing communication cost.

<img src="/Users/tangjun/Library/Application Support/typora-user-images/image-20260610163552178.png" style="zoom: 33%;" /><img src="/Users/tangjun/Library/Application Support/typora-user-images/image-20260610164937528.png" alt="image-20260610164937528" style="zoom: 33%;" /><img src="/Users/tangjun/Library/Application Support/typora-user-images/image-20260610165051199.png" alt="image-20260610165051199" style="zoom: 33%;" />

降低通信开销：二维化 | Bringing Down Communication Costs

------

#### 核心思路：把1维数据库变成2维矩阵

**之前**：数据库是一个长度 $n $ 的列表，查询向量也要 $n $ 个密文。

**现在**：把同样的数据排列成 $\sqrt{n} \times \sqrt{n} $ 的矩阵，用**两次查询**代替一次。

------

#### 具体例子

原来的列表：$[a, b, c, \ldots, x, y, z] $（$x $ 在第6位）

重新排列成矩阵：

|       | 0    | 1    | 2     | 3    |
| ----- | ---- | ---- | ----- | ---- |
| **0** | a    | b    | c     | d    |
| **1** | e    | f    | **g** | h    |
| **2** | i    | j    | k     | l    |
| **3** | m    | n    | o     | p    |

想查 $g $，分两步：

- **第一步（行查询）**：发送行选择向量 $[0, 1, 0, 0] $，告诉服务器"选第1行"
- **第二步（列查询）**：发送列选择向量 $[0, 0, 1, 0] $，告诉服务器"选第2列"

------

#### 为什么通信量下降？

| 方案 | 查询大小                                  |
| ---- | ----------------------------------------- |
| 1维  | $n $ 个密文                               |
| 2维  | $\sqrt{n} + \sqrt{n} = 2\sqrt{n} $ 个密文 |

**例子**：$n = 100万 $

- 1维：100万个密文
- 2维：$2 \times 1000 = 2000 $ 个密文

> 通信量从 $n $ 降到 $2\sqrt{n} $，**节省了几百倍**。✅





### 两阶段查询的具体大小 | Query Size with 2 Stages

------

#### 两阶段 | 2 Stages

- **第一阶段**：查询行（query row）
- **第二阶段**：查询列（query column）

------

#### 具体例子：想查 $x $（在第3行第1列）

**行查询向量**（长度 $\sqrt{n} $）：
$$
[\text{Enc}(0),\ \text{Enc}(0),\ \text{Enc}(0),\ \text{Enc}(1)]
$$
**列查询向量**（长度 $\sqrt{n} $）：
$$
[\text{Enc}(0),\ \text{Enc}(1),\ \text{Enc}(0),\ \text{Enc}(0)]
$$

------

#### 查询总大小 | Total Query Size

$$
\text{Query} = 2\sqrt{n} \text{ 个密文}
$$

对比之前：

| 方案        | 查询大小            |
| ----------- | ------------------- |
| 1维（之前） | $n $ 个密文         |
| 2维（现在） | $2\sqrt{n} $ 个密文 |

$n = 1,000,000 $ 时：$2\sqrt{n} = 2000 $，**缩小了500倍**。✅

------

#### 直觉 | Intuition

> 原来要指定列表里的一个位置，需要说 $n $ 个数。现在变成矩阵后，只需要说"第几行、第几列"，各说 $\sqrt{n} $ 个数就够了。

### 能做得更好吗？| Can We Do Even Better?

------

#### 思路：从2维扩展到3维

之前2维把查询从 $n $ 降到 $2\sqrt{n} $，那如果用**3维**呢？

把数据库排列成 $\sqrt[3]{n} \times \sqrt[3]{n} \times \sqrt[3]{n} $ 的立方体。

------

#### 三阶段查询 | 3 Stages

1. **选列**（Pick column）：$\sqrt[3]{n} $ 个密文
2. **选行**（Pick row）：$\sqrt[3]{n} $ 个密文
3. **选深度**：$\sqrt[3]{n} $ 个密文

**总查询大小：**
$$
\sqrt[3]{n} + \sqrt[3]{n} + \sqrt[3]{n} = 3\sqrt[3]{n} = 3n^{1/3}
$$

------

#### 对比 | Comparison

| 维度 | 查询大小                   |
| ---- | -------------------------- |
| 1维  | $n $                       |
| 2维  | $2\sqrt{n} = 2n^{1/2} $    |
| 3维  | $3\sqrt[3]{n} = 3n^{1/3} $ |

$n = 1,000,000 $ 时：

- 2维：$2000 $ 个密文
- 3维：$300 $ 个密文，**又小了约7倍** ✅

------

#### 规律 | Pattern

维度越高，查询越小——理论上可以一直推广到 $d $ 维，查询大小为 $d \cdot n^{1/d} $。

> 但维度越高，计算复杂度也越高，实际中需要权衡。这就是SimplePIR等方案背后的核心设计思想。

------

## ✅ 四、信息论 PIR（多服务器方案）**Information-Theoretic PIR — Unconditional Privacy

之前的方案依赖同态加密（计算复杂），现在换一个思路：

> 如果有**2个服务器**，且它们**不互相通信（not collude）**，能否不用加密就实现隐私？
>
> ==**信息论PIR——无条件隐私 | Information Theoretic PIR**==
>
> ------
>
> > 
>
> 
>
> 

![image-20260610170217766](/Users/tangjun/Library/Application Support/typora-user-images/image-20260610170217766.png)

### 4.1 前提 Assumption

使用 **2 个互不勾结的服务器**，各持有完整数据库副本。 Two **non-colluding servers**, each holding a full copy of the database.

核心思路：用2个不互通的服务器

之前的方案依赖同态加密（计算复杂），现在换一个思路：

> 如果有**2个服务器**，且它们**不互相通信（not collude）**，能否不用加密就实现隐私？

------

###### 具体例子：想查 index 1（二进制 = `01`）

数据库：

| index | 二进制 |
| ----- | ------ |
| 0     | 00     |
| 1     | 01     |
| 2     | 10     |
| 3     | 11     |

**第一步**：客户随机生成一个掩码，比如 $q_{s1} = \{0, 1\} $（随机子集）

**第二步**：

- 发给Server 1：$q_{s1} $
- 发给Server 2：$q_{s2} = q_{s1} \oplus \{1\} $（加入目标index）

**第三步**：两个服务器各自对自己收到的子集做XOR，返回结果：

- Server 1：$ans_1 = 11 $
- Server 2：$ans_2 = 10 $

**第四步**：客户重建：
$$
ans_1 \oplus ans_2 = 11 \oplus 10 = 01 = x_1 ✅
$$

###### 为什么隐私性成立？

- Server 1只看到随机子集 $q_{s1} $，**完全随机，看不出你要查哪个**
- Server 2只看到 $q_{s2} $，也是随机子集
- 只有把两个答案合并才能得到结果——**单个服务器无法推断index**

------

###### 与之前方案对比

| 方案        | 需要加密？ | 服务器数量    | 隐私基础         |
| ----------- | ---------- | ------------- | ---------------- |
| 同态加密PIR | ✅ 需要     | 1个           | 计算困难性       |
| 信息论PIR   | ❌ 不需要   | 2个（不互通） | 信息论（无条件） |

> "无条件"的意思是：即使服务器算力无限强，也无法破解隐私——不依赖任何计算假设。

------

### 4.2 分布式点函数 Distributed Point Functions (DPF)

### 

------

#### 什么是点函数 | Point Function

$$
P_{a,1}(x) = \begin{cases} 1, & \text{if } x = a \\ 0, & \text{if } x \neq a \end{cases}
$$

就是：只在 $x=a $ 这一个点输出1，其他地方全是0。

> 这正是之前PIR查询向量的本质——在想查的index位置放1，其他放0。

------

#### 分布式点函数 | Distributed Point Function

由两个算法组成：

**Gen**（生成）：
$$
\text{Gen}(a, 1) \rightarrow (k_0, k_1)
$$
把点函数"拆分"成两个密钥 $k_0, k_1 $，分别发给两个服务器。

**Eval**（计算）：
$$
\text{Eval}(k, i) \rightarrow y
$$
每个服务器用自己的密钥对index $i $ 求值。

------

#### 正确性 | Correctness

$$
\text{Eval}(k_0, x) \oplus \text{Eval}(k_1, x) = P_{a,1}(x)
$$

两个服务器的结果XOR起来，等于原始点函数的值：

- $x = a $ 时：$\text{Eval}(k_0, a) \oplus \text{Eval}(k_1, a) = 1 $ ✅
- $x \neq a $ 时：结果 $= 0 $ ✅

------

#### 安全性 | Security

手写：Given only $k_0 $ (or $k_1 $), no information is leaked about the point $a $.

> 单独拿到 $k_0 $ 或 $k_1 $，完全无法推断出 $a $ 是哪个index——这就是隐私性的保证。

------

#### 和PIR的联系

| PIR概念                      | DPF对应                                   |
| ---------------------------- | ----------------------------------------- |
| 查询向量 $[0,0,1,0,\ldots] $ | 点函数 $P_{a,1} $                         |
| 加密查询发给服务器           | 把点函数拆成 $k_0, k_1 $                  |
| 两服务器返回结果合并         | $\text{Eval}(k_0)\oplus\text{Eval}(k_1) $ |

> DPF是信息论PIR的**形式化表达**，把"如何隐藏查询位置"这件事抽象成了一个严格的密码学原语。

------

### 4.3 DPF的具体构造 | DPF Construction

------

#### 设定 | Setup

- 数据库长度 $n$，想查 $a = 2$
- $e_i$ = 第 $i$ 个标准基向量，即只有第 $i$ 位是1，其余为0

$$e_2 = (0, 0, 1, 0, 0, \ldots) \leftarrow \text{第2位是1}$$

------

#### Gen：生成两个密钥

$$\text{Gen}(a=2, 1) \rightarrow (k_0, k_1)$$

生成两个长度为 $n$ 的随机向量，满足：

$$k_0 + k_1 = e_2 = (0,0,1,0,\ldots,0)$$

**例子**（手写）： $$k_0 = (-4, -2, -6, 1, 3, \ldots)$$ $$k_1 = k_0 \text{ 的"补"，使两者之和} = e_2$$

$k_0$ 看起来完全随机，**单独看不出 $a=2$ 在哪里**。✅

------

#### Eval：求值

$$\text{Eval}(k, i) \rightarrow y = \langle k, e_i \rangle$$

即：$k$ 和 $e_i$ 的内积，结果就是 $k$ 的第 $i$ 个分量。

**例子**（手写，$k_0 = (-4,-2,-6,1,3,\ldots)$）：

$$\text{Eval}(k_0, i) = -4\times0 + -2\times0 + -6\times1 + 1\times0 + \ldots = -6$$

------

#### 正确性验证

$$\text{Eval}(k_0, 2) + \text{Eval}(k_1, 2) = k_0[2] + k_1[2] = e_2[2] = 1 ✅$$

两个服务器的结果加起来，正好等于点函数在 $a=2$ 处的值。

------

#### 直觉总结

> $k_0$ 和 $k_1$ 是点函数 $e_2$ 的一个**随机加法拆分**——单独看每一半都是随机噪声，合在一起才能还原出"第2位是1"这个信息。

### 4.3 检索协议 Retrieval Protocol

1. 客户端用 DPF 生成 k₀, k₁，分别发给两个服务器 Client generates k₀, k₁ via DPF and sends one to each serverGen$(a,1) \rightarrow (k_0, k_1) $

2. 服务器 1 计算 `Σ Eval(k₀, i) · D[i]`，服务器 2 计算 `Σ Eval(k₁, i) · D[i]` Each server evaluates its key against the full database

3. 客户端将两个答案相加，结果即 D[a] Client adds both answers to recover D[a]

4. 每个服务器看到的密钥是**随机的**，无法推断 a Each server's key looks random — target a remains hidden

   ![image-20260610171555360](/Users/tangjun/Library/Application Support/typora-user-images/image-20260610171555360.png)

   ### 信息论PIR的完整流程 | Full Information Theoretic PIR

   ------

   #### 场景：想查 $a = 2 $，即 $A[2] $

   ------

   #### 第一步：客户生成密钥

   $$
   \text{Gen}(2, 1) \rightarrow (k_0, k_1)
   $$

   手写例子：
   $$
   k_0 = (4, -2, -6, 9, -3)
   $$

   - $k_0 $ 发给 Server 1
   - $k_1 $ 发给 Server 2

   ------

   #### 第二步：两个服务器各自计算

   **Server 1** 计算：
   $$
   \sum_i \text{Eval}(k_0, i) \cdot A[i]
   $$
   **Server 2** 计算：
   $$
   \sum_i \text{Eval}(k_1, i) \cdot A[i]
   $$
   两者各返回一个数字。

   ------

   #### 第三步：客户合并

   $$
   \sum_i \text{Eval}(k_0,i)\cdot A[i] + \sum_i \text{Eval}(k_1,i)\cdot A[i]
   $$

   因为 $e_2 = (0,0,1,0,0) $，只有第2项存活。

   **为什么隐私成立？**

   - Server 1只看到 $k_0 $，完全随机，**不知道 $a=2 $**
   - Server 2只看到 $k_1 $，也完全随机，**不知道 $a=2 $**
   - 两个服务器**不互相通信**，无法合谋

   > 隐私性不依赖任何计算假设——即使服务器算力无限强也无法破解，这就是"无条件（unconditional）"的含义。

   

------

### 4.4 HE-PIR vs IT-PIR 对比 Comparison

| 维度 Dimension                | HE-PIR                                 | IT-PIR（DPF）                                   |
| ----------------------------- | -------------------------------------- | ----------------------------------------------- |
| 服务器数量 Servers            | 1 个 / Single                          | ≥2 个，互不勾结 / Non-colluding                 |
| 安全假设 Security assumption  | 计算安全（困难问题）/ Computational    | **信息论安全（无条件）/ Information-theoretic** |
| 通信开销 Communication        | 较高（密文较大）/ Higher               | **更低（大数据库优势明显）/ Lower**             |
| 服务器计算 Server computation | 同态操作（慢）/ Homomorphic ops (slow) | 轻量乘加（快）/ Lightweight (fast)              |



## ✅五、真实部署 / Real-world Deployments

| 应用 Application             | 隐藏内容 What It Hides                       |
| ---------------------------- | -------------------------------------------- |
| **Google Safe Browsing API** | 用户查询的具体网址 / Exact URL being checked |
| **Apple Private Relay**      | 用户浏览查询 / User browsing queries         |
| **Cloudflare Oblivious DoH** | DNS 查询内容 / DNS query content             |
| **Signal**                   | 联系人查询元数据 / Contact lookup metadata   |

![Chrome’s Safe Browsing protections just got a lot stronger | PCWorld](https://b2c-contenthub.com/wp-content/uploads/2024/03/Screenshot-2024-03-13-3.41.41-PM.png?w=1200)

![Dns Over Https Cloudflare](https://www.eyerys.com/sites/default/files/odoh-howitworks.png)



**Google Safe Browsing**：只上传哈希前缀，服务器无法知道用户查询的具体 URL。 Only a hash prefix is sent — the server never sees the full URL.

![safebrowsing-hash — Rust web dev library // Lib.rs](https://img.gs/czjpqfbdkz/full/https://raw.githubusercontent.com/jadedblueeyes/safebrowsing-rs/b7eb7e6c5a4cd4b6401da73815664519a2d59b6e/docs/workspace-deps-simplified.svg)

![Google Introduces Enhanced Real-Time URL Protection for Chrome Users](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEguI4h9zWFboPIrvJ8Ev2C0TTN20cTb50iez2Z1suSEHgzdeY_U7xkb9XQHUquHYnLw2JstnCM6IGieEgWU7blqnfs0J4ceQPJUWJDOrQeNkDuCMUr46_FjNRnIJHaz2R4Tv9C2unFiO6wBTmDgpxoECTNxJbSizdT9ekHKZzaFRc63q8yJiNU_eiSWKqxB/s1600/chrome.jpg)

![Chrome’s Safe Browsing protections just got a lot stronger | PCWorld](https://b2c-contenthub.com/wp-content/uploads/2024/03/Screenshot-2024-03-13-3.39.50-PM.png?w=1200)

[Results from the web](https://support.claude.com/en/articles/13641943-visual-and-interactive-content)

------

**Cloudflare Oblivious DoH**：代理隔离客户端与解析器，解析器无法关联查询与真实用户 IP。 A proxy decouples client identity from DNS queries — the resolver never sees the real IP.

![Cloudflare Research: Two Years In](https://blog.cloudflare.com/content/images/2021/10/unnamed--1-.png)

Image unavailable

![Encrypted DNS, Episode II](https://doh.defaultroutes.de/enc-dns-episode2/images/oDoH/12-oDoH-Query-via-Proxy.png)

[Results from the web](https://support.claude.com/en/articles/13641943-visual-and-interactive-content)

------

**Apple Private Relay**：两跳架构，任何一方都无法同时知道"是谁"和"在访问什么"。 Two-hop architecture — no single party can see both identity and destination.

![What Is Apple iCloud+?](https://static1.howtogeekimages.com/wordpress/wp-content/uploads/2024/08/screenshot-2024-08-05-at-13-25-04.png)

![An investigation into Apple’s new Relay network | APNIC Blog](https://blog.apnic.net/wp-content/uploads/2023/01/Figure-1-%E2%80%93-Architecture-of-iCloud-Private-Relay.-.png)

![Cloudflare explains how Apple's iCloud Private Relay feature works](https://media.idownloadblog.com/wp-content/uploads/2022/03/Apple-iCloud-Private-Relay-CloudFlare-illustration.png)

[Results from the web](https://support.claude.com/en/articles/13641943-visual-and-interactive-content)

------

**Signal**：联系人查询通过 SGX（可信执行环境）处理，服务器无法得知用户在查谁。 Contact lookups are processed inside SGX enclaves — the server cannot learn who is being queried.

![SGX EPID & ECDSA Cheat Sheet | imlk's blog](http://blog.imlk.top/images/SGX-a3196a0f115b43e6b125299a00ef48aa/Untitled.png)

Image unavailable

![XPDDS17: Introduction to Intel SGX and SGX Virtualization - Kai Huang ...](https://image.slidesharecdn.com/xpdds17introductiontointelsgxandsgxvirtualization-kaihuangintel-170804150157/75/XPDDS17-Introduction-to-Intel-SGX-and-SGX-Virtualization-Kai-Huang-Intel-5-2048.jpg)

[Results from the web](https://support.claude.com/en/articles/13641943-visual-and-interactive-content)

![image-20260608231451704](/Users/tangjun/Library/Application Support/typora-user-images/image-20260608231451704.png)

------

#### 共同原理 Common Principle

```
将"身份 Identity"与"查询内容 Query content"解耦
Decouple who is asking from what is being asked
```

------

## ✅六、三周知识串联

**Connecting Weeks 4–6**

```
Week 4: PIR          →  如何隐私地"取"云端数据
Week 5: 秘密共享/MPC  →  如何安全地"存"和"算"分布式数据  
Week 6: 同态加密      →  如何在加密数据上直接"计算"
```

PIR 本身就用到了同态加密（Week 6 内容）作为构建模块，三者共同构成**隐私保护云计算**的完整图景。

> **核心 Key Takeaway**：加密数据不等于隐藏访问行为。PIR 保护的是"你在查什么"，而非"数据内容是什么"——这是一个更深层的隐私问题。

#### 三个要点

**1. 从云端检索数据时，隐私很重要**

> 服务器知道你查什么，本身就是隐私泄露——即使数据是加密存储的。

**2. 通信开销是PIR的主要瓶颈**

> 这就是为什么这周花了大量时间讲压缩（2维/3维），目标就是把通信量压下来。

**3. 数据库很大时，信息论PIR比同态加密PIR表现更好**

| 方案             | 通信量                        | 服务器数 |
| ---------------- | ----------------------------- | -------- |
| 同态加密PIR      | $n $个密文（很大）            | 1个      |
| 压缩PIR          | $2\sqrt{n} $或$3\sqrt[3]{n} $ | 1个      |
| 信息论PIR（DPF） | 小，且无条件安全              | 2个      |

> 数据库越大，信息论PIR的优势越明显——通信量小，安全性又最强。

------

#### 代价是什么？

信息论PIR需要**2个不互通的服务器**，现实中不一定能保证——这是它的限制。

------

# 🌸CSEC5615 Week 5 – Securing Data and Application in Cloud Workflow安全计算🌸

23:15

多方在不暴露各自私有输入的情况下共同计算结果。 Multiple parties jointly compute a result without revealing their private inputs.

**核心技术 Core Techniques**：

- **MPC（多方安全计算 Multi-Party Computation）**
- **同态加密 Homomorphic Encryption**：直接在密文上运算 / Compute directly on ciphertext
- **TEE（可信执行环境 Trusted Execution Environment）**：如 Intel SGX



![image-20260608231556967](/Users/tangjun/Library/Application Support/typora-user-images/image-20260608231556967.png)

## ✅一、核心问题：云端存储敏感数据的风险

- ### 单一云服务商存储存在以下威胁 / Storing data with a single cloud provider poses risks:

  - 单点故障 / Single point of failure
  - 数据泄露 / Data breaches
  - 内部人员威胁 / Insider threats
  - 凭证泄露 / Compromised credentials

- ### **传统加密为何不够 Why Traditional Encryption Falls Short**：

  - 密钥管理困难，密钥被盗则加密失效 / Key theft renders encryption useless
  - 数据使用时必须解密，解密状态下仍可被攻击 / Data must be decrypted during use, leaving it exposed
  - 仍然依赖单一云服务商 / Still relies on a single provider

------

##   ✅‼️  ‼️  二、秘密共享（Secret Sharing）

####   核心思想 Core Idea

将秘密 s 拆分成多个份额分发给不同参与方，只有凑齐足够数量的份额才能重构秘密。 Split secret s into shares distributed to multiple parties; only a threshold number of shares can reconstruct it.

#### (t, n) 门限方案 Threshold Scheme

| 参数 Parameter  | 含义 Meaning                                              |
| --------------- | --------------------------------------------------------- |
| n               | 总份额数（云服务商数量）/ Total number of shares          |
| t               | 重构所需最少份额数 / Minimum shares needed to reconstruct |
| < t 份 / shares | 信息论意义上零泄露 / Zero information revealed            |
| ≥ t 份 / shares | 可完整恢复秘密 / Secret fully reconstructed               |

> 类比：少于 t 份的份额，在信息论意义上完全不泄露任何信息——攻击者必须同时攻破多个地点。 Fewer than t shares reveal zero information — the attacker must compromise multiple locations simultaneously.



##### 真实应用 / Real-world Use  秘密共享 适用场景医疗、金融等敏感私密数据   区块链。交易记录、合约等需要公开验证的数据

- DNSSEC"七人守护者"（5/7门限）
- Google Cloud Secret Manager
- HashiCorp Vault
- 加密货币钱包（Coinbase, ZenGo）
- 
- > 区块链解决的是"**大家都能验证、没人能篡改**"，秘密共享解决的是"**没人能看到，但凑齐足够多人才能用**"。

  所以区块链天生不适合存敏感数据——账本是公开的，隐私保护反而是它的弱点，需要额外引入零知识证明（ZKP）等技术才能补上。

  - 

  - > 
    >
    > **DNSSEC 七人守护者 Seven Guardians**
    >
    > ![DNS 101 Miniseries - #8 - The DNSSEC Root Signing Ceremony - the most ...](https://i.ytimg.com/vi/1VqscYMG_Rs/maxresdefault.jpg)
    >
    > ![Introduction to DNSSEC | CodiLime](https://codilime.com/img/root-dnssec-ksk-ceremony-.png)
    >
    > ![DNSSEC Root Signing Ceremony Explained | DNS 101 Miniseries [Ep. 8 ...](https://i.ytimg.com/vi/dC525-8Gy_I/maxresdefault.jpg)
    >
    > [Results from the web](https://support.claude.com/en/articles/13641943-visual-and-interactive-content)
    >
    > 每隔几个月，来自全球不同国家的 7 位"守护者"聚在一个物理安全设施里，各自带着自己的智能卡（份额），凑齐 5 张才能启动 DNS 根密钥签名仪式。这是现实中规模最大的门限方案之一。
    >
    > ------
    >
    > **HashiCorp Vault**
    >
    > ![Add a HashiCorp Vault secret manager | Harness Developer Hub](https://developer.harness.io/assets/images/add-hashicorp-vault-31-9b0cc98da663fec1540325dce60ec65c.png)
    >
    > ![HashiCorp Vault - Manage Secrets & Protect Sensitive Data](https://www.hashicorp.com/_next/image?url=https%3A%2F%2Fwww.datocms-assets.com%2F2885%2F1677792874-products-features-hero-vault.png&w=3840&q=75)
    >
    > ![Learn to use the Vault UI | Vault | HashiCorp Developer](https://developer.hashicorp.com/_next/image?url=https:%2F%2Fcontent.hashicorp.com%2Fapi%2Fassets%3Fproduct%3Dtutorials%26version%3Dmain%26asset%3Dpublic%252Fimg%252Fvault%252Fui%252Fui-vault-dashboard-configuration.png%26width%3D1365%26height%3D928&w=3840&q=75&dpl=dpl_CoB9qQjN4yCbDN2s9NhLj5q9myFG)
    >
    > [Results from the web](https://support.claude.com/en/articles/13641943-visual-and-interactive-content)
    >
    > 企业级密钥管理工具，内置 Shamir 秘密共享——启动时需要多名管理员各输入一个 unseal key（份额），凑齐门限数量才能解锁 Vault。
    >
    > ------
    >
    > **ZenGo 加密货币钱包**
    >
    > ![Zengo Wallet Review 2026: Best Crypto Wallets](https://www.cryptovantage.com/app/uploads/2021/07/Zengo-wallet-1024x521-1.jpg)
    >
    > ![Zengo Wallet Review: Is It Really Secure? - CNC Intelligence](https://s39904.pcdn.co/wp-content/uploads/2025/03/Zengo-Review.webp)
    >
    > ![Wallet crypto : les 5 meilleurs portefeuilles pour Bitcoin](https://www.presse-citron.net/app/uploads/2023/08/Application-Zengo-wallet.jpg)
    >
    > [Results from the web](https://support.claude.com/en/articles/13641943-visual-and-interactive-content)
    >
    > ZenGo 用 MPC 把私钥拆成两份——一份在你手机，一份在 ZenGo 服务器——单独任何一方都无法动用资产，签名时两方协同计算，私钥从未完整出现过。
    >
    > ------
    >
    > 这三个案例刚好覆盖了秘密共享的三种形态：**物理仪式**（DNSSEC）、**企业软件**（Vault）、**消费者产品**（ZenGo）。

    所以区块链天生不适合存敏感数据——账本是公开的，隐私保护反而是它的弱点，需要额外引入零知识证明（ZKP）等技术才能补上。

  23:26

  
#### 具体方案一：(2,2) 秘密共享 (2,2) Secret Sharing

  基于一次性密码本 OTP / Based on One-Time Pad

  **生成份额 Share**：随机采样 s₁，令 s₂ = s₁ ⊕ s **重构 Reconstruct**：m = s₁ ⊕ s₂

  > 单独持有任意一份，对 s 一无所知。/ Either share alone reveals nothing about s.

------

#### 具体方案二: Shamir 秘密共享 Shamir's Secret Sharing

  ##### 核心思想 Core Idea

  秘密 s 藏在多项式的常数项 f(0)，份额是多项式上的各个点。 The secret s is hidden as the constant term f(0); each share is a point on the polynomial.

  ##### 数学工具 Math

  给定 t 个点，唯一确定一条 t-1 次多项式——用**拉格朗日插值**还原。 Given t points, a unique degree-(t-1) polynomial is determined — reconstruct via Lagrange interpolation.

  ```
  f(x) = y₁ℓ₁(x) + y₂ℓ₂(x) + ··· + y_t ℓ_t(x)
  ```

  所有运算在有限域 ℤp 上进行。/ All operations over finite field ℤp.

  ##### 方案步骤 Scheme（以 (5,7) 为例）

  **Share(m)**：选随机 4 次多项式 f，令 f(0) = m，第 i 份份额 = (i, f(i) mod p) **Reconstruct**：任意 5 份份额 → 拉格朗日插值 → 输出 f(0)

  ##### 数值例子 Numerical Example

  m = 7，p = 11，f(x) = x² + 4x + 7，(3, n) 方案

  | 份额 Share | 计算 Calculation | 结果 mod 11 |
  | ---------- | ---------------- | ----------- |
  | s₁ = f(1)  | 1 + 4 + 7 = 12   | **1**       |
  | s₂ = f(2)  | 4 + 8 + 7 = 19   | **8**       |
  | s₃ = f(3)  | 9 + 12 + 7 = 28  | **6**       |

  任意 3 份 → 插值还原 → f(0) = **7** ✓ Any 3 shares → Lagrange interpolation → f(0) = 7 ✓

  #### (2,2) OTP vs Shamir 对比 Comparison

  |                      | (2,2) OTP              | Shamir (t,n)                        |
  | -------------------- | ---------------------- | ----------------------------------- |
  | 门限灵活性 Threshold | 固定 2/2 / Fixed       | 任意 t/n / Flexible                 |
  | 数学工具 Math        | 异或 XOR               | 多项式插值 Polynomial interpolation |
  | 安全性 Security      | 信息论安全 / IT-secure | 信息论安全 / IT-secure              |
  | 扩展性 Scalability   | 不支持 / No            | 任意 n / Yes                        |

------

##   ✅‼️  ‼️  三、安全多方计算（SMPC）**Secure Multi-Party Computation**

### 问题动机 / Motivation

多个互不信任的参与方希望**联合计算**一个函数，同时**不泄露各自的输入**。Multiple mutually-distrusting parties want to **jointly compute** a function without **revealing individual inputs**.

经典例子：**姚氏百万富翁问题**（Yao, 1982）— 两人想知道谁更富有，但不想透露具体财富。Classic example: **Millionaire's Problem** (Yao, 1982) — who is richer, without revealing actual wealth.

通用形式：P₁(x₁), P₂(x₂), ..., Pₙ(xₙ) 联合计算 f(x₁, x₂, ..., xₙ)

### 安全性定义 / Security Definition

**真实视图 ≈ 理想视图** / Real view ≈ Ideal view

即参与方在真实协议中看到的信息，与理想可信第三方模型中看到的信息在计算上不可区分。

What parties see in the real protocol is computationally indistinguishable from an ideal trusted-party computation.

### BGW 协议（1988）/ BGW Protocol

- 各方用 Shamir 秘密共享分发自己的输入

- **加法**：各方直接将自己的份额相加，无需交互

- **乘法**：需要一轮交互，但安全性维持

- 最终结果仅在协议结束时由授权方重构

  

  #### 核心流程 Protocol Steps

  **输入阶段 Input phase**：各方用 Shamir 秘密共享分发自己的输入。 Each party distributes their input via Shamir secret sharing.

  **计算阶段 Computation phase**：

  | 操作 Operation      | 交互 Interaction     | 原理 How                                                     |
  | ------------------- | -------------------- | ------------------------------------------------------------ |
  | 加法 Addition       | 无需交互 / None      | 各方直接将份额相加 / Parties add their shares locally        |
  | 乘法 Multiplication | 需要一轮 / One round | 份额相乘后重新分发以降次 / Shares multiplied then re-shared to reduce degree |

  **重构阶段 Reconstruction**：最终结果仅在协议结束时由授权方重构，计算过程中没有任何一方能看到他人的私有输入。 The result is only reconstructed at the end — no party learns anyone else's private input during computation.

  ------

  #### 数学解释 Mathematical Explanation

  设两方各持有秘密 a 和 b，分别用 Shamir 共享： Suppose two parties hold secrets a and b, each shared via Shamir:

  **加法 Addition**：

  ```
  f(x) + g(x) = h(x)，其中 h(0) = a + b
  ```

  各方直接将自己的份额 fᵢ + gᵢ 相加，结果就是 h(x) 的份额——**无需通信**。 Each party adds their own shares locally — no communication needed.

  **乘法 Multiplication**：

  ```
  f(x) · g(x) = h(x)，其中 h(0) = a · b
  ```

  但 f(x)·g(x) 的次数变为 2(t-1)，超过门限——需要一轮交互重新降次。 The product's degree doubles to 2(t-1), exceeding the threshold — one round of interaction is needed to reduce the degree back.

  ------

  #### 安全性保证 Security Guarantee

  > 在诚实多数假设下（t < n/2），任何少于 t 方的联合无法获得任何私有输入的信息。 Under honest majority (t < n/2), any coalition of fewer than t parties learns nothing about private inputs.

  

------

## 六、案例分析：Capital One 数据泄露（2019）

**Case Study: Capital One Breach**

攻击者利用 WAF 配置错误，访问存储在 Amazon S3 的超1亿条客户 PII 记录

**根本问题**：数据集中存储，单一访问控制失效即全盘皆失

**秘密共享的对策**：将数据/密钥分散存储于多个云区域，攻破单一区域无法获取完整数据

**Capital One 总部 / HQ**

![Visit the Capital One Center](https://uploads-ssl.webflow.com/629f870cdf4cb875d4864ef3/629f870cdf4cb8bb698650d2_Capital_One_15-M2-tower.jpg)

![Capital One Headquarters – Block B – Enclos](https://enclos.com/wp-content/uploads/2020/07/ENCLOS_Projects_TysonsHQs_BlockA_10_3000x1500-scaled.jpg)

![Capital One Headquarters – Block A – Enclos](https://enclos.com/wp-content/uploads/2023/03/ENCLOS_Projects_CapitalOneBlockA_3000x1500_19-scaled.jpg)

[Results from the web](https://support.claude.com/en/articles/13641943-visual-and-interactive-content)

**2019年数据泄露新闻报道 / 2019 Breach News Coverage**

![Breach Detection | Stellar Cyber](https://stellarcyber.ai/wp-content/uploads/2019/08/capital-one-data-breach2.jpg)

![What to know about the Capital One data breach | FOX 5 New York](https://images.foxtv.com/static.fox5ny.com/www.fox5ny.com/content/uploads/2019/09/1280/720/Capital_One_data_breach_0_7560670_ver1.0.jpg?ve=1&tl=1)

![Massive data breach hits Capital One affecting 100 million people ...](https://media.cbs8.com/assets/KING/images/2e78b018-98cd-4039-8344-0f7152cc4ff3/2e78b018-98cd-4039-8344-0f7152cc4ff3_1920x1080.jpg)

[Results from the web](https://support.claude.com/en/articles/13641943-visual-and-interactive-content)

**攻击路径：WAF 配置错误 → S3 / Attack path: WAF misconfiguration → S3**

![Amazon S3 Bucket Security Risks | AWS Misconfigurations | Qualys](https://ik.imagekit.io/qualys/wp-content/uploads/2023/12/Block-Public-Access43.png)

![Aws Describe-Buckets Example at Alexander Feakes blog](https://d2908q01vomqb2.cloudfront.net/fc074d501302eb2b93e2554793fcaf50b3bf7291/2021/08/02/Fig1-S3-Object-1024x540.png)

![How To Connect To Aws S3 Bucket Using Powershell at Oscar Betts blog](https://d2908q01vomqb2.cloudfront.net/1b6453892473a467d07372d45eb05abc2031647a/2017/06/21/Step_Functions_S3_Bucket_Arch-1.png)

[Results from the web](https://support.claude.com/en/articles/13641943-visual-and-interactive-content)

------

### 六、案例分析 Case Study — Capital One (2019)

**攻击路径 Attack path**：

```
WAF 配置错误 → 获取 IAM 角色凭证 → 访问 S3 → 泄露 1 亿条 PII
WAF misconfiguration → IAM role credentials → S3 access → 100M PII records exposed
```

**根本问题 Root cause**：数据集中存储，单一访问控制失效即全盘皆失。 Centralised storage — one access control failure exposed everything.

**秘密共享对策 Secret sharing countermeasure**：将数据/密钥分散存储于多个云区域，攻破单一区域无法获取完整数据。 Distribute data/keys across multiple cloud regions — compromising one region is not enough.









> > 🤔全世界的canvas被俄罗斯攻击是因为什么呢🤔
> >
> > ## ShinyHunters 在 Canvas 主页上留下的勒索信截图。 攻击时间点卡在期末考试周，全美数千所学校受影响。 ShinyHunters 在暗网开设的数据泄露站点，专门用来发布或出售窃取的数据。
> >
> > ![Cyber Intel Brief: ShinyHunters Claims Breach of Canvas LMS](https://www.dataminr.com/wp-content/uploads/2026/05/Screenshot-2026-05-05-at-12.04.52-PM-1020x1024.jpg)
> >
> > ![Cushman & Wakefield hit in ShinyHunters claim | Cybernews](https://media.cybernews.com/images/1024w/2026/04/ShinyHunters6victims.png)
> >
> > ![ShinyHunters claims attack on top US investment advisors | Cybernews](https://media.cybernews.com/images/1500w/2026/02/ShinyHunters-alleged-breach-of-Mercer-advisors-Beacon-Pointe-Advisors.png)
> >
> > [Results from the web](https://support.claude.com/en/articles/13641943-visual-and-interactive-content)
> >
> > ShinyHunters 在 Canvas 主页上留下的勒索信截图。
> >
> > ![Canvas outage tied to cyberattack disrupts finals week at OSU | News ...](https://bloximages.newyork1.vip.townnews.com/ocolly.com/content/tncms/assets/v3/editorial/a/cb/acb3c317-89c7-47e4-a3df-058d54ea9b05/69fcffb419a9e.image.jpg?resize=1249%2C1660)
> >
> > ![Canvas outage tied to cyberattack disrupts finals week at OSU | News ...](https://bloximages.newyork1.vip.townnews.com/ocolly.com/content/tncms/assets/v3/editorial/a/cb/acb3c317-89c7-47e4-a3df-058d54ea9b05/69fcffb419a9e.image.jpg?crop=3072%2C1613%2C0%2C1233&resize=1200%2C630&order=crop%2Cresize)
> >
> > ![Canvas outage impacts thousands of schools, universities: Hacker group ...](https://images.foxtv.com/static.fox5dc.com/www.fox5dc.com/content/uploads/2026/05/764/432/canvasoutage.png?ve=1&tl=1)
> >
> > [Results from the web](https://support.claude.com/en/articles/13641943-visual-and-interactive-content)
> >
> > 攻击时间点卡在期末考试周，全美数千所学校受影响。
> >
> > ![Salesforce-Related Data Breach Affecting Multiple Companies](https://socradar.io/wp-content/uploads/2025/08/shintyhunters.png.webp)
> >
> > Image unavailable
> >
> > ![Infinite Campus warns of breach after ShinyHunters claims data theft](https://www.bleepstatic.com/images/news/u/1220909/2026/March/shiny.jpg)
> >
> > [Results from the web](https://support.claude.com/en/articles/13641943-visual-and-interactive-content)
> >
> > ShinyHunters 在暗网开设的数据泄露站点，专门用来发布或出售窃取的数据。
> >
> > ------
> >
> > 时间线总结：
> >
> > - **4月25日**：攻击者入侵 Canvas 系统
> >
> > - **4月29日**：Instructure 发现入侵并切断访问
> >
> > - **5月1日**：公开披露
> >
> > - **5月7日前后**：期末考试周，各大学 Canvas 主页出现勒索信，影响超 3000 万用
> >
> > - ------
> >
> >   #### 攻击原因 Root Causes
> >
> >   **第一次（2025年9月）**：ShinyHunters 通过社会工程学攻击入侵了 Instructure 的 Salesforce 环境。 Instructure 重置了凭证，但没有从根本上修复架构问题。 [Reed Smith](https://www.reedsmith.com/articles/canvasinstructure-cyberattack-key-developments-and-action-items-for-higher-education-institutions/)
> >
> >   **第二次（2026年4月，也就是这次）**：攻击者利用了"教师免费账户（Free-For-Teacher）"项目的漏洞——该程序允许教育者无需机构验证即可创建 Canvas 账户，导致 FFT 账户与正式机构账户之间的信任边界过弱。 [Rescana](https://www.rescana.com/post/shinyhunters-launches-second-major-attack-on-instructure-canvas-lms-via-free-for-teacher-accounts-may-2026-breach-analys)
> >
> >   更具体地说，ShinyHunters 通过用户生成内容注入了恶意 JavaScript（存储型 XSS），利用已认证的管理员会话横向进入更广泛的平台——根本问题在于 FFT 账户和机构账户共享同一底层基础设施。 [Spartanssec](https://www.spartanssec.com/post/shinyhunters-canvas-breach-what-we-can-learn-from-it)
> >
> > ------
> >
> >   和课程的关联
> >
> >   这个案例几乎完美对应你学的内容：
> >
> >   | 攻击手法                  | 对应课程概念                |
> >   | ------------------------- | --------------------------- |
> >   | 社会工程学入侵 Salesforce | 访问控制失效 / IAM 问题     |
> >   | FFT 账户验证缺失          | 最小权限原则被违反          |
> >   | 存储型 XSS                | 应用层安全漏洞              |
> >   | 同一底层基础设施          | 单点故障 / 秘密共享的必要性 |
> >
> >   同一攻击路径（Salesforce 配置错误）此前已被 ShinyHunters 用于攻击 McGraw-Hill、Amtrak、ADT 等多家公司——这是一个有据可查的重复攻击模式，Instructure 在第一次被攻击后并没有真正解决根本问题。 [Sentra](https://sentra.io/blog/the-instructure-breach-was-salesforce-again-heres-the-governance-problem-nobody-is-talking-about)

------

## 七、Week 5 与 Week 6 的联系

**Connection to Week 6**

|          | Week 5: 秘密共享 & MPC | Week 6: 同态加密         |
| -------- | ---------------------- | ------------------------ |
| 数据状态 | 分布式存储             | 加密存储于云端           |
| 计算方式 | 多方协作交互           | 单方直接在密文上计算     |
| 局限     | 需要多方通信，开销大   | 噪声累积，计算慢         |
| 适用场景 | 联合分析、投票         | 隐私AI推理、医疗数据分析 |

> **核心外卖 / Key Takeaway**：不要将信任集中于单一实体。秘密共享分散信任，MPC 在分散数据上安全计算，二者共同构成云安全隐私计算的基础。

------

# 🌸第六周：CSEC5615 Week 6 – Advanced Data and Application Protection Strategies🌸

**高级安全技术（Advanced Security Techniques）** 包括零知识证明（ZKP）、属性加密（ABE）、秘密共享（Secret Sharing）等，用于在云环境中实现细粒度访问控制和隐私保护。

------

## ✅一、核心问题：如何在不解密的情况下对数据进行计算？

**云环境中，敏感数据需要被处理，但又不能暴露明文。 How to compute on data without decrypting it?**



**已知方案**：Secret Sharing + MPC → 可以安全多方计算，不暴露各方输入

之前学过的**多方安全计算（MPC**）虽然可行，但存在以下局限：

In cloud environments, sensitive data needs to be processed without exposing plaintext. Previously learned MPC has limitations:

- 需要多方之间频繁交互 / Requires **interaction** among multiple parties
- 通信开销大 / High communication **overhead**
- 不适合大规模云计算 / Not efficient for **large-scale cloud operations**

------

##   ✅‼️  ‼️ 二、同态加密（Homomorphic Encryption, HE）　without 　interaction



允许直接对**加密数据**进行计算，**无需解密** Allows direct computation on encrypted data without decryption.

Week 4已见过，用于构建PIR（私有信息检索 Private Information Retrieval） We saw already for building PIR (Week 4).

### 三种类型 / Three Types

| 类型          | Type                  | 支持操作                                                     |
| ------------- | --------------------- | ------------------------------------------------------------ |
| 部分同态 PHE  | Partially Homomorphic | 仅加法或仅乘法supports limited operation(addition or multiplication) |
| 有限同态 SWHE | Somewhat Homomorphic  | 有限次操作（噪声累积）few operation before noise accumulates |
| 全同态 FHE    | Fully Homomorphic     | 任意计算 arbitrary computations                              |

**目标 Goal:** 在不暴露底层明文的情况下，对云端加密数据进行函数计算 Compute functions on encrypted cloud data without revealing the underlying plaintext.

### 同态加密实战 Homomorphic Encryption in Action

------

**应用场景：隐私保护医疗数据分析** **Example Use Case: Privacy-Preserving Medical Data Analysis**

流程三步：

- 医院将病人数据**加密后**上传云端 A hospital encrypts patient data before storing it in the cloud.
- 研究机构向云端发起查询，运行统计计算，**全程不解密** A research institute queries the cloud to run statistical computations without ever decrypting the data.
- 结果**只由授权方解密** The results are decrypted only by authorized parties.

**优势：数据在整个计算过程中始终保持机密** **Advantage: Data remains confidential throughout computation.**

------

**手写图的含义：**

![image-20260608210227272](/Users/tangjun/Library/Application Support/typora-user-images/image-20260608210227272.png)

即：明文x加密→云端在密文上算f→得到ct_f→授权方解密→得到f(x)，和直接对x算f结果一样。

### 形式化定义 / Formal Definition

在标准公钥加密（Gen, Enc, Dec）基础上，增加一个**Eval算法**：

On top of standard public key encryption, add an **Eval algorithm**:

> ```
> c* ← Eval(pk, f, c₁, ..., cₗ)
> ```

Eval是**公开操作**，无需私钥。/ Eval is a **public operation** — no secret key needed.

**第一部分：回顾标准公钥加密的三个算法**

| 算法                | 输入             | 输出                 |
| ------------------- | ---------------- | -------------------- |
| **Gen**（密钥生成） | 安全参数 1^λ     | 密钥对 (pk, sk)      |
| **Enc**（加密）     | 公钥 pk + 消息 μ | 密文 c               |
| **Dec**（解密）     | 私钥 sk + 密文 c | 消息 μ，或 ⊥（失败） |

这是之前Week 2-3学过的标准内容，这里只是**回顾铺垫**。

------

**第二部分：同态加密新增的算法 Eval**

在上面三个算法的基础上，HE**额外增加一个算法**：

> **Eval(pk, f, c₁, …, c_l) → c***

- 输入：公钥 pk + 函数 f + 一组密文 c₁…c_l
- 输出：新密文 c*（即 f 作用在明文上的结果的加密）

------

**手写注释 "efficient" 的含义：**

老师特别标注 PPT = **Probabilistic Polynomial Time（概率多项式时间）**，意思是 Eval 必须是**高效可计算的**——不能因为要在密文上计算就变得无比慢，这是 HE 实用性的核心要求。

------

**关键区别：Eval 不需要私钥**

Enc 和 Dec 分别需要 pk 和 sk，但 **Eval 只需要 pk**——这正是云端可以执行 Eval 的原因，云端没有私钥，却能在密文上完成计算。

![image-20260608210542344](/Users/tangjun/Library/Application Support/typora-user-images/image-20260608210542344.png)

------

**核心结论：同态计算是公开操作，不需要私钥** Homomorphic Evaluation is a public operation — no secret key needed

------

**定义2：C-同态加密**

如果一个加密方案对函数类 C 中的所有函数 f 都满足以下条件，则称其为 **C-同态的**：

**完整流程（右侧条件）：**

1. `(pk, sk) ← Gen(1^λ)` — 生成密钥对
2. `c₁ ← Enc(pk, μ₁), …, c_l ← Enc(pk, μ_l)` — 分别加密每条消息（手写标注 μ₁…μ_l）
3. `c ← Eval(pk, f, c₁, …, c_l)` — **用公钥**对密文执行函数 f
4. `μ* ← Dec(sk, c)` — 解密结果

**正确性要求（左侧）：**

> Pr[ μ* = f(μ₁, …, μ_l) ] = 1 − negl(λ)

解密结果 μ* 等于直接对明文算 f 的结果，概率为 **1 − negl(λ)**

------

**手写注释 "99.999%" 的含义：**

`1 − negl(λ)` 就是"**几乎必然正确**"——negl(λ) 是可忽略的失败概率，实际上无限接近于0，老师用 99.999% 来直观说明这个概率极高。

------

**最后一句：**

> 若 C 是**所有函数**的集合 → 称为**全同态加密 FHE**

C 越大，支持的计算越多：PHE（加法或乘法）→ SWHE（有限次）→ FHE（任意函数）

###  General Idea — 同态加密的核心思想

![image-20260608210731315](/Users/tangjun/Library/Application Support/typora-user-images/image-20260608210731315.png)

------





**标题箭头：Structured keys → Public key encryption（pk ↔ sk）**

HE 建立在公钥加密基础上，密钥必须有**结构性**（不是随机的），这个结构才能支撑密文上的计算。

------

**两大核心要素：**

**1. Structured keys（结构化密钥）**

- pk 和 sk 之间有数学关系
- 这个结构使得 Eval 在密文上操作后，Dec 仍能正确还原

**2. Randomness, blinding factor and message encoding（随机性、盲化因子、消息编码）**

手绘图解释了加密的三个步骤，输入随机数 r：

| 步骤 | 内容                            |
| ---- | ------------------------------- |
| keys | 密钥结构                        |
| r    | 随机数（引入不可预测性）        |
| →    | 输出 Blinding Factor（BF_r,pk） |

- **Blinding Factor（盲化因子）**：用随机数 r 和公钥 pk 生成，作用是**掩盖明文**，让攻击者无法从密文推断消息
- 右侧注释："format. Not give security easily → message"
  - 意思是：盲化因子本身只是**格式/结构**，不能轻易从中还原出消息，这才保证了安全性

**3. Encoded message（编码消息）**

- 消息在加密前需要先**编码**成特定格式
- 编码后的消息再与盲化因子结合，才形成最终密文

------

**整体逻辑总结：**

```
明文 μ
  → 编码（Encoded message）
  → 与 Blinding Factor（由 r + pk 生成）结合
  → 密文 c
```

三者缺一不可：结构化密钥提供数学基础，随机数保证语义安全（CPA安全），编码保证消息格式正确可计算。

------

## ❓三、几种具体方案 / Specific Schemes

### 1. RSA（乘法同态 / Multiplicative）



```
Enc(m₁) · Enc(m₂) = Enc(m₁ · m₂)
```

但教科书RSA不安全（非CPA安全），安全变体是否同态是开放问题。

Textbook RSA is insecure (not CPA-secure); whether secure variants are homomorphic is an open problem.

![image-20260608210804172](/Users/tangjun/Library/Application Support/typora-user-images/image-20260608210804172.png)

**Limited Homomorphism — RSA 的有限同态性**

------

**核心公式（乘法同态）：**

```
Enc(m₁) · Enc(m₂) = m₁ᵉ · m₂ᵉ = (m₁m₂)ᵉ = Enc(m₁ · m₂)
```

手写补充（e=3 为例）：

- 密文 c₁ = m₁ᵉ，密文 c₂ = m₂ᵉ
- 两个密文直接相乘 → 等价于对明文乘积加密
- **Eval 算法就是：把两个密文相乘**

------

**但有一个关键问题：**

| 版本                        | 安全性              | 同态性         |
| --------------------------- | ------------------- | -------------- |
| Textbook RSA（教科书RSA）   | ❌ 不安全（Not CPA） | ✅ 天然乘法同态 |
| Variants of RSA（安全变体） | ✅ 安全              | ❓ Open problem |

**手写框的含义：Open problem — homomorphic?**

安全的 RSA 变体（如 OAEP padding）是否仍然同态，是**开放问题**——目前没有证明安全变体能保留同态性。

------

**结论：**

RSA 是**有限同态**的典型例子——只支持乘法，不支持加法，且安全版本与同态性之间存在矛盾，这正是为什么需要专门设计 HE 方案（如 Paillier、Regev）的原因。





### 2. Paillier 加密（加法同态 / Additive）

- 基于**判定性复合剩余假设** / Based on Decisional Composite Residuosity (DCR)

- `ct₁ · ct₂ mod N² = Enc(m₁ + m₂)`

- 应用：**电子投票** / Used in **e-voting**

  ![image-20260608212126210](/Users/tangjun/Library/Application Support/typora-user-images/image-20260608212126210.png)**Paillier 加密方案（加法同态）— 用于电子投票**

  ------

  **Gen（密钥生成）：**

  | 步骤               | 说明                     |
  | ------------------ | ------------------------ |
  | p, q 为 λ-bit 素数 | λ → 2048（现代安全参数） |
  | N = p·q            | → 公钥 public key        |
  | g = N+1            | → 公钥的一部分           |
  | φ(N) = (p-1)·(q-1) | → 私钥 secret key        |

  **Encryption（加密）：**

  - 消息 m < N
  - 随机采样 r < N，r 来自 Z*_N
  - 密文 = **g^m · r^N mod N²**

  手写标注：

  - **g^m** = message encoding（消息编码部分）
  - **r^N** = Blinding factor（盲化因子，隐藏明文）

  ------

  **Eval（同态计算）：**

  已有两个密文：

  ```
  ct₁ = g^m₁ · r₁^N mod N²
  ct₂ = g^m₂ · r₂^N mod N²
  ```

  **两密文相乘 mod N²：**

  ```
  ct₁ · ct₂ mod N² = (g^m₁ · r₁^N) · (g^m₂ · r₂^N)
                   = g^(m₁+m₂) · (r₁·r₂)^N
                   = Enc(m₁ + m₂)
  ```

  → 密文相乘 = 明文相加，实现**加法同态**

  ------

  **安全性基础（绿色手写）：**

  - 安全性依赖 **DCR（Decisional Composite Residuosity，判定性复合剩余假设）**
  - 证明安全需要：Z ← Z*_N²，且 r 从 Z*_N 中采样
  - 密文 r^N mod N² 中，r 被隐藏，攻击者无法还原

  ------

  **为什么用于电子投票：**

  每票加密为 0 或 1，云端对所有密文**同态相乘**（= 明文相加），一次解密即得总票数，全程无需解密个人票据。

### 3. ElGamal 加密

- 在 ℤp* 上的**乘法同态** / Multiplicative homomorphic over ℤp*



### 4. Regev 加密（基于LWE / Based on LWE）

- 基于**格密码学**，非数论 / Based on lattices, not number theory
- 具备**后量子安全性** / Post-quantum secure
- 核心思想：加入受控噪声 / Key idea: add controlled noise
- ![image-20260608210058106](/Users/tangjun/Library/Application Support/typora-user-images/image-20260608210058106.png)
- ![image-20260608210042511](/Users/tangjun/Library/Application Support/typora-user-images/image-20260608210042511.png)

------

## 四、LWE问题（Learning With Errors）

系统方程 `s·A + e = b`，在加入小随机误差 **e** 后，即使对量子计算机也难以求解。

The system `s·A + e = b` becomes computationally hard even for quantum computers once small random error **e** is added.

- **LWE搜索问题**：给定 (A, b)，找 s / Find **s** given (A, b)
- **LWE判定问题**：区分 (A, b=sA+e) 与随机 / Distinguish (A, b) from random
- LWE假设 ⟹ **CPA安全性** / LWE assumption ⟹ CPA security
- ![image-20260608205945269](/Users/tangjun/Library/Application Support/typora-user-images/image-20260608205945269.png)

### Regev加密方案 / Regev Encryption

- **密钥生成**：采样秘密向量 s
- **加密**：`c = (a, aᵀs + e + μ·⌊q/2⌋)`，μ为消息位
- **解密**：计算 `c₂ - sᵀa`，判断是否接近 0 或 q/2

**优点 / Strengths：** 抗量子、支持加法同态
 **缺点 / Weaknesses：** 密文较大、噪声积累导致操作受限

------

## 五、全同态加密（FHE）的突破

长达30年的开放问题，被 **Craig Gentry 于2008年解决**，被称为密码学"圣杯"。

An open problem for 30 years, solved by **Craig Gentry in 2008** — considered the "Holy Grail" of cryptography. Builds on top of Regev's encryption.

### 现实应用 / Real-world Implementations

- **Microsoft SEAL**
- **ZAMA Concrete**
- **IBM FHE**

------

## 六、课堂问题答案 / Quiz Answers

**Q1：计算平均薪资需要什么同态？** → **A) 加法同态** — 平均值 = 加总 ÷ 人数，云端可同态相加密文，再由授权方解密。

**Q2：电子投票如何利用同态加密？** → 每票加密为 0 或 1，云端对密文**同态相加**，得到各候选人票数密文，只需一次解密即可获得结果，全程无需解密个人票据。所需：**加法同态**。优势：隐私保护 + 可验证性。

------

> 关键外卖 / **Key Takeaway**：同态加密让云端在"看不见"数据的情况下完成计算，是隐私保护计算的核心技术。

------

# 🌸CSEC5615 Week 7 — 安全与可验证云计算总结🌸

**可验证计算（Verifiable Computation）** 允许客户端将计算外包给云服务器，并能验证结果正确性而无需重新计算，常用技术为 **zk-SNARKs**（零知识简洁非交互知识论证）。

------

## ✅1. 背景回顾 / Background Review — 已学内容的局限性==总结==

**中文：** 在本周之前，课程已经学习了多种安全技术，但每种都有其局限性：

**English:** Before this week, the course covered several security techniques, each with limitations:

| 技术                            | 示例                               | 局限性                                 |
| ------------------------------- | ---------------------------------- | -------------------------------------- |
| **数字签名** Digital Signatures | 云服务签署计算结果证明来源         | 只证明来源，不保证计算正确性           |
| **私有信息检索 PIR**            | 从云端检索医疗记录不暴露查询内容   | 保护查询隐私但不验证返回数据是否正确   |
| **秘密共享** Secret Sharing     | 密钥分散存于多个云提供商           | 保证可用性和机密性，但不保证计算正确性 |
| **多方计算 MPC**                | 银行联合计算欺诈统计不暴露个人交易 | 需要多方交互，通信成本高               |
| **同态加密 HE**                 | 医院加密患者数据交给云端AI分析     | 保证隐私但不验证云端计算是否正确执行   |

**核心差距 / Key Gap:**

> 我们能保持数据私密并安全计算，但如何在**不重做整个计算**的情况下验证结果的正确性？
>
> We can keep data private and compute securely, but how do we verify correctness **without rerunning the entire computation**?
>
> **核心一句话：**
>  这些技术都能保护隐私、身份或可用性，但共同问题是：**不能直接保证云返回的计算结果是正确的。**
>
> 
>
> | 数据状态                       | 含义                                 | 主要风险                               | 常用保护方式                     |
> | ------------------------------ | ------------------------------------ | -------------------------------------- | -------------------------------- |
> | **Data in transit 传输中数据** | 数据正在客户端、服务器、API 之间传输 | 被窃听、MITM 中间人攻击                | TLS / SSL、加密通信、数字证书    |
> | **Data at rest 静态数据**      | 数据存储在数据库、云存储、备份中     | 数据泄露、配置错误、内部人员访问       | AES 加密、KMS 密钥管理、访问控制 |
> | **Data in use 使用中数据**     | 数据正在被应用、云服务或 AI 模型处理 | 内存泄露、云服务商看到明文、侧信道攻击 | MPC、HE、TEE、ZKP 等高级技术     |
>
> | 技术                                                  | 作用                                 | 例子                                    | 局限                                 |
> | ----------------------------------------------------- | ------------------------------------ | --------------------------------------- | ------------------------------------ |
> | **Symmetric Encryption 对称加密 / 私钥加密**          | 同一个密钥加密和解密，保护机密性     | AES 加密云存储、数据库、备份            | 密钥分发困难；密钥泄露就失效         |
> | **Public-Key Encryption 公钥加密**                    | 公钥加密，私钥解密，解决初次密钥共享 | 用服务器公钥加密 AES 会话密钥           | 比 AES 慢，不适合大文件              |
> | **Key Exchange 密钥交换**                             | 在不安全网络中协商共享密钥           | Diffie-Hellman / TLS 握手生成会话密钥   | 需要防 MITM，通常要配合证书          |
> | **Hash Function 哈希函数**                            | 生成固定长度摘要，检查数据完整性     | SHA-256 检查文件是否被篡改              | 不能加密，不能隐藏原文               |
> | **MAC / HMAC 消息认证码**                             | 用共享密钥验证消息完整性和来源       | API 请求带 HMAC，服务器验证请求没被改   | 双方必须共享同一个密钥               |
> | **Digital Signature 数字签名**                        | 私钥签名，公钥验证，证明来源和完整性 | 云服务商给计算结果签名                  | 只能证明来源，不能证明结果正确       |
> | **Digital Certificate / PKI 数字证书 / 公钥基础设施** | 把公钥和真实身份绑定                 | HTTPS 证书证明网站公钥属于该网站        | 依赖 CA；证书泄露或错误签发会出问题  |
> | **KMS / HSM 密钥管理**                                | 安全生成、存储、轮换、保护密钥       | AWS KMS / Azure Key Vault 管理 AES 密钥 | 仍要正确配置权限；KMS 本身也要被信任 |
> | **TLS / IPSec 安全通信协议**                          | 保护传输中数据，防窃听和篡改         | 浏览器访问 HTTPS 网站                   | 协议配置错误会降低安全性             |
>
> | （简单点）技术                               | 作用                                             | 例子                                           | 局限                                 |
> | -------------------------------------------- | ------------------------------------------------ | ---------------------------------------------- | ------------------------------------ |
> | **Symmetric Encryption 对称加密 / 私钥加密** | 用同一个密钥加密和解密，保护数据机密性           | AES 加密云存储文件、数据库、备份               | 密钥分发困难；如果密钥泄露，加密失效 |
> | **Public-Key Encryption 公钥加密**           | 用公钥加密，只有私钥能解密，解决初次密钥共享问题 | 用户用服务器公钥加密会话密钥，服务器用私钥解密 | 比 AES 慢，不适合直接加密大文件      |
> | **Hash Function 哈希函数**                   | 把任意长度数据变成固定长度摘要，用来检查完整性   | 下载文件后比对 SHA-256 hash，确认文件没被改    | 不能恢复原文；本身不提供机密性       |
>
> | 技术                           | 作用                             | 例子                                           | 局限                                   |
> | ------------------------------ | -------------------------------- | ---------------------------------------------- | -------------------------------------- |
> | **MPC 多方安全计算**           | 多方一起计算，但不暴露各自输入   | 多家银行联合计算欺诈检测数据，但不暴露单笔交易 | 通信成本高，需要多方交互               |
> | **HE 同态加密**                | 在不解密的情况下，对密文进行计算 | 医院把加密病人数据发给云端做 AI 分析           | 保护隐私，但不能保证云算得对           |
> | **Digital Signature 数字签名** | 证明结果来自可信来源             | 云服务商给计算结果签名，证明是它发的           | 只能证明来源，不能证明结果正确         |
> | **PIR 私有信息检索**           | 查询数据库时不暴露自己查了什么   | 用户查病历，但云不知道查的是哪条               | 保护查询隐私，但不能保证返回的数据正确 |
> | **Secret Sharing 秘密共享**    | 把秘密拆成多份，达到门限才能恢复 | 密钥分给多个云服务商，够数量才能重构           | 保证机密性和可用性，但不保证计算正确性 |





> | 技术                                              | 作用                                        | 例子                                                         | 局限                                               |
> | ------------------------------------------------- | ------------------------------------------- | ------------------------------------------------------------ | -------------------------------------------------- |
> | **Verifiable Computation 可验证计算**             | 让云计算结果可以被验证，不用用户重新算一遍  | 云计算 `y = f(x)`，同时给一个 proof，用户检查 proof          | 生成 proof 可能成本高；复杂计算/AI 场景实现难      |
> | **ZKP 零知识证明**                                | 证明某件事是真的，但不泄露额外信息          | 用户证明信用分 > 750，但不透露完整财务记录                   | 构造复杂；proof 生成可能慢；不是所有场景都容易建模 |
> | **IAM 身份与访问管理**                            | 确保“正确的人”访问“正确资源”                | 员工登录云系统后，根据权限访问文件                           | 只能控制访问，不保证访问后不会滥用数据             |
> | **MFA 多因素认证**                                | 用多个因素增强登录安全                      | 密码 + 手机验证码 / Authenticator App                        | 不能防所有攻击；用户体验成本更高                   |
> | **RBAC 基于角色访问控制**                         | 按角色分配权限                              | HR 可以看员工记录，普通员工只能看自己的记录                  | 不够灵活，角色太多会变复杂                         |
> | **ABAC 基于属性访问控制**                         | 按属性和环境动态判断访问                    | 只有在公司设备 + 办公室网络中才能访问敏感文件                | 策略复杂，依赖 PEP/PDP 正确执行                    |
> | **ABE 属性基加密**                                | 把访问控制放到加密层面                      | 文件加密策略为 Engineer AND Development，只有满足属性的人能解密 | 需要可信 authority 发密钥；撤销和密钥管理复杂      |
> | **VM / Hypervisor Security 虚拟机与虚拟化层安全** | 保护云中虚拟机和底层虚拟化管理器            | 防止 VM escape 从虚拟机逃逸到宿主机                          | 依赖配置、补丁、权限控制；误配置风险高             |
> | **Container Security 容器安全**                   | 保护容器镜像、运行时和部署环境              | 扫描 Docker image，禁止容器以 root 运行                      | 共享宿主机内核；镜像供应链和配置风险大             |
> | **Kubernetes Security K8s 安全**                  | 管理容器集群中的访问、网络和部署安全        | 使用 RBAC、Network Policies、Admission Controller            | 配置复杂；API endpoint、权限过大常出问题           |
> | **Blockchain 区块链**                             | 提供不可篡改记录和去中心化信任              | 把云访问日志写入链上，防管理员事后改日志                     | 扩展性差；隐私与合规有冲突；集成旧系统困难         |
> | **Smart Contract 智能合约**                       | 自动执行规则，不依赖人工中介                | 付款成功后自动开放云资源访问；SLA 违规自动退款               | 合约代码可能有漏洞；链上数据公开；修改困难         |
> | **Fair Payment 公平支付**                         | 保证用户拿到结果，云同时拿到钱              | 云完成计算并提交 proof 后，智能合约自动付款                  | 同时满足隐私、正确性、公平性很难                   |
> | **SECaaS 安全即服务**                             | 把安全能力作为云服务提供                    | Splunk Cloud SIEM 监控日志；DLP 阻止数据外泄                 | 依赖外部供应商；责任边界可能不清楚                 |
> | **EaaS 加密即服务**                               | 云端提供加密和密钥管理服务                  | 云 KMS 生成 DEK/KEK，加密存储数据                            | 仍要信任 KMS 和访问控制配置                        |
> | **TCaaS 门限密码服务**                            | 把签名/解密密钥拆给多个节点，达到门限才执行 | 多个节点共同完成区块链交易签名                               | 节点同步、通信和可用性要求高                       |
> | **Incident Response 事件响应**                    | 发现、控制、清除、恢复安全事件              | IDS/EDR/SIEM 发现异常后隔离受影响服务器                      | 依赖日志质量；误报/漏报；响应慢会扩大损失          |
> | **Compliance 合规**                               | 满足法律、行业标准和审计要求                | PCI DSS 保护银行卡数据；GDPR 管理个人数据跨境传输            | 合规不等于绝对安全；需要持续审计                   |
> | **Auditing 审计**                                 | 检查系统是否按策略和标准运行                | 审计 IAM logs、S3 logs、key rotation logs                    | 云环境动态变化快；很多证据依赖 CSP 日志            |
>
> **考试记忆线：**
>
> > **隐私 Privacy**：PIR / Secret Sharing / MPC / HE
> >  **正确性 Correctness**：Verifiable Computation / ZKP
> >  **访问 Access**：IAM / MFA / RBAC / ABAC / ABE
> >  **基础设施安全 Infrastructure**：VM / Hypervisor / Container / Kubernetes
> >  **审计与自动化 Audit & Automation**：Blockchain / Smart Contract / SECaaS
> >  **治理 Governance**：Incident Response / Compliance / Auditing



------

## ✅2. 为什么验证很重要 / Why Verification Matters

云服务对用户数据执行计算，用户必须信任云端正确计算。但云端可能：Cloud services compute on user data, but cloud may:

- 恶意或出错地返回不正确结果
- 使用质量较低的AI模型偷工减料
- 篡改财务计算报告
- 在AI推理中引入偏差

**三个典型场景：**

1. 云端数据分析 — 提供商是否计算了正确的统计数据？

2. AI模型执行 — AI是否提供了准确的推断？

3. 金融计算 — 云提供商是否篡改了报告？

   

------

## 3. 可验证计算的需求 / The Need for Verifiable Computation

**朴素方法（不可行）/ Naïve Approach (Infeasible):**

- 下载所有中间结果并重新计算
- **问题：** 数据传输量过大、计算成本高、完全违背外包云计算的目的

**目标 / Goal:**

> 云端能否提供一个**简洁的证明**（succinct proof），==证明计算结果是正确的==？ 用户验证证明的效率必须**优于**重新计算。

**密码学的解决思路：**

```
云端计算：f(x) → y
云端同时生成：y 正确的证明 π
用户验证：检查证明 π，无需重做计算
隐私保障：用户只知道 y 是正确的，学不到其他信息
```

------

## 4. 生活中的证明案例 / Proofs in Daily Life

**Example 1 — 找Waldo / Where's Waldo:**

- Alice在图中知道Waldo的位置
- Bob找不到，指责Alice作弊
- 问题：Alice如何证明Waldo在图中，**但不直接透露Waldo的位置**？
- 解法：用大纸板遮住图，只在Waldo位置开一个小洞，让Bob看到Waldo但看不到周围环境

**Example 2 — 数独 / Sudoku:**

- Alice设计了一个数独，让Bob求解
- Bob想先确认数独有解，才愿意尝试
- 问题：Alice如何证明有解，**而不直接给出答案**？

**Example 3 — 账户所有权 / Account Ownership:**

- Alice：我是这个账户的拥有者
- Bob：给我看你的密码
- 问题：如何证明知道密码，**而不透露密码本身**？

**→ 这三个例子都指向同一个需求：零知识证明 ZKP**

------

##   ‼️  ‼️  5. 零知识证明简介 / Introduction to Zero-Knowledge Proofs (ZKPs)

**历史：** 由 Goldwasser、Micali 和 Rackoff 于 **1984年** 提出。

**核心思想：**

> 证明者（Prover）想说服验证者（Verifier）某个陈述为真，同时**不透露任何额外信息**。

**云端应用示例：**

- 云端证明计算正确性
- 用户只学到"结果有效"，学不到其他任何东西

### ZKP的语法 / Syntax

- **传统数学证明：** 一次性书面证明（静态）
- **ZK证明：** 交互式 + 密码学（动态多轮）

```
公共输入：陈述 X（Statement）
证明者 P（持有见证 w）    验证者 V
        消息1 →
        ← 挑战1
        消息2 →
        ← 挑战2
        ...（多轮交互）
                      → 输出：0（拒绝）或 1（接受）
```

------

## 6. ZKP 的三大性质 / Three Properties of ZKPs

### ① 完备性 Completeness

如果陈述X为真，且证明者和验证者都诚实，证明者持有见证w，则交互后验证者**一定接受**。If statement X is true and both are honest, verifier **always accepts**.

------

### ② 可靠性 Soundness

不诚实的证明者无法作弊。如果陈述为假，则任何作弊证明者与验证者交互后，验证者**以高概率拒绝**（理想情况概率=1，实际可为 1−negl）。

**English:** Dishonest provers cannot cheat. If statement is false, verifier rejects with high probability.

------

### ③ 零知识性 Zero-Knowledge

（诚实或不诚实的）验证者什么都学不到。直觉上，验证者不能从证明者那里学到见证w。

**形式定义：** 存在一个高效的公开算法 **模拟器S**（Simulator），使得：

- V*从真实协议中获得的"知识"
- ≈ V*自己用S模拟出来的"知识"

即：V* **本可以自己生成**这些信息，不需要和真正的证明者交互。

```
真实世界 Real              理想世界 Ideal
P(w) ↔ V*  →  View_V*    ≈    S → View_V*
```

**关键问题：为何作弊证明者不能运行模拟器？**

- 可靠性是一次性交互，作弊证明者失败后验证者拒绝
- 而模拟器对验证者有完全控制权，可以多次运行，这是作弊证明者做不到的

------

## 7. ZKP 案例：图同构 / ZKP for Graph Isomorphism

### 图同构定义

两个图 G₀ 和 G₁ 同构（G₀ =ᵢ G₁），当且仅当存在一个置换 π: V→V 使得 G₀ = π(G₁)。

**陈述 X：** (G₀, G₁) 且 G₀ =ᵢ G₁ **见证 w：** 置换 π

### 三个关键事实 / Key Facts

| 事实       | 内容                                                         |
| ---------- | ------------------------------------------------------------ |
| **Fact 1** | 若 G₀ ≠ᵢ G₁，则对任意图H，H ≠ᵢ G₀ 或 H ≠ᵢ G₁（至少一个不同构） |
| **Fact 2** | 对任意置换σ和图G，σ(G) 的随机重标签分布与随机置换后的图分布相同 |
| **Fact 3** | 若 G₀ =ᵢ G₁，则 σ(G₀) 和 σ(G₁) 分布相同                      |

### 协议步骤 / Protocol

```
证明者 P(π)                         验证者 V
1. 随机选置换 τ
   计算 H = τ(G₀)
   发送 H →

2.                              ← 随机选 b ∈ {0,1}

3. 若 b=0：发送 σ = τ
   若 b=1：发送 σ = τ∘π⁻¹
   发送 σ →

4.                              检查 σ(Gᵦ) = H
                                若成立 → 接受（输出1）
                                否则 → 拒绝（输出0）
```

### 分析 / Analysis

**完备性：** 若 G₀ =ᵢ G₁，无论验证者选 b=0 还是 b=1，证明者总能正确回答 → 总是被接受。

**可靠性：** 若 G₀ ≠ᵢ G₁（由Fact 1），H只能与其中一个同构：

- 若 H =ᵢ G₀ 但 H ≠ᵢ G₁：作弊证明者只能回答 b=0
- 作弊成功概率 = 1/2，被拒绝概率 ≥ 1/2
- **如何让拒绝概率接近1？** → **顺序重复**（Sequential Repetition）重复k次，作弊成功概率降至 (1/2)ᵏ

**零知识性：** 模拟器S的构造：

```
1. 随机选 b' ∈ {0,1}，τ ← 随机置换
2. 计算 H = τ(G_{b'})，发给 V*，收到 b
3. 若 b = b'：令 σ = τ，输出 (H, b, σ) ✓
   否则：重新回到第1步
（模拟器平均2次即成功，效率高）
```

------

## 8. ZKP 在现实云端的应用 / ZKPs in Cloud Today

| 应用领域             | 实例                                     | 用途                             |
| -------------------- | ---------------------------------------- | -------------------------------- |
| **隐私保护云存储**   | ProtonDrive, Tresorit                    | 证明文件所有权，不泄露内容       |
| **云AI与机器学习**   | Microsoft ZKP AI, ZKML (Google Cloud AI) | AI模型处理加密数据，无需直接访问 |
| **零知识认证**       | ZKLogin (Mysten Labs), zkPass            | 安全登录，不暴露密码             |
| **区块链云基础设施** | Azure Confidential Ledger, StarkNet      | 可验证云日志、高效区块链扩展     |
| **金融与合规**       | ING Bank ZK Proofs, EY Nightfall         | 私密交易同时满足监管审计         |

------

## 9. ZKP 应用题解析 / Question Analysis

**场景：** 云端欺诈检测服务，对交易返回"安全"或"风险"，但不想透露其风险模型。

**是否需要ZKP？** ✅ 是的

| 要素               | 内容                                                         |
| ------------------ | ------------------------------------------------------------ |
| **陈述 Statement** | "给定交易T，基于风险模型M，T的风险分数低于阈值θ（即交易安全）" |
| **见证 Witness**   | 秘密风险模型M的参数（权重、规则、阈值等）                    |
| **ZKP的作用**      | 云端证明"T是安全的"这一结论正确，同时不暴露M的具体细节       |

**三个 ZKP 场景对比 / Three ZKP Scenario Comparison**

| 要素 Element            | Waldo 场景 Where's Waldo                                     | 数独场景 Sudoku                                              | 账户所有权场景 Account Ownership                             |
| ----------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **陈述 Statement**      | "图中存在 Waldo" / "Waldo is in the picture"                 | "该数独存在合法解" / "This sudoku has a valid solution"      | "Alice 知道该账户的正确密码" / "Alice knows the correct password for this account" |
| **见证 Witness**        | Waldo 的具体位置坐标 / The exact location of Waldo           | 完整数独答案 / The complete sudoku solution                  | Alice 的真实密码 / Alice's actual password                   |
| **ZKP 的作用 ZKP Role** | 证明 Waldo 存在，但不暴露具体位置 / Prove Waldo exists without revealing his location | 证明存在合法解，但不暴露答案 / Prove a solution exists without revealing it | 证明知道密码，但不把密码发送给验证方 / Prove knowledge of the password without sending it to the verifier |

------

**在线选举场景 / Online Election Scenario**

| 要素 Element                          | 内容 Content                                                 |
| ------------------------------------- | ------------------------------------------------------------ |
| **陈述 Statement**                    | "云端对所有加密选票的统计结果为 tally T，且计算过程正确" / "The cloud correctly computed tally T from all encrypted ballots" |
| **见证 Witness**                      | 每张选票的明文内容及解密过程 / The plaintext of each ballot and the decryption process |
| **ZKP 的作用 ZKP Role**               | 云端证明 tally 计算正确，但不暴露每个人具体投了谁 / The cloud proves the tally is correct without revealing individual votes |
| **完备性 Completeness**               | 若云端确实正确计算，proof 必然被接受 / If the cloud computed correctly, the proof will always be accepted |
| **可靠性 Soundness**                  | 若云端篡改票数，伪造的 proof 必然被拒绝 / If the cloud tampered with results, any fake proof will be rejected |
| **可验证计算 Verifiable Computation** | 整体目标：验证云计算结果正确，且不泄露额外信息 / Overall goal: verify the correctness of cloud computation without leaking extra information |





------

## 10. 核心考点速记 / Key Takeaways

> - **可验证计算的核心问题：** 如何在不重做计算的情况下验证云端结果正确？
> - **ZKP三大性质：** 完备性（诚实必过）、可靠性（欺骗必败）、零知识性（什么都学不到）
> - **零知识性的形式化：** 用模拟器S证明——验证者自己就能产生同样的"知识"
> - **图同构ZKP：** 作弊成功概率≤1/2，重复k次降至(1/2)ᵏ
> - **模拟器 vs 作弊证明者的区别：** 模拟器可控制验证者多次运行；作弊证明者只有一次机会
> - **ZKP应用：** 投票计数、信用评分验证、AI模型验证、欺诈检测——凡需"证明结论但隐藏细节"的场景
> - **零信任在哪里？**
>
>   零信任不是一个具体软件，也不是一定在区块链上。
>
>   它是一种**安全架构思想 security architecture principle**，通常放在用户访问云资源的中间检查环节。
>
>   可以理解成：
>
>   ```
>   用户 / 设备 / 服务
>   → 发起访问请求
>   → 零信任检查层 Zero Trust checking layer
>   → 允许或拒绝访问云资源
>   ```
>
>   这个“零信任检查层”可以出现在很多地方：
>
>   | 位置                                                         | 作用                           |
>   | ------------------------------------------------------------ | ------------------------------ |
>   | IAM / Identity and Access Management 身份与访问管理IAM / 身份与访问管理 | 检查用户身份和权限             |
>   | API Gateway / API 网关API 网关 / API Gateway                 | 检查 API 请求是否允许          |
>   | Service Mesh / 服务网格                                      | 检查服务和服务之间的访问       |
>   | Policy Engine / 策略引擎                                     | 根据规则决定 allow / deny      |
>   | Smart Contract / 智能合约                                    | 在区块链场景下自动执行访问规则 |
>   | Audit Log / 审计日志                                         | 记录每次访问，方便追责         |
>
>   所以零信任的位置大概是：
>
>   ```
>   访问请求 → 身份验证 → 权限验证 → 策略判断 → 资源访问 → 审计记录
>   ```
>
>   零信任主要发生在：
>
>   > **访问资源之前和访问过程中。**
>
>   不是等出事以后才查。



# ❤️Week 4–7：云数据安全 Cloud Data Security

# ❤️怎么取，怎么算（云上加密计算，云上计算验证）

# 信息检索、安全计算、高级云安全技术、可验证计算 / PIR, secure computation, advanced cloud security, verifiable computation

# \- 核心问题：当数据存储或计算发生在云端时，如何在不完全信任云服务提供商的情况下保护数据隐私，并验证云端计算结果是否正确？❤️



# 🌸CSEC5615 Week 8 — 身份与访问管理（IAM）总结PKI 与 IAM🌸

**PKI（公钥基础设施，Public Key Infrastructure）** 管理数字证书和公私钥对的体系，核心组件：

- **CA（证书颁发机构）**：签发和吊销证书
- **证书（Certificate）**：绑定公钥与身份的数字文件（X.509 标准）

**IAM（身份与访问管理，Identity and Access Management）** 管理"谁能访问什么资源"的框架，核心模型：

- **RBAC**：基于角色的访问控制
- **ABAC**：基于属性的访问控制
- **Zero Trust**：零信任模型（永不信任，始终验证）

------

## ✅1. IAM 简介 / Introduction to IAM

IAM 是确保正确用户**能访问正确资源**的框架。 IAM is a framework ensuring the right users have the right access to resources.

**为什么重要 Why it matters**：

- 防止未授权访问 / Prevents unauthorized access
- 执行安全策略 / Enforces security policies
- 支持法规合规（GDPR、HIPAA）/ Supports compliance

**四大核心组件 Core components**：

| 组件 Component                   | 问题 Question                      | 说明 Description                            |
| -------------------------------- | ---------------------------------- | ------------------------------------------- |
| 身份管理 Identity Management     | 你是谁？/ Who are you?             | 创建和管理身份 / Create & manage identities |
| 认证 Authentication              | 证明你的身份 / Prove your identity | 验证用户 / Verify the user                  |
| 授权 Authorization               | 你能做什么？/ What can you do?     | 决定权限 / Determine permissions            |
| 审计与撤销 Auditing & Revocation | 持续安全保障 / Ongoing security    | 监控与撤销访问 / Monitor & revoke access    |

------

## ✅2. IAM 生命周期 / IAM Life Cycle

五个阶段构成闭环 / Five stages forming a cycle：

```
① 身份配置 Identity Provisioning
   创建人员和标识符、定义组和角色、定义所需系统和账户
   Create person & identifier, define groups & roles, define systems & accounts

② 认证 Authentication
   验证人员身份 / Validate person identity

③ 授权 Authorization
   确定访问权限、安全审计报告
   Determine right-to-access, audit & security reporting

④ 监控与审计 Monitoring & Auditing
   记录用户活动、检测异常行为
   Log user activity, detect anomalies

⑤ 撤销与注销 Revocation & Deprovisioning
   移除访问权限（如员工离职）→ 循环回到①
   Remove access (e.g., terminated employee) → back to ①
```

## ✅3. 认证 / Authentication — 第一道防线

###

认证是授予访问权限之前验证用户身份的过程。 Authentication verifies a user's identity before granting access.

**三类认证因素 Three factors**：

- 你知道的 Something you know → 密码、PIN / Password, PIN
- 你拥有的 Something you have → 智能卡、令牌 / Smart card, token
- 你本身的 Something you are → 生物特征 / Biometrics

##### 3.1 为什么不用数字签名？Why not digital signatures?

| 原因 Reason                      | 说明                                                |
| -------------------------------- | --------------------------------------------------- |
| 易用性 Usability                 | 普通用户操作复杂 / Too complex for general users    |
| 平台限制 Platform constraints    | 并非所有平台都支持 / Not supported on all platforms |
| 实时性 Real-time needs           | 签名验证开销较大 / Verification overhead            |
| 撤销与恢复 Revocation & recovery | 证书撤销机制复杂 / Complex certificate revocation   |

**何时用数字签名 When to use**：高安全场景、不可否认性、零信任环境 High security settings, non-repudiation, zero-trust environments

##### 3.2 密码认证 Password-based Authentication

**工作原理 How it works**：

1. 用户输入用户名和密码 / User enters username & password
2. 服务器用加盐哈希验证 / Server verifies using salted hash

**密码攻击类型 Attack types**：

| 攻击 Attack                 | 说明 Description                                         |
| --------------------------- | -------------------------------------------------------- |
| 暴力破解 Brute-force        | 尝试所有可能字符组合 / Try every possible combination    |
| 字典攻击 Dictionary         | 使用预建常见密码列表 / Use prebuilt common password list |
| 彩虹表攻击 Rainbow table    | 使用预计算哈希表反推明文 / Use precomputed hash table    |
| 社会工程 Social engineering | 心理操纵诱骗用户泄露密码 / Psychological manipulation    |

**防护措施 Security measures**：

- 单向哈希（SHA-256）/ One-way hash
- 加盐 Salting：每个密码加随机盐值，防彩虹表 / Random salt per password, defeats rainbow tables
- 密码单独存储在独立数据库表 / Store passwords in a separate table
- 加密密码数据库 / Encrypt password database
- 速率限制器 Rate-limiters
- 密码加固服务（如 BeyondTrust PasswordSafe）

**使用建议 General recommendations**：

- 长且包含字母数字的密码 / Long alphanumeric passwords
- 不同网站不重用密码 / Never reuse passwords across sites
- 使用密码管理器 / Use a password manager
- 使用安全随机生成器 / Use a secure random generator
- 设置过期周期 / Set expiry periods

##### 3.3 生物特征认证 Biometric Authentication

使用唯一物理特征（指纹、虹膜、声音、人脸）认证用户。 Uses unique physical traits to authenticate users.

**工作原理**：扫描生物特征 → 转换为模板 → 与存储模板比对 Scan biometric data → convert to template → compare with stored template

| ✅ 优点 Pros                   | ❌ 缺点 Cons                                        |
| ----------------------------- | -------------------------------------------------- |
| 便捷，无需记密码 / Convenient | 隐私问题，泄露后无法更改 / Cannot change if leaked |
| 难以伪造 / Hard to fake       | 假阳性/假阴性问题 / False positives & negatives    |

**使用场景**：B2C（手机登录、机场安检）/ B2B（员工门禁）

##### 3.4 多因素认证 Multi-Factor Authentication (MFA)

结合两种或以上认证因素，防止凭证泄露。 Combines two or more factors to protect against credential leaks.

示例 / Example：密码 + 认证器 App 的 OTP 一次性密码 Password + OTP from an authenticator app

------

## ✅四、公钥基础设施 / PKI in IAM

PKI 是管理加密密钥和数字证书的系统。 PKI manages encryption keys and digital certificates.

**三大组件 Components**：

| 组件                             | 功能                                                         |
| -------------------------------- | ------------------------------------------------------------ |
| 证书颁发机构 CA                  | 签发和吊销证书 / Issues & revokes certificates               |
| 公钥与私钥 Public & private keys | 加密与签名 / Encryption & signing                            |
| 撤销机制 Revocation              | 使过期或被入侵的证书失效 / Invalidate expired or compromised certs |

**PKI 如何帮助 IAM How PKI helps**：

- 支持安全认证（TLS、数字签名）/ Enables secure authentication
- 支持加密通信（HTTPS、VPN）/ Supports encrypted communication
- 云示例：Google Cloud IAM 使用 PKI 进行安全 API 访问

------

## ✅❗️❗️❗️五、授权与访问控制 Authorization & Access Control

授权决定已认证用户可以执行什么操作。 Authorization determines what actions an authenticated user can perform.

##### 5.1 四种访问控制模型 Four Access Control Models

| 模型 Model           | 说明 Description                                     | 特点                                      |
| -------------------- | ---------------------------------------------------- | ----------------------------------------- |
| **DAC** 自主访问控制 | 资源所有者决定权限 / Owner decides access            | 灵活但风险高 / Flexible but risky         |
| **MAC** 强制访问控制 | 系统强制执行严格规则 / System enforces strict rules  | 高度敏感环境 / High-security environments |
| **RBAC** 基于角色    | 根据工作角色分配权限 / Permissions based on job role | 简单易管理 / Simple to manage             |
| **ABAC** 基于属性    | 使用属性动态策略 / Dynamic policies using attributes | 细粒度但复杂 / Fine-grained but complex   |

##### 5.2 RBAC

**优点**：简化大型组织管理、防止权限过多 / Simplifies management, prevents excessive permissions **缺点**：角色必须预定义、无法根据上下文动态调整 / Roles must be predefined, no dynamic context adjustment

示例 Example：

- Admin → 完全访问 / Full access
- HR 经理 → 查看和编辑员工记录 / View & edit employee records
- 普通员工 → 仅查看个人记录 / View personal records only

##### 5.3 ABAC

**优点**：细粒度访问控制、动态策略更新 / Fine-grained control, dynamic policy updates **缺点**：管理更复杂，对 PEP/PDP 软件实现高度信任，实现易出错 More complex; massive trust in software-based PEP/PDP, prone to implementation errors

**工作机制 Mechanism**：

- **PEP**（策略执行点 Policy Enforcement Point）
- **PDP**（策略决策点 Policy Decision Point）

示例 Example（用户属性：Role=Engineer, Area=Development, Year=2020）：

| 文件夹策略 Folder Policy           | 结果 Result      |
| ---------------------------------- | ---------------- |
| Folder A：Scientist AND Research   | ❌ 拒绝 / Denied  |
| Folder B：Engineer AND Development | ✅ 允许 / Allowed |
| Folder C：Engineer OR 2020         | ✅ 允许 / Allowed |

**课堂题答案 Class question answers**：

| 需求 Requirement               | 选择 Choice |
| ------------------------------ | ----------- |
| HR 能查员工记录，IT 不能       | RBAC        |
| 高级客户获额外云存储           | RBAC        |
| 仅从办公电脑访问文件           | ABAC        |
| 财务数据仅工作时间可访问       | ABAC        |
| 管理员全访问，客服仅看指定账户 | RBAC + ABAC |

------

## ✅六、高级加密扩展 IAM Advanced Encryption Extensions

**为何 IAM 单独不够 Why IAM alone is insufficient**：

- 内部威胁、配置错误、网络攻击仍可导致数据泄露 / Insider threats, misconfigurations, cyberattacks
- 访问日志无法防止已获访问者滥用数据 / Logs don't prevent misuse of accessed data
- 云提供商被攻破时，明文数据暴露 / Provider compromise exposes plaintext data

**三种方案 Three schemes**：

| 方案    | 全称                                      | 作用                                                         |
| ------- | ----------------------------------------- | ------------------------------------------------------------ |
| **ABE** | 基于属性的加密 Attribute-Based Encryption | 基于属性和策略的细粒度访问 / Fine-grained access via attributes & policies |
| **IBE** | 基于身份的加密 Identity-Based Encryption  | 用身份简化密钥管理 / Simplify key management using identities |
| **FE**  | 功能加密 Functional Encryption            | 对加密数据执行计算，无需完整解密 / Compute on encrypted data without full decryption |

##### 6.1 基于属性的加密 Attribute-Based Encryption (ABE)

- **属性 Attributes**：字符串，如 "Engineer"、"Scientist" / Strings like "Engineer", "Scientist"
- **策略 Policies**：布尔公式，如（"Scientist" AND "Research"）OR "Engineer" / Boolean formulas
- 属性必须满足策略才能解密 / Attributes must satisfy the policy to decrypt
- **缺点 Downside**：需要可信权威机构分发密钥 / Requires a trusted authority to distribute keys
- **NIST 认可**：NIST Special Publication 800-162（Jan. 2014）将 ABAC 列为推荐访问控制模型

**两种变体 Two variants**：

| 变体 Variant                          | 属性位置 Attributes           | 策略位置 Policy               |
| ------------------------------------- | ----------------------------- | ----------------------------- |
| **KP-ABE** 密钥策略 Key-Policy        | 属性 → 密文 / In ciphertext   | 策略 → 用户密钥 / In user key |
| **CP-ABE** 密文策略 Ciphertext-Policy | 属性 → 用户密钥 / In user key | 策略 → 密文 / In ciphertext   |

**KP-ABE 四个算法 Four algorithms**：

| 算法 Algorithm              | 输入 Input                                        | 输出 Output                                                  |
| --------------------------- | ------------------------------------------------- | ------------------------------------------------------------ |
| **Setup(λ)**                | 安全参数 / Security parameter                     | 公共参数 pp、主密钥 msk / Public params & master secret key  |
| **KeyGen(msk, policy p)**   | 主密钥 + 策略 / Master key + policy               | 用户密钥 sk（权威机构生成，绑定策略）/ User key bound to policy |
| **Encrypt(pp, attributes)** | 公共参数 + 属性集 / Public params + attribute set | 密文 ct / Ciphertext                                         |
| **Decrypt(ct, sk)**         | 密文 + 用户密钥 / Ciphertext + user key           | 消息 m 或失败 / Message m or ⊥                               |

**CP-ABE 四个算法**（结构相同，属性/策略位置对调）：

| 算法 Algorithm              | 输入 Input      | 输出 Output                                           |
| --------------------------- | --------------- | ----------------------------------------------------- |
| **Setup(λ)**                | 安全参数        | 公共参数 pp、主密钥 msk                               |
| **KeyGen(msk, attributes)** | 主密钥 + 属性集 | 用户密钥 sk（绑定属性）/ User key bound to attributes |
| **Encrypt(pp, policy)**     | 公共参数 + 策略 | 密文 ct（绑定策略）/ Ciphertext bound to policy       |
| **Decrypt(ct, sk)**         | 密文 + 用户密钥 | 消息 m 或失败                                         |

**ABE 安全性 Security**：

ABE 是多用户系统，与 PKE IND-CPA 相比有两点关键差异： ABE is a multi-user system with two key differences from PKE IND-CPA:

- **合谋攻击抵抗 Collusion resistance**：多个用户密钥被攻破后即使合并，也无法解密不满足策略的密文 / Even combining multiple compromised keys cannot decrypt if attributes don't satisfy the policy

- **密钥选择自由 Key selection**：攻击者可选择获取任意用户密钥（PKE IND-CPA 中不存在此情况）/ Attacker can retrieve user keys of its choice

- **安全定义需排除平凡胜利 Trivial wins**：当属性/策略本身不满足时，攻击者不应能区分密文 / When attributes don't satisfy policy, attacker must not distinguish ciphertexts

  攻击者不是因为破解了系统，而是因为游戏规则给了他一个“直接赢”的漏洞。在安全定义中，不允许攻击者请求那些本来就能解密挑战密文的密钥。

  

------

## ✅七、撤销与监控 Revocation and Monitoring

**为何监控 Why monitor**：

- 检测未授权访问尝试 / Detect unauthorized access attempts
- 帮助执行合规策略 / Enforce compliance policies

**关键机制 Key mechanisms**：

- **访问日志 Access logs**：跟踪用户操作 / Track user actions
- **异常检测 Anomaly detection**：基于 AI 监控可疑登录 / AI-based monitoring for suspicious logins
- **撤销策略 Revocation policies**：立即移除被入侵用户 / Immediate removal of compromised users

云示例 / Cloud example：AWS IAM 记录失败登录尝试并警告管理员 AWS IAM logs unsuccessful login attempts & alerts administrators

------

## ✅八、IAM 最佳实践 IAM Best Practices

| #    | 实践 Practice                                                | 说明 Description                                             |
| ---- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| 1    | **最小权限 + 零信任 Least Privilege + Zero Trust**           | 只授予最低必要权限，持续验证每次访问 / Grant minimum permissions, verify every access |
| 2    | **MFA**                                                      | 所有用户强制 MFA，推荐 FIDO2/WebAuthn 无密码认证 / Enforce MFA, use passwordless where possible |
| 3    | **联合认证 + SSO Federation + SSO**                          | 通过 SAML/OAuth/OpenID Connect 集中认证，减少凭证蔓延 / Centralize auth, reduce credential sprawl |
| 4    | **JIT + JEA Just-In-Time privilege elevation**Just Enough Administration | 按需临时提升权限，自动过期并留完整审计记录 / Time-bound privilege elevation, auto-expiry |
| 5    | **多云/混合 IAM Multi-cloud**                                | 跨云统一身份，联合信任和策略转换 / Unified identity across cloud providers |
| 6    | **策略即代码 Policy as Code**                                | 版本控制的声明式 IAM 策略，自动验证和部署 / Version-controlled declarative policies |
| 7    | **监控与合规 Monitoring & Compliance**                       | 实时异常检测（UEBA），持续审计（SOC 2, ISO 27001, PCI DSS, GDPR） |

**AWS IAM 最佳实践**：

| 实践                | 原则       | 实施                |
| ------------------- | ---------- | ------------------- |
| 不用 root 账户      | 最小权限   | 创建 Admin IAM 用户 |
| 应用使用 IAM 角色   | 身份联合   | EC2 实例配置文件    |
| 定期轮换凭证        | 纵深防御   | 自动密钥轮换        |
| 启用 MFA            | 多因素认证 | 虚拟/硬件 MFA       |
| 使用策略条件        | 上下文感知 | IP/时间限制         |
| 最小授权            | PoLP 原则  | 默认拒绝 all        |
| 监控审计            | 问责制     | CloudTrail, Config  |
| IAM Access Analyzer | 策略验证   | 自动分析            |

**Azure IAM 最佳实践**：

| 实践             | 实施                                        |
| ---------------- | ------------------------------------------- |
| 不用全局管理员   | 使用特定角色（User Admin, Security Admin）  |
| 应用使用托管身份 | System/User-assigned Managed Identities     |
| 凭证定期轮换     | Azure Key Vault 自动轮换                    |
| 启用 MFA         | Azure AD 条件访问 + MFA 强制执行            |
| 条件访问策略     | 位置/设备合规/风险级别条件                  |
| 最小权限         | Azure RBAC 自定义角色，从 Reader 开始       |
| 监控审计         | Azure Monitor, Activity Log, Azure Sentinel |
| 特权身份管理 PIM | 时间绑定权限提升                            |
| 访问审查         | 定期审查权限                                |
| 身份保护         | 风险策略                                    |

------

#### 核心考点 Key Takeaways

- IAM 生命周期 = 身份配置 → 认证 → 授权 → 监控 → 撤销（闭环）/ IAM lifecycle is a closed loop
- MFA = 三类因素中任意两种 / Any two of three factors
- RBAC = 按角色，简单；ABAC = 按属性，灵活但复杂 / RBAC simple; ABAC flexible but complex
- ABAC 缺点：对 PEP/PDP 软件实现高度信任，容易出错 / Heavy reliance on correct PEP/PDP implementation
- ABE 将访问控制从软件层下沉到密码学层 / ABE moves access control from software to cryptographic level
- KP-ABE：属性在密文，策略在密钥 / CP-ABE：策略在密文，属性在密钥
- ABE 安全核心：合谋攻击抵抗 / Core ABE security: collusion resistance
- 零信任 = 永不默认信任，持续验证 / Zero Trust = never trust by default, always verify



------

# 🌸CSEC5615 Week 9 — 容器安全与漏洞管理总结**层级关系 Hierarchy**：🌸

```
云虚拟化 Cloud Virtualization（最上层概念）
│
├── 虚拟机技术 Virtual Machine
│     └── 由 Hypervisor 管理程序 管理
│           ├── Type 1：直接跑在硬件上
│           └── Type 2：跑在 OS 上
│
└── 容器技术 Container（更轻量的虚拟化）
      └── 由 Kubernetes 编排管理
```

**虚拟机（VM，Virtual Machine）** 通过软件模拟的完整计算机环境，与物理机隔离运行独立操作系统。

**虚拟机管理程序（Hypervisor）** 管理和调度多个虚拟机的软件层：

- **Type 1**（裸机型）：直接运行在硬件上，如 VMware ESXi
- **Type 2**（托管型）：运行在操作系统上，如 VirtualBox

**容器（Container）** 轻量级隔离运行环境（如 Docker），共享宿主机内核，比 VM 更轻量但隔离性较弱。



------

### ✅一、虚拟化安全 Virtualization Security

##### 1. 虚拟机安全 VM Security

虚拟机是硬件的软件模拟，常用于云环境部署应用。 VMs are software-based emulations of hardware, used to deploy applications in the cloud.

**主要威胁 Key threats**：

- **VM 逃逸 VM escape**：攻击者从虚拟机突破到宿主机 / Attacker breaks out of a VM into the host machine
- **VM 蔓延 VM sprawl**：未管理的虚拟机积累，扩大攻击面 / Unmanaged VMs accumulate, expanding the attack surface

**防护 Countermeasures**：

- 最小化 OS 配置，禁用不必要服务 / Minimal OS footprint, disable unnecessary services
- 定期打补丁 / Regular patching and updates
- 严格访问控制 / Strict access controls

------

##### 2. Hypervisor 安全 Hypervisor Security

Hypervisor 是管理虚拟机的软件层，是云基础设施的核心。 The hypervisor manages VMs and is the backbone of cloud infrastructure.

| 类型 Type                | 运行位置 Runs on                        | 特点 Characteristics                                         |
| ------------------------ | --------------------------------------- | ------------------------------------------------------------ |
| Type 1 裸机型 Bare-metal | 直接运行在硬件上 / Directly on hardware | 性能和安全性更好，攻击面小 / Better performance & security   |
| Type 2 托管型 Hosted     | 运行在 OS 之上 / On top of OS           | 更易用，但攻击面更大 / More user-friendly, more attack vectors |

**主要威胁 Key threats**：

- VM 逃逸 / VM escape exploits 从 guest VM 逃逸到 host/hypervisor 的攻击。
- 权限提升 / Privilege escalation attacks

**防护 Mitigations**：

- 硬件辅助安全特性（Intel VT-x, AMD-V）/ Hardware-assisted security features
- 限制管理员访问 / Restrict administrative access
- 监控 Hypervisor 日志 / Monitor hypervisor logs for anomalies

------

### ✅二、容器安全 Container Security



#####  容器基础 Container Basics

容器是轻量级隔离环境，将应用与依赖项打包在一起，解决"在我机器上能跑"的问题。 Lightweight isolated environments packaging apps with dependencies — solves the "works on my machine" problem.

**优势 Benefits**：

- 快速部署，几乎即时启动 / Faster deployments, near-instant startup
- 比 VM 占用更少系统资源 / Better resource utilization than VMs
- 跨环境一致性（开发/测试/生产）/ Consistent behavior across dev, test, and production

**主要工具 Key tools**：

- **Docker**：构建、运行、管理容器 / Build, run & manage containers
- **Kubernetes (K8s)**：跨集群编排、扩展、负载均衡 / Orchestration, scaling & load balancing across clusters

------

##### 容器安全风险 Container Security Risks

| 风险 Risk                          | 中文说明                           | English                                                      |
| ---------------------------------- | ---------------------------------- | ------------------------------------------------------------ |
| 镜像漏洞 Image vulnerabilities     | 过时库、恶意镜像                   | Outdated libraries, malicious images from unverified sources |
| 不安全配置 Insecure configurations | 以 root 运行、权限过大             | Running as root, excessive permissions                       |
| 运行时威胁 Runtime threats         | 容器逃逸、数据泄露                 | Container escape, data breaches during execution             |
| 共享内核 Shared kernel             | 与宿主机共享内核，比 VM 攻击面更大 | Shared kernel with host OS — larger attack surface than VMs  |
| 供应链漏洞 Supply chain            | 依赖库被篡改                       | Compromised dependencies and libraries                       |

------

##### 容器安全防护 Container Security Countermeasures

**镜像安全 Image security**：

- 多阶段构建 Multi-stage builds
- 镜像扫描 Image scanning
- 镜像签名验证 Image signing & verification

**运行时安全 Runtime security**：

- 以非 root 用户运行 / Run as non-root user
- 只读文件系统 / Read-only root filesystem
- 移除不必要权限，使用 Seccomp/AppArmor 配置文件 / Drop unnecessary capabilities, use Seccomp/AppArmor profiles
- 资源限制 / Resource limits
- 运行时威胁检测 / Runtime threat detection
- 沙箱隔离（gVisor / Kata Containers）/ Sandbox isolation

**网络安全 Network security**：

- 零信任网络策略 / Zero-trust network policies
- 服务网格 / Service mesh security

**秘密管理 Secrets management**：

- 安全存储密钥和凭证 / Secure credential storage

**供应链安全 Supply chain security**：

- SBOM（软件物料清单 Software Bill of Materials）
- 镜像来源追踪 Image provenance
- 内容信任 Content trust

------

#####  Kubernetes 安全 Kubernetes Security

Kubernetes 自动化容器的部署、扩展和管理。 Kubernetes automates deployment, scaling, and management of containerized applications.

**主要功能 Key features**：调度 Scheduling / 扩展 Scaling / 自愈 Self-healing / 负载均衡 Load balancing

**主要威胁 Key threats**：

- 访问控制配置错误 / Misconfigured access controls
- API 端点未受保护 / Unprotected API endpoints — attackers can manipulate resources and escalate privileges

**最佳实践 Best practices**：

- Role-Based Access Contro**RBAC**：细粒度权限管理，定期审查 / Granular permission management, regularly reviewed
- **网络策略 Network policies**：限制容器间通信，防止容器逃逸 / Restrict inter-container communication, helps prevent container escape
- **Pod 安全标准 Pod Security Standards (PSS)**
- ==**准入控制器 Admission Controllers**==

------

### ✅三、应用安全 Application Security in Cloud

云应用（托管在容器或 VM 中）是攻击者的主要目标。 Applications hosted in containers or VMs are a prime target for attackers.

**三大攻击类型 Key attack types**：

- **SQL 注入 SQL Injection**：操控数据库查询 / Manipulating database queries
- **跨站脚本 XSS**：注入恶意脚本 / Injecting malicious scripts
- **API 漏洞 API exploits**：配置错误的 API 泄露敏感数据 / Misconfigured APIs leaking sensitive data

**防护 Best practices**：

- 开发阶段定期安全测试 / Regular security testing in development
- 输入验证 + 安全 API 认证（密码、Token、数字签名）/ Input validation + secure API authentication（密码 Password，Token（令牌）Token-based，数字签名 Digital signatures）

------

### ✅四、漏洞管理 Vulnerability Management

#####  为什么需要漏洞管理 Why It Matters

云环境动态变化，配置频繁更改，攻击面持续扩大。 Cloud environments are dynamic — configurations change frequently, expanding the attack surface.

**三大漏洞来源 Key vulnerability sources**：

- 未打补丁的软件 / Unpatched software（OS、中间件、容器镜像）
- 错误配置 / Misconfigurations（弱 API 安全、权限过大）
- 第三方依赖风险 / Third-party risks（被篡改的依赖库）
- 零日漏洞 / Zero-day vulnerabilities

**漏洞管理流程 Process**：

```
定期扫描 → 按 CVSS 评分排优先级 → 及时修复
Regular scanning → Prioritize by CVSS score → Timely patching
```

> **CVSS**（Common Vulnerability Scoring System）：通用漏洞评分系统，评分 >7 为高危 / Score above 7 = high risk

> 漏洞管理是**持续过程**，不是一次性任务 / Vulnerability management is ongoing, not one-time

------

##### 漏洞扫描工具 Vulnerability Scanner Tools

**容器专用工具 Container-specific**：

| 工具 Tool         | 用途 Purpose                                                 |
| ----------------- | ------------------------------------------------------------ |
| **Trivy**         | 容器镜像、K8s 集群、OS 扫描 / Container images, K8s clusters, OS |
| **Clair**         | Docker 镜像层扫描，集成 Docker 仓库 / Docker image layer scanning |
| **Aqua Security** | 容器 + K8s 运行时保护 + 漏洞检测 / Runtime protection & vulnerability detection |

**云安全工具 Cloud security**：

| 工具 Tool                 | 用途 Purpose                                                 |
| ------------------------- | ------------------------------------------------------------ |
| **Qualys Cloud Platform** | 网络、系统、应用综合扫描，实时合规监控 / Comprehensive scanning, real-time compliance monitoring |
| **Nessus**                | 云/网络/配置综合扫描，详细风险报告 / Cloud, network & config scanning |
| **AWS Inspector**         | AWS 工作负载自动扫描，识别配置问题 / Automated AWS workload scanning |
| **Azure Defender**        | Azure 资源威胁检测与漏洞扫描 / Threat detection & vulnerability scanning for Azure |

**扫描工具最佳实践 Best practices**：

- 集成进 CI/CD 流水线，部署前扫描 / Integrate with CI/CD pipelines, scan before deploying
- 自动化定期扫描 / Automate regular scans
- 优先修复高危漏洞（CVSS > 7）/ Prioritize fixes for high-risk vulnerabilities
- 分析报告趋势，持续改进配置 / Analyze reports to improve configurations

------

### ❗️❗️❗️五、共担责任模型 Shared Responsibility Model

云商和客户各自负责不同安全层级。 Cloud providers and customers each own different security layers.

| 服务模式 | 云提供商负责 Provider                        | 客户负责 Customer                                  |
| -------- | -------------------------------------------- | -------------------------------------------------- |
| **IaaS** | 物理/虚拟基础设施 / Physical & virtual infra | 网络安全到数据全部 / Network security through data |
| **PaaS** | 基础设施 + 中间件 / Infra + middleware       | 应用 + 数据 / Application + data                   |
| **SaaS** | 几乎全部 / Almost everything                 | 数据访问安全 / Data access security                |

**云商负责 Provider secures**：物理数据中心、服务器、Hypervisor、内置防火墙与加密工具– **Infrastructure:** Physical data centers, servers, and hypervisors.– **Built-in tools:** Firewalls, monitoring, and encryption features.

 **客户负责 Customer secures**：数据加密、安全 API、访问控制、容器/K8s/网络配置**Data and Applications:** Encryption, secure APIs, access control.– **Configurations:** Prevent misconfigurations in containers, Kubernetes, and networks.

> 关键：双方共同承担才能实现完整云安全。 Key insight: comprehensive cloud security requires both sides to play their role.

------

#### 核心考点 Key Takeaways

- 容器共享宿主机内核，比 VM 攻击面更大 / Containers share the host kernel — larger attack surface than VMs
- 永远不要以 root 权限运行容器 / Never run containers as root
- RBAC + 网络策略是 K8s 安全核心 / RBAC + network policies are the core of K8s security
- 漏洞管理是持续过程，不是一次性任务 / Vulnerability management is ongoing, not one-time
- 共担责任：云商管基础设施，客户管数据和配置 / Shared responsibility: provider owns infra, customer owns data & config
- CVSS > 7 优先修复 / Prioritize fixes for CVSS score above 7

------



# 😍Week 10 总结：新兴技术——威胁与机遇Emerging Technologies: Threats and Opportunities😍

**云区块链（Cloud Blockchain）** 将区块链部署于云端，提供去中心化、不可篡改的分布式账本服务，用于审计日志、供应链追踪等。

**PQC（后量子密码，Post-Quantum Cryptography）** 能抵御量子计算机攻击的新一代密码算法（如 CRYSTALS-Kyber、CRYSTALS-Dilithium），应对量子计算对 RSA/ECC 的威胁。

------

## ✅一、为什么需要去中心化？/ Why Decentralization?

传统分布式应用（消息、支付、云计算、医疗）依赖**中央可信实体**：

- ✅ 高性能 / High performance
- ❌ 单点故障风险 / Prone to single point of failures

区块链的出现正是为了解决这一问题。

| ✅ 高性能   | 中央节点统一调度，延迟低、吞吐量高 | Central scheduling → low latency, high throughput          |
| ---------- | ---------------------------------- | ---------------------------------------------------------- |
| ❌ 单点故障 | 中央节点宕机导致全系统失效         | Single point of failure: central node crash = total outage |
| ❌ 信任依赖 | 所有参与方必须信任同一中央权威     | All parties must trust the same central authority          |
| ❌ 审查风险 | 中央实体可冻结账户、删除记录       | Central entity can freeze accounts or delete records       |

------

## ✅二、什么是区块链？/ What is a Blockchain?

**定义 / Definition：** 分布式用户网络就历史记录达成共识的去中心化账本。A distributed network where users agree on a shared history via a decentralized ledger.

------

**核心特性 / Key Properties：**

| 特性 Property                         | 说明 Explanation                                             |
| ------------------------------------- | ------------------------------------------------------------ |
| **去中心化账本 Decentralized ledger** | 分布式信任，无需中央权威 Distributed trust, no central authority |
| **只追加 Append-only**                | 历史记录不可删除 Records can never be removed                |
| **公开验证 Public verification**      | 任何人均可验证 Anyone can independently verify               |
| **不可篡改 Immutable**                | 一旦写入无法修改 Cannot be altered once written              |
| **低使用成本 Low cost**               | 无中间商 No intermediaries needed                            |

------

### **✅跨领域融合 / Interdisciplinary Innovation：**

 区块链不是单一技术，而是多领域交叉的创新体系。Blockchain is not a single technology — it is an interdisciplinary innovation system.

- **新共识协议 New consensus protocols** — 分布式系统层面解决拜占庭将军问题 Byzantine fault tolerance（PoW, PoS, BFT）       

  ##### 关键词：  PoW, PoS, BFT, Byzantine fault tolerance

  解决的问题是：**没有中心服务器时，很多节点怎么达成一致？**
   也就是说，系统里可能有人作恶、掉线、发送错误信息，但大家仍然要对“哪笔交易有效、账本状态是什么”形成一致判断。

- **新密码学 New cryptography** — 零知识证明、哈希链、数字签名 ZKP, hash chains, digital signatures（ZKP, ECDSA）   

  ##### 关键词：ZKP, hash chains, digital signatures, ECDSA

  作用是：**证明身份、防止篡改、保护隐私、验证交易。**
   例如，数字签名可以证明“这笔交易确实是某个用户授权的”；哈希链可以防止历史记录被随意修改；零知识证明可以在不暴露原始信息的情况下完成验证。

- **新经济模型 New economic models** — 去中心化借贷、交易所 Decentralized lending & exchanges（Aave, Uniswap）  

  #####   关键词：DeFi, 借贷协议, DEX, Aave, Uniswap

  它研究的是：**怎样用代币、奖励、手续费、质押机制来激励用户诚实参与。**
   因为没有银行或中心平台，所以系统需要靠经济激励让用户提供流动性、维护网络、参与交易和承担风险。

- **去中心化自治 DAO** — 智能合约取代传统治理结构 Smart contracts replace traditional governance（MakerDAO）  

  #####  关键词：智能合约，链上投票，代币治理，MakerDAO

  解决的问题是：**没有传统公司管理层时，一个组织怎么做决策？**
   DAO 用智能合约和链上投票来决定资金怎么用、规则怎么改、协议怎么升级。

- **数字资产合规 Compliance** — 链上 KYC/AML 执行，监管接口 On-chain KYC/AML enforcement

  ##### 关键词：KYC, AML, 链上合规, 可审计性, 监管接口

  解决的问题是：**去中心化资产怎样满足现实世界的监管要求？**
   例如防止洗钱、诈骗、非法资金流动，同时给监管机构或审计方提供可追踪的记录。

------

## ✅三、区块链如何工作？/ How Does Blockchain Work?

```
[创世区块]←[区块]←[区块]←[区块]←[新区块]←...
Genesis Block              ↑
                    包含交易数据 tx
```

13:02

###  区块链运作原则四要点 / Four Key Points of Blockchain Operation：

- **P2P 网络 P2P Network** — 用户分布式连接，没有中央服务器，互相广播消息 Users connect in a distributed manner, no central server, broadcast messages to each other
- **特殊节点 Special Nodes = 矿工 Miners**（stakeholders / node operators）— 负责把交易数据整理成区块，再添加到账本 Organise transaction data into blocks and add them to the ledger
- **矿工竞争 Miner Competition** — 多个矿工同时争夺将自己的区块写入最终历史的权利，谁赢谁的区块就成为链的一部分 Miners compete for the right to write their block into the final history
- **不可撤销 Irreversibility** — 区块一旦上链，永久记录，无法修改 Once added to the chain, permanently recorded and cannot be altered

###### 矿工收集交易 → 打包成区块 → 竞争上链 → 上链后不可撤销，历史永久保存。Collect tx    → Pack into block → Compete to add → Irreversible once added, history preserved forever

### **分布式共识三要素 / Three Properties of Distributed Consensus：**

16:24

| 属性 Property              | 含义 Meaning                                                 |
| -------------------------- | ------------------------------------------------------------ |
| **链质量 Chain Quality**   | 链中任意足够长的片段里，诚实节点贡献的区块比例必须高于某个阈值。**防止攻击者长期垄断区块生产**、污染链内容。In any sufficiently long segment, the proportion of blocks from honest nodes must exceed a threshold — preventing adversaries from dominating block production. |
| **公共前缀 Common Prefix** | 所有诚实节点看到的链基本一致，不能出现严重分叉。**链的历史对所有人来说是同一份。**All honest nodes share essentially the same chain — no serious forks, one consistent history. |
| **链增长 Chain Growth**    | 链以稳定速率持续增长，**系统不能停滞。**The chain keeps growing at a consistent rate — the system must not stall. |

| 概念                       | 它真正关心的问题             | 加粗句子的意思                         |
| -------------------------- | ---------------------------- | -------------------------------------- |
| **链质量 Chain Quality**   | 这本账本主要是谁写的？       | 诚实节点写的区块比例必须够高           |
| **公共前缀 Common Prefix** | 大家看到的是不是同一本账本？ | 所有人看到的历史大体一致，不能严重分叉 |
| **链增长 Chain Growth**    | 这本账本有没有继续写下去？   | 系统不能停，链要持续变长               |

**三者防止的问题不同 / What Each Property Prevents：**

```
链质量 Chain Quality
  → 防止攻击者污染链的内容
  → H-H-A-A-A-A-H 这种攻击者连续占据区块的情况
  → 诚实区块比例太低 → 双花攻击、交易排挤、顺序操纵

公共前缀 Common Prefix
  → 防止分叉太严重
  → 不同节点对"历史"产生分歧

链增长 Chain Growth
  → 防止系统停滞
  → 链不再增长 → 整个网络瘫痪
```

### **共识机制 / Consensus Mechanisms：**

| 机制 Mechanism       | 原理 Principle                                               | 代表 Example |
| -------------------- | ------------------------------------------------------------ | ------------ |
| **工作量证明 PoW**   | 最先解出计算难题 **First** to solve a computational puzzle   | Bitcoin      |
| **权益证明 PoS**     | 证明持有系统中的份额 Prove that you own a stake in the system | Ethereum     |
| **空间证明 PoSpace** | 证明拥有计算存储空间 Prove you have computational storage space | Chia         |

所以说"系统"是对的，但比普通软件系统更复杂——没有服务器，没有公司，**协议本身就是系统**。

区块链结构 Structure
  → 只追加链 Append-only chain
  → 每块含交易数据 Each block contains tx data
        ↓
共识保障 Consensus guarantees
  → 链质量：抵抗恶意节点 Chain quality: resists malicious nodes
  → 公共前缀：历史一致 Common prefix: consistent history
  → 链增长：系统持续运转 Chain growth: system keeps running
        ↓
共识机制 Mechanism
  → PoW：算力竞争 Compute competition
  → PoS：持币竞争 Stake competition
  → PoSpace：存储竞争 Storage competition



![image-20260608154128524](/Users/tangjun/Library/Application Support/typora-user-images/image-20260608154128524.png)

**Bitcoin (BTC)** — 橙色₿图标 第一个区块链货币，2009年中本聪（Satoshi Nakamoto）发布。使用 PoW，是整个加密货币领域的起点。

------

**Ethereum (ETH)** — 灰色钻石图标 2015年发布，不只是货币，更是**智能合约平台**。2022年从 PoW 转为 PoS，是目前最大的智能合约生态。

------

**Bitcoin Cash (BCH)** — 橙色₿加外框图标 2017年从 Bitcoin **硬分叉 Hard Fork** 产生，争议点是区块大小——BCH 支持更大区块以提升交易速度，与 BTC 社区分裂。

------

**Litecoin (LTC)** — 蓝色₤图标 2011年发布，被称为"数字白银"（BTC 是数字黄金）。出块速度比 BTC 快4倍，早期改进版。

------

**Monero (XMR)** — 橙黑M图标 隐私币代表。默认**隐藏发送方、接收方、金额**，使用环签名 Ring Signature + 隐身地址技术，追踪极难，监管争议最大。

------

**Zcash (ZEC)** — 黄色Z图标 另一个隐私币，使用**零知识证明 ZKP（zk-SNARKs）** 实现可选隐私，可在透明交易和隐私交易之间切换。

------

## ✅四、智能合约 / Smart Contracts

**定义 / Definition：**

**智能合约 Smart Contract 是部署在区块链上、条款直接写入代码、条件满足自动执行的程序。** A smart contract is a program deployed on a blockchain, with agreement terms written directly into code, that automatically executes when conditions are met.

智能合约 Smart Contract  → 用 Solidity 写的代码  → 部署到 Ethereum 网络  → 跑在区块链上的所有节点上

### **执行流程 / Execution Flow：**

```
触发事件 Trigger
    ↓
执行合约代码 Execute Contract Code
（所有节点执行，验证条件）
    ↓
条件满足？Conditions Met?
  ✅ Yes → 执行预定操作（转账/授权）
  ❌ No  → 拒绝/回滚
    ↓
记录到区块链 Record on Blockchain
（不可篡改，全网验证）
```

### **优势 / Advantages：**

| 中文                       | English                                     |
| -------------------------- | ------------------------------------------- |
| 效率——自动执行，减少延迟   | Efficiency — automates transactions         |
| 安全——区块链保证不可篡改   | Security — immutability & tamper-resistance |
| 信任——无需中间方，依靠代码 | Trust — no intermediaries needed            |
| 透明——所有方可见执行过程   | Transparency — visible to all parties       |

### **云自动化应用 / Smart Contracts for Cloud Automation：**

| 应用场景                           | 说明                       |
| ---------------------------------- | -------------------------- |
| 支付验证 Payment Verification      | 自动验证付款并授予访问权限 |
| SLA 执行 SLA Enforcement           | 监控云性能，自动处罚/退款  |
| 多租户访问控制 Multi-Tenant Access | 安全管理共享云资源权限     |

> 📌 示例：Microsoft Azure 提供以太坊区块链即服务（BaaS）实现上述功能。
>
> 传统方式 Traditional  支付验证 → 人工核对付款记录 → 手动开通权限  SLA 违约 → 客户投诉 → 人工审核 → 协商退款  访问控制 → IT 管理员手动配置权限 
>
> 智能合约方式Smart Contract  支付验证 → 链上自动检测到账 → 自动开通权限  SLA 违约 → 链上自动检测性能数据 → 自动退款  访问控制 → 权限规则写入合约 → 自动执行
>
> 云本身已经是自动化基础设施，但**云服务商和租户之间的信任和结算**还是靠人工。智能合约把这一层也自动化了——
>
> > 云负责运行计算，区块链负责自动执行合约条款，两者结合才是完整的云自动化。
> >
> > 原本需要人工介入的流程，被智能合约的"条件满足→自动执行"机制完全替代。

------

区块链是技术，云是基础设施，Bitcoin/Ethereum 是区块链的具体系统，Azure/AWS 是云的具体服务商，BaaS 是云托管区块链的桥梁。

## ✅五、区块链用于云安全与审计 / Blockchain for Cloud Security17:08

------

#### **不可篡改日志 / Immutable Logging**

- 维护所有操作的详细历史（数据访问、修改等）Maintains a detailed history of all actions (data access, changes, etc.)

- 追踪内部人员活动，确保问责 Tracks insider activities, ensuring accountability

  

  工具示例 Tool：**Hyperledger Fabric**是一个支持透明 transparent 和不可篡改 immutable 日志的区块链框架，帮助机构审计操作 audit operations、检测异常 detect anomalies。

- ![image-20260608171520550](/Users/tangjun/Library/Application Support/typora-user-images/image-20260608171520550.png)主要是**节点配置、链码部署、日志查询**的后台系统

- ![image-20260608171602689](/Users/tangjun/Library/Application Support/typora-user-images/image-20260608171602689.png)

#### **去中心化身份管理 / Decentralized Identity (SSI)**

- 用户自主控制数字凭证，无需中央权威 Users control their **own credentials**, no central authority needed

- 通过密码学证明，无需密码 Identity **verified via cryptographic proof**, no password required

- Self-Sovereign Identity（自主主权身份）  SSI

  🤔为什么总是说密码，密码就是一种中心权威嘛🤔

  > **密码 password 本身不是中心权威；使用密码的“账号系统”通常依赖中心权威。**
  >
  > 也就是说，中心权威不是那串密码，而是**负责验证密码、保存账号、决定你能不能登录的平台/服务器**。
  >
  > 🤔所以多因素认证认证的是数字身份吗🤔
  >
  > 🤔所以未来这个自动化的发展起来了sap erp之类的信息管理是不是全部都失业了🤔
  >
  > 😊传统的方式是平台说你是谁，现在的方式是你自己说你自己是谁！！😏😏😏
  >
  > ![image-20260608171912726](/Users/tangjun/Library/Application Support/typora-user-images/image-20260608171912726.png)就像你用同一个护照 Passport 进入不同国家，SSI 让你用同一个数字身份访问不同云平台，而且没有任何一个平台存储你的密码。(😭我去俄罗斯旅游，诈骗电话打到我们当地的公安局😭)
  >
  > 🤔中国现在很火的那个数字身份证是为了识别还是为了告诉系统🤔
  >
  > | 对比         | 中国网号/网证                    | 去中心化身份 SSI                 |
  > | ------------ | -------------------------------- | -------------------------------- |
  > | 核心功能     | 证明用户真实身份已被核验         | 用户自己控制数字凭证             |
  > | 身份来源     | 国家统一身份认证平台             | 多个发行方，例如学校、医院、公司 |
  > | 是否去中心化 | 更偏中心化/国家级公共服务        | 更强调去中心化和自主控制         |
  > | 给系统什么   | 认证结果、网号/网证              | 可验证凭证 Verifiable Credential |
  > | 作用         | 支持实名核验、减少明文身份证暴露 | 支持身份、资格、属性证明         |

  

#### **零信任安全 / Zero Trust Security**

- 每次访问请求都通过密码学证明验证 Every access request verified via cryptographic proof

- 智能合约中编码的规则决定访问决策 Access decisions enforced by rules encoded in smart contracts

- 所有操作都被记录和验证 All actions recorded and verified on-chain

- 

  > 访问请求 → 身份验证 → 权限验证 → 策略判断 → 资源访问 → 审计记录

  ##### 门禁系统：

传统门禁：

```
你有密码 → 进去
```

零信任 + 区块链：😺😺想到了j12的那个破门😺😺不同人不同权限不同时间

```
你要证明你是谁
→ 证明你的权限还有效
→ 证明你这次请求没有被篡改
→ 智能合约检查规则
→ 允许/拒绝访问
→ 把这次操作记录下来
```

所以这个地方“验证”的不是单一东西，而是一整套访问条件：

> **验证身份、验证权限、验证请求、验证记录。**
>
> | 位置                                                         | 作用                           |
> | ------------------------------------------------------------ | ------------------------------ |
> | IAM / Identity and Access Management 身份与访问管理IAM / 身份与访问管理 | 检查用户身份和权限             |
> | API Gateway / API 网关API 网关 / API Gateway                 | 检查 API 请求是否允许          |
> | Service Mesh / 服务网格                                      | 检查服务和服务之间的访问       |
> | Policy Engine / 策略引擎（😭我们capstone的那个黑白名单😭）     | 根据规则决定 allow / deny      |
> | Smart Contract / 智能合约                                    | 在区块链场景下自动执行访问规则 |
> | Audit Log / 审计日志                                         | 记录每次访问，方便追责         |

------

### **总体而言，区块链将变革云安全 / Overall, Blockchain is Transformative for Cloud Security**

| 能力 Capability                      | 说明 Explanation                                             |
| ------------------------------------ | ------------------------------------------------------------ |
| **防篡改审计 Tamper-Proof Auditing** | 日志不可更改且透明 Logs are immutable and transparent        |
| **增强身份管理 Identity Management** | 去中心化替代传统身份系统 Decentralized alternative to traditional identity systems |
| **无信任安全 Trustless Security**    | 密码学证明替代中央权威 Cryptographic proof replaces central authority |
| **简化合规 Improved Compliance**     | GDPR/HIPAA 合规更易实现 Easier to achieve GDPR/HIPAA compliance |

**挑战 / Challenges：**

- 公链不可篡改性 vs 数据隐私合规（GDPR 被遗忘权）Immutability vs privacy compliance (GDPR right to be forgotten)
- 可扩展性是主要瓶颈 Scalability is a major bottleneck
- 难以与中心化遗留系统集成 Difficult to integrate with centralized legacy systems

------

**审计流程对比 / Audit Flow Comparison：**

```
普通审计 Traditional Audit
员工访问数据 Employee accesses data
    → 云平台生成日志 Cloud generates log
    → 日志存入数据库 Log stored in database
    → 审计员事后检查 Auditor checks later
问题 Problem：日志可被删除，审计员无从得知
              Log can be deleted without auditor knowing

区块链审计 Blockchain Audit
员工访问数据 Employee accesses data
    → 云平台生成日志 Cloud generates log
    → 日志存在云端 Log stored in cloud
    → 计算日志 hash Compute log hash
    → hash 写入区块链 Write hash to blockchain
    → 审计时重新计算 hash Recompute hash at audit time
    → 对比链上 hash Compare with on-chain hash
        ✅ 一致 Match → 日志未被篡改 Log untampered
        ❌ 不一致 Mismatch → 日志已被篡改 Log has been altered
```

| 概念                                | 重点                           |
| ----------------------------------- | ------------------------------ |
| Decentralized Identity 去中心化身份 | 解决“你是谁”的问题             |
| Zero Trust Security 零信任安全      | 解决“每次访问能不能信任”的问题 |
| Smart Contract 智能合约             | 负责自动执行访问规则           |
| Blockchain Audit 区块链审计         | 负责记录证据，防止事后改日志   |

关系可以这样看：

```
去中心化身份 SSI
→ 证明你是谁

密码学证明 Cryptographic proof
→ 证明身份和请求是真的

智能合约 Smart contract
→ 判断你有没有权限

区块链日志 Blockchain log
→ 记录这次访问，方便审计




```

18:33

### 按使用量付费的云服务模式 / Pay-as-You-Use Cloud Service Model

**定义 / Definition：** 根据用户实际使用量收费（存储容量、计算时长等），企业只为实际使用的资源付费。Charges users based on actual usage (storage, computation hours, etc.) — pay only for what you use.

------

**区块链对云计费的好处 / Blockchain Benefits for Cloud Billing：**

- **透明性 Transparency** — 使用指标和付款记录不可篡改地记录在区块链上 Usage metrics and payments are logged immutably on-chain
- **自动化 Automation** — 智能合约根据实时资源使用情况自动处理付款 Smart contracts handle payment automatically based on real-time usage
- **无信任模式 Trustless Model** — 无需依赖中心化机构，代码本身执行计费规则 No centralized authority needed — the code enforces billing rules

------

```
用户使用云资源 User consumes cloud resources
    ↓
使用量实时记录上链 Usage logged on-chain in real time
（不可篡改 Immutable）
    ↓
智能合约按规则自动结算
Smart contract auto-settles based on rules
    ↓
✅ 用户只付实际用量 Pay only what you used
✅ 云无法伪造使用记录 Cloud cannot falsify usage data
✅ 无需信任任何中间方 No middleman needed
```

------

## ✅六、case 公平云计算支付 / Fair Payments for Cloud Computation。🤔现实场景交易概述🤔

![image-20260608182320372](/Users/tangjun/Library/Application Support/typora-user-images/image-20260608182320372.png)

**核心矛盾 / Core Problem：** 用户不想先付钱后被骗，云不想先交结果后收不到钱。The user does not want to pay without getting the result, and the cloud does not want to deliver without getting paid.

------

**场景 / Scenario：**

- 用户有数据 **x**，想让云计算 **f(x)**，得到结果 **y**
- 用户要付 **$100**，云要返回 **y**，但谁先做？

```
用户先付 → 云可能不返回结果 → 用户亏
云先给 y → 用户可能不付款 → 云亏
```

**公平交换 Fair Exchange = 要么双方都得到，要么双方都得不到。Either both parties get what they want, or neither does.**

```核心问题 / Core Challenge：
用户有数据 x，想计算 f(x)，将任务外包给云
用户支付 $100，云返回 y = f(x)

公平性挑战：
用户获得结果 y  ←→  云收到付款
这两件事必须同时发生！
```

------

**为什么不用中介 / Why Not Use a Middleman：**

| 问题 Problem                         | 说明 Explanation                                       |
| ------------------------------------ | ------------------------------------------------------ |
| **单点故障 Single Point of Failure** | 中介挂了系统就瘫痪 If middleman fails, system fails    |
| **信任问题 Trust Problem**           | 双方必须信任中介 Both parties must trust the middleman |
| **审查风险 Censorship Risk**         | 中介可以冻结交易 Middleman can freeze transactions     |

------

**智能合约解决方案 / Smart Contract Solution：**

```
1. 用户把 $100 锁进智能合约
   User locks $100 into smart contract
        ↓
2. 云计算 y = f(x)
   Cloud computes y = f(x)
        ↓
3. 云提交结果和证明
   Cloud submits result and proof
        ↓
4. 智能合约验证正确性
   Smart contract verifies correctness
        ↓
   ✅ 正确 Correct → 自动付款 Auto-pay $100 to cloud
   ❌ 错误/超时 Wrong/Timeout → 退款给用户 Refund to user
```

**关键：智能合约不重新计算 f(x)，只快速验证 proof。Smart contract does not recompute f(x) — it only verifies the proof.**

------

**三个层次 / Three Levels of Privacy：**

| 层次 Level          | 隐私要求 Privacy                                       | 方案 Approach                                  |
| ------------------- | ------------------------------------------------------ | ---------------------------------------------- |
| **基础 Basic**      | x、y 可公开 x and y are public                         | 合约直接重算验证 Contract recomputes to verify |
| **进阶 Advanced**   | 链上观察者不能看到 x、y Hidden from on-chain observers | 可验证计算 Verifiable computation              |
| **高级 High-level** | 云也不能看到 x Hidden from cloud too                   | ZKP + 同态加密 Homomorphic encryption          |

| 层次     | 问题               | 解决思路                                    |
| -------- | ------------------ | ------------------------------------------- |
| 基础方案 | 无隐私需求         | 智能合约直接验证并支付                      |
| 进阶方案 | 对链上观察者的隐私 | 如何验证计算正确性？验证能否比计算 f 更快？ |
| 高级方案 | 对链和云双重隐私   | 结合 ZKP 等密码学技术                       |

**规律 / Pattern：隐私要求越高，方案越复杂。Higher privacy requirement = more complex solution.**

💡 关键洞察：验证计算正确性的成本应远低于重新计算 f 本身（可验证计算思想）。

------

**关键密码学工具 / Key Cryptographic Tools：**

- **ZKP 零知识证明** — 证明"我算对了"但不泄露数据 Prove correctness without revealing data
- **同态加密 Homomorphic Encryption** — 云在加密数据上直接计算 Compute on encrypted data
- **可验证计算 Verifiable Computation** — 快速验证结果正确性 Efficiently verify computation correctness
- **承诺-揭示 Commit-Reveal** — 先锁定结果，后公开验证 Commit first, reveal and verify later

------

```
公平支付 Fair Payment
  → 智能合约锁定付款 Smart contract locks payment
  → 云提交结果+证明 Cloud submits result + proof
  → 合约验证后自动结算 Auto-settle after verification
        ↓
隐私升级 Privacy upgrade
  → 基础：公开验证 Basic: public verification
  → 进阶：链上隐私 Advanced: on-chain privacy
  → 高级：对云也隐私 High-level: private from cloud too
        ↓
核心工具 Core tools
  → ZKP / 同态加密 / 可验证计算
```



------

## 核心总结 / Key Takeaways  和成熟度补充

 * 区块链通过去中心化、不可篡改、密码学证明等机制，为云安全提供了全新工具：透明审计、去中心化身份、零信任安全和公平支付。但可扩展性与数据隐私合规仍是主要挑战。
* Blockchain provides cloud security with new tools — tamper-proof auditing, decentralized identity, zero trust security, and fair payment protocols — through decentralization and cryptographic proofs. Scalability and privacy compliance remain key challenges.
>
> 12:23
>
> ######  【完全无关】区块链成熟度 / Blockchain Maturity
>
> ###### ✅ 相对成熟 Relatively Mature（已大规模落地 Large-scale deployment）
>
> - **加密货币 Cryptocurrency** — Bitcoin、Ethereum，运行稳定十余年 Stable for 10+ years
> - **DeFi 基础协议 DeFi Core Protocols** — 借贷 Lending（Aave）、去中心化交易所 DEX（Uniswap）
> - **NFT 基础设施 NFT Infrastructure** — 链上所有权记录 On-chain ownership records
>
> ------
>
> ###### 🟡 发展中 Emerging（有应用但未普及 Deployed but not mainstream）
>
> - **供应链溯源 Supply Chain Traceability** — 沃尔玛食品追踪试点 Walmart food tracking pilot，覆盖面有限 Limited coverage
> - **跨境支付 Cross-border Payments** — Ripple 在部分银行试点 Piloted in select banks，未全面替代 SWIFT Not yet replacing SWIFT
> - **数字身份 DID Digital Identity** — 技术标准已有 Standards exist，但落地极少 Minimal real-world deployment
>
> ------
>
> ###### ❌ 还不成熟 Immature（距离替代中心化还很远 Far from replacing centralized systems）
>
> | 领域 Domain                          | 原因 Reason                                                  |
> | ------------------------------------ | ------------------------------------------------------------ |
> | **消息通讯 Messaging**               | 区块链延迟无法满足实时聊天 Blockchain latency incompatible with real-time chat |
> | **云计算 Cloud Computing**           | 去中心化存储成本高、速度慢 Decentralized storage (IPFS) is slow and expensive |
> | **医疗健康 Healthcare**              | 隐私法规与公开账本冲突 Privacy laws (HIPAA, AU Privacy Act) conflict with public ledgers |
> | **主流数字支付 Mainstream Payments** | 监管障碍 + 用户习惯 + 性能三重阻碍 Regulation + user habits + performance barriers |
> | **DAO 治理 DAO Governance**          | 投票率低、攻击风险高 Low voter turnout, high attack risk     |
>
> ------
>
> ###### 逻辑主线 Key Logic
>
> ```
> 金融 / 资产领域 Financial & Asset domains
>   → 区块链相对成熟 Blockchain relatively mature
> 
> 基础设施 / 民生领域 Infrastructure & Public services
>   → 距离替代中心化还很远 Far from replacing centralized systems
> 
> 课程定位 Course framing
>   → 区块链 = 新兴安全模型 Emerging security model
>   → 不是已解决的技术 Not a solved technology
> ```

------

# ❤️**Week 8–10：云系统安全 Cloud Infrastructure Security**

# 如何保护云平台本身的安全——谁能访问、怎么隔离、未来怎么办？How to secure the cloud platform itself — who can access, how to isolate, what about the future?

------

**怎么证明你是你 · Identity & Access**

- PKI（公钥基础设施 Public Key Infrastructure）— 用证书绑定身份和公钥
- CA（证书机构 Certificate Authority）— 证明某个公钥属于某个网站或组织
- IAM（身份与访问管理 Identity and Access Management）— 控制谁能访问什么资源

------

**怎么隔离运行环境 · Isolation & Virtualization**

- VM（虚拟机 Virtual Machine）— 在同一物理机上运行多个独立系统
- Hypervisor（虚拟机监控程序）— 管理和隔离多个虚拟机
- 容器 Containers — 比虚拟机更轻量的隔离方式，如 Docker

------

**怎么建立信任 · Trust & Verification**

- 区块链 Blockchain — 去中心化、不可篡改的信任机制
- 可验证计算 Verifiable Computation — 验证云端计算结果是否正确

------

**未来怎么办 · Future-proofing**

- PQC（后量子密码 Post-Quantum Cryptography）— 替代未来不安全的 RSA / ECC
- CRYSTALS-Kyber（密钥交换）、CRYSTALS-Dilithium（数字签名）

# PKI、IAM、虚拟机、Hypervisor、容器、区块链、后量子密码 / PKI, IAM, VMs, hypervisors, containers, blockchain, PQC

# 核心问题：如何保护云平台中的身份认证、访问控制、虚拟化环境、容器隔离，以及面向未来的后量子安全？❤️



# 🌸第十一周：安全服务与响应

| 术语           | 全称                          | 含义                                             |
| -------------- | ----------------------------- | ------------------------------------------------ |
| **加密即服务** | Encryption as a Service       | 云端提供密钥管理和加密 API，无需自建加密基础设施 |
| **DLP**        | Data Loss Prevention          | 数据防泄漏，监控并阻止敏感数据的未授权传输       |
| **身份即服务** | Identity as a Service (IDaaS) | 云端托管的身份认证服务（如 Okta、Azure AD）      |
| **事件检测**   | Incident Detection            | 通过 SIEM、IDS 等工具发现安全异常事件            |
| **响应计划**   | Incident Response Plan        | 安全事件发生后的处置流程（准备→检测→遏制→恢复）  |
| **数字取证**   | Digital Forensics             | 从数字设备中收集、保存、分析证据的科学方法       |

# Week 11 总结：安全即服务 & 事件响应

## Security as a Service & Incident Response

------

## 一、什么是安全即服务？/ What is SECaaS?

**定义 / Definition：** 通过云以订阅方式交付安全解决方案，无需自建安全基础设施。 Delivery of security solutions through the cloud on a subscription basis, without on-premise infrastructure.

**核心优势 / Key Benefits：**

| 中文                       | English                                             |
| -------------------------- | --------------------------------------------------- |
| 成本效率——无需前期硬件投入 | Cost Efficiency — no upfront hardware investment    |
| 可扩展性——按需调整安全能力 | Scalability — adapt to growing needs                |
| 专家资源——无需内部团队     | Specialist Expertise — no in-house resources needed |
| 概念更简单                 | Conceptually simpler                                |

------

## 二、安全的哪些方面可以作为服务提供？/ SECaaS Aspects

| 安全目标                         | 服务形式                | English                                |
| -------------------------------- | ----------------------- | -------------------------------------- |
| **保密性** Confidentiality       | 加密即服务（EaaS）      | Encryption as a Service                |
| **认证** Authentication          | MFA、生物识别           | MFA, Biometrics                        |
| **访问控制** Access Control      | 云端 RBAC               | Role-based Access Control              |
| **完整性** Integrity             | 数字签名、哈希服务      | Digital Signatures, Hashing            |
| **监控与日志** Monitoring        | 安全事件追踪审计        | Security event tracking & audit trails |
| **威胁检测** Threat Detection    | IDS、防火墙             | IDS, Firewall                          |
| **备份与恢复** Backup & Recovery | 灾难恢复即服务（DRaaS） | Disaster Recovery as a Service         |

------

## 三、SECaaS 的挑战 / Challenges

| 挑战 Challenge                            | 缓解措施 Mitigation      |
| ----------------------------------------- | ------------------------ |
| 信任外部供应商 Trusting External Vendors  | 供应商评估 + SLA 协议    |
| 违规责任模糊 Shared Responsibility Gaps   | 合同中明确责任划分       |
| 与本地系统集成复杂 Integration Complexity | 分阶段迁移策略           |
| 数据跨境合规 Data Residency Issues        | 选择支持数据驻留的供应商 |

------

## 四、SECaaS 具体服务 / SECaaS Offerings

### 1. 加密即服务（EaaS）/ Encryption as a Service

**完整流程 / Full Pipeline：**

```
客户明文数据
Client Plaintext Data
    ↓
密钥生成 Key Generation
├── DEK（数据加密密钥）— 加密实际数据
└── KEK（密钥加密密钥）— 保护 DEK
    ↓
云加密过程 Cloud Encryption (AES)
明文 → 密文 / Plaintext → Ciphertext
    ↓
密钥管理 Key Management
存储、轮换、撤销、分布式管理
Storage, Rotation, Revocation
    ↓
访问控制与解密 Access Control & Decryption
    ↓
审计与合规日志 Audit & Compliance Logging
每一步均被记录，支持取证分析
```

### 2. 数据防泄漏即服务（DLP）/ Data Loss Prevention

监控、检测、阻止潜在数据泄露，覆盖邮件、云存储、文件传输。 Monitors, detects, and blocks potential data breaches across email, cloud storage, and file transfers.

### 3. 身份即服务（IDaaS）/ Identity as a Service

提供认证（MFA/生物识别）、授权（RBAC/ABAC）、单点登录（SSO）。 Delivers authentication, authorization, and SSO as cloud services.

### 4. 门限密码学即服务（TCaaS）/ Threshold Cryptography as a Service

**核心思想 / Core Idea：** 私钥被分散到多个节点，需 k-out-of-n 个节点协作才能完成操作，消除单点故障。 The private key is split across nodes; k-out-of-n nodes must collaborate, eliminating single points of failure.

| 类型                              | 机制                               | 优势                   |
| --------------------------------- | ---------------------------------- | ---------------------- |
| **门限签名** Threshold Signatures | 各节点生成部分签名，合并得完整签名 | 分布式信任，抗节点失效 |
| **门限解密** Threshold Decryption | 各节点产生解密份额，合并还原明文   | 无单节点可独立解密     |

------

## 五、事件响应 / Incident Response

### 核心四阶段 / Four Core Phases

```
准备          检测与分析        遏制·清除·恢复        事后审查
Preparation → Detection &  → Containment,    → Post-Incident
              Analysis       Eradication,       Review
                             Recovery
```

**各阶段详解 / Phase Details：**

**① 准备 Preparation**

- 制定响应计划 / Develop response plans
- 培训团队 / Train the team
- 部署检测工具 / Deploy detection tools
- 加固基础设施 / Secure infrastructure

**② 检测与分析 Detection & Analysis**

- 工具：IDS（Snort/Zeek）、AWS GuardDuty、Azure Sentinel
- 利用威胁情报理解范围和严重程度 / Use threat intelligence to assess scope & severity

**③ 遏制·清除·恢复 Containment, Eradication, Recovery**

| 阶段                 | 目标                                 | 工具示例                    |
| -------------------- | ------------------------------------ | --------------------------- |
| **遏制** Containment | 隔离受影响系统，阻止横向扩散         | CrowdStrike EDR             |
| **清除** Eradication | 移除恶意软件，修补漏洞               | 恶意软件清除工具 + 补丁管理 |
| **恢复** Recovery    | 从备份恢复系统，完整性验证后重新接入 | Veeam / AWS Backup          |

**④ 事后审查 Post-Incident Review**

- 详细分析事件经过 / Detailed incident analysis
- 记录经验教训 / Document lessons learned
- 更新策略和防御措施 / Update policies and defenses

------

## 六、数字取证 / Digital Forensics

**定义 / Definition：** 为法律目的保存、分析和呈现数字证据。 Preserving, analyzing, and presenting digital evidence for legal purposes.

**关键步骤 / Key Steps：**

1. 识别并隔离受影响系统 / Identify and isolate affected systems
2. 创建取证镜像（逐位复制）/ Create forensic images (bit-for-bit copies)
3. 分析系统日志、内存、网络流量 / Analyze logs, memory, network traffic

**密码学证据收集技术 / Cryptographic Evidence Techniques：**

| 技术                        | 作用                             |
| --------------------------- | -------------------------------- |
| 数字签名 Digital Signatures | 验证日志来源与完整性             |
| 哈希（SHA-256）Hashing      | 验证取证副本未被篡改             |
| 可信时间戳 Timestamping     | 为日志条目添加不可篡改的时间证明 |

------

## 七、安全日志管理 / Secure Log Management

安全日志必须满足 / Secure logs must be：

- **防篡改** Tamper-resistant
- **维持审计跟踪** Maintain audit trails
- **符合法规** Comply with GDPR, HIPAA

**技术手段 / Techniques：**

| 技术                             | 说明                                     |
| -------------------------------- | ---------------------------------------- |
| HMAC 完整性校验                  | 确保日志完整性                           |
| 日志链接 Log Chaining            | 每条日志哈希链接到前一条，形成不可篡改链 |
| 一次性写入存储 WORM / 区块链日志 | 物理或逻辑防止日志被修改                 |

------

## 核心总结 / Key Takeaways

> **中文：** SECaaS 提供灵活性，但必须严格评估供应商。事件响应需要事先规划、反复演练，并由具备取证能力的系统支撑。密码学（哈希、签名、时间戳）是日志可信度和证据完整性的基础。
>
> **English:** SECaaS provides agility, but due diligence on vendors is critical. Incident response must be planned, practiced, and supported by forensic-ready systems. Cryptography underpins trust in logs and evidence integrity.





------



# 🌸第十二周：合规与标准

**NIST（美国国家标准与技术研究院）** 发布网络安全框架（CSF）和 SP 800 系列标准，提供识别→保护→检测→响应→恢复五大功能框架。

**GDPR（通用数据保护条例）** 欧盟数据隐私法规，核心原则：数据最小化、用户同意、被遗忘权、72小时违规通报义务，违规最高罚款 **2000万欧元或全球营收4%**。

**PCI DSS（支付卡行业数据安全标准）** 保护持卡人数据的行业标准，适用于处理信用卡交易的所有组织，包含12大要求，涵盖防火墙、加密、访问控制等。

**安全审计（Security Audit）** 对系统、策略、控制措施的系统性检查，验证其是否符合既定标准和法规要求，输出审计报告和整改建议。

## Claude responded: Week 12 总结：合规、标准与审计

## Week 12 总结：合规、标准与审计

### Compliance, Standards, and Auditing

------

### ✅一、为什么合规很重要？ / Why Compliance Matters?

- 法律义务——违规将面临处罚 / Legal obligations — penalties for violations
- 声誉与信任——客户信心的基础 / Reputation & trust — foundation of customer confidence
- 降低供应商风险 / Mitigating vendor risks
- 行业特定要求（金融/医疗/政府）/ Industry-specific mandates (Finance/Healthcare/Government)

### ❗️二、共享责任模型 / Shared Responsibility Model

**云服务商（CSP）负责 / CSP Covers:**

- 基础设施安全（物理安全、网络防护）/ Infrastructure security (physical, network)
- 基础合规认证（ISO 27001, SOC 2）

**租户（用户）负责 / Tenant Must Handle:**

- 数据隐私（加密、访问控制）/ Data privacy (encryption, access controls)
- 应用层安全（API 安全）/ Application-layer security
- 行业法规遵从 / Regulatory adherence

> 📌**案例 Capital One**：AWS 存储桶配置错误 → 1 亿用户数据泄露 → 罚款 $8000 万 教训：配置责任在租户，不在 CSP / Configuration responsibility lies with the tenant, not the CSP

------

### 三、NIST 标准 / NIST Standards

**SP 800-53**：联邦系统安全与隐私控制蓝图 / Security & privacy controls for federal systems

**SP 800-171**：保护非联邦环境中的受控非密信息（CUI）/ Safeguards CUI in non-federal environments

**CSF 网络安全框架**：基于风险的灵活安全管理框架 / Flexible risk-based cybersecurity framework

**NIST CSF 五大核心功能 / Five Core Functions:**

```
识别(Identify) → 保护(Protect) → 检测(Detect) → 响应(Respond) → 恢复(Recover)
```

> ⚠️ NIST 是**自愿性指南**，非强制法律 / NIST provides **voluntary guidelines**, not legally binding rules.

------

### 四、PCI DSS（支付卡行业数据安全标准）

**目的 Purpose**：保护信用卡数据安全 / Secure handling of credit card data

**适用对象 Applies to**：所有处理支付卡信息的组织，含 SaaS 提供商 / All organizations handling payment card data, including SaaS providers

核心要求：12 大要求，6 个控制目标 / 12 requirements across 6 control objectives

**云环境中的常见陷阱 / Common Pitfalls:**

| 问题 Problem                         | 缓解措施 Mitigation                             |
| ------------------------------------ | ----------------------------------------------- |
| 密钥管理不当 Improper Key Management | 严格的密钥管理规范 Strict key management        |
| 不安全的 API Insecure APIs           | 定期漏洞测试 Regular vulnerability testing      |
| 影子 IT Shadow IT                    | 监控未经授权的数据流 Monitor unauthorized flows |

------

### 五、GDPR（通用数据保护条例）

#### **适用范围 / Applies to:**

- 所有在欧盟运营的组织 / Organizations in the EU
- 向欧盟居民提供服务的非欧盟组织 / Non-EU orgs offering services to EU residents
- 追踪欧盟居民行为的组织 / Orgs monitoring EU residents' behavior

#### **核心概念 / Key Concepts:**

**数据控制者 Data Controller**：决定数据处理的目的和方式 / Decides how & why data is processed

**数据处理者 Data Processor**：按控制者指令执行处理，云服务商通常扮演此角色 / Acts on controller's instructions — cloud providers typically play this role

**被遗忘权 Right to Erasure**：用户可要求删除其个人数据 / User can request deletion of personal data

**访问权 Right to Access**：用户可查看其被收集的数据 / User can view their collected data

**数据可携权 Right to Portability**：用户可转移其数据 / User can transfer their data

#### **云环境下 GDPR 五要点 / GDPR in Cloud — 5 Key Actions:**

1. 知晓数据存储位置 / Know where data is stored
2. 采取充分安全措施 / Take adequate security measures
3. 确保数据可被删除 / Ensure data can be erased
4. 只收集必要数据 / Collect only necessary data
5. 签署数据处理协议（SCC）/ Close data processing agreements

------

### 六、云环境审计 / Auditing in Cloud

**什么是安全审计 / What is a Security Audit:** 对安全态势的独立审查，验证政策合规性和风险暴露程度。 Independent review verifying policy adherence and risk exposure.

#### **关键审计产物 / Key Audit Artifacts:**

- 访问日志（IAM、S3 日志）/ Access logs
- 变更管理记录 / Change management records
- 加密与密钥轮换日志 / Encryption & key rotation logs

**常用工具 / Tools:** AWS CloudTrail、Azure Monitor、GCP Cloud Audit Logs

------

### 七、密码学合规工具 / Cryptographic Compliance Tools

**HSM 硬件安全模块 Hardware Security Module**：物理保护密钥，防篡改 / Physically protect keys, tamper-resistant

**KMS 密钥管理服务 Key Management Service**：云原生密钥管理（AWS KMS, Azure Key Vault）/ Cloud-native key management

**哈希链 / Merkle 树 Hash chain / Merkle tree**：提供完整性证明，供审计使用 / Integrity proof for auditing

**安全时间戳 Secure timestamp**：证明操作发生的时间 / Prove when an operation occurred

**零知识证明 ZKP Zero-Knowledge Proof**：不暴露原始数据的前提下证明合规性 / Prove compliance without revealing raw data

------

### 八、未来趋势 / Future Trends

- 🤖 **AI 驱动的持续合规监控** / AI-powered continuous compliance monitoring
- 🔍 **AI 异常检测审计日志** / AI anomaly detection in audit logs
- ⛓️ **智能合约驱动合规**（如链上 GDPR 同意管理）/ Smart contract–driven compliance(e.g., on-chain GDPR consent management)

------

### 核心总结 / Key Takeaways

> 合规不是一次性任务，而是持续过程 / Compliance is ongoing, not one-time
>
> 共担责任：CSP 管基础设施，租户管数据和配置 / CSP owns infra; tenant owns data & config
>
> NIST 是自愿性指南，不具法律约束力 / NIST guidelines are voluntary, not legally binding
>
> PCI DSS 适用所有处理支付卡信息的组织 / PCI DSS applies to all organizations handling card data
>
> GDPR 核心：数据最小化 + 用户权利 + 责任明确 / Data minimization + user rights + clear responsibility
>
> 密码学工具（HSM/KMS/ZKP）是合规的技术保障 / Cryptographic tools are the technical backbone of compliance

# **Week 11–12：云安全治理 Cloud Security Governance**

# EaaS、DLP、IdaaS、事件响应、数字取证、合规审计 / EaaS, DLP, IdaaS, incident response, forensics, compliance

# 核心问题：企业如何在真实云环境中部署安全服务、监控数据泄露、响应安全事件，并满足 NIST、GDPR、PCI DSS 等合规要求？







# ❓问题 RSA 不懂。对称加密发展：OTP → DES → AES

AES 模式发展：ECB → CBC → GCM

公钥密码发展：DH → RSA → ECC

Plain RSA → Padded RSA → Hybrid Encryption

Hash 发展：MD5 → SHA-1 → SHA-2 → SHA-3

数字签名发展：RSA Signature → DSA → ECDSA

安全标准发展：IND-CPA / IND-CCA / EUF-CMA

公钥密码学出现之后
→ 新问题：怎么确认这个公钥真的属于某个人或某个网站？

PKI / CA / Fingerprint

后量子密码发展：RSA/ECC → PQC



本体也是“一次处理一个块 / 一个数”

RSA 不是处理 128-bit block，而是处理一个 **比 modulus n 小的大整数**。

RSA 本体加密公式是：

$c \equiv m^e \pmod n$

意思是：

| 符号 | 意思                            |
| ---- | ------------------------------- |
| `m`  | 明文，被编码成一个大整数        |
| `e`  | 公钥指数                        |
| `n`  | modulus，模数，是两个大素数乘积 |
| `c`  | 密文，也是一个大整数            |

解密是：

```
m = c^d mod n
```

其中 `d` 是私钥指数。

所以 RSA 本体可以理解成：

```
RSA_public_key(m) → c
```

和 AES 类似，RSA 本体也不是直接处理无限长文件。