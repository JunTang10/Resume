# CISS6022 — Cybersecurity

## 第一周：了解主题、对象和访问权限的术语

### 1. Defining IT Security 信息技术安全的定义

- 保障IT系统按照预期运行，保护信息、资源与用户利益。

- 需要理解系统整体、其目标及各部分如何协作。

- 安全不仅需要技术能力，也需同理心与系统视角。

### 2. External View of a Computer 计算机的外部视角

- 信息来源：各种传感器（手势、语音、触摸、灯光、烟雾探测器等）输入数据。

- 信息输出：通过视觉、音频、灯光、机械动作、功率控制等形式实现。输入-处理-输出构成控制循环。

### 3. Computer Organisation 计算机组织结构

- 硬件组成：CPU、内存、设备、总线。CPU 执行流程：提取（fetch）、解码（decode）、行（execute）。内存结构：虚拟地址映射到物理地址，用于多进程之间的资源分配。内核模式与用户模式：只有内核模式才能访问敏感指令和内存区域。

### 4. Operating System 操作系统

- 它对计算机安全、其流程、文件和帐户管理的重要性

- 作用：管理硬件资源，实现用户间资源共享（内存、执行、文件、设备等）。

- 安全功能：进程管理与调度：文件系统抽象（文件/目录），设备管理（驱动、系统调用），账户管理与认证（权限分配、资源使*用）*保护机制：虚拟机、沙箱、虚拟内存；特权级划分（如 root 权限）

### 5. Access Control 访问控制

- 术语：Subject（主体）：发起请求的用户或进程Object（客体）：被访问的资源（如文件、设备）Access Right（访问权限）：读、写、执行、所有权等

- Terminology:Subject: The user or process initiating a requestObject: The resource being accessed (e.g., file, device)Access Right: Permissions like read, write, execute, ownership

- 访问控制矩阵：记录每个主体对每个客体的权限（如 UNIX 权限）。

- Access Control Matrix: Records which subject has what rights over which object (e.g., UNIX file permissions).

- OS Access Control Management:

- 了解作系统如何管理访问控制操作系统。

- Determines whether a subject is allowed to access a given object.

- 管理机制：权限分配、撤销、动态调整、角色划分（如RBAC）

- Mechanisms include: assigning permissions, revoking access, dynamic adjustment, and role-based access control (RBAC).

### 6. Privilege Escalation 权限提升

- 管理员权限：仅限受信任用户执行关键操作（安装、账户创建等）。提升机制：su 命令、setuid 程序，临时以更高权限运行安全风险：漏洞或设计失误可能导致攻击者非法获更高权限。

- Administrator Privileges: Restricted to trusted users for critical tasks (e.g., software installation, account creation).

- Elevation Mechanisms:  Commands like su, setuid allow temporary elevation of privileges.

- Security Risks:Vulnerabilities or poor design can allow attackers to gain unauthorized high-level access

## 

## 第二周：通信安全与密码学基础

### 1. 通信安全的核心属性（Attributes of Communication Security）

通信安全主要包括四个核心属性：

- **保密性（Confidentiality）**：只有发送者和预期接收者能够理解信息内容。
- **身份认证（Authentication）**：通信双方能够确认对方的身份。
- **消息完整性（Message Integrity）**：确保消息在传输或存储过程中未被篡改。
- **访问与可用性（Access and Availability）**：系统和服务应持续对合法用户可用。

### 2. 密码学基本术语（Cryptographic Terminology）

- **加密（Encryption）**：将明文（Plaintext）转换为密文（Ciphertext）。
- **解密（Decryption）**：将密文恢复为明文。
- **加密算法（Cryptographic Algorithm）**：执行加密或解密的规则和方法。
- **密钥（Key）**：控制加密和解密过程的参数。
- **密码分析（Cryptanalysis）**：研究如何分析或破解密码系统。
- **数字签名（Digital Signature）**：用于验证消息来源、完整性和提供不可否认性的机制。

在密码学示例中：

- **Alice** 和 **Bob**：通信双方。
- **Eve**：潜在的窃听者或攻击者。

**差分密码分析（Differential Cryptanalysis）**研究明文输入差异如何影响加密后的输出差异，并利用加密算法结构中的弱点降低破解难度。

### 3. 对称加密与非对称加密（Symmetric vs Asymmetric Cryptography）

#### 对称加密（Symmetric Encryption）

发送者和接收者使用相同的密钥进行加密和解密。

- 优点：速度快，适合大量数据加密。
- 缺点：密钥分发和管理困难。

#### 非对称加密（Asymmetric/Public-Key Encryption）

每个用户拥有一对密钥：

- **公钥（Public Key）**：可以公开。
- **私钥（Private Key）**：由所有者秘密保存。

非对称加密能够缓解密钥分发问题，但计算开销通常高于对称加密。

### 4. 数字签名与消息完整性（Digital Signatures and Message Integrity）

数字签名的基本过程：

1. 使用哈希函数计算消息摘要。
2. 发送者使用私钥对消息摘要进行签名。
3. 接收者使用发送者的公钥验证签名。
4. 如果消息被修改，签名验证将失败。

数字签名可以提供：

- **身份认证（Authentication）**
- **消息完整性（Integrity）**
- **不可否认性（Non-repudiation）**

哈希函数（如 **SHA-256**）可以将任意长度的消息转换为固定长度的“数字指纹”。

> 更准确地说，数字签名不是简单地“用私钥加密哈希值”，而是使用私钥对消息摘要执行特定的签名算法。

### 5. 密钥及其管理（Keys and Key Management）

密钥通常是用于控制加密、解密或签名过程的位序列。

- 密钥空间越大，穷举攻击的成本通常越高。
- 密钥不等于密码。
- 密码可以通过**密钥派生函数（KDF, Key Derivation Function）**转换为密钥。

二者的区别可以简单理解为：

- **密钥（Key）**：由系统使用的高随机性位串。
- **密码（Password）**：用户知道并输入的信息，通常随机性较低。

### 6. HTTPS与TLS的工作机制（HTTPS and TLS Workflow）

HTTPS 是运行在 **TLS** 安全层之上的 HTTP，用于保护浏览器和服务器之间的通信。

基本流程如下：

1. 浏览器连接服务器。
2. 双方协商TLS版本和加密算法。
3. 服务器向浏览器发送数字证书。
4. 浏览器验证证书及服务器身份。
5. 双方通过密钥交换协议建立共享会话密钥。
6. 后续数据主要使用高效的对称加密传输。
7. TLS同时保护通信的保密性和完整性。

> 早期TLS可以使用服务器公钥加密会话密钥；现代TLS通常使用（EC）DHE临时密钥交换，以提供前向保密性（Forward Secrecy）。



## 第三周：软件漏洞与恶意软件（Week 3: Software Vulnerabilities and Malware）

### 1. 堆栈内存与控制流（Stack Memory and Control Flow）

**堆栈内存（Stack Memory）**是函数运行时用于存储局部变量、函数参数和返回地址的内存区域，遵循后进先出（Last In, First Out，LIFO）原则。

**控制流（Control Flow）**是程序执行指令的顺序。函数执行结束后，程序会根据堆栈中保存的返回地址继续运行。如果攻击者覆盖返回地址，就可能劫持程序的控制流。

### 2. 缓冲区溢出与漏洞利用（Buffer Overflow and Exploitation）

**缓冲区溢出（Buffer Overflow）**是指程序写入数组或缓冲区的数据超过其容量，从而覆盖相邻内存区域，例如返回地址。攻击者可能借此改变控制流、执行恶意代码、打开命令行解释器（Shell）或提升权限。

常见防御方法包括边界检查（Bounds Checking）、栈保护（Stack Canary）、地址空间布局随机化（Address Space Layout Randomisation，ASLR）和数据执行保护（Data Execution Prevention，DEP/NX）。

**漏洞利用（Exploitation）**是利用程序中的逻辑错误、输入验证问题或内存管理缺陷改变程序行为。攻击者可能借此绕过认证、执行恶意代码或获得未被授权的权限。

**权限提升（Privilege Escalation）**是从较低权限获得更高权限的过程，例如普通用户通过系统漏洞获得根用户权限。

### 3. 争态条件攻击（Race Condition Attack）

**争态条件（Race Condition）**发生在多个进程或线程并发访问共享资源，并且操作顺序会影响最终结果时。

典型例子是**检查时刻到使用时刻攻击（Time of Check to Time of Use，TOCTOU）**。系统首先检查资源是否合法，但攻击者在检查完成后、资源被实际使用前将其替换，导致系统对被替换的资源执行操作。

防御方法包括使用原子操作（Atomic Operations）、文件锁或线程锁，并尽量消除检查与使用之间的时间窗口。

### 4. SQL注入（SQL Injection）

**SQL注入（SQL Injection）**发生在程序将未经安全处理的用户输入直接拼接进SQL语句时。攻击者可以插入恶意SQL代码，从而改变原有的查询逻辑。

例如，攻击者输入：

```
' OR '1'='1
```

可能使登录条件始终成立，从而绕过身份验证。SQL注入还可能导致敏感数据被读取、修改或删除。

最重要的防御方法是使用**参数化查询（Parameterized Queries）\**或\**预编译语句（Prepared Statements）**。此外，还应遵循最小权限原则（Principle of Least Privilege）、验证用户输入，并避免向用户显示详细的数据库错误信息。

### 5. 恶意软件类型（Types of Malware）

**病毒（Virus）**会附着在文件或程序上，通常需要用户运行受感染文件后才能传播。

**蠕虫（Worm）**能够自我复制并通过网络自动传播，不需要用户主动执行。

**木马（Trojan）**伪装成正常软件，诱骗用户安装。木马通常不会像病毒或蠕虫一样自我复制。

**逻辑炸弹（Logic Bomb）**会在特定条件满足时触发恶意行为，例如到达特定日期或出现特定文件。

**根工具包（Rootkit）**用于隐藏恶意进程、文件、网络连接和入侵痕迹，使攻击活动更难被发现。

**后门（Backdoor或Trapdoor）**是绕过正常身份验证机制、秘密访问系统的方法。

**键盘记录器（Keylogger）**能够记录用户的键盘输入，从而窃取密码、银行卡信息和聊天内容等敏感数据。

### 6. 访问控制术语（Access Control Terminology）

**主体（Subject）**是主动请求访问资源的用户、进程或程序。

**客体（Object）**是被访问的资源，例如文件、数据库、内存和设备。

**访问权限（Access Right）**表示主体可以对客体执行的操作，例如读取、写入或执行。

**访问控制矩阵（Access Control Matrix）**用于表示不同主体对不同客体拥有的访问权限。

**根用户（Root）**是Unix/Linux系统中的超级用户，通常拥有系统的最高权限。

**沙箱（Sandbox）**是一种受限制的隔离环境，用于安全地运行不可信程序，防止其随意访问重要系统资源。

**临时权限（Temporary Privileges）**是程序为了完成特定操作而暂时获得的额外权限，操作完成后应当立即撤销。

## 第四周：网络结构、TCP/IP与网络攻击

### 1. 网络基本结构（Network Structure）

计算机网络由节点和连接节点的链路组成。**节点（Node）**是网络中的计算机或设备；**链路（Link）**是节点之间传输数据的连接；**主机（Host）**是通信的端点，通常分为客户端和服务器；**中间系统（Intermediate System）**则负责转发数据，例如交换机和路由器。

网络可以进一步分为**网络边缘（Network Edge）\**和\**网络核心（Network Core）**。网络边缘由用户设备、客户端和服务器组成，是数据产生和接收的位置；网络核心主要由路由器及高速通信链路组成，负责在不同网络之间转发数据。

### 2. 物理传输介质（Physical Transmission Media）

网络需要通过物理介质传输电信号、光信号或无线电波。物理介质可以分为导向介质和非导向介质。

**导向介质（Guided Media）**使用实体线路限制信号的传播路径。双绞线（Twisted Pair）广泛应用于以太网；同轴电缆（Coaxial Cable）具有较好的抗干扰能力；光纤（Optical Fibre）利用光信号传输数据，适合高速、远距离通信。

**非导向介质（Unguided Media）**不依赖实体线路，而是利用无线电波、微波或卫星信号传输数据。Wi-Fi、蓝牙、4G、5G和卫星通信都属于无线通信。

### 3. 网络拓扑（Network Topology）

网络拓扑描述节点和链路的排列及连接方式。常见结构包括点对点、总线、星型、环形和网状拓扑。

**点对点拓扑（Point-to-Point）**直接连接两个节点；**总线拓扑（Bus）**允许多个设备共享一条通信线路；**星型拓扑（Star）**将所有设备连接到中心交换机或集线器；**环形拓扑（Ring）**使节点形成闭合链路；**网状拓扑（Mesh）**在节点之间建立多条路径，具有较强的冗余能力，可以降低单点故障造成的影响。

### 4. 接入网络（Access Networks）

接入网络负责将终端设备连接到互联网。家庭网络通常使用DSL、光纤或电缆调制解调器，并通过路由器、Wi-Fi和网络地址转换（NAT）连接多个设备。企业网络通常采用以太网交换机组织局域网，并通过路由器连接外部网络。

无线接入网络通过**无线接入点（Access Point，AP）**提供覆盖。设备需要先连接接入点，并根据网络配置完成身份认证，然后才能访问局域网或互联网。移动网络则通过4G或5G基站提供无线接入。

### 5. 互联网结构（Internet Structure）

互联网并不是一个单独的网络，而是由大量相互连接的网络构成，因此常被称为“网络之网”。这些网络通常划分为不同的**自治系统（Autonomous System，AS）**，每个自治系统由互联网服务提供商、企业、大学或其他组织独立管理。

自治系统内部使用相应的内部路由协议选择路径，不同自治系统之间则主要使用**边界网关协议（Border Gateway Protocol，BGP）**交换路由信息。路由器根据路由表确定数据包的下一跳，使数据包逐跳到达目的网络。

### 6. TCP/IP参考模型（TCP/IP Reference Model）

TCP/IP模型通过分层方式组织网络通信。每一层承担不同功能，并为上一层提供服务。

**应用层（Application Layer）**直接为应用程序提供网络功能，常见协议包括HTTP、DNS、SMTP和FTP。**传输层（Transport Layer）**负责端到端通信，主要协议是TCP和UDP。**网络层（Internet Layer）**使用IP协议完成逻辑寻址和数据包路由。**网络接口层（Link Layer）**负责局域网中的帧传输、MAC寻址以及对物理网络的访问。

数据从应用程序发送到网络时，会依次经过各层。每一层都会加入自己的控制信息；接收端则按照相反顺序移除这些信息并恢复原始数据。

### 7. 封装与分层数据流（Encapsulation and Layered Data Flow）

**封装（Encapsulation）**是指数据向下经过TCP/IP各层时，每一层在数据中加入相应的首部，有时还会加入尾部。应用层数据在传输层被封装为TCP报文段或UDP数据报，在网络层被封装为IP数据包，最后在链路层被封装为帧。

接收端执行相反的**解封装（Decapsulation）**过程。链路层移除帧首部，网络层处理IP首部，传输层处理TCP或UDP信息，最终将应用数据交给相应程序。

### 8. 地址与身份标识（Addressing and Identification）

不同网络层使用不同的标识符。

**MAC地址（MAC Address）**用于链路层的局域网通信，通常为48位。**IP地址（IP Address）**用于网络层的逻辑寻址，IPv4地址为32位，IPv6地址为128位。IP地址标识网络接口在特定网络中的位置，但不一定是永久或全球唯一的，因为地址可以动态分配，也可能经过NAT转换。

**端口号（Port Number）**是传输层使用的16位标识符，用于区分同一主机上的不同应用或服务。例如，HTTP传统上使用80端口，HTTPS通常使用443端口。**域名系统（DNS）**则在应用层将人类容易理解的域名转换为IP地址。

### 9. IP协议与路由（IP Protocol and Routing）

IP协议负责将数据包从源主机传送到目的网络。发送方在IP数据包中写入源IP地址和目的IP地址，路由器读取目的地址并查询路由表，然后将数据包发送给下一跳。

这一过程会在多个路由器之间重复，直到数据包到达目的网络。IP采用**尽力而为（Best-Effort）**的服务方式，本身不保证数据包一定到达，也不保证数据包按顺序到达或只到达一次。可靠性需要由TCP等上层协议提供。

### 10. TCP可靠连接（Reliable TCP Connection）

TCP是一种面向连接的传输层协议。在正式发送数据之前，通信双方通常通过**三次握手（Three-Way Handshake）**建立连接。

TCP使用序列号维持数据顺序，使用确认应答判断数据是否到达，并在数据丢失时进行重传。因此，TCP能够向应用程序提供有序、可靠的字节流。HTTP、电子邮件和文件传输等对数据完整性要求较高的服务通常使用TCP。

需要注意，TCP提供的是传输可靠性，但不提供加密。HTTPS会在TCP之上使用**传输层安全协议（TLS）**。TLS通过加密保护机密性，并通过消息认证或现代认证加密机制保护数据的完整性和真实性。

### 11. UDP不可靠传输（Unreliable UDP Transport）

UDP是一种无连接协议。它在发送数据之前不建立连接，也不提供确认、重传和顺序恢复机制。因此，UDP不能保证数据一定到达，也不能保证数据按发送顺序到达。

UDP的协议开销较小，延迟较低，适用于更重视实时性而能够容忍少量丢包的场景，例如语音通话、视频直播、在线游戏和部分DNS查询。应用程序也可以在UDP之上自行增加可靠性或安全机制。

### 12. 域名系统（Domain Name System，DNS）

DNS负责将域名转换为IP地址。例如，用户输入一个网站域名后，系统会向DNS解析器查询对应的IP地址，然后才能与目标服务器建立通信。

为了提高解析效率，DNS服务器和客户端会缓存查询结果。**DNS缓存投毒（DNS Cache Poisoning）**是指攻击者设法将伪造的域名与IP地址对应关系写入缓存，使用户被重定向到恶意服务器或虚假网站。

常见防护措施包括使用随机查询标识、限制缓存信息的有效期，以及通过DNSSEC验证DNS记录的真实性。

### 13. 网络侦察（Network Reconnaissance）

网络侦察是攻击者收集目标系统信息的过程。攻击者可能扫描IP地址和端口，识别操作系统、网络服务、软件版本及潜在漏洞，从而确定后续攻击目标。

Nmap等工具可以用于合法的网络管理和授权安全测试，但未经授权扫描他人系统可能违反法律或组织安全政策。Wireshark主要用于捕获和分析网络数据包，并不是典型的端口扫描工具。

### 14. 网络窃听（Eavesdropping）

网络窃听是指攻击者截获网络中传输的数据。在共享无线网络、配置不当的局域网或未加密通信中，攻击者可能通过数据包嗅探获取账户信息、会话数据或其他敏感内容。

加密协议可以降低窃听风险。例如，HTTPS使用TLS保护网页通信，WPA2或WPA3可以保护Wi-Fi链路上的数据传输。

### 15. 身份伪装（Impersonation）

身份伪装是指攻击者冒充合法用户、设备或服务器。常见方式包括密码猜测、会话劫持、伪造网站、IP欺骗和ARP欺骗。DNS缓存投毒也可能将用户引导至由攻击者控制的服务器，从而支持身份伪装或网络钓鱼。

身份认证、多因素认证、加密通信和数字证书可以降低身份伪装攻击的风险。

### 16. 拒绝服务攻击（Denial of Service，DoS）

拒绝服务攻击通过消耗目标系统的带宽、连接、内存或计算资源，使合法用户无法正常使用服务。**分布式拒绝服务攻击（Distributed Denial of Service，DDoS）**则利用由大量受控设备组成的僵尸网络，从多个来源同时攻击目标，因此更难阻止。

**Ping Flood**通过发送大量ICMP请求消耗网络资源；**SYN Flood**利用TCP三次握手机制，制造大量未完成的半连接；**DNS放大攻击（DNS Amplification）**则向开放DNS服务器发送伪造源地址的小型请求，使大量放大后的响应被发送给受害者。

DoS和DDoS攻击的主要目标通常不是窃取数据，而是破坏服务的**可用性（Availability）**。第五周：

#### ✅ 了解漏洞的含义 & 零日漏洞（Zero-day Vulnerability）

定义：漏洞是程序中存在的缺陷，在攻击者可访问并有能力利用时构成威胁（

零日漏洞：指尚未被厂商修补、也未公开披露的漏洞，极具危害性。

Vulnerability = Flaw + Accessible + Exploitable

#### Q1: Key Vulnerabilities Identified问题 1：已识别的关键漏洞

Social engineering – Staff vulnerable to phishing emails社会工程学 ——员工容易受到网络钓鱼电子邮件的攻击

Unpatched zero-day vulnerabilities in systems or applications系统或应用程序中未修补的零日漏洞 Insufficient network segmentation, enabling lateral movement网络分段不足 ，导致横向移动→ These issues enabled initial access, persistence, and eventual data exfiltration.→ 这些问题导致了初始访问、持久性和最终的数据泄露 。

#### Q2: Incident Response PlanQ2：事件响应计划

Containment – Isolate affected systems遏制 ——隔离受影响的系统Identification – Assess attack scope and vectors识别 ——评估攻击范围和载体Eradication – Remove malware and patch vulnerabilities根除 ——删除恶意软件并修补漏洞Recovery – Safely restore systems恢复 ——安全恢复系统

Documentation – Maintain detailed incident records文档 ——保留详细的事件记录

Communication – Notify stakeholders or authorities when needed沟通 ——必要时通知利益相关者或当局

#### Q3: Long-Term StrategiesQ3：长期战略

Zero Trust Architecture – Verify every access attempt, limit lateral movement零信任架构 ——验证每次访问尝试，限制横向移动

Comprehensive security awareness training – Regular phishing simulations and education to build a “human firewall”全面的安全意识培训 ——定期进行网络钓鱼模拟和教育，构建“人肉防火墙”

Advanced threat detection and response – Deploy AI-powered EDR/XDR for early detection高级威胁检测与响应 ——部署 AI 驱动的 EDR/XDR 以实现早期检测

#### ✅ Canary 的概念（堆栈 Cookie）

Canary机制：在函数返回前检测是否有栈溢出攻击。

方法是在栈帧中插入一个“金丝雀值”，若值被篡改则终止执行，防止控制流被劫持（第9页）。

Stack canary helps detect buffer overflows before return

#### ✅ 黑盒测试与模糊测试（Fuzz Testing）

黑盒测试：不依赖程序源代码，仅通过输入输出行为测试（第12页）。

模糊测试：向程序输入大量随机或异常数据，观察是否崩溃，是发现未知漏洞的有效方法。

Testing presence of bugs, fuzzing can reveal exploitable flaws

#### ✅ 网络安全实施过程：威胁分析 & 加密

威胁分析：识别网络组件（链路、主机、协议层）中可能的拦截、伪装等威胁  加密技术：包括链路层加密和端到端加密确保数据保密与完整性。Encryption + threat modeling are key to defense

#### ✅ VPN 工作原理

VPN通过加密隧道保护远程访问通信内容，常用于企业远程连接。防火墙会验证身份并生成加密密钥，数据通过IP隧道加密传输。  VPN creates secure encrypted tunnels over the Internet

#### ✅ PKI 与证书（Public Key Infrastructure）

PKI依赖可信CA签发数字证书，用于加密通信与身份验证。创建、验证、撤销证书

可设有注册机构（RA）作为CA接口PKI helps establish trust through digital certificates

#### ✅ 强身份验证（Strong Authentication）

传统密码容易被窃听 ；使用一次性密码（OTP）、密码令牌（如SecurID）、挑战响应机制提升安全（第33页）

强身份验证机制阻止伪造与重放攻击

#### ✅ 防火墙工作原理及限制

阻止未授权流量，分为三种类型（第37页）：无状态包过滤（Stateless）有状态包过滤（Stateful）应用网关（Application Gateway）限制包括无法防IP伪造、对UDP控制弱等 Firewalls are necessary but not sufficient alone

#### ✅ 无状态 vs 有状态 数据包筛选

无状态：逐个包检查，效率高但易被绕过

有状态：记录连接状态，能识别不合逻辑的流量

Stateful filters track session context; stateless do not

#### ✅ 入侵检测系统（IDS）运作方式：监控网络或主机行为，检测异常（第46页）

基于签名的 IDS：比对已知攻击特征（如端口扫描）启发式 IDS（Heuristic）：分析行为模式，发现未知攻击基于主机的 IDS（HIDS）：检查文件系统变化（第54页）隐身模式（Stealth）：不在网络上暴露自身存在，避免被攻击者发现

IDS enhances detection beyond firewall capabilities

#### ✅ 如何保护电子邮件（Secure E-mail）

目标：保密性、完整性、防伪造 标准：PGP、S/MIME 使用加密和签名 防垃圾与伪造：使用 SPF、DKIM、DMARC  Secure e-mail uses encryption and signature protocols to defend against spoofing

### 第五周：网络防御与安全机制（Network Defence and Security Mechanisms）

#### 1. 漏洞与零日漏洞（Vulnerabilities and Zero-Day Vulnerabilities）

**漏洞（Vulnerability）**是系统、程序、配置或安全流程中的弱点。当攻击者能够接触该弱点并利用它影响系统的保密性、完整性或可用性时，漏洞便会形成实际安全风险。其基本关系可以概括为：

> **漏洞 = 缺陷 + 可访问性 + 可利用性**  
> **Vulnerability = Flaw + Accessibility + Exploitability**

**零日漏洞（Zero-Day Vulnerability）**通常是指尚无可用补丁、因而留给防御者“零天”修复时间的漏洞。它可能尚未被厂商发现，也可能已被发现但补丁仍未发布。攻击者利用零日漏洞实施的攻击称为**零日攻击（Zero-Day Attack）**。

企业中常见的关键漏洞包括员工容易受到网络钓鱼影响、系统未及时更新、访问控制配置不当以及网络分段不足。这些问题可能使攻击者获得**初始访问（Initial Access）**，在系统内建立**持久性（Persistence）**，横向移动至其他主机，最终窃取敏感数据。

#### 2. 事件响应过程（Incident Response Process）

事件响应的目标是控制安全事件、消除攻击影响并安全恢复业务。首先需要进行**识别（Identification）**，确认事件性质、攻击入口、影响范围和涉及的数据。随后通过**遏制（Containment）**隔离受感染设备、限制恶意账户并阻断攻击通信，防止事件继续扩散。

完成遏制后，需要进入**根除（Eradication）**阶段，删除恶意软件、关闭攻击入口并修复相关漏洞。在**恢复（Recovery）**阶段，应从可信备份恢复系统，并持续监控是否存在残留攻击活动。

事件处理期间还需要保存日志、时间线、技术证据和处置记录，并根据法律、监管和合同要求通知管理层、客户或有关机构。事件结束后应开展**事后复盘（Post-Incident Review）**，分析根本原因并改进安全控制。

#### 3. 缓冲区溢出防御（Buffer Overflow Defence）

缓冲区溢出发生在程序向固定大小的内存区域写入过多数据时。超出边界的数据可能覆盖相邻变量、函数指针或返回地址，从而破坏程序控制流。

**栈金丝雀（Stack Canary）**是在局部变量与控制数据之间插入的随机值。函数返回前，系统会检查该值是否发生变化。如果金丝雀值被覆盖，程序会立即终止，从而降低攻击者篡改返回地址的可能性。

其他防御机制还包括**地址空间布局随机化（Address Space Layout Randomisation, ASLR）**、**数据执行保护（Data Execution Prevention, DEP）**和**不可执行位（No-Execute Bit, NX）**。ASLR随机排列关键内存区域的位置，DEP和NX则阻止程序将数据区域中的内容直接作为代码执行。

从软件开发角度看，还可以采用具有内存安全机制的语言，如Java、Python、Rust和Swift，并结合静态分析、动态分析和内存检测工具发现越界访问、释放后使用及内存泄漏等问题。不过，内存安全语言仍可能存在逻辑错误、依赖漏洞和不安全配置。

#### 4. 黑盒测试与模糊测试（Black-Box Testing and Fuzz Testing）

**黑盒测试（Black-Box Testing）**不需要了解程序内部代码，而是通过向系统输入数据并观察输出、响应时间和错误行为来判断是否存在缺陷。这种方法与外部攻击者观察系统的方式较为接近。

**模糊测试（Fuzz Testing）**通过自动生成大量随机、异常、超长或格式错误的输入，观察程序是否崩溃、停止响应或产生异常结果。现代模糊测试器还可以根据代码覆盖率调整输入，从而探索更多执行路径。

程序崩溃只说明可能存在缺陷，并不代表该缺陷一定可以被利用。因此，发现异常后还需要进行输入复现、根本原因分析和可利用性判断。

#### 5. 安全设计原则（Security Design Principles）

安全系统应遵循若干基本原则。**最小权限（Least Privilege）**要求用户和程序只能获得完成任务所必需的权限；**安全默认设置（Fail-Safe Defaults）**要求系统默认拒绝访问，只有获得明确授权后才允许操作；**完全仲裁（Complete Mediation）**要求每次访问敏感资源时都进行权限检查。

系统设计还应保持简单和模块化，减少不必要的功能与攻击面。所有外部输入都应进行长度、类型、格式和范围验证，错误信息不应泄露敏感的系统结构。密码、密钥及其他敏感信息在使用后也应得到安全清理。

#### 6. 威胁建模与纵深防御（Threat Modelling and Defence in Depth）

**威胁建模（Threat Modelling）**是识别系统资产、信任边界、潜在攻击者、攻击入口和安全控制的过程。网络链路、主机、应用程序及通信协议都可能遭受监听、篡改、身份冒充、重放和拒绝服务攻击。

**纵深防御（Defence in Depth）**强调使用多层安全措施，而不是依赖单一产品。身份认证、网络分段、终端保护、加密、防火墙、入侵检测、备份和安全监控应相互配合。即使某一层失效，其他安全层仍能限制攻击范围。

网络分段可以将用户终端、Web服务器、应用服务器、数据库和管理网络划分到不同区域，并通过访问控制限制区域之间的通信。冗余服务器、故障转移和异地备份则可以提高系统的可用性与恢复能力。

#### 7. 链路加密与端到端加密（Link and End-to-End Encryption）

**链路加密（Link Encryption）**保护相邻网络节点之间的通信。数据到达中间节点后可能被解密，再使用下一段链路的密钥重新加密，因此中间设备仍可能接触明文。

**端到端加密（End-to-End Encryption）**由通信端点完成加密和解密，中间网络设备无法理解信息内容。它可以在数据穿越多个不可信网络时持续提供保护，但流量方向、通信时间和数据大小等元数据仍可能暴露。

两种方法可以同时使用。链路加密保护局部网络连接，端到端加密则保护数据在整个通信路径中的保密性和完整性。

#### 8. 匿名技术与虚拟专用网络（Anonymity Technologies and VPNs）

**网络地址转换（Network Address Translation, NAT）**可以隐藏内部设备的私有IP地址，但其主要目的是地址转换，并不能提供真正的匿名性。**代理服务器（Proxy Server）**代表客户端访问外部资源，可以隐藏客户端的直接网络地址，但代理运营者仍可能观察用户活动。

**洋葱路由（Onion Routing）**通过多个中继节点传输数据，并对路由信息进行分层加密。Tor是这种技术的典型实现，能够降低通信双方被直接关联的可能性，但并不能消除所有流量分析和终端泄露风险。

**虚拟专用网络（Virtual Private Network, VPN）**在公共网络上建立经过认证和加密的隧道。远程用户通过VPN网关验证身份并协商密钥，随后数据被封装在隧道协议中传输。VPN可以保护用户设备与VPN网关之间的通信，但数据离开VPN服务器后的安全性仍取决于目标协议和服务。

#### 9. 公钥基础设施与数字证书（Public Key Infrastructure and Digital Certificates）

**公钥基础设施（Public Key Infrastructure, PKI）**通过数字证书将实体身份与公钥关联起来。**证书颁发机构（Certificate Authority, CA）**负责签发和签署证书，**注册机构（Registration Authority, RA）**可以协助核验申请者身份。

客户端验证证书时，会检查证书签名、有效期、域名、证书链和撤销状态。证书撤销可以通过**证书撤销列表（Certificate Revocation List, CRL）**或**在线证书状态协议（Online Certificate Status Protocol, OCSP）**进行查询。

PKI不仅涉及证书签发，还包括密钥生成、证书更新、撤销、存档和销毁。CA或私钥一旦受到破坏，相关证书所建立的信任也可能失效。

#### 10. 强身份认证（Strong Authentication）

仅使用密码进行认证容易受到网络钓鱼、撞库、暴力破解和凭据泄露的影响。**多因素认证（Multi-Factor Authentication, MFA）**要求用户提供来自不同类别的认证因素，例如知道的密码、拥有的设备以及用户自身的生物特征。

常见机制包括**一次性密码（One-Time Password, OTP）**、硬件安全令牌、认证应用程序和挑战—响应协议。一次性密码可以降低密码重放风险，但通过短信或要求用户手动输入验证码的方式仍可能遭受钓鱼和中间人攻击。

基于FIDO2或WebAuthn的安全密钥使用公钥密码学验证登录，并将凭据绑定到特定网站，通常比密码和普通OTP具有更强的抗钓鱼能力。

#### 11. 安全通信协议（Secure Communication Protocols）

**传输层安全协议（Transport Layer Security, TLS）**运行在TCP之上，为客户端和服务器通信提供身份认证、机密性和完整性。HTTPS就是HTTP与TLS的组合。现代TLS通常通过临时密钥交换建立共享密钥，再使用高效的对称加密保护数据。

**安全外壳协议（Secure Shell, SSH）**用于安全远程登录、命令执行和文件传输。它通过服务器主机密钥验证服务器身份，并支持密码、公钥或其他方式认证用户。

**互联网协议安全（Internet Protocol Security, IPsec）**在网络层保护IP数据包，可以提供加密、完整性验证和来源认证。它既可用于IPv4，也可用于IPv6，经常用于站点到站点VPN和远程访问VPN。

#### 12. 防火墙及数据包过滤（Firewalls and Packet Filtering）

**防火墙（Firewall）**根据安全规则控制不同网络区域之间的流量。**无状态包过滤（Stateless Packet Filtering）**独立检查每个数据包的源地址、目标地址、端口和协议，处理速度较快，但不了解数据包所属的连接状态。

**有状态包过滤（Stateful Packet Filtering）**维护连接状态表，能够判断数据包是否属于已经建立的合法连接，从而识别部分不符合正常通信过程的数据包。**应用层网关（Application Gateway）**或代理防火墙则能够理解HTTP、DNS等应用层协议，并实施更细粒度的控制。

防火墙可以通过源地址验证等机制缓解IP欺骗，但无法独立解决所有伪造、内部威胁、恶意加密流量和应用程序漏洞。因此，防火墙应当与身份认证、终端防护、日志分析和入侵检测系统结合使用。

#### 13. 入侵检测与响应系统（Intrusion Detection and Response Systems）

**入侵检测系统（Intrusion Detection System, IDS）**持续监控网络或主机活动，并在发现可疑行为时产生警报。**基于签名的检测（Signature-Based Detection）**将流量或行为与已知攻击特征进行比较，准确率通常较高，但难以发现没有现成规则的新型攻击。

**基于异常或启发式的检测（Anomaly-Based or Heuristic Detection）**建立正常活动基线，并识别偏离正常模式的行为。它可能发现未知攻击，但通常会产生更多误报。

**主机型入侵检测系统（Host-Based IDS, HIDS）**监控文件、进程、日志和系统调用；**网络型入侵检测系统（Network-Based IDS, NIDS）**分析网络流量。部分IDS采用不对外分配普通IP地址的监控接口，以减少自身暴露，这种部署方式有时称为**隐身模式（Stealth Mode）**。

IDS主要负责检测和告警，而**入侵防御系统（Intrusion Prevention System, IPS）**部署在通信路径上，可以主动阻断恶意连接。**终端检测与响应（Endpoint Detection and Response, EDR）**和**扩展检测与响应（Extended Detection and Response, XDR）**则进一步整合终端、身份、邮件和网络数据，用于发现和调查复杂攻击。

#### 14. 蜜罐与欺骗防御（Honeypots and Deception Defence）

**蜜罐（Honeypot）**是专门设计用于吸引攻击者的虚假系统或服务。由于正常用户通常不会访问蜜罐，对蜜罐的连接本身便具有较高的可疑性。

蜜罐可以帮助安全人员观察攻击工具、技术和行为，但必须与生产环境严格隔离。如果配置不当，攻击者可能利用已被控制的蜜罐攻击其他系统。多个蜜罐组成的环境称为**蜜网（Honeynet）**。

#### 15. 电子邮件安全（Secure E-mail）

电子邮件安全需要保护信息的保密性、完整性、来源真实性和可用性。**PGP（Pretty Good Privacy）**和**S/MIME（Secure/Multipurpose Internet Mail Extensions）**可以对邮件正文和附件进行加密或数字签名，但部分传输与路由信息通常仍然可见。

**发件人策略框架（Sender Policy Framework, SPF）**声明哪些服务器有权代表域名发送邮件；**域名密钥识别邮件（DomainKeys Identified Mail, DKIM）**通过数字签名验证邮件内容和发送域名；**基于域的消息认证、报告与一致性机制（Domain-based Message Authentication, Reporting and Conformance, DMARC）**结合SPF和DKIM结果，规定接收方应如何处理验证失败的邮件。

这些机制可以减少域名伪造，但不能完全阻止相似域名、被盗合法账户或社会工程学攻击。因此，邮件过滤仍需与用户安全意识和身份认证机制结合。

#### 16. 长期安全策略（Long-Term Security Strategies）

**零信任架构（Zero Trust Architecture）**遵循“永不默认信任，始终进行验证”的原则。系统应根据用户身份、设备状态、访问位置和风险水平持续评估每次访问，并通过最小权限和微分段限制横向移动。

安全意识培训应结合定期的网络钓鱼模拟，使员工能够识别可疑链接、异常附件和身份冒充行为。但培训不能替代技术控制，组织仍需部署邮件过滤、多因素认证、终端保护和权限管理机制。

高级检测与响应平台可以整合EDR、XDR和安全信息与事件管理系统的数据，帮助安全团队尽早识别异常行为。不过，人工智能产生的告警仍需要结合威胁情报、业务背景和安全人员判断进行分析。

#### 17. 安全管理、备份与恢复（Security Management, Backup and Recovery）

网络安全不仅是技术问题，还包括人员、流程和物理环境。组织应建立账户创建与撤销、密码和密钥管理、权限审查、软件更新、日志保存以及事件报告等日常制度。

重要数据和存储介质应进行加密，废弃设备中的数据必须通过安全擦除或物理销毁方式处理。备份应遵循多副本、不同介质和异地保存原则，并至少保留一份离线或不可变备份，以降低勒索软件同时破坏生产数据和备份的风险。

备份只有在能够成功恢复时才真正有价值，因此组织需要定期开展恢复测试和灾难恢复演练。网络安全不存在绝对安全，组织必须根据资产价值、威胁可能性、潜在影响和控制成本持续管理风险。

### 第六周：安全运营中心与事件响应（Security Operations Centre and Incident Response）

#### 1. 安全运营中心（Security Operations Centre, SOC）

**安全运营中心（SOC）**是集中监控、检测、分析和响应网络安全事件的组织单位。它通过持续观察组织的网络、终端、服务器、云平台和应用程序，及时发现异常活动并降低安全事件造成的影响。

SOC建立在三个核心要素之上：**人员（People）**负责分析、调查和决策；**流程（Process）**规定事件分类、升级、沟通和处置方法；**技术（Technology）**负责收集数据、检测威胁并支持自动响应。三者缺一不可，仅部署安全工具并不能形成完整的SOC能力。

SOC的主要服务包括风险管理、漏洞管理、事件管理、合规管理、数字取证、安全态势感知和安全技术研发。其目标不仅是发现攻击，还要理解组织当前面临的风险，并持续改进整体防御能力。

| | |
| --- | --- |
| ![Course illustration](https://images.openai.com/static-rsc-4/LRFkp6DLLuzLk96mQfOGICXtYwvroOjjLuQpJSF7J52blDt1yb5iieenqw4y-3Q6bpNtsUo_rEv5a8QFwOossKd4SQPu8uU_umpnNV9GoF_qG2PJjDB2I0_ismOLyqoize-ufj-LK63BLoazEJY8EdtyoRAucWn-C12Uen6Xkl_J9yS3J11xLOD8QYI-KGJp?purpose=fullsize) | ![Course illustration](https://images.openai.com/static-rsc-4/tkp863Sh2QLLkGC17ORYQfAjy-Xk1ATGSkQO3Uem0T3Oc1FK96K_P9ZIF4Mr7Qlo86_hJsNHopB307JvrRL5kR3aTYU01ZA4sAWJUuz4Rf7Ui3frB58bEwkuoZrDx4jimHMROjsq476Nm0UJElu89d4pkXd9zVfH7-YWzU9P5TTlRzWJQuL4gW1KjGeeG3uz?purpose=fullsize) |
| ![Course illustration](https://images.openai.com/static-rsc-4/ZX2J5lhA38Mg7wgdgcwAtKVXSd24r-GLFrjNlYO-2rG6sUy6Z7TREHq9S2eFW6i3wgzVGJbgIz82Wk897a-5XGpQgCeyEqVDIEy53Ak-dBeizJIXxnjoDeX2SN-RBuXvhqcfeIp_cYYQqvBGCew56tnEa0weKf1tSx6h0K0KK__1xfltoxuve1ATG8f_I34s?purpose=fullsize) | |
#### 2. SOC的组织结构（SOC Organisational Structure）

SOC通常采用分层分析模式。一级分析师负责监控告警、初步验证和事件分类；二级分析师负责深入调查、关联日志及判断攻击范围；三级分析师负责高级威胁狩猎、恶意软件分析和数字取证。SOC经理负责资源协调、绩效管理和重大事件升级。

现代SOC还需要与IT运维、网络团队、法律部门、人力资源、管理层和公共关系部门合作。重大安全事件通常同时涉及技术、业务、法律和声誉问题，因此不能仅由安全分析师独立处理。

SOC常见指标包括**平均检测时间（Mean Time to Detect, MTTD）**和**平均响应时间（Mean Time to Respond, MTTR）**。这些指标可以衡量组织发现和控制安全事件的效率，但不能只追求处理速度，还要考虑调查质量、误报率和事件是否真正得到解决。

#### 3. SOC的核心技术（Core SOC Technologies）

**安全信息与事件管理系统（Security Information and Event Management, SIEM）**集中收集来自操作系统、网络设备、应用程序、数据库和云平台的日志，并通过规则、搜索和关联分析发现可疑行为。Microsoft Sentinel、Splunk和IBM QRadar都是常见的SIEM平台；AWS CloudTrail则主要提供AWS账户活动和API调用日志，本身不属于完整的SIEM。

**终端检测与响应（Endpoint Detection and Response, EDR）**监控设备上的进程、文件、网络连接和用户行为；**扩展检测与响应（Extended Detection and Response, XDR）**进一步整合终端、网络、电子邮件、身份和云平台数据。

**安全编排、自动化与响应（Security Orchestration, Automation and Response, SOAR）**可以按照预设流程自动执行重复任务，例如查询IP信誉、隔离终端、禁用账户和创建调查工单。自动化能够提高响应速度，但高风险操作仍应保留人工审批。

其他常见技术还包括威胁情报平台、网络流量分析工具、漏洞扫描器、防火墙、IDS/IPS、WAF和反恶意软件系统。

#### 4. 事件响应与威胁情报（Incident Response and Threat Intelligence）

**事件响应（Incident Response）**是识别、分析、控制和处理安全事件的过程，其目标是尽快恢复正常业务，并降低事件对组织、客户和其他利益相关者的影响。

**威胁情报（Threat Intelligence）**是经过收集、分析并与实际环境结合的威胁信息。它关注潜在攻击者的动机、能力、工具、基础设施和攻击方法，帮助组织判断哪些威胁最值得优先处理。

威胁情报通常分为战略、战术、技术和运营层面。战略情报面向管理层，解释整体威胁趋势；战术情报描述攻击者的技术和程序；技术情报包括恶意IP、域名和文件哈希等**失陷指标（Indicators of Compromise, IoCs）**；运营情报则关注具体攻击活动及其目标。

原始数据只有在经过验证、分析并能够支持决策后，才能称为真正的威胁情报。

#### 5. 网络杀伤链（Cyber Kill Chain）

**网络杀伤链（Cyber Kill Chain）**将攻击过程划分为七个阶段。攻击者首先进行**侦察（Reconnaissance）**，收集目标人员、系统和网络信息；随后进行**武器化（Weaponisation）**，将漏洞利用代码与恶意载荷结合。

攻击工具通过电子邮件、恶意网站或移动介质完成**传送（Delivery）**，随后利用软件漏洞或人为错误进入**利用（Exploitation）**阶段。攻击者接着在目标系统中进行**安装（Installation）**，部署后门或其他持久化机制，并通过**命令与控制（Command and Control, C2）**与受感染设备通信。

最后，攻击者执行**目标行动（Actions on Objectives）**，例如窃取数据、勒索、破坏系统或进行长期监视。防御者在任何阶段阻止攻击，都可能中断整个攻击链。

| | |
| --- | --- |
| ![Course illustration](https://images.openai.com/static-rsc-4/DSBsPYDzAHe-QQLJH0XnySwmmoxbPQEYMJcXWVcBEgiJib_y2TPoBJkpLuzpgsR631tqWD8D1O2e7lB92qEVl9ByjaXsDbC15x-4UnAJebPUjum1eCHPmDKFKdro8DwOlsGHY9WYSQqY3CJ9qry-Qvu6-_wh_kzYGnKKrdEJZt8igrdZG_yJQHvFcm4qhSY1?purpose=fullsize) | ![Course illustration](https://images.openai.com/static-rsc-4/HIRsB4iyqQFOc6Fz0sHYT8TU8W4QGjNn8vmoKI1tEpIWbZV7vxOW-qkjnl1K7Gn5KEKe-YyR7hBIBzxvdu6L5hSXswrTEfuDoi8hXTbLff-E3taiFuevUAd2CDCEWxGDJw--riTLJkaUF__bgnqDUMra_Bi2aVxmEO04K9JzZH3XNDZpdUaaUvePwTmpY1BN?purpose=fullsize) |
| ![Course illustration](https://images.openai.com/static-rsc-4/jyARYaAZs3sCFLfF6jJYGsFkh2PUSoU72WsQbRJhLRxocb8hYxVy27cLr8SyUvKqGXD3tJ45BA-QqF2AjGh8ldJ8kmby-7MbcUnrRwgO_v5olWgMqqcLUWmK-6oFDoLS1Xcf1WmNKSTXzTxL_izHi8T7zfpoTKu2Cpd_nXlCBUPFRmpl1iD7M8Iy1d5DK2h7?purpose=fullsize) | |
5

网络杀伤链适合描述攻击的总体阶段，但现代攻击不一定严格按照线性顺序发展。实际分析中还经常使用**MITRE ATT&CK框架**描述攻击者的战术与技术，例如初始访问、权限提升、持久化、横向移动和数据外泄。

#### 6. 观察—判断—决策—行动循环（OODA Loop）

**OODA循环**包括观察、判断、决策和行动四个阶段。**观察（Observe）**是收集日志、告警和环境信息；**判断（Orient）**是结合业务背景分析事件；**决策（Decide）**是选择隔离、阻断或继续监控；**行动（Act）**是执行响应措施并观察结果。

OODA是一个持续循环。安全团队需要不断利用新的调查结果修正判断和行动。缩短这一循环，可以帮助防御者在攻击者完成目标前采取有效措施。

#### 7. 日志、告警与指标（Logs, Alerts and Metrics）

**日志（Log）**是系统活动的详细记录，例如登录时间、用户账户、源IP、命令执行和配置变化。日志主要用于审计、故障排查和事件调查。

**告警（Alert）**是安全工具在事件符合某项规则或异常模型时生成的提示。例如，同一账户在短时间内出现大量登录失败，可能触发暴力破解告警。告警是系统对日志作出的判断，但并不代表攻击一定真实发生。

**指标（Metric）**是反映系统状态的量化数据，例如CPU使用率、网络流量、登录失败次数和告警处理时间。指标主要用于观察趋势、发现异常并评估安全运营效果。

三者之间的关系可以理解为：

> 系统产生日志 → SIEM分析和关联日志 → 满足条件时生成告警 → 指标衡量整体状态和处置效果。

#### 8. 日志来源与日志解析（Log Sources and Parsing）

常见日志来源包括操作系统、中间件、Web服务器、应用程序、数据库、身份认证系统、云平台和网络设备。防火墙、IDS、EDR、WAF和Anti-DDoS系统也会产生大量安全日志。

不同系统的日志格式通常并不一致。**日志解析（Log Parsing）**负责从原始日志中提取时间戳、用户名、IP地址、事件类型和执行结果等字段，再将它们转换为统一格式，以便搜索和分析。

解析完成后还需要进行**标准化（Normalisation）**和**时间同步（Time Synchronisation）**。如果各设备的系统时间不一致，就难以准确重建攻击时间线。因此，组织通常使用NTP保证日志时间的一致性。

日志中可能包含密码、访问令牌、个人信息或业务数据，这类日志有时被称为**有毒日志（Toxic Logs）**。日志进入集中平台前，应进行脱敏、访问控制和加密，避免日志系统本身成为数据泄露来源。

#### 9. 日志搜索与事件关联（Log Searching and Event Correlation）

**搜索（Searching）**通过关键词、字段和时间范围查找特定事件，例如搜索某个IP在24小时内的所有登录记录。**事件关联（Event Correlation）**则把来自多个系统的相关事件组合起来，识别单条日志无法反映的攻击行为。

例如，某账户出现300次登录失败，随后成功登录；同一账户又在异常地点访问敏感数据库，并传出大量数据。单独观察这些事件可能无法确认攻击，但将其关联后，可能显示密码喷洒、账户接管和数据外泄的完整过程。

关联规则应持续调整。规则过于宽松会产生大量**误报（False Positives）**，规则过于严格则可能造成**漏报（False Negatives）**。SOC需要结合资产重要性、用户行为和威胁情报优化告警质量。

| | |
| --- | --- |
| ![Course illustration](https://images.openai.com/static-rsc-4/iSs9rYOcFx695hwUxl1eSWstA9E2jcJwYvJaa0eN0vjGH_mz4Qzfp8wXh75XNeTgHIE2tn20inkZojBf6n870u0fpBEENhsymh8TSxVyBQLNY_j-PgLn2tw9ScssOF3rGXJsohcObfqglKL5S-0QU79Pmkbcei0OfybDdrXN5vvgVSMDnB3Ypg1VDEWvUY3Q?purpose=fullsize) | ![Course illustration](https://images.openai.com/static-rsc-4/G8ywWCHMD9_KMUsrQmDMIaRuUiHCbDPwnazxbtQD_rGrO2XOYQVPktH6jiZXgOs_gBikHTjUFLTmXTZ98Frij1fCCeLE67rsio9hrPmtEPu2oBH5QKx0mvBd5urM-Y0bQKqN1nXrJxntRrcXYQFZw7zmFqKxOlr4Ki-JJydBqB48gqAUpOKN20Gdg-RaZqQz?purpose=fullsize) |
| ![Course illustration](https://images.openai.com/static-rsc-4/UhuKjP9bl31kUANJO-YfRtRsamSJywBn22gtXo1B-_dvNrA5FJ1m3PWh1ZAUBcbyKk1DjZfvlLPN74t_KY6_PCfBDPXqi_PGsIC5nXt9nqpc6T6_19n0TlR-iVaVqf5i84fJYR1_RIdVt-t8D1JNhY34_Gy_hOADHr1zyCQWshIvdTi1CWlQEapoHGODRkfA?purpose=fullsize) | |
7

#### 10. 热存储与冷存储（Hot and Cold Log Storage）

**热存储（Hot Storage）**保存近期且需要频繁查询的日志，通常使用高性能存储和索引，因此搜索速度快，但成本较高。它主要支持实时监控、威胁狩猎和近期事件调查。

**冷存储（Cold Storage）**保存不经常访问的历史日志，成本较低，但恢复和搜索所需时间较长，适用于长期归档、合规审计和历史调查。部分组织还设置介于两者之间的温存储。

日志保留时间应根据法律、行业规定、存储成本和调查需求确定，并不一定统一为一年。重要日志应防止未经授权的修改和删除，可使用只写存储、数字签名或不可变存储保护其完整性。

#### 11. 告警管理与自动响应（Alert Management and Automated Response）

SOC需要为告警设置规则、阈值、严重程度和处理时限。告警的优先级应综合考虑资产价值、威胁可信度、攻击影响和暴露范围，而不能只根据工具自动给出的等级判断。

关键告警必须得到调查和跟进，例如恶意软件执行、异常管理员登录、大量数据外传以及安全控制被关闭。告警关闭时应记录判断依据，避免真正的攻击因误判而被忽略。

对于重复且低风险的操作，可以使用SOAR自动完成情报查询、工单创建和证据收集。隔离生产服务器、关闭核心账户等可能影响业务的操作，应当设置人工审批和回滚机制。

#### 12. 事件响应团队（Incident Response Team）

事件响应团队需要覆盖技术、业务和治理职能。技术负责人负责调查攻击路径、隔离系统和恢复服务，并应安排备用人员。业务决策负责人负责批准暂停服务、调配资源和承担业务风险。

法律顾问负责判断数据泄露通知、监管义务和证据使用问题；公共关系人员负责与客户、媒体和外部机构沟通；人力资源代表处理涉及内部员工的事件。必要时还需要联系网络服务商、云服务商、保险机构和执法部门。

团队成员、联系方式和职责必须事先确定，而不是等到事件发生后再临时安排。

#### 13. 事件响应计划与生命周期（Incident Response Plan and Lifecycle）

事件响应计划应规定沟通渠道、事件分级、升级条件、决策权限、外部通知、财务资源以及证据保存要求。计划还应包含关键系统清单、联系人信息、备份位置和具体响应手册。

事件生命周期可以概括为**准备（Preparation）**、**检测与分析（Detection and Analysis）**、**遏制、根除与恢复（Containment, Eradication and Recovery）**以及**事后总结（Post-Incident Activity）**。

处置过程中需要先保护人员和关键业务，再控制攻击范围。恢复系统后仍应加强监控，确认攻击者没有留下后门。事后复盘的重点是找出根本原因、控制失效位置和改进措施，而不是简单追究个人责任。

#### 14. 事件响应测试与演练（Incident Response Testing and Exercises）

**桌面演练（Tabletop Exercise）**通过讨论虚拟事件，检查团队是否理解职责和决策流程；**功能演练（Functional Exercise）**要求相关团队实际执行部分响应任务，例如分析日志、隔离测试设备和进行内部通报。

**全面演练（Full-Scale Exercise）**尽可能模拟真实事件，由技术、管理、法律和沟通团队共同参与。**红队测试（Red Teaming）**则由授权安全人员模拟攻击者，检验组织能否发现并阻止攻击。

演练结束后应形成改进清单，明确负责人和完成期限。如果演练发现的问题没有得到修复，演练本身就无法真正提高安全能力。

#### 15. 数字取证与证据链（Digital Forensics and Chain of Custody）

数字取证负责识别、收集、保存和分析电子证据。事件响应要求迅速控制攻击，但操作不当可能覆盖内存、日志或文件时间戳，因此必须在业务控制和证据保护之间取得平衡。

**证据链（Chain of Custody）**记录证据由谁、在什么时间、以什么方式获取、保存、转移和分析。取证人员通常为原始数据制作只读副本，并使用哈希值验证证据在调查过程中没有发生变化。

对于可能涉及法律程序的事件，应使用经过验证的取证工具和标准流程，并限制证据访问权限。加密可以保护证据的保密性，哈希与数字签名则可帮助证明证据完整性。

#### 16. 补充复习要点（Additional Review Points）

**三因素认证（Three-Factor Authentication）**结合知识因素、持有因素和生物因素，但并不能保证“最高安全性”；认证强度仍取决于具体实现、抗钓鱼能力和账户恢复流程。

**跨站脚本攻击（Cross-Site Scripting, XSS）**的主要防御措施是根据输出位置进行编码，并配合输入验证、内容安全策略和安全框架。输入验证本身通常不足以彻底防止XSS。

**可信平台模块（Trusted Platform Module, TPM）**可以安全保存密码学密钥，并通过度量启动支持系统完整性验证。**侧信道攻击（Side-Channel Attack）**则利用执行时间、功耗、电磁辐射或缓存行为等物理信息推断秘密数据。

**元数据（Metadata）**通常不直接包含通信正文，但可以暴露通信双方、时间、频率、位置和数据量。大量元数据仍可能揭示敏感的行为模式。

**序列号（Sequence Number）**可以帮助检测消息重放，但通常还需要配合认证机制、时间窗口或随机数。没有完整性保护的序列号可能被攻击者修改。

**迪菲–赫尔曼密钥交换（Diffie–Hellman Key Exchange）**允许双方通过公共信道建立共享秘密，但必须进行身份认证以防止中间人攻击。使用临时DH密钥时可以提供前向保密性；固定DH并不必然具有这一性质。

**TLS完成消息（TLS Finished Message）**验证握手记录和双方导出的密钥是否一致，从而发现握手过程是否被篡改。

**AES**的分组大小为128位，即16字节。1500字节需要94个分组才能容纳，但最终长度是否恰好为1504字节取决于加密模式和填充方式。AES通常远快于RSA，适合大量数据加密；RSA等非对称算法主要用于密钥封装和数字签名。

**HMAC**使用共享密钥验证消息完整性，通常比数字签名更快，但不能提供公开验证和不可否认性。数字签名则允许任何拥有公钥的人验证签名。

**TLS卸载（TLS Offloading）**将TLS处理交给负载均衡器或专用设备，可以提高性能；如果卸载设备到后端服务器之间不再加密，则会降低内部通信保护，因此内部链路仍应根据风险使用TLS。

**CRL**并不是主动“撤销”证书，而是由CA发布已经被撤销证书的列表，客户端可以通过它检查证书状态。

**区块链（Blockchain）**通过哈希链接、共识和分布式复制提高历史记录被修改的难度，但它不能自动保证输入数据真实，也不能替代访问控制、隐私保护和安全代码。

#### 17. 系统与网络安全复习（System and Network Security Review）

**缓冲区溢出（Buffer Overflow）**可能覆盖控制数据并劫持程序执行流程；栈金丝雀、ASLR和NX可以提高利用难度。

**检查时间与使用时间漏洞（Time-of-Check to Time-of-Use, TOCTTOU）**利用安全检查与实际使用资源之间的时间差改变系统状态，属于竞争条件漏洞。

**SQL注入（SQL Injection）**通过构造恶意输入改变SQL语句逻辑。主要防御方法是使用参数化查询或预编译语句，并配合输入验证和最小数据库权限。

**蠕虫（Worm）**能够利用网络或系统漏洞自动复制和传播，不一定需要用户主动执行。**SYN洪水（SYN Flood）**则通过制造大量未完成的TCP连接消耗服务器连接资源。

**网状网络（Mesh Network）**具有较高的路径冗余和容错能力，但设备、链路和维护成本也更高。**虚拟局域网分段（VLAN Segmentation）**可以限制不同网络区域之间的通信，但还需要防火墙和访问控制规则才能有效阻止横向移动。

**多因素认证（MFA）**可以降低密码泄露后的账户接管风险，但不能绝对阻止访问。攻击者仍可能通过会话劫持、MFA疲劳攻击或恶意账户恢复流程绕过认证。

侦察扫描可能表现为同一来源对多个端口或主机的重复访问；原本处于空闲状态的设备突然产生异常网络流量，也可能表明设备受到控制。发现这类活动时，应根据业务影响迅速隔离设备、保存证据并展开调查。

系统补丁应根据漏洞严重性和资产风险安排，而不能仅等待低流量时段。对于正在被利用的严重漏洞，即使会影响业务，也可能需要实施紧急修补或临时缓解措施。

### 第七周：网络安全的地缘政治（Geopolitics of Cybersecurity）

#### 1. 全球网络威胁（Global Cyber Threats）

**网络威胁（Cyber Threat）**是指通过数字手段危害信息系统、网络、数据或用户的潜在恶意活动。当前常见威胁包括勒索软件、网络钓鱼、恶意软件、数据泄露和身份盗窃。

网络威胁的行为主体可能包括内部人员、个人攻击者、网络犯罪组织、工业间谍、黑客行动主义者、网络恐怖主义者和国家支持的攻击组织。**道德黑客（Ethical Hacker）**通常在获得授权后测试系统安全，因此不应直接归类为网络犯罪分子。

**内部威胁（Insider Threat）**是组织内部人员利用合法访问权限造成的安全风险。行为可能是恶意的，也可能源于疏忽、错误配置或凭据被盗。

#### 2. 网络安全与地缘政治（Cybersecurity and Geopolitics）

网络安全的地缘政治研究地理位置、国家利益、权力关系和国际冲突如何影响信息系统安全。网络基础设施跨越国界，但法律、监管和国家利益仍以主权国家为中心，由此产生复杂的管辖权和国际合作问题。

网络安全会影响国家安全、经济稳定、公共服务、军事能力和国际关系。针对能源、通信、金融或交通系统的攻击可能同时产生技术、经济和政治后果，因此网络安全已经成为国家战略的重要组成部分。

#### 3. 网络安全为何是棘手问题（Cybersecurity as a Wicked Problem）

网络安全被称为**棘手问题（Wicked Problem）**，是因为威胁、技术、参与者和目标不断变化，通常不存在能够永久解决问题的单一方案。系统之间高度互联，一个组织的安全也可能依赖供应商、云平台和用户行为。

攻击方式快速演变，防御者必须保护大量入口，而攻击者可能只需找到一个薄弱点。安全控制还需要兼顾成本、效率、隐私和用户体验。技术、人因、组织和政治问题相互影响，使网络安全成为持续治理过程，而不是一次性工程任务。

#### 4. 有效与无效的安全方法（Effective and Ineffective Approaches）

有效策略通常包括主动威胁情报、持续监控、补丁管理、员工培训、多因素认证、事件响应准备和国际情报合作。它们共同构成**纵深防御（Defence in Depth）**，避免组织依赖单一控制措施。

常见失败原因包括过度依赖某一种技术、忽视人为风险、缺乏长期战略、重复使用密码、未部署MFA以及没有测试事件响应计划。安全技术只有与清晰流程、责任分配和人员能力结合，才能发挥作用。

#### 5. 网络空间中的主要参与者（Major Actors in Cyberspace）

国家利用网络能力开展情报收集、军事准备、政治影响和关键基础设施保护。私营企业控制大量平台、数据和网络基础设施，同时也是攻击目标和安全技术提供者。联合国、北约及区域组织则参与制定国际规范、促进合作和协调网络事件响应。

个人、公民社会组织和技术社群也会影响网络空间治理。例如，安全研究人员可以披露漏洞，平台用户能够推动公共议题，行动主义团体则可能通过数字工具进行政治动员。

#### 6. 网络安全的未来趋势（Future Cybersecurity Trends）

人工智能、物联网、云计算和区块链正在扩大网络安全的应用范围，同时带来新的攻击面。未来治理需要更主动的政策、跨国合作、威胁情报共享和网络空间行为规范。

不存在绝对安全。组织需要根据资产价值、威胁可能性、潜在影响和控制成本持续评估风险，并在**变化（Change）**、**连续性（Continuity）**、**成本（Cost）**、**合规性（Compliance）**和**覆盖范围（Coverage）**之间取得平衡。这五项有时被概括为网络安全的“5C”。

### 第八周：安全化与网络战争争议（Securitisation and the Cyberwar Debate）

#### 1. 安全化理论（Securitisation Theory）

哥本哈根学派提出的**安全化（Securitisation）**理论认为，某个议题并非天然属于国家安全问题，而是可能被政府、媒体或权威人士通过话语建构为生存性威胁。当相关受众接受这种论述后，行为者便可能获得采取非常规措施的正当性。

安全化包括四个要素：提出安全论述的**安全化行为者（Securitising Actor）**、将议题描述为威胁的**言语行为（Speech Act）**、需要保护的**所指对象（Referent Object）\**以及决定是否接受该论述的\**受众（Audience）**。

“对毒品的战争”是经典案例。毒品问题可以被理解为公共卫生问题，但当它被表述为国家安全威胁后，政府可能采用军事化执法等非常规措施。类似地，网络威胁也可能通过政治话语被安全化。

#### 2. 技术是政治的（Technology Is Political）

“技术是政治的”意味着技术并非完全中立。系统的设计、所有权、算法规则和基础设施分布会体现并重塑权力关系。例如，平台的内容推荐机制会影响公共讨论，身份识别技术可能强化监控能力，网络基础设施的控制权也会影响国家主权。

分析网络安全不能只关注技术是否有效，还要研究安全措施保护谁、由谁决定、成本由谁承担，以及不同群体受到的影响是否平等。

#### 3. 网络战争的定义（Definition of Cyberwarfare）

**网络战争（Cyberwarfare）**通常指国家或国家支持的行为者使用数字手段破坏另一个国家的关键系统，以实现军事或政治目标。攻击对象可能包括政府网络、军事指挥系统、金融机构、能源基础设施和民用服务。

这一概念存在争议，因为许多网络行动缺乏传统战争中的公开身份、物理暴力和明确边界。网络间谍、信息行动、网络犯罪和军事行动之间可能发生重叠，使网络攻击经常处于战争与和平之间的**灰色地带（Grey Zone）**。

#### 4. 《网络战争不会发生》（Cyber War Will Not Take Place）

Thomas Rid在《网络战争不会发生》中主张，真正意义上的网络战争从未发生，并且未来发生的可能性也较低。他依据克劳塞维茨的战争概念，认为战争行为应同时具有**暴力性（Violence）**、**工具性（Instrumentality）\**和\**政治性（Politicality）**。

暴力性要求行动造成或威胁实际的人身伤害或物理破坏；工具性要求行动服务于明确目标；政治性要求行动具有政治动机并与政治行为者相关。Rid认为，大多数网络行动不能同时满足这三个条件。

#### 5. 网络行动的三种性质（Three Types of Cyber Operations）

Rid将多数政治性网络行动归纳为**破坏（Sabotage）**、**间谍（Espionage）\**和\**颠覆（Subversion）**。破坏旨在降低系统或设施的功能；间谍活动秘密获取数据和情报；颠覆则通过宣传、泄密或社会动员削弱权威和秩序。

Stuxnet通常被视为高度复杂的网络破坏行动；Titan Rain和GhostNet体现了大规模网络间谍活动；Anonymous发起的部分DDoS抗议则更接近数字颠覆或黑客行动主义。三者都可能具有政治影响，但未必构成传统意义上的战争。

#### 6. 对Rid理论的批评（Criticism of Rid’s Theory）

批评者认为，Rid对物理暴力和传统战争定义的依赖可能过于狭窄。现代社会高度依赖数字基础设施，即使攻击没有直接造成伤亡，也可能导致医疗、能源、金融或交通系统大规模中断。

网络归因困难也不代表攻击不存在政治动机。俄罗斯—乌克兰战争及其他地区冲突显示，网络行动可以与军事、外交、经济和信息行动结合，成为**混合战争（Hybrid Warfare）**的一部分。因此，网络行动是否构成战争，需要结合规模、后果、意图和具体背景判断。

#### 7. 典型案例（Key Cases）

2007年爱沙尼亚遭遇大规模DDoS攻击，政府、银行和媒体服务受到干扰，但缺乏直接人员伤亡和明确公开归属。2008年格鲁吉亚网络攻击与地面军事冲突同时发生，但网络行动本身造成的物理影响相对有限。

2010年发现的Stuxnet针对伊朗核设施的工业控制系统，破坏离心机运行。它比普通网络间谍活动更接近定向破坏，而且造成了物理设备损害，但是否构成独立的战争行为仍有争议。

这些案例说明，网络行动的性质不能只根据所使用的技术判断，还需要分析行为主体、政治目的、攻击效果及其与其他军事行动的关系。

### 第九周：战争、国家安全与网络战略（War, National Security and Cyber Strategy）

#### 1. 安全困境（Security Dilemma）

**安全困境（Security Dilemma）**是指一个国家为了提高自身安全而增强军事或网络能力，却被其他国家视为威胁，促使对方采取类似措施，最终使各方都更加不安全。

其根源在于国际体系缺乏能够完全保证所有国家安全的最高权威。在网络空间中，防御工具和进攻工具经常具有双重用途，使其他国家更难判断能力建设的真实意图。

#### 2. 攻守理论（Offence–Defence Theory）

攻守理论研究进攻和防御哪一方更容易取得优势，以及这种平衡如何影响国家行为。当进攻成本低、成功概率高时，国家可能更愿意发展进攻能力；当防御具有明显优势时，合作和稳定更容易形成。

网络空间经常被认为有利于攻击者，因为攻击者可以隐藏身份、重复利用工具并寻找最薄弱的入口。不过，云平台集中更新、默认安全配置、威胁情报共享和自动化防御也可能提高防御效率，因此“进攻永远占优”并不是绝对结论。

#### 3. 网络威慑（Cyber Deterrence）

**威慑（Deterrence）**通过让对手相信攻击成本大于预期收益，促使其放弃行动。网络威慑可以包括报复威胁、防御加固、拒止攻击收益、法律追责和国际制裁。

网络威慑面临归因困难、行为主体不对称和攻击门槛差异等问题。国家、犯罪组织和个人攻击者的风险承受能力不同，传统军事威慑模式难以直接适用于所有网络行动。

#### 4. 网络归因（Cyber Attribution）

**网络归因（Cyber Attribution）**是判断攻击来源和责任主体的过程。攻击者可以利用代理服务器、受害主机、匿名网络、伪造代码和跨国基础设施隐藏身份，因此单一IP地址通常不足以证明责任归属。

可靠归因需要综合技术取证、基础设施关联、攻击工具、受害目标、行为模式、情报信息和政治背景。技术归因、法律归因和政治归因的证据标准并不完全相同。

#### 5. 网络战争的威胁与影响（Threats and Impacts of Cyberwarfare）

网络行动可能威胁电网、金融系统、交通网络、医疗服务和通信基础设施，造成服务中断与经济损失。针对军事指挥、通信和武器系统的攻击还可能削弱军事行动能力。

网络间谍能够窃取军事机密、外交通信、商业秘密和知识产权。信息行动和宣传活动则可能削弱公众信任、加剧社会分裂并影响国际关系。

常见战术包括拒绝服务攻击、网络钓鱼、恶意软件部署、供应链攻击、数据破坏和宣传行动。不同战术的影响范围、可逆性和暴力程度存在显著差异，不能全部等同于战争行为。

#### 6. 国家与个人层面的防御（National and Individual Defence）

国家层面需要建立关键基础设施保护框架、事件响应体系、国际合作机制和公共安全教育。对重要行业应实施最低安全标准、供应链风险管理和跨部门演练。

个人应及时更新系统、使用密码管理器和多因素认证、减少不必要的个人信息公开，并对异常邮件、深度伪造和煽动性内容保持警惕。事实核查有助于识别虚假信息；提高信息素养比简单限制在线交流更加合理。

#### 7. 无人机与现代战争（Drones in Modern Warfare）

无人机可用于侦察、监视、目标识别、通信中继和精确打击。MQ-9 Reaper是典型的中高空长航时无人机，可执行情报、监视、侦察和攻击任务。

无人机依赖卫星通信、导航、数据链和地面控制系统，因此也可能受到干扰、欺骗、通信劫持和软件攻击。无人机技术体现了物理战争与网络能力日益融合的趋势。

### 第十周：数字行动主义、间谍与监视（Digital Activism, Espionage and Surveillance）

#### 1. 数字行动主义（Digital Activism）

**数字行动主义（Digital Activism）**是使用社交媒体、网站、众筹平台和其他数字工具推动社会或政治议题的行为。它可以突破地域限制，扩大公众参与，但也可能受到平台控制、信息操纵和数字监视的影响。

George与Leidner将数字政治参与分为三个层次。**旁观者活动（Spectator Activities）**投入较低，例如浏览、点赞或转发；**过渡活动（Transitional Activities）**需要一定资源和承诺，例如线上募捐和组织活动；**角斗士活动（Gladiator Activities）**投入与风险较高，包括领导运动、组织抗议或实施高影响力行动。

#### 2. 点击行动主义与黑客行动主义（Clicktivism and Hacktivism）

**点击行动主义（Clicktivism）**通常指点赞、转发、签署请愿等低门槛政治参与，其优势是能够快速扩大议题影响，但参与深度可能有限。

**黑客行动主义（Hacktivism）**使用技术手段表达政治立场，例如网站篡改、数据泄露或DDoS抗议。即使行为以公共利益为目标，未经授权访问和破坏系统仍可能违反法律并伤害无关用户。

#### 3. 间谍与网络间谍（Espionage and Cyber Espionage）

**间谍活动（Espionage）**是为政治、军事或经济目的秘密获取机密信息。网络间谍通过恶意软件、凭据窃取、供应链攻击或漏洞利用收集数据，通常具有远程实施、速度快、数据量大和归因困难等特点。

间谍活动可分为军事间谍、政治间谍、工业间谍和网络间谍。其功能包括国家安全、政治情报、经济优势、反间谍、危机管理和环境监测。

#### 4. 情报收集方法（Intelligence Collection Methods）

**人力情报（Human Intelligence, HUMINT）**通过人员和人际关系获取信息；**信号情报（Signals Intelligence, SIGINT）**分析通信或电子信号；**图像情报（Imagery Intelligence, IMINT）**利用卫星、飞机或无人机影像；**开源情报（Open-Source Intelligence, OSINT）**则从公开网站、新闻、数据库和社交媒体收集信息。

不同方法通常需要交叉验证。公开信息并不等于可以无限制使用，情报收集仍可能涉及隐私、知识产权和数据保护问题。

#### 5. 网络反间谍（Cyber Counterintelligence）

**网络反间谍（Cyber Counterintelligence）**旨在识别、阻止和误导针对组织或国家的网络情报活动。防御措施包括威胁情报、持续监控、访问控制、欺骗系统和内部威胁管理。

主动措施可能包括虚假身份、诱饵文件或欺骗性信息，但这类行动容易引发法律、伦理和升级风险，必须经过明确授权并受到严格监督。

#### 6. 监视与间谍的区别（Surveillance and Espionage）

**监视（Surveillance）**是为了管理、保护、预测或控制而持续、系统地收集个人或群体信息，目标范围通常较广。间谍活动的目标则更加具体，重点是秘密获取具有战略价值的机密信息。

监视技术具有军民两用性质，可以用于公共安全、疾病控制和基础设施保护，也可能被用于政治压制、商业跟踪和侵犯隐私。评价监视措施时，应考虑合法性、必要性、比例原则、透明度和救济机制。

#### 7. 案例与伦理问题（Cases and Ethical Issues）

Edward Snowden在2013年披露美国国家安全局的大规模监控项目，引发全球对隐私、国家安全和政府透明度的讨论。剑桥五人组则是冷战时期为苏联提供情报的英国间谍网络，体现了传统人力情报和意识形态动机的重要性。

网络间谍与监视涉及国家主权、国际法、隐私权和企业责任。技术能力并不自动赋予行为合法性，相关活动仍需受到法律和伦理约束。

### 第十一周：网络治理与虚假信息（Internet Governance and Online Misinformation）

#### 1. 网络治理（Internet Governance）

**网络治理（Internet Governance）**是管理互联网规则、标准、规范和决策过程的制度体系。它涉及政府、企业、技术社群、国际组织和公民社会，因此通常采用**多利益相关方治理（Multi-Stakeholder Governance）**模式。

全球网络倡议（Global Network Initiative, GNI）成立于2008年，通过多利益相关方原则推动科技企业尊重用户的表达自由和隐私权。

#### 2. 网络犯罪与国际合作（Cybercrime and International Cooperation）

**网络依赖型犯罪（Cyber-Dependent Crime）**只有依靠计算机和网络才能实施，例如恶意软件传播和DDoS攻击；**网络促成型犯罪（Cyber-Enabled Crime）**是传统犯罪借助数字技术扩大规模，例如诈骗、勒索和身份盗窃。

国际网络犯罪框架通常涉及犯罪化、程序法调查工具和跨境合作。主要法律难题包括攻击归因、网络行动是否构成使用武力、国家的尽职义务以及主权原则如何适用于网络空间。

#### 3. 错误信息与虚假信息（Misinformation and Disinformation）

**错误信息（Misinformation）**是内容不准确或具有误导性，但传播者未必具有欺骗意图；**虚假信息（Disinformation）**则是为误导或造成伤害而故意制造或传播的信息。两者的关键区别通常在于意图。

实践中，判断内容真假和传播者意图都可能很困难。部分研究因此更加关注可验证的内容、传播行为和实际危害，而不是仅根据“假新闻”标签作出判断。

#### 4. 人们为何相信虚假信息（Why People Believe False Information）

依赖直觉而缺乏分析性思考的人更容易接受表面可信的信息。**动机性推理（Motivated Reasoning）**使人倾向于接受符合身份和既有信念的内容；**从众偏差（Conformity Bias）**则使个人受到群体观点和社会压力影响。

信息来源的权威感、重复出现、情绪唤起和熟悉程度也会增加内容的可信感。因此，仅提供一次事实更正往往不足以完全消除错误信念。

#### 5. 虚假信息的传播（How Misinformation Spreads）

虚假内容通常具有新奇性、情绪性和可传播性，可能比更正信息传播得更快。更正内容往往无法覆盖所有接触过原始说法的用户，一些已被否定的信息还会反复出现，形成所谓的“信息僵尸（Information Zombies）”。

研究者可以使用社交网络分析、大数据和实验等定量方法，也可以通过访谈、焦点小组和内容分析开展定性研究。

#### 6. 信念网络与烟草策略（Belief Networks and the Tobacco Strategy）

信念通过社会关系形成和传播。Bala与Goyal的网络学习模型研究个人如何根据自身经验和他人行为更新判断，说明社交网络结构会影响群体最终形成的信念。

**烟草策略（Tobacco Strategy）**是指利益集团通过选择性资助研究、放大不确定性、利用权威人物和攻击科学共识干扰公共认知。这种方法不一定需要证明相反观点，只要成功制造“科学仍未确定”的印象，就可能推迟监管行动。

#### 7. 应对虚假信息（Responding to Misinformation）

媒体应提供研究背景、证据强度和不确定性，避免只报道孤立结论。公众需要提高数字与媒体素养，检查来源、证据、日期和原始语境，并警惕只迎合情绪或身份认同的内容。

结构性措施包括事实核查、平台治理、透明推荐机制、研究数据开放和适当监管。治理应在减少现实伤害与保护表达自由之间保持比例，避免以安全为名实施过度审查。

### 补充专题：人工智能与网络安全（Artificial Intelligence and Cybersecurity）

#### 1. 人工智能的双重用途（The Dual Use of AI）

人工智能是机器执行识别、推理、预测和生成等任务的技术集合。在网络安全中，它同时增强防御者和攻击者的能力，因此具有明显的双重用途。

防御团队可以利用AI识别异常登录、分析恶意软件、对告警进行分类、发现软件漏洞并加快事件响应。自动化还可能缓解网络安全人才短缺，提高大规模环境中的处理效率。

攻击者也可以使用AI批量生成钓鱼邮件、制作深度伪造语音和视频、筛选泄露凭据、寻找漏洞并自动调整恶意代码。例如，攻击者可能模拟CEO语音诱骗员工转账。

#### 2. AI安全系统的局限（Limitations of AI Security Systems）

AI模型依赖训练数据和目标函数。数据偏差、环境变化和缺乏业务背景可能造成误报或漏报，例如将正常的远程登录误判为账户入侵。

模型本身还可能遭受数据投毒、规避攻击、提示注入和模型窃取。因此，AI输出应作为辅助证据，而不是完全取代安全人员判断。关键响应措施需要审计记录、人工监督和回滚机制。

#### 3. AI更有利于进攻还是防御（Does AI Favour Offence or Defence?）

AI能够帮助防御者更快发现漏洞、安装补丁、分析攻击并恢复系统，也能帮助攻击者扩大攻击规模并降低技术门槛。最终影响取决于技术普及速度、数据质量、计算资源、组织能力和防御自动化程度。

云平台可能形成防御优势，因为集中基础设施便于快速部署补丁、共享检测规则和实施默认安全控制。但过度集中也会带来供应链风险和系统性故障风险。

#### 4. AI环境下的个人安全（Personal Security in an AI Environment）

个人仍应坚持基本安全实践，包括使用密码管理器、多因素认证、及时安装更新、保护个人数据并警惕异常请求。对于要求紧急转账、提供验证码或绕过正常流程的语音和视频，应通过独立渠道再次确认身份。

### 综合复习：技术与治理要点（Consolidated Review Notes）

#### 1. 身份认证与密码学（Authentication and Cryptography）

**三因素认证（Three-Factor Authentication）**结合知识、持有和生物特征因素，但安全程度仍取决于具体实现和账户恢复机制。**HMAC**使用共享密钥验证消息来源和完整性，速度通常快于数字签名，但不提供公开验证和不可否认性。

AES等对称算法速度快，适合大量数据加密；RSA等非对称算法更常用于密钥封装和数字签名。使用临时密钥的Diffie–Hellman可以提供前向保密性，但必须进行身份认证以防止中间人攻击。

数字签名由私钥生成，并由相应公钥验证，可支持来源认证、完整性和不可否认性。bcrypt是专门用于密码哈希的慢速算法，并内置盐值处理；普通SHA-256速度过快，不适合直接存储密码。

#### 2. 密码攻击与软件漏洞（Cryptographic Attacks and Software Vulnerabilities）

**差分密码分析（Differential Cryptanalysis）**研究输入差异如何影响输出差异，以利用分组密码的结构规律。**选择密文攻击（Chosen-Ciphertext Attack, CCA）**允许攻击者查询解密结果，并尝试推断明文或破坏安全属性。

缓冲区溢出可能覆盖返回地址并劫持控制流，栈金丝雀、ASLR和NX能够提高攻击难度。整数溢出可能造成错误计算和条件绕过；TOCTTOU漏洞则利用检查资源与使用资源之间的时间差。

SQL注入通过恶意输入改变查询结构。主要防御方式是参数化查询或预编译语句，并配合输入验证和数据库最小权限。

#### 3. 协议与网络安全（Protocols and Network Security）

TLS通过证书验证服务器身份，并使用对称认证加密保护通信内容。IPsec在网络层加密和认证IP流量。网络层负责逻辑IP寻址与路由。

Tor通过多跳洋葱路由降低外部观察者同时识别通信来源和目的地的能力，但不能保证绝对匿名。网络分段和VLAN能够限制横向移动，但仍需配合防火墙和访问控制策略。

#### 4. 恶意软件与系统防护（Malware and System Protection）

蠕虫能够在网络中自动复制传播；木马伪装为合法软件，但内部包含恶意功能。SilentBanker是一类针对网上银行的恶意软件，可劫持浏览器会话并窃取凭据。

DNS欺骗通过伪造解析结果将用户重定向至恶意地址。沙盒分析在隔离环境中运行可疑程序，以观察行为并降低对真实系统的影响。零日漏洞是尚无可用补丁的漏洞，可能在防御者完成修复前被攻击者利用。

完整网状拓扑具有较高冗余度，但部署和维护成本也较高。容器可以隔离应用和依赖项，但共享宿主机内核，不能被视为绝对安全边界。

#### 5. 监控、日志与取证（Monitoring, Logging and Forensics）

基于异常的IDS通过识别偏离正常基线的行为发现潜在未知攻击，但可能产生较多误报。过量告警会掩盖真正威胁，因此需要持续调整规则和优先级。

日志中的异常登录、数据传输和进程活动可能显示数据泄露或命令与控制行为。及时报告钓鱼邮件能够帮助安全团队阻断相同攻击并保护其他用户。

SOC负责持续监控、检测和响应事件；SIEM集中收集与关联安全日志；EDR/XDR则提供终端及跨安全域的检测与响应能力。

#### 6. 安全治理与剩余风险（Security Governance and Residual Risk）

**剩余风险（Residual Risk）**是实施安全控制后仍然存在的风险。组织不可能消除全部风险，需要决定接受、降低、转移或避免哪些风险。

HTTPS可以保护传输中的数据，但不能保证网站内容本身可信。蜜罐是吸引攻击者的诱饵系统，可用于观察攻击行为，但必须与生产环境隔离。CRL记录已经被CA撤销的证书，客户端可据此检查证书状态。

#### 7. 社会科学与批判性网络安全（Social Science and Critical Cybersecurity）

自由主义强调国际制度、合作和非国家行为体；建构主义认为国家利益受到规范、信念和身份塑造。批判性观点关注主流安全论述中的权力关系，女权主义安全研究则分析安全政策对不同性别和社会群体造成的不平等影响。

参与式威胁建模让不同利益相关者共同识别风险，有助于纳入容易被忽视的经验。网络归因困难会削弱威慑；危机治理中的**信任悖论（Trust Paradox）**则体现保密需求与透明度之间的张力。

单纯依赖技术修复可能忽视贫困、不平等、政治压迫和组织文化等深层原因。更具包容性的安全治理需要让受影响群体参与决策，而不仅由国家或技术专家定义风险。
