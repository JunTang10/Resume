# INFO5301 — Information Security Management

## 第一周：信息安全管理导论 / Week 1: Introduction to Information Security Management

### 1. 组织中的信息系统 / Information Systems in Organizations

#### 1.1 三层系统模型 / Three-Level System Model

- 技术系统 / Technical Systems
- 正式系统 / Formal Systems
- 非正式系统 / Informal Systems

### 2. 信息安全控制类型 / Information Security Control Types

#### 2.1 技术控制 / Technical Controls

#### 2.2 正式控制 / Formal Controls

#### 2.3 非正式控制 / Informal Controls

#### 2.4 例题：技术控制 / Example: Technical Control

#### 2.5 例题：非正式控制 / Example: Informal Control

### 3. 控制的有效性 / Control Effectiveness

### 4. 制度化信息安全 / Institutionalizing Information Security

这样顺序就是 **1—2—3—4**，内部知识点再用 **1.1、2.1、2.2** 等编号，不再沿用课件原来的 **4—7**。

对的重新弄一下

## 第二周：信息安全管理模型 / Week 2: Information Security Management Models

### 1. 安全定义与核心目标 / Security Definition and Core Goals

#### 1.1 安全的定义 / Definition of Security

“安全”是指保护有价值的信息资产，并确保硬件、软件和数据满足基本安全原则。/ “Secure” means protecting valuable information assets and ensuring that hardware, software, and data satisfy fundamental security principles.

五大安全原则包括**机密性（Confidentiality）**、**完整性（Integrity）**、**可用性（Availability）**、**身份验证（Authentication）\**和\**不可否认性（Non-repudiation）**。/ The five security principles are **Confidentiality**, **Integrity**, **Availability**, **Authentication**, and **Non-repudiation**.

#### 1.2 CIA三元组 / CIA Triad

**机密性 / Confidentiality**

- 信息只能向获得授权的主体披露。/ Information is disclosed only to authorized parties.
- 无论数据处于存储还是传输状态，都需要保护私有数据。/ Private data must be protected both at rest and in transit.
- “需要知道”原则与“需要保留”原则。/ “Need-to-know” principle versus “need-to-withhold” principle.
- “需要知道”适用于军事环境，“需要保留”更适合商业环境。/ Need-to-know works in military environments, while need-to-withhold is more suitable for commercial environments.

**完整性 / Integrity**

- 指数据未受损、完整且齐全的状态。/ Refers to the unimpaired, complete, and whole condition of data.
- 所有数据都被呈现和说明，无论其是否准确或正确。/ All data is presented and accounted for, regardless of its accuracy or correctness.
- 只有当数据按照规定并经过授权的方式被修改时，它才具有完整性。/ Data has integrity when it is changed only in a specified and authorized manner.

**可用性 / Availability**

- 合法用户能够在需要的时间和地点访问数据与服务。/ Data and services are accessible to legitimate users when and where needed.
- 可用性与系统可靠性相关。/ Availability relates to system reliability.
- 拒绝服务攻击是影响可用性的典型例子。/ Denial-of-service attacks are a well-known example of threats to availability.

#### 1.3 身份验证与不可否认性 / Authentication and Non-repudiation

**身份验证 / Authentication**

- 确保消息确实来自其声称的来源。/ Assures that a message comes from the source it claims to come from.
- 第三方不应能够冒充发送者或接收者。/ A third party should not be able to masquerade as the sender or recipient.
- 及时性是身份验证的重要属性。/ Timeliness is an important attribute of authentication.
- 可审计性也是身份验证的重要方面。/ Auditability is also an important aspect of authentication.

**不可否认性 / Non-repudiation**

- 防止个人或实体否认自己执行过某项特定操作。/ Prevents an individual or entity from denying having performed a particular action.
- 随着企业越来越依赖电子通信和电子文档的法律效力，不可否认性变得至关重要。/ Non-repudiation becomes critical as businesses increasingly rely on electronic communications and the legal validity of electronic documents.

#### 1.4 例题：信息安全政策 / Example: Information Security Policies

以下三项政策可加强 News Media Ltd 的信息安全并改善 CIA 三要素。/ The following three policies can strengthen the information security of News Media Ltd and improve the CIA triad.

**1. 强制启用多因素身份验证政策 / Mandatory Multi-Factor Authentication Policy**

所有访问公司内部系统的用户，尤其是处理敏感或机密数据的用户，都必须使用多因素身份验证（MFA），包括密码、生物识别或一次性验证码等组合方式。/ All users accessing internal systems, especially those handling sensitive or confidential data, must use Multi-Factor Authentication (MFA), including combinations of passwords, biometrics, or one-time passcodes.

该政策有助于提高系统的**机密性（Confidentiality）**，防止攻击者窃取凭据后直接登录系统。/ This policy improves **Confidentiality** by preventing attackers from directly accessing the system with stolen credentials.

**2. 定期开展员工安全意识培训 / Regular Security Awareness Training Requirement**

所有员工和外部承包商必须每年完成一次安全意识培训，内容包括网络钓鱼、密码安全、数据分类和事件报告。/ All employees and contractors must complete annual security awareness training covering phishing, password hygiene, data classification, and incident reporting.

该政策有助于防范人为失误和社会工程攻击，提高系统的**完整性（Integrity）\**与\**可用性（Availability）**。/ This policy helps prevent human error and social engineering attacks, improving **Integrity** and **Availability**.

**3. 静态及传输中的数据加密政策 / Data Encryption at Rest and in Transit Policy**

所有敏感信息与个人数据在存储和传输过程中，都必须使用行业标准加密协议，例如 AES-256 和 TLS 1.3。/ All sensitive and personal information must be encrypted both at rest and in transit using industry-standard encryption protocols, such as AES-256 and TLS 1.3.

该政策通过防止数据泄露或篡改，加强**机密性（Confidentiality）\**与\**完整性（Integrity）**。/ This policy strengthens **Confidentiality** and **Integrity** by preventing data disclosure and tampering.

### 2. 漏洞与威胁 / Vulnerabilities and Threats

#### 2.1 漏洞 / Vulnerabilities

- 漏洞是“可被一个或多个威胁利用的资产或资产组的弱点”。/ A vulnerability is a “weakness of an asset or group of assets that can be exploited by one or more threats.” [ISO/IEC 13335-1:2004]
- 漏洞是“产品中可能允许攻击者破坏其完整性、可用性或机密性的弱点”。/ A vulnerability is a “weakness in a product that could allow an attacker to compromise its integrity, availability, or confidentiality.” [Microsoft]
- 漏洞可能存在于硬件、软件和数据中。/ Vulnerabilities may exist in hardware, software, and data.

#### 2.2 威胁 / Threats

- 威胁是“有可能造成损失或伤害的一系列情况”。/ A threat is a “set of circumstances that has the potential to cause loss or harm.” [Charles & Shari Pfleeger]
- 威胁是“可能导致系统或组织受到伤害的不良事件的潜在原因”。/ A threat is a “potential cause of an unwanted incident, which may result in harm to a system or organization.” [ISO/IEC 13335-1:2004]

#### 2.3 例题：物联网威胁 / Example: IoT Threats

- **设备被未经授权地访问 / Unauthorized Access to Devices：**如果智能插座或智能灯等物联网设备没有得到妥善保护，攻击者可能远程控制它们。/ If IoT devices such as smart plugs or lights are not properly secured, attackers may gain remote control over them.
- **数据收集与行为画像 / Data Collection and Profiling：**设备使用模式可能被收集并用于推断用户的日常规律或是否在家。/ Device usage patterns may be collected to infer a user’s daily routine or presence at home.
- **云服务泄露 / Cloud Service Breaches：**如果 IFTTT、Google 或 TP-Link 等云平台遭到入侵，攻击者可能获得个人数据或设备控制权。/ If cloud platforms such as IFTTT, Google, or TP-Link are breached, attackers may gain access to personal data or device controls.
- **中间人攻击 / Man-in-the-Middle Attacks：**如果手机、路由器和物联网设备之间的通信未加密，攻击者可能截获并篡改通信内容。/ If communication among smartphones, routers, and IoT devices is unencrypted, attackers may intercept and tamper with it.
- **固件未更新 / Lack of Firmware Updates：**过时固件可能包含攻击者能够利用的已知漏洞。/ Outdated firmware may contain known vulnerabilities that attackers can exploit.

### 3. 漏洞评估与漏洞类型 / Vulnerability Assessment and Types

#### 3.1 通用漏洞评分系统 / Common Vulnerability Scoring System

- **基础组 / Base Group：**表示漏洞的内在属性。/ Represents the intrinsic qualities of a vulnerability.
- **威胁组 / Threat Group：**反映随时间变化的漏洞特征。/ Reflects vulnerability characteristics that change over time.
- **环境组 / Environmental Group：**表示用户环境特有的漏洞特征。/ Represents vulnerability characteristics unique to the user’s environment.
- **补充组 / Supplemental Group：**提供上下文并描述漏洞的外在属性。/ Provides context and describes extrinsic attributes.

#### 3.2 六种主要漏洞类型 / Six Major Vulnerability Types

**修改 / Modification**

- 硬件、软件或数据未经授权被更改。/ Hardware, software, or data is altered without authorization.
- 被更改的软件可能执行额外计算。/ Altered software may perform additional computations.

**销毁 / Destruction**

- 硬件、软件或数据被销毁。/ Hardware, software, or data is destroyed.
- 可能由环境因素、恶意行为或故障造成。/ It may be caused by environmental factors, malicious intent, or failure.

**披露 / Disclosure**

- 主要涉及数据。/ Primarily concerns data.
- 在没有适当同意的情况下使数据可用。/ Makes data available without appropriate consent.
- 会对安全和隐私产生影响。/ Affects both security and privacy.

**拦截 / Interception**

- 未经授权访问资源。/ Unauthorized access to resources.
- 复制程序、数据或其他机密信息。/ Copying programs, data, or other confidential information.
- 拦截者可能使用一个位置的计算资源访问其他位置的资产。/ An interceptor may use computing resources at one location to access assets elsewhere.

**中断 / Interruption**

- 系统资产变得不可用或无法使用。/ System assets become unavailable or unusable.
- 主要影响可用性。/ Primarily affects availability.

**伪造 / Fabrication**

- 将虚假交易插入网络，或向现有数据库添加虚假记录。/ Spurious transactions are inserted into a network or false records are added to an existing database.
- 未经授权的主体在数据库中放置伪造对象。/ Counterfeit objects are placed in a database by unauthorized parties.
- 真实对象和伪造对象可能很难区分。/ Genuine and forged objects may be difficult to distinguish.

### 4. 信息安全基础原则 / Fundamental Principles of Information Security

#### 4.1 原则1：绝对安全不存在 / Principle 1: There Is No Absolute Security

只要攻击者拥有足够的时间、工具、技能和动机，就可能突破任何安全措施。/ Given enough time, tools, skills, and inclination, attackers may break through any security measure.

#### 4.2 原则2：CIA是三个核心安全目标 / Principle 2: CIA Represents the Three Core Security Goals

机密性、完整性和可用性构成 CIA 三元组，是信息安全的基础。/ Confidentiality, integrity, and availability form the CIA triad, which is the foundation of information security.

#### 4.3 原则3：采用纵深防御 / Principle 3: Use Defense in Depth

- 在相互重叠的多个层次中实施安全控制。/ Implement security controls in multiple overlapping layers.
- 提供保护资产所需的三个要素：预防、检测和响应。/ Provide the three elements needed to secure assets: prevention, detection, and response.
- 一个安全层的弱点可以由两个或更多其他安全层的优势来弥补。/ Weaknesses in one security layer can be offset by the strengths of two or more other layers.

### 5. 人员、需求与安全策略 / People, Requirements, and Security Strategy

#### 5.1 原则4：人们容易做出不安全的决定 / Principle 4: People Tend to Make Poor Security Decisions

- 人们可能为了琐碎或没有价值的物品而交出自己的登录凭据。/ People may give up their credentials in exchange for trivial or worthless goods.
- 许多人很容易被说服去双击电子邮件中的附件或链接。/ Many people are easily persuaded to double-click attachments or links in emails.

#### 5.2 原则5：安全依赖功能性与保证性需求 / Principle 5: Security Depends on Functional and Assurance Requirements

- **功能需求 / Functional Requirements：**描述系统应该做什么。/ Describe what the system should do.
- **保证需求 / Assurance Requirements：**描述功能需求应如何实施和测试。/ Describe how functional requirements should be implemented and tested.
- **验证 / Verification：**确认系统满足预定需求或规范的过程。/ The process of confirming that predetermined requirements or specifications are met.
- **确认 / Validation：**确定用于满足需求的机制是否正确及其质量如何。/ The determination of the correctness or quality of the mechanisms used to meet the needs.

#### 5.3 原则6：通过隐藏实现安全不是答案 / Principle 6: Security Through Obscurity Is Not an Answer

- 这种方法主要依赖隐藏重要信息和强制保密。/ This approach is based primarily on hiding important information and enforcing secrecy.
- 它可能降低攻击风险，但会造成虚假的安全感。/ It may reduce the risk of attacks but can create a false sense of security.
- 虚假的安全感往往比完全不处理安全问题更加危险。/ A false sense of security is often more dangerous than not addressing security at all.
- 单纯的匿名化不足以保护人口普查数据隐私。/ Simple anonymization is insufficient to protect census data privacy.
- 攻击者可以把准标识符与外部公开数据集关联，从而重新识别个人身份。/ Attackers can re-identify individuals by linking quasi-identifiers with external public datasets.

#### 5.4 原则7：安全就是风险管理 / Principle 7: Security Is Risk Management

- 安全的目标不是消除所有威胁，而是应对已知威胁并尽量减少损失。/ Security is not about eliminating every threat, but about addressing known threats and minimizing losses.
- 风险分析和风险管理是保护信息系统的核心主题。/ Risk analysis and risk management are central to securing information systems.
- 风险评估通过确定资产的经济价值来选择适当对策。/ Risk assessment assigns economic value to assets to determine appropriate countermeasures.

### 6. 控制、复杂性与业务整合 / Controls, Complexity, and Business Integration

#### 6.1 原则8：三种安全控制类型 / Principle 8: Three Types of Security Controls

- **预防性控制 / Preventive Controls：**通过保护层阻止入侵，例如守卫、锁门和访问控制。/ Prevent compromise through protection layers such as guards, locked doors, and access controls.
- **检测性控制 / Detective Controls：**快速发现异常活动，例如闭路电视、运动传感器和警报系统。/ Quickly detect unusual activity through CCTV, motion sensors, and alarm systems.
- **响应性控制 / Responsive Controls：**触发自动锁门、通知警察或释放催泪瓦斯等响应。/ Trigger responses such as automatic door locking, police notification, or tear gas release.

#### 6.2 原则9：复杂性是安全的敌人 / Principle 9: Complexity Is the Enemy of Security

- 系统越复杂，就越难保护。/ The more complex a system is, the harder it is to secure.
- 简单性有助于提高安全性。/ Simplicity supports security.

#### 6.3 原则10：FUD不利于推销安全投资 / Principle 10: FUD Does Not Work in Selling Security

- 恐惧、不确定性和怀疑（FUD）不能有效说服组织投资安全。/ Fear, uncertainty, and doubt (FUD) do not effectively persuade organizations to invest in security.
- 信息安全经理必须用行业方法和商业理由证明安全投资的合理性。/ Information security managers must justify security investments using industry techniques and sound business rationale.
- 当资源投入有可靠的商业理由支持时，安全请求很少被拒绝。/ Security requests are rarely denied when resource expenditure is supported by a solid business rationale.

#### 6.4 原则11：人员、流程和技术缺一不可 / Principle 11: People, Process, and Technology Are All Necessary

- 充分保护系统或设施需要人员、流程和技术的结合。/ Adequately securing a system or facility requires a combination of people, process, and technology.
- 正式控制、非正式控制和技术控制都不可缺少。/ Formal, informal, and technical controls are all required.

#### 6.5 原则12：公开披露漏洞有利于安全 / Principle 12: Open Disclosure of Vulnerabilities Benefits Security

公开和透明地披露漏洞有助于推动整体安全水平的改善。/ Open and transparent vulnerability disclosure helps improve overall security.

### 7. 最易渗透原则 / Principle of Easiest Penetration

#### 7.1 核心概念 / Core Concept

“作恶者并不具备技术专家所假设的价值观。他们通常会坚持采用最容易、最安全和最简单的方式实现目标。”/ “Perpetrators do not have the values assumed by technologists. They generally stick to the easiest, safest, and simplest means of accomplishing their objectives.” [Donn Parker]

- 链条的强度取决于最薄弱的环节。/ A chain is only as strong as its weakest link.
- 安全分析需要找出最薄弱的位置。/ Security analysis must identify the weakest points.
- 强化某项控制或某个方面，可能使另一个方面对攻击者更有吸引力。/ Strengthening one control or aspect may make another more attractive to an attacker.

#### 7.2 实施策略 / Implementation Strategy

- 识别并加强最薄弱的环节。/ Identify and strengthen the weakest links.
- 均衡不同防护层的安全强度。/ Balance protection strength across layers.
- 避免单点故障。/ Avoid single points of failure.

#### 7.3 考试要点：通过隐藏实现安全 / Exam Point: Security Through Obscurity

- 通过隐藏实现安全主要依赖隐藏重要信息和强制保密。/ Security through obscurity is based primarily on hiding important information and enforcing secrecy.
- 这种做法可能降低攻击风险。/ It may reduce the risk of attacks.
- 尽管这种思路看似合理，但实际上并不可靠。/ Although this approach may seem logical, it is not reliable in practice.
- 隐藏安全机制会造成虚假的安全感，而这通常比完全不处理安全问题更危险。/ Obscuring security creates a false sense of security, which is often more dangerous than not addressing security at all.

##  第三周：网络安全与密码学 / Week 3: Network Security and Cryptography

### 1. 网络基础与协议分层 / Network Fundamentals and Protocol Layering

#### 1.1 互联网的硬件视角 / Internet “Nuts and Bolts” View

- 互联网由数十亿台相互连接的计算设备组成，这些设备称为主机或终端系统。/ The Internet consists of billions of connected computing devices known as hosts or end systems.
- 主机负责运行各种网络应用程序。/ Hosts run various network applications.
- 通信链路包括光纤、铜线、无线电和卫星。/ Communication links include fiber, copper, radio, and satellite.
- 传输速率也称为带宽。/ Transmission rate is also known as bandwidth.
- 数据包交换机负责转发数据包，即数据块。/ Packet switches forward packets, which are chunks of data.
- 路由器和交换机是常见的数据包交换设备。/ Routers and switches are common packet-switching devices.

#### 1.2 互联网协议与标准 / Internet Protocols and Standards

互联网协议控制消息的发送与接收，例如 TCP、IP、HTTP、Skype 和 802.11。/ Internet protocols control the sending and receiving of messages, such as TCP, IP, HTTP, Skype, and 802.11.

互联网标准主要包括 **RFC（征求意见 / Request for Comments）**，并由 **IETF（互联网工程任务组 / Internet Engineering Task Force）**等组织制定。/ Internet standards mainly include RFCs and are developed by organizations such as the IETF.

#### 1.3 互联网的服务视角 / Internet Service View

- 互联网是为应用程序提供服务的基础设施。/ The Internet is an infrastructure that provides services to applications.
- 支持 Web、VoIP、电子邮件、游戏、电子商务和社交网络等应用。/ It supports applications such as the Web, VoIP, email, games, e-commerce, and social networks.
- 为应用程序提供编程接口。/ It provides programming interfaces to applications.
- 提供类似邮政服务的不同服务选项。/ It provides service options analogous to postal services.

#### 1.4 协议的定义 / Definition of a Protocol

协议规定网络实体之间所发送和接收消息的格式与顺序，以及消息发送或接收时采取的操作。/ A protocol defines the format and order of messages sent and received among network entities, as well as the actions taken during message transmission and receipt.

人类协议包括“现在几点？”或“我有一个问题”等交互规则。/ Human protocols include interaction rules such as “What is the time?” or “I have a question.”

网络协议由机器而不是人类执行，控制互联网中的所有通信活动。/ Network protocols are executed by machines rather than humans and govern all Internet communication.

#### 1.5 为什么需要协议分层 / Why Protocol Layering Is Needed

- 分层有助于处理复杂系统。/ Layering helps manage complex systems.
- 明确的结构有助于识别复杂系统中的不同组成部分及其关系。/ An explicit structure helps identify the components of a complex system and their relationships.
- 分层参考模型便于讨论和理解网络系统。/ A layered reference model makes network systems easier to discuss and understand.
- 模块化设计便于维护和更新系统。/ Modularization makes systems easier to maintain and update.
- 某一层服务实现的变化通常不会影响系统的其他部分。/ Changes to the implementation of one layer’s services are generally transparent to the rest of the system.

#### 1.6 互联网协议栈 / Internet Protocol Stack

- **应用层 / Application Layer：**支持 FTP、SMTP 和 HTTP 等网络应用。/ Supports network applications such as FTP, SMTP, and HTTP.
- **传输层 / Transport Layer：**负责进程之间的数据传输，例如 TCP 和 UDP。/ Provides process-to-process data transfer through protocols such as TCP and UDP.
- **网络层 / Network Layer：**负责数据报路由，包括 IP 和路由协议。/ Handles datagram routing through IP and routing protocols.
- **链路层 / Link Layer：**负责相邻网络元素之间的数据传输，例如 Ethernet、Wi-Fi 和 PPP。/ Transfers data between neighboring network elements through Ethernet, Wi-Fi, and PPP.
- **物理层 / Physical Layer：**负责在线路上传输比特。/ Transmits bits “on the wire.”

------

### 2. 网络安全目标、威胁与漏洞 / Network Security Goals, Threats, and Vulnerabilities

#### 2.1 网络安全的四个要素 / Four Elements of Network Security

- **机密性 / Confidentiality：**只有发送者和接收者能够理解消息内容；发送者加密消息，接收者解密消息。/ Only the sender and receiver can understand the message; the sender encrypts it and the receiver decrypts it.
- **消息完整性 / Message Integrity：**确保消息未被修改，并能够检测消息在传输期间或之后发生的变化。/ Ensures that a message has not been altered and detects changes made during or after transmission.
- **访问与可用性 / Access and Availability：**确保服务可以被合法用户访问和使用。/ Ensures that services remain accessible and available to legitimate users.
- **身份验证 / Authentication：**确认通信双方的真实身份。/ Confirms the identities of the communicating parties.

#### 2.2 攻击者能够实施的行为 / What Attackers Can Do

- **窃听 / Eavesdropping：**拦截通信消息。/ Intercept communication messages.
- **消息插入 / Message Insertion：**主动向现有连接中插入消息。/ Actively insert messages into an existing connection.
- **冒充 / Impersonation：**伪造数据包的源地址。/ Spoof the source address of a packet.
- **劫持 / Hijacking：**接管正在进行的连接。/ Take over an ongoing connection.
- **拒绝服务 / Denial of Service：**阻止其他用户使用服务。/ Prevent other users from accessing a service.
- **网络钓鱼 / Phishing：**利用人的弱点而不是恶意代码，通过伪造电子邮件或网站诱导用户泄露敏感信息。/ Exploits human vulnerabilities rather than malicious code, often using spoofed emails or websites to trick users into revealing sensitive information.

#### 2.3 具体网络攻击 / Specific Network Attacks

**拒绝服务攻击 / Denial-of-Service Attack**

拒绝服务攻击使资源无法向合法流量提供服务，其典型流程是选择目标、入侵大量主机形成僵尸网络，然后向目标发送大量攻击数据包。/ A denial-of-service attack makes resources unavailable to legitimate traffic. A typical process involves selecting a target, compromising hosts to form a botnet, and sending attack packets to the target.

**数据包嗅探 / Packet Sniffing**

攻击者可以读取广播介质中的所有数据包，其中可能包含密码等敏感信息。/ Attackers may read all packets transmitted over broadcast media, including sensitive information such as passwords.

**IP欺骗 / IP Spoofing**

攻击者发送带有虚假源地址的数据包。/ An attacker sends packets containing a false source address.

**恶意软件 / Malware**

- **病毒 / Virus：**通过执行受感染对象实现自我复制。/ Self-replicates when an infected object is executed.
- **蠕虫 / Worm：**通过被动接收后自动执行并自我复制。/ Automatically executes and self-replicates after passive reception.
- **间谍软件 / Spyware：**记录用户的击键和访问的网站。/ Records users’ keystrokes and visited websites.
- **僵尸网络 / Botnet：**通常用于发送垃圾邮件和实施 DDoS 攻击。/ Commonly used to send spam and conduct DDoS attacks.

#### 2.4 网络易受攻击的原因 / What Makes Networks Vulnerable

- **匿名性 / Anonymity：**攻击者难以被追踪。/ Attackers are difficult to trace.
- **多个攻击点 / Multiple Attack Points：**网络中存在许多潜在入口。/ Networks contain many potential entry points.
- **资源共享 / Resource Sharing：**共享资源会增加安全风险。/ Resource sharing increases security risks.
- **系统复杂性 / System Complexity：**复杂系统难以得到完全保护。/ Complex systems are difficult to secure completely.
- **不确定的边界 / Uncertain Perimeter：**现代网络的安全边界较为模糊。/ The security boundaries of modern networks are blurred.
- **未知路径 / Unknown Path：**数据可能经过无法预测的路由路径。/ Data may travel through unpredictable routing paths.
- **协议缺陷 / Protocol Flaws：**协议可能存在设计或实现问题。/ Protocols may contain design or implementation flaws.

------

### 3. 网络安全控制与政策 / Network Security Controls and Policies

#### 3.1 安全政策类型 / Types of Security Policies

- **企业信息安全政策 / Enterprise Information Security Policy：**规定组织整体的信息安全原则。/ Defines the organization’s overall information security principles.
- **特定问题安全政策 / Issue-Specific Security Policy：**针对特定安全问题制定要求。/ Establishes requirements for a particular security issue.
- **系统特定政策 / System-Specific Policy：**针对特定系统规定安全配置和操作要求。/ Defines security configuration and operational requirements for a particular system.
- 安全政策用于指导组织成员的特定行为。/ Security policies provide guidelines that dictate behavior within an organization.

#### 3.2 物理与硬件控制 / Physical and Hardware Controls

- 门锁、门禁和入口警卫。/ Locks, doors, access controls, and guards at entrances.
- 物理场地规划。/ Physical site planning.
- 防火墙、IDS 和 IPS 等安全设备。/ Security devices such as firewalls, IDS, and IPS.
- 身份认证硬件。/ Authentication hardware.
- 智能卡和访问控制电路板。/ Smart cards and access-control circuit boards.

#### 3.3 软件控制 / Software Controls

**软件开发控制 / Software Development Controls**

- 遵守相关标准和方法论。/ Conformance to relevant standards and methodologies.
- 对软件进行测试和维护。/ Software testing and maintenance.

**操作系统控制 / Operating System Controls**

- 保护系统数据和用户数据。/ Protect system and user data.
- 使用安全配置检查清单。/ Use secure configuration checklists.

**程序内部控制 / Controls Within Programs**

在程序的输入、处理和输出层面实施控制。/ Implement controls at the input, processing, and output levels.

#### 3.4 四种关键软件控制 / Four Key Software Controls

- **加密 / Encryption：**将数据转换为无法理解的形式。/ Transforms data into an incomprehensible form.
- **身份验证 / Authentication：**验证实体所声明的身份。/ Verifies the identity claimed by an entity.
- **授权 / Authorization：**验证实体是否有权执行某项操作。/ Verifies whether an entity has the right to perform an action.
- **审计 / Auditing：**监控谁以何种方式访问了哪些资源。/ Monitors who accesses which resources and how.

#### 3.5 政策层级与实施 / Policy Hierarchy and Implementation

- **企业级政策 / Enterprise-Level Policy：**提供组织总体原则声明。/ Provides broad organizational or “motherhood” statements.
- **详细程序 / Detailed Procedures：**规定具体的工作流程。/ Define specific workflows.
- **高管支持 / Executive Support：**管理层必须支持安全政策的实施。/ Senior management must support policy implementation.
- **员工认同 / Employee Buy-in：**员工需要理解并接受安全要求。/ Employees need to understand and accept security requirements.
- **定期审查 / Regular Review：**政策和程序需要定期更新。/ Policies and procedures must be reviewed regularly.
- **持续改进 / Continuous Improvement：**根据新风险和实施结果不断改善安全管理。/ Security management must be continuously improved based on new risks and implementation outcomes.

------

### 4. 密码学与身份验证 / Cryptography and Authentication

#### 4.1 密码学的定义 / Definition of Cryptography

密码学将消息从可理解的形式转换为不可理解的形式，并在接收端将其恢复，从而使窃听者无法读取消息。/ Cryptography converts messages from a comprehensible form into an incomprehensible form and converts them back at the receiving end, making them unreadable to eavesdroppers.

密码学使用加密和解密过程，以及规定加密与解密规则的密码算法。/ Cryptography uses encryption and decryption processes together with cryptographic algorithms that define the rules for these operations.

#### 4.2 密码学术语 / Cryptographic Terminology

- **m：**明文消息，即可理解的原始消息。/ Plaintext message in comprehensible form.
- **Kₐ：**密钥，即秘密知识。/ Key or secret knowledge.
- **Kₐ(m)：**密文，即不可理解的消息形式。/ Ciphertext in an incomprehensible form.
- **$m=K_b(K_a(m))$：**对密文进行解密并恢复明文的过程。/ The process of decrypting ciphertext and recovering the plaintext.

#### 4.3 对称密钥密码学 / Symmetric-Key Cryptography

Bob 和 Alice 共享同一个秘密密钥 Ks。/ Bob and Alice share the same secret key Ks.

- **加密 / Encryption：**Ks(m)
- **解密 / Decryption：**$m=K_s(K_s(m))$
- **主要问题 / Main Problem：**通信双方如何安全地共享密钥？/ How can the communicating parties securely share the key?

#### 4.4 公钥密码学 / Public-Key Cryptography

发送者和接收者不需要共享秘密密钥。/ The sender and receiver do not need to share a secret key.

- **公钥 / Public Key：**所有人都可以知道，用于加密。/ Known to everyone and used for encryption.
- **私钥 / Private Key：**只有接收者知道，用于解密。/ Known only to the receiver and used for decryption.
- **RSA要求 / RSA Requirement：**$K_B^{+}(K_B^{-}(m))=m$
- 无法从公钥 KB+ 计算出私钥 KB−。/ The private key KB− cannot be calculated from the public key KB+.

#### 4.5 身份验证的定义 / Definition of Authentication

身份验证通过确凿的身份证据确认通信方的身份，并确认第二方确实参与了协议。/ Authentication uses corroborative evidence to confirm a party’s identity and establish that the second party actually participated in the protocol.

身份验证需要确凿证据、双方参与的过程以及第二方的实际参与。/ Authentication requires corroborative evidence, a two-party process, and the actual involvement of the second party.

#### 4.6 三种身份验证因素 / Three Authentication Factors

- **拥有因素 / Possession：**用户拥有的物品，例如物理密钥或接收短信的手机。/ Something the user has, such as a physical key or a phone that receives SMS messages.
- **固有特征 / Inherence：**用户自身的生物特征，例如指纹、虹膜、面部或语音。/ Something the user is, such as a fingerprint, iris, face, or voice.
- **知识因素 / Knowledge：**用户知道的信息，例如密码或安全问题答案。/ Something the user knows, such as a password or the answer to a security question.

**SMS（短消息服务 / Short Message Service）**是一种通过移动蜂窝网络发送和接收简短文本信息的通信协议，单条消息通常最多包含160个字符。/ SMS is a communication protocol used to send and receive short text messages over cellular networks, typically with a limit of 160 characters per message.

#### 4.7 身份验证协议的演进 / Evolution of Authentication Protocols

- **ap1.0：**仅声明“我是 Alice”，因此容易被冒充。/ Simply states “I am Alice,” making impersonation easy.
- **ap2.0：**加入 IP 地址，但仍可能受到 IP 欺骗。/ Includes an IP address but remains vulnerable to IP spoofing.
- **ap3.0：**发送密码，容易受到重放攻击。/ Sends a password and is vulnerable to replay attacks.
- **ap3.1：**发送加密后的密码，但仍然容易受到重放攻击。/ Sends an encrypted password but remains vulnerable to replay attacks.
- **ap4.0：**使用一次性随机数（Nonce）避免重放攻击。/ Uses a nonce to prevent replay attacks.
- **ap5.0：**结合公钥密码学与 Nonce，安全性更高。/ Combines public-key cryptography with a nonce for stronger security.

------

### 5. 数字签名与公钥认证 / Digital Signatures and Public-Key Certification

#### 5.1 数字签名的特性 / Properties of Digital Signatures

数字签名是类似手写签名的密码学技术，可以证明文档的所有者或创建者。/ A digital signature is a cryptographic technique analogous to a handwritten signature and can establish the owner or creator of a document.

数字签名应当可验证且不可伪造，并提供不可否认性，因此可以作为法律证据。/ A digital signature should be verifiable and non-forgeable and should provide non-repudiation, allowing it to serve as legal evidence.

数字签名保护以下核心安全原则：/ Digital signatures preserve the following core security principles:

- **完整性 / Integrity：**确保消息在传输过程中未被修改。/ Ensures that the message has not been altered in transit.
- **身份验证 / Authentication：**验证消息来自合法发送者。/ Verifies that the message comes from a legitimate sender.
- **不可否认性 / Non-repudiation：**防止发送者否认发送过已签名的消息。/ Prevents the sender from denying having sent the signed message.

#### 5.2 消息摘要与哈希函数 / Message Digests and Hash Functions

使用公钥算法加密较长的消息会产生较高的计算成本，因此可以使用固定长度的消息摘要作为消息的数字“指纹”。/ Encrypting long messages with public-key algorithms is computationally expensive, so a fixed-length message digest can be used as the message’s digital “fingerprint.”

哈希函数具有以下属性：/ Hash functions have the following properties:

- 将多个可能的输入映射为固定长度的输出。/ Map many possible inputs to a fixed-size output.
- 属于多对一映射。/ Use a many-to-one mapping.
- 无法从消息摘要反推出原始消息。/ The original message cannot be derived from its digest.

#### 5.3 数字签名过程 / Digital Signature Process

- Bob 使用自己的私钥签名消息：KB−(m)。/ Bob signs the message using his private key: KB−(m).
- Alice 使用 Bob 的公钥验证签名：$K_B^{+}(K_B^{-}(m))=m$。/ Alice verifies the signature using Bob’s public key: $K_B^{+}(K_B^{-}(m))=m$.
- 如果验证得到的消息与原消息相同，则可以证明签名来自 Bob。/ If the recovered message matches the original, it proves that Bob signed it.
- 实际应用中通常签署消息摘要 H(m)，而不是直接签署完整消息 m。/ In practice, the message digest H(m) is signed instead of the complete message m.

#### 5.4 证书颁发机构 / Certification Authority

证书颁发机构（CA）负责将公钥与特定实体的身份绑定。/ A Certification Authority (CA) binds a public key to the identity of a specific entity.

- 实体向 CA 注册自己的公钥。/ The entity registers its public key with the CA.
- 实体向 CA 提供身份证明。/ The entity provides proof of identity to the CA.
- CA 创建经过数字签名的证书。/ The CA creates a digitally signed certificate.
- 证书包含实体的公钥和身份信息。/ The certificate contains the entity’s public key and identity information.

#### 5.5 证书的使用与信任链 / Certificate Usage and Chain of Trust

当 Alice 需要 Bob 的公钥时：/ When Alice needs Bob’s public key:

1. Alice 获取 Bob 的数字证书。/ Alice obtains Bob’s digital certificate.
2. Alice 使用 CA 的公钥验证证书。/ Alice verifies the certificate using the CA’s public key.
3. Alice 从证书中提取 Bob 的公钥。/ Alice extracts Bob’s public key from the certificate.
4. 信任链最终追溯到双方共同信任的 CA。/ The chain of trust ultimately traces back to a CA trusted by both parties.

------

### 6. 入侵检测、防火墙与安全系统 / Intrusion Detection, Firewalls, and Security Systems

#### 6.1 包过滤与入侵检测 / Packet Filtering and Intrusion Detection

**包过滤 / Packet Filtering**

- 仅检查 TCP/IP 数据包头部。/ Operates only on TCP/IP packet headers.
- 不检查不同会话之间的关联。/ Does not check correlations among sessions.
- 提供基本的访问控制。/ Provides basic access control.

**入侵检测系统功能 / IDS Functions**

- **深度包检查 / Deep Packet Inspection：**检查数据包内容。/ Examines packet contents.
- 检查病毒和攻击字符串。/ Checks for viruses and attack strings.
- **多数据包关联分析 / Multiple-Packet Correlation：**综合分析多个数据包之间的关系。/ Analyzes relationships among multiple packets.
- 检测端口扫描。/ Detects port scanning.
- 检测网络映射行为。/ Detects network mapping.
- 检测拒绝服务攻击。/ Detects denial-of-service attacks.

#### 6.2 IDS的部署 / IDS Deployment

- 在网络中的不同位置部署多个 IDS。/ Deploy multiple IDSs at different network locations.
- 在不同位置执行不同类型的检查。/ Perform different types of inspection at different locations.
- 使用基于签名的检测系统。/ Use signature-based detection systems.
- 使用基于异常的检测系统。/ Use anomaly-based detection systems.
- 在 DMZ（隔离区 / Demilitarized Zone）中部署 IDS。/ Deploy IDSs in the DMZ.

#### 6.3 防火墙类型 / Types of Firewalls

- **包过滤器 / Packet Filter：**提供基本的数据包过滤。/ Provides basic packet filtering.
- **状态包过滤器 / Stateful Packet Filter：**跟踪网络连接的状态。/ Tracks the state of network connections.
- **应用代理 / Application Proxy：**在应用层检查通信内容。/ Inspects communication at the application layer.
- **数据二极管 / Data Diode：**只允许数据单向流动。/ Allows data to flow in only one direction.
- **端点防火墙 / Endpoint Firewall：**为单个主机提供保护。/ Provides host-level protection.

#### 6.4 IDS与IPS类型 / Types of IDS and IPS

- **基于网络 / Network-Based：**监控网络通信。/ Monitors network traffic.
- **基于主机 / Host-Based：**监控单个主机上的活动。/ Monitors activity on an individual host.
- **基于签名 / Signature-Based：**根据已知攻击模式识别攻击。/ Detects attacks based on known attack patterns.
- **基于启发式或异常 / Heuristics-Based or Anomaly-Based：**根据异常行为识别潜在攻击。/ Detects potential attacks based on abnormal behavior.
- **隐身模式 / Stealth Mode：**以网络中不可见的方式进行监控。/ Performs monitoring while remaining invisible on the network.

#### 6.5 其他安全系统 / Other Security Systems

- **数据泄露防护 / Data Leakage Protection（DLP）：**防止敏感数据外泄。/ Prevents sensitive data from being exfiltrated.
- **内容扫描系统 / Content Scanning Systems：**检测病毒和恶意软件。/ Detects viruses and malware.
- **安全邮件系统 / Secure Email Systems：**提供电子邮件过滤和加密。/ Provides email filtering and encryption.

------

### 7. 网络安全架构 / Network Security Architecture

#### 7.1 架构设计原则 / Architecture Design Principles

- **网络分段 / Network Segmentation：**隔离具有不同安全级别的网络区域。/ Isolates network areas with different security levels.
- **可用性架构 / Architecture for Availability：**通过适当设计确保服务持续可用。/ Ensures continuous service through appropriate architectural design.
- **避免单点故障 / Avoiding a Single Point of Failure（SPOF）：**通过冗余设计避免单个组件故障导致整个系统中断。/ Uses redundancy to prevent one component failure from disrupting the entire system.

#### 7.2 加密的实施方式 / Encryption Implementation

- 链路加密 / Link encryption
- 端到端加密 / End-to-end encryption
- 虚拟专用网 / Virtual Private Network（VPN）
- 公钥基础设施 / Public Key Infrastructure（PKI）
- SSL和SSH协议 / SSL and SSH protocols

#### 7.3 强身份验证与访问控制 / Strong Authentication and Access Control

- **一次性密码 / One-Time Password（OTP）：**每个密码只使用一次。/ Each password is valid for only one use.
- **挑战—响应认证 / Challenge-Response Authentication：**通过对随机挑战作出正确响应来证明身份。/ Proves identity by correctly responding to a random challenge.
- **Kerberos协议 / Kerberos Protocol：**使用可信第三方和票据提供网络身份验证。/ Uses a trusted third party and tickets to provide network authentication.
- **访问控制列表 / Access Control Lists（ACL）：**规定哪些主体可以访问哪些资源以及执行哪些操作。/ Specifies which subjects may access particular resources and what actions they may perform.

## 第四周：信息系统安全规范模型 / Week 4: Models for Specification of Information Systems Security

### 1. 安全模型基础 / Security Model Foundations

#### 1.1 安全模型概述 / Security Models Overview

计算机安全存在两个基本事实：/ Computer security is based on two fundamental facts:

- 所有复杂软件系统最终都会暴露需要修复的缺陷或漏洞。/ All complex software systems eventually reveal flaws or bugs that need to be fixed.
- 构建完全不容易受到安全攻击的计算机硬件或软件极其困难。/ It is extraordinarily difficult to build computer hardware or software that is not vulnerable to security attacks.

安全策略的目标是防止未经授权的信息泄露，并处理信息流、完整性和可用性问题。/ The goal of a security policy is to prevent unauthorized disclosure of information and address information flow, integrity, and availability.

**安全模型（Security Model）**是对安全策略的正式描述。/ A **security model** is a formal description of a security policy.

安全模型具有以下用途：/ Security models have the following uses:

- 记录安全策略。/ Document the security policy.
- 帮助概念化和设计安全实现。/ Help conceptualize and design a security implementation.
- 检查安全实现是否满足要求。/ Check whether an implementation meets its requirements.
- 测试安全策略的完整性和一致性。/ Test a security policy for completeness and consistency.
- 理解安全与信任之间的关系。/ Understand the relationship between security and trust.

#### 1.2 安全策略类型 / Types of Security Policies

**军事安全策略 / Military Security Policy**

- 主要用于提供机密性。/ Developed primarily to provide confidentiality.
- 也称为政府安全策略。/ Also known as a governmental security policy.
- 重点是防止信息被泄露。/ Focuses on protecting information from disclosure.

**商业安全策略 / Commercial Security Policy**

- 主要用于提供完整性。/ Developed primarily to provide integrity.
- 更关注谁能够修改信息，而不是谁能够读取信息。/ Focuses more on who can change information than who can read it.
- 适用于商业组织的安全需求。/ Suitable for the security needs of business organizations.

#### 1.3 安全与信任的区别 / Difference Between Security and Trust

**安全属性 / Security Attributes**

- 通常是二元的，即“是”或“否”。/ Typically binary, meaning “yes” or “no.”
- 是信息提供者的属性。/ A property of the presenter of information.
- 由产品特征决定或声明。/ Determined or asserted by product characteristics.
- 是绝对的，不受具体使用环境限制。/ Absolute, without qualifications of usage.
- 是需要实现的目标。/ A goal to be achieved.

**信任属性 / Trust Attributes**

- 是分级的，可以具有不同程度。/ Graded and may exist at different levels.
- 是信息接收者的属性。/ A property of the receiver of information.
- 根据证据和分析进行判断。/ Judged based on evidence and analysis.
- 是相对的，需要结合使用环境判断。/ Relative and evaluated within the context of use.
- 是结果所表现出的特征。/ A characteristic of the result.

#### 1.4 零信任架构 / Zero Trust Architecture

零信任架构的核心理念是：**永不信任，始终验证。/ Never Trust, Always Verify.**

- 无论资源位于何处，都必须确保其被安全访问。/ Ensure that all resources are accessed securely regardless of location.
- 采用最小权限策略，并严格执行访问控制。/ Adopt a least-privilege strategy and strictly enforce access control.
- 检查并记录所有活动。/ Inspect and log all activities.

------

### 2. 安全模型的构建 / Building a Security Model

#### 2.1 安全模型的三个基本元素 / Three Basic Elements of a Security Model

- **对象 / Objects：**需要保护什么，例如文档、文件、目录、数据库和事务。/ What must be protected, such as documents, files, directories, databases, and transactions.
- **主体 / Subjects：**需要控制谁，例如与对象交互的用户、实体和进程。/ Who must be controlled, such as users, entities, and processes that interact with objects.
- **动作 / Actions：**需要控制什么，例如主体可以对对象执行的操作。/ What must be controlled, such as operations that subjects may perform on objects.

安全模型可以概括为：**哪些主体可以对哪些对象执行哪些动作。/ Which subjects can perform which actions on which objects.**

#### 2.2 安全分类级别 / Security Classification Levels

信息可以按照以下安全级别进行分类：/ Information may be divided into the following security classification levels:

1. **绝密 / Top Secret（TS）**
2. **机密 / Secret（S）**
3. **秘密 / Confidential（C）**
4. **非密 / Unclassified（UC）**

#### 2.3 需知原则 / Need-to-Know Principle

仅使用安全级别无法充分控制信息访问，还需要加入“需知”类别。/ Security levels alone are insufficient to control information access, so need-to-know categories must also be included.

例如，研究文件和人力资源文件可能都属于“秘密”级别，但人力资源部门不需要知道组织的研究成果。/ For example, research and human resources files may both be classified as “Confidential,” but HR does not need to know the organization’s research outcomes.

对象敏感度可以表示为：/ Object sensitivity can be represented as:

> **（安全分类级别，[需知类别]）/ (Classification Level, [Need-to-Know Categories])**

例如：**（秘密，[研究]）\**或\**（秘密，[财务]）**。/ Examples include **(Confidential, [Research])** and **(Confidential, [Financial])**.

#### 2.4 支配关系 / Dominance Relationship

给定安全标签 (L,C)，其中 L 表示安全分类级别，C 表示类别集合。/ Given a security label (L,C), L represents the security classification level and C represents the set of categories.

(L1,C1) 支配 (L2,C2) 当且仅当：/ (L1,C1) dominates (L2,C2) if and only if:

$$L_1 \ge L_2,\qquad C_2 \subseteq C_1$$

也就是说，第一个标签的安全级别必须不低于第二个标签，并且必须包含第二个标签的全部类别。/ In other words, the first label must have a classification level no lower than the second and must contain all categories of the second label.

支配关系具有以下属性：/ The dominance relationship has the following properties:

- **传递性 / Transitivity：**如果 a≪b，且 b≪c，那么 a≪c。/ If a≪b and b≪c, then a≪c.
- **反对称性 / Antisymmetry：**如果 $a\ll b$，且 $b\ll a$，那么 $a=b$。/ If $a\ll b$ and $b\ll a$, then $a=b$.

------

### 3. Bell-LaPadula机密性模型 / Bell-LaPadula Confidentiality Model

#### 3.1 模型背景 / Model Background

Bell-LaPadula 模型由 David Bell 和 Len LaPadula 于1973年提出。/ The Bell-LaPadula model was developed by David Bell and Len LaPadula in 1973.

该模型也称为**军事安全模型（Military Security Model）**，主要用于解决军事文档的机密性问题。/ It is also called the **Military Security Model** because it models the confidentiality of military documents.

该模型包含两个基本公理：**简单安全属性（Simple-Security Property）**和 ***-属性（The \*-Property）**。/ The model contains two basic axioms: the **Simple-Security Property** and the ***-Property**.

#### 3.2 简单安全属性 / Simple-Security Property

特定安全级别的主体不能读取更高安全级别的数据。/ A subject at a particular classification level cannot read data at a higher classification level.

具有许可标签 (LS,CS) 的主体 S，只有当 (LS,CS) 支配对象 O 的标签 (LO,CO) 时，才能读取对象。/ A subject S with clearance (LS,CS) can read object O only when (LS,CS) dominates (LO,CO).

> **禁止向上读 / No Read Up**

#### 3.3 *-属性 / The *-Property

特定安全级别的主体不能向较低安全级别的对象写入数据。/ A subject at a particular classification level cannot write data to an object at a lower classification level.

具有许可标签 $(L_S,C_S)$ 的主体 $S$，只有当 $(L_S,C_S) \le (L_O,C_O)$ 时，才能向对象 $O$ 写入数据。/ A subject $S$ with clearance $(L_S,C_S)$ can write to object $O$ only when $(L_S,C_S) \le (L_O,C_O)$.

> **禁止向下写 / No Write Down**

#### 3.4 访问权限矩阵 / Access Permission Matrix

访问权限矩阵允许实施自主访问控制。/ An access permission matrix allows discretionary access control.

它将主体和对象放入矩阵中，并定义每个主体可以对每个对象执行的操作。/ It places subjects and objects in a matrix and defines the operations each subject may perform on each object.

#### 3.5 Bell-LaPadula模型的问题 / Issues with the Bell-LaPadula Model

- 只关注机密性，不考虑完整性。/ Focuses only on confidentiality and does not consider integrity.
- 根据 *-属性，下士可能覆盖绝密级别的战争计划。/ According to the *-Property, a corporal may overwrite a top-secret war plan.
- 无法保护通过隐蔽通道传输的信息。/ Does not protect information transmitted through covert channels.
- 不处理访问控制管理。/ Does not address access-control management.
- 更改安全级别不被视为有效操作。/ Changing security levels is not considered a valid operation.
- 不处理现代系统中的文件共享问题。/ Does not address file sharing in modern systems.

#### 3.6 隐蔽通道 / Covert Channels

隐蔽通道是原本不用于通信，却能够实现未经授权信息传输的机制。/ A covert channel is a mechanism not intended for communication but capable of unauthorized information transmission.

这种信息流不受正常安全机制控制，并可能利用文件属性、标志或系统时钟等资源。/ This information flow is not controlled by normal security mechanisms and may use resources such as file attributes, flags, or system clocks.

- **隐蔽存储通道 / Covert Storage Channel：**通过读取或写入共享存储位置传递信息。/ Transfers information by reading from or writing to shared storage locations.
- **隐蔽时序通道 / Covert Timing Channel：**通过调节系统资源的使用时间或使用模式传递信息。/ Transfers information by modulating the timing or pattern of system resource usage.

------

### 4. Biba完整性模型 / Biba Integrity Model

#### 4.1 模型背景 / Model Background

Biba 模型由 Ken Biba 于1975年提出。/ The Biba model was proposed by Ken Biba in 1975.

它可以被视为完整性领域的 Bell-LaPadula 模型。/ It can be viewed as the Bell-LaPadula equivalent for integrity.

对象和主体被分配到不同的完整性级别和完整性类别，其作用类似于 Bell-LaPadula 模型中的许可级别和需知类别。/ Objects and subjects are assigned integrity levels and categories, functioning similarly to clearance levels and need-to-know categories in Bell-LaPadula.

#### 4.2 简单完整性属性 / Simple Integrity Property

特定完整性级别的主体不能读取较低完整性级别的数据。/ A subject at a particular integrity level cannot read data at a lower integrity level.

主体 S 只有在对象标签 (LO,CO) 支配主体标签 (LS,CS) 时，才能读取对象 O。/ A subject S can read object O only when (LO,CO) dominates (LS,CS).

> **禁止向下读 / No Read Down**

该属性可以防止低完整性数据污染高完整性主体和数据。/ This property prevents low-integrity data from corrupting high-integrity subjects and data.

#### 4.3 完整性*-属性 / Integrity *-Property

特定完整性级别的主体不能向更高完整性级别的对象写入数据。/ A subject at a particular integrity level cannot write to an object at a higher integrity level.

主体 $S$ 只有在 $(L_O,C_O) \le (L_S,C_S)$ 时，才能向对象 $O$ 写入数据。/ A subject $S$ can write to object $O$ only when $(L_O,C_O) \le (L_S,C_S)$.

> **禁止向上写 / No Write Up**

该属性可以保护更高级别信息的完整性。/ This property preserves the integrity of higher-level information.

------

### 5. Clark-Wilson商业完整性模型 / Clark-Wilson Commercial Integrity Model

#### 5.1 模型背景 / Model Background

Clark-Wilson 模型由 David Clark 和 David Wilson 于1987年提出，主要面向商业组织。/ The Clark-Wilson model was proposed by David Clark and David Wilson in 1987 and primarily targets commercial organizations.

该模型以金融机构的记账制度为基础，因为记账是最重要的完整性检查之一。/ It is based on bookkeeping in financial institutions, which is one of the most important integrity checks.

其主要目标是确保系统状态中不同组件之间的一致性。/ Its main objective is to maintain consistency among the components of the system state.

#### 5.2 四项基本要求 / Four Fundamental Requirements

- **身份验证 / Authentication：**必须分别识别和验证每个用户。/ Every user must be individually identified and authenticated.
- **审计 / Audit：**任何修改都必须被安全记录，包括执行的程序和执行者。/ Every modification must be securely logged, including the program executed and the person who executed it.
- **良构事务 / Well-Formed Transactions：**受保护的数据只能由符合良构事务要求的受限程序操作。/ Protected data may only be manipulated by restricted programs that satisfy well-formed transaction requirements.
- **职责分离 / Separation of Duty：**系统必须为每个用户关联有效的程序集合，并确保认证者和实施者由不同人员担任。/ The system must associate each user with a valid set of programs and ensure that certifiers and implementers are different people.

#### 5.3 四个主要组件 / Four Main Components

- **受限数据项 / Constrained Data Items（CDIs）：**完整性受到安全策略保护的对象。/ Objects whose integrity is protected by the security policy.
- **非受限数据项 / Unconstrained Data Items（UDIs）：**不受完整性策略保护的对象。/ Objects not covered by the integrity policy.
- **转换过程 / Transformation Procedures（TPs）：**唯一被允许修改 CDIs 的程序。/ The only procedures permitted to modify CDIs.
- **完整性验证过程 / Integrity Verification Procedures（IVPs）：**用于验证 CDIs 的完整性是否得到维护。/ Procedures used to verify that the integrity of CDIs has been maintained.

#### 5.4 策略规则与权限 / Policy Rules and Permissions

- **认证规则 / Certification Rules（C1–C5）：**定义系统必须满足的条件。/ Define the conditions that the system must satisfy.
- **执行规则 / Enforcement Rules（E1–E4）：**定义系统必须强制执行的规则。/ Define the rules that the system must enforce.
- 权限被编码为三元组：**（用户，转换过程，{CDI集合}）**。/ Permissions are encoded as triples: **(User, TP, {CDI Set})**.

------

### 6. 三种安全模型的比较 / Comparison of the Three Security Models

#### 6.1 Bell-LaPadula模型 / Bell-LaPadula Model

- 防止高机密信息泄露到低分类文件。/ Prevents highly confidential information from leaking into lower-classified files.
- 核心规则是“禁止向上读”和“禁止向下写”。/ Its core rules are “No Read Up” and “No Write Down.”
- 重点是保护**机密性**。/ Focuses on **confidentiality**.
- 主要适用于军事环境。/ Primarily suitable for military environments.

#### 6.2 Biba模型 / Biba Model

- 防止不可信信息流入高完整性文件。/ Prevents untrusted information from flowing into higher-integrity files.
- 核心规则是“禁止向下读”和“禁止向上写”。/ Its core rules are “No Read Down” and “No Write Up.”
- 重点是保护**完整性**。/ Focuses on **integrity**.
- 适用于对数据完整性要求较高的系统。/ Suitable for systems requiring strong data integrity.

#### 6.3 Clark-Wilson模型 / Clark-Wilson Model

- 保护数据完整性并确保事务按照正确格式执行。/ Protects data integrity and ensures that transactions are properly formed.
- 依赖授权程序、职责分离和审计。/ Relies on authorized programs, separation of duties, and auditing.
- 重点是保护**商业完整性**。/ Focuses on **commercial integrity**.
- 主要适用于商业组织。/ Primarily suitable for business organizations.

#### 6.4 规则对照 / Rule Comparison

- **Bell-LaPadula：**禁止向上读，禁止向下写。/ No Read Up and No Write Down.
- **Biba：**禁止向下读，禁止向上写。/ No Read Down and No Write Up.
- **Clark-Wilson：**只有授权的转换过程可以修改受限数据项。/ Only authorized transformation procedures may modify constrained data items.

------

### 7. 安全模型的局限性与实施 / Model Limitations and Implementation

#### 7.1 模型的局限性 / Limitations of Security Models

每种安全模型都有自身的优点，但对现实的抽象终究只是抽象。/ Each security model has its own merits, but an abstraction of reality remains only an abstraction.

模型是否适用取决于其所处的具体环境。/ The suitability of a model depends on the environment in which it is applied.

**军事环境 / Military Environments**

- 通常具有较强的信任文化。/ Usually have a strong culture of trust.
- 组织角色和权限较为明确。/ Organizational roles and permissions are clearly defined.
- 完整性通常不是最主要的关注点。/ Integrity is not usually the primary concern.

**非军事组织 / Non-Military Organizations**

- 完整性通常是关键要求。/ Integrity is often a critical requirement.
- 不应默认组织成员或系统值得信任。/ Trust should not be assumed.
- 信息通常需要更加自由地流动。/ Information generally needs to flow more freely.

#### 7.2 实施建议 / Implementation Recommendations

- 应由组织的实际需求决定采用什么模型，而不是让模型反过来限制组织。/ The organization’s actual needs should determine the model, rather than allowing the model to drive the organization.
- 在选择模型前，需要彻底分析组织环境。/ The organizational environment must be thoroughly analyzed before selecting a model.
- 制定安全策略前，必须充分理解组织文化和实际运营方式。/ Organizational culture and operations must be fully understood before developing security policies.









## 第五周：正式信息安全管理 / Week 5: Formal Information Systems Security Management

### 1. 信息安全管理的十个致命错误 / Ten Deadly Sins of Information Security Management

#### 1.1 治理与管理认知错误 / Governance and Management Misconceptions

**错误1：未意识到信息安全是企业治理责任 / Sin 1: Not Realizing That Information Security Is a Corporate Governance Responsibility**

- 信息安全责任最终由组织最高管理层承担。/ Information security responsibility ultimately rests with senior management.
- 领导一个组织意味着必须对组织内部发生的事情承担责任。/ Leading an organization means accepting responsibility for what happens within it.
- “责任止于此处”是美国总统杜鲁门的名言。/ “The buck stops here” was President Truman’s motto.

**错误2：未意识到信息安全是商业问题，而不只是技术问题 / Sin 2: Not Realizing That Information Security Is a Business Issue, Not Just a Technical Issue**

- 信息安全必须从商业角度进行考虑。/ Information security must be considered from a business perspective.
- 信息安全不只是技术实施问题。/ Information security is not merely a matter of technical implementation.

**错误3：未意识到信息安全治理是一门多维学科 / Sin 3: Not Realizing That Information Security Governance Is a Multidimensional Discipline**

- 信息安全治理是一个复杂的问题。/ Information security governance is a complex issue.
- 不存在能够解决所有安全问题的“银弹”或单一的现成方案。/ There is no silver bullet or single off-the-shelf solution that can solve every security problem.

#### 1.2 风险与最佳实践错误 / Risk and Best-Practice Misconceptions

**错误4：未意识到信息安全计划必须以已识别的风险为基础 / Sin 4: Not Realizing That an Information Security Plan Must Be Based on Identified Risks**

- 信息安全计划应解决已知威胁并尽量减少损失。/ An information security plan should address known threats and minimize losses.
- 可以使用风险矩阵评估风险的可能性和后果。/ A risk matrix can be used to assess the likelihood and consequences of risks.

**风险矩阵 / Risk Matrix**

- **可能性 / Likelihood：**从几乎确定（A）到罕见（E）。/ Ranges from Almost Certain (A) to Rare (E).
- **后果 / Consequences：**从灾难性（5）到微不足道（1）。/ Ranges from Catastrophic (5) to Insignificant (1).
- **风险等级 / Risk Levels：**极端、高、中和低。/ Extreme, High, Moderate, and Low.

**错误5：未意识到国际最佳实践在信息安全管理中的重要作用 / Sin 5: Not Realizing the Importance of International Best Practices in Information Security Management**

- 组织需要参考并采用国际标准。/ Organizations need to reference and adopt international standards.
- 组织应学习所在行业的最佳实践。/ Organizations should learn from industry best practices.

#### 1.3 政策、合规与意识错误 / Policy, Compliance, and Awareness Misconceptions

**错误6：未意识到企业信息安全政策绝对必要 / Sin 6: Not Realizing That a Corporate Information Security Policy Is Essential**

- 政策是信息安全管理的基础。/ Policy is the foundation of information security management.
- 新南威尔士州议会网络安全审查强调了安全政策的重要性。/ The NSW Parliamentary cybersecurity review emphasized the importance of security policies.

**错误7：未意识到信息安全合规执行与监控绝对必要 / Sin 7: Not Realizing That Compliance Enforcement and Monitoring Are Essential**

- 仅仅制定政策并不足够，还需要执行和监控。/ Having a policy alone is insufficient; enforcement and monitoring are also required.
- 违规案例包括荷兰数据保护机构对 Uber 处以2.9亿欧元罚款。/ A compliance violation example is the Dutch Data Protection Authority’s €290 million fine against Uber.

**错误8：未意识到用户安全意识的核心重要性 / Sin 8: Not Realizing the Importance of User Security Awareness**

- 用户是信息安全链条中的关键环节。/ Users are a critical link in the information security chain.
- 安全意识培训至关重要。/ Security awareness training is essential.

#### 1.4 组织结构与资源错误 / Organizational Structure and Resource Misconceptions

**错误9：未意识到适当的信息安全治理结构绝对必要 / Sin 9: Not Realizing That a Proper Information Security Governance Structure Is Essential**

- 组织需要将信息安全管理制度化。/ Organizations need to institutionalize information security management.
- 需要明确 CISO 的角色和相应组织结构。/ A clear CISO role and corresponding organizational structure are required.

**错误10：未向信息安全经理提供必要的基础设施、工具与支持 / Sin 10: Not Empowering Information Security Managers with Infrastructure, Tools, and Support**

- 信息安全管理需要投入时间、精力和资金。/ Information security management requires time, effort, and financial investment.
- 信息安全经理需要获得充分的资源与支持。/ Information security managers need adequate resources and support.

------

### 2. 正式信息安全的四个类别 / Four Classes of Formal Information Security

#### 2.1 责任与权限结构 / Responsibility and Authority Structures

- 确定正式控制系统如何运行。/ Determine how formal control systems operate.
- 提供识别责任主体的方法。/ Provide a means of identifying responsible agents.
- 帮助理解组织成员潜在的行为模式。/ Help identify underlying patterns of organizational member behavior.
- 分离权限和责任，例如 Clark-Wilson 模型中的职责分离。/ Separate authority and responsibilities, as demonstrated by the Clark-Wilson model.
- 培训内容应当与岗位职责相关。/ Training content should be related to job responsibilities.
- 如果组织结构保持不变，风险模型也可以保持相对稳定，从而节省资源并避免重复建设。/ If the organizational structure remains unchanged, the risk model may also remain stable, saving resources and avoiding redundant development.

#### 2.2 安全战略与政策 / Security Strategy and Policy

- 确定如何管理信息安全的行政与管理事务。/ Determine how the administrative aspects of information security are managed.
- 建立信息安全计划。/ Establish an information security program.
- 分配安全计划的管理责任。/ Assign responsibility for managing the security program.
- 设定整个组织范围内的计算机安全目的和目标。/ Establish organization-wide computer security purposes and objectives.

#### 2.3 业务流程 / Business Processes

- 定义和识别信息流。/ Define and identify information flows.
- 建立运营完整性。/ Establish operational integrity.
- 确保业务流程与责任和权限结构保持一致。/ Align business processes with responsibility and authority structures.
- 识别组织中的沟通差距。/ Identify areas containing communication gaps.

#### 2.4 角色与技能 / Roles and Skills

- 识别与责任和权限结构相匹配的岗位角色。/ Identify roles required to match responsibility and authority structures.
- 确定不同角色所需要的技能水平。/ Identify the skill levels required for different roles.
- 建立吸引、培训和留住所需人才的机制。/ Identify mechanisms for attracting, training, and retaining people with the required skills.

------

### 3. 组织认同与管理技术差距 / Organizational Buy-in and the Management–Technician Gap

#### 3.1 组织认同的重要性 / Importance of Organizational Buy-in

获得组织执行领导层的支持通常是最具挑战性的任务。/ Gaining support from executive leadership is often the most challenging task.

执行领导层的认同具有双重作用：/ Executive leadership buy-in serves two purposes:

- 确保员工认同并配合安全计划。/ Ensures staff buy-in and cooperation with the security program.
- 确保信息安全获得必要的资金。/ Ensures that information security receives the necessary funding.

IT部门的支持同样必不可少，每一位员工的支持也是信息安全成功的重要因素。/ Support from the IT department is also essential, and the support of every employee is an important factor in information security success.

#### 3.2 弥合管理层与技术人员差距的十个方面 / Ten Aspects of Bridging the Management–Technician Gap

1. 获得高层管理者的支持，首先让 CEO 认同安全计划。/ Gain top-management support, beginning with the CEO’s buy-in.
2. 获得技术管理层的支持。/ Gain technical management support.
3. 将 ICT 安全问题作为一个专项项目处理。/ Address the ICT security problem as a special project.
4. 快速扫描 ICT 相关风险及其对组织的后果。/ Conduct a quick scan of ICT-related risks and their consequences for the organization.
5. 获得管理层的关注和支持。/ Gain management’s attention and backing.
6. 记录 ICT 安全的当前状态并评估现有情况。/ Document the current state of ICT security and assess the existing situation.
7. 在用户中开展安全意识提升会议。/ Conduct awareness-raising sessions among users.
8. 实施风险评估和风险分析。/ Carry out risk assessment and analysis.
9. 制定短期和长期风险缓解计划。/ Develop short-term and long-term mitigation plans.
10. 制定并实施安全对策。/ Develop and implement security countermeasures.

------

### 4. 信息安全政策体系 / Information Security Policy Framework

#### 4.1 信息安全政策层次 / Information Security Policy Levels

- **计划级政策 / Program-Level Policies：**将信息安全计划制度化，并确定计划的目的和目标。/ Institutionalize the information security program and establish its purposes and objectives.
- **计划框架政策 / Program-Framework Policies：**支持安全计划的实施，并为 IT 决策建立背景和框架。/ Support program implementation and establish the context for IT decisions.
- **问题特定政策与系统特定政策 / Issue-Specific and System-Specific Policies：**解决特定问题、系统或关注领域。/ Address specific issues, systems, or areas of concern.

#### 4.2 良好安全政策的制定 / Formulation of a Good Security Policy

良好的信息安全政策应当与组织的业务目标、风险环境、责任结构和实际运营方式保持一致。/ A good information security policy should align with the organization’s business objectives, risk environment, responsibility structure, and actual operations.

政策不仅需要被正式制定，还需要得到高层支持、员工认同、持续执行、有效监控和定期审查。/ A policy must not only be formally established but also supported by senior management, accepted by employees, continuously enforced, effectively monitored, and regularly reviewed.

------

### 5. NIST网络安全框架 / NIST Cybersecurity Framework

#### 5.1 NIST框架的三个主要组成部分 / Three Main Components of the NIST Framework

**核心 / Core**

- 定义组织希望实现的网络安全结果。/ Defines the cybersecurity outcomes an organization wants to achieve.
- 按照层次进行组织，并与更详细的指导和控制措施保持一致。/ Organizes outcomes hierarchically and aligns them with more detailed guidance and controls.

**配置文件 / Profiles**

- 将组织需求、目标、风险偏好和可用资源保持一致。/ Align organizational requirements, objectives, risk appetite, and available resources.
- 使用框架核心中定义的期望结果。/ Use the desired outcomes defined in the Framework Core.

**实施层级 / Implementation Tiers**

- 对组织的网络安全风险治理与管理实践进行定性衡量。/ Provide a qualitative measure of an organization’s cybersecurity risk governance and management practices.

#### 5.2 NIST框架核心功能 / NIST Framework Core Functions

**治理 / Govern**

- 制定网络安全风险管理战略、期望和政策。/ Develop cybersecurity risk-management strategies, expectations, and policies.
- 确保这些内容得到建立、沟通和监控。/ Ensure that they are established, communicated, and monitored.

**识别 / Identify**

- 建立组织对系统、人员、资产、数据和能力所面临网络安全风险的理解。/ Develop organizational understanding of cybersecurity risks to systems, people, assets, data, and capabilities.

**保护 / Protect**

- 开发并实施适当的保障措施，确保关键服务能够持续交付。/ Develop and implement appropriate safeguards to ensure the delivery of critical services.

**检测 / Detect**

- 开发并实施适当活动，以识别网络安全事件的发生。/ Develop and implement appropriate activities to identify the occurrence of cybersecurity events.

**响应 / Respond**

- 开发并实施适当活动，对已经检测到的网络安全事件采取行动。/ Develop and implement appropriate activities to take action regarding detected cybersecurity incidents.

**恢复 / Recover**

- 开发并实施适当活动，以维持弹性计划，并恢复因网络安全事件而受损的能力或服务。/ Develop and implement appropriate activities to maintain resilience plans and restore capabilities or services impaired by cybersecurity incidents.

------

### 6. NIST配置文件与实施层级 / NIST Profiles and Implementation Tiers

#### 6.1 CSF配置文件 / CSF Profiles

- **当前配置文件 / Current Profile：**表示组织当前已经实现的框架核心结果。/ Represents the Framework Core outcomes that the organization is currently achieving.
- **目标配置文件 / Target Profile：**表示考虑未来网络安全态势变化后希望实现的结果。/ Represents desired outcomes after considering anticipated changes in the cybersecurity posture.
- **社区配置文件 / Community Profile：**为某个特定行业或部门制定的安全基线。/ Provides a security baseline developed for a particular industry or sector.

#### 6.2 CSF实施层级 / CSF Implementation Tiers

**第1级：部分实施 / Tier 1: Partial**

风险管理流程的功能性和可重复性较低。/ Risk-management processes have limited functionality and repeatability.

**第2级：风险知情 / Tier 2: Risk Informed**

风险管理实践已经获得批准，但可能尚未得到充分实施。/ Risk-management practices have been approved but may not be fully implemented.

**第3级：可重复 / Tier 3: Repeatable**

风险管理实践已经获得正式批准，并且会定期更新。/ Risk-management practices are formally approved and regularly updated.

**第4级：自适应 / Tier 4: Adaptive**

组织能够根据过去和当前的安全活动持续调整并改进实践。/ The organization continuously adapts and improves its practices based on previous and current activities.

------

### 7. NIST有效安全计划与总结 / NIST Effective Security Program and Summary

#### 7.1 NIST建立有效安全计划的五个步骤 / NIST’s Five Steps for an Effective Security Program

**步骤1：确定初始配置文件的范围 / Step 1: Scope the Initial Profile**

- 明确信息安全计划的范围、目标和目的。/ Identify the scope, goals, and objectives of the program.
- 一个组织可以根据需要建立任意数量的配置文件。/ An organization may create as many profiles as necessary.

**步骤2：收集所需信息 / Step 2: Gather the Required Information**

- 识别相关系统、资产、监管要求和整体风险管理方法。/ Identify relevant systems, assets, regulatory requirements, and the overall risk-management approach.
- 查询相关资源，识别适用于这些系统和资产的威胁与漏洞。/ Consult relevant sources to identify threats and vulnerabilities applicable to those systems and assets.

**步骤3：创建组织配置文件 / Step 3: Create the Organizational Profile**

- 根据框架核心中的类别和子类别结果建立当前配置文件。/ Develop the Current Profile using Category and Subcategory outcomes from the Framework Core.
- 对当前配置文件进行风险评估。/ Conduct a risk assessment of the Current Profile.
- 创建目标配置文件。/ Create the Target Profile.

**步骤4：确定、分析并优先处理差距 / Step 4: Determine, Analyze, and Prioritize Gaps**

- 比较当前配置文件和目标配置文件，确定两者之间的差距。/ Compare the Current Profile and Target Profile to identify gaps.
- 建立按优先级排列的行动计划来解决这些差距。/ Create a prioritized action plan to address the gaps.

**步骤5：实施行动计划 / Step 5: Implement the Action Plan**

- 确定需要采取哪些行动来解决已经识别的差距。/ Determine which actions should be taken to address the identified gaps.
- 调整当前网络安全实践，以实现目标配置文件。/ Adjust current cybersecurity practices to achieve the Target Profile.

#### 7.2 正式信息安全的核心 / Core of Formal Information Security

正式信息安全由以下方面共同构成：/ Formal information security consists of the following elements:

- 与责任结构相关的组织考虑。/ Organizational considerations related to structures of responsibility.
- 确保整个组织对信息安全的认同。/ Ensuring organizational buy-in for information security.
- 建立安全计划和政策，并将其与组织愿景联系起来。/ Establishing security plans and policies and aligning them with the organizational vision.

#### 7.3 成功因素 / Success Factors

- 高层管理者的支持至关重要。/ Top-management support is essential.
- 信息安全是商业问题，而不只是技术问题。/ Information security is a business issue, not merely a technical issue.
- 安全管理需要采用基于风险的方法。/ Security management requires a risk-based approach.
- 政策、合规执行和安全意识培训都必不可少。/ Policies, compliance enforcement, and security awareness training are all necessary.
- NIST网络安全框架提供了一套结构化方法。/ The NIST Cybersecurity Framework provides a structured approach.

#### 7.4 实施建议 / Implementation Recommendations

- 使用 NIST 五步流程建立有效的信息安全计划。/ Use NIST’s five-step process to establish an effective information security program.
- 确保所有利益相关者认同并支持安全计划。/ Ensure buy-in and support from all stakeholders.
- 持续监控并改进组织的安全实践。/ Continuously monitor and improve the organization’s security practices.







## 第六周：信息安全规划与设计 / Week 6: Planning and Designing for Information Security

### 1. 安全策略与管理层次 / Security Strategy and Management Levels

#### 1.1 安全管理的四个层次 / Four Levels of Security Management

**策略 / Strategy**

- 指组织最高层的管理过程和方向性决策。/ Refers to high-level managerial processes and directional decisions.
- 策略责任不能被委派。/ Strategic responsibility cannot be delegated.
- 主要涉及组织高层的长期决策。/ Primarily involves long-term decisions made by senior management.

**政策 / Policy**

- 指组织根据具体情况制定的权变决策。/ Refers to contingent decisions made according to particular circumstances.
- 通常以指导性文件的形式存在。/ Usually exists as a guidance document.
- 政策的制定和执行可以被委派。/ Policy development and implementation may be delegated.

**计划 / Program**

- 指按照时间阶段安排的一系列行动。/ Refers to a time-phased sequence of actions.
- 项目是计划的组成部分。/ A project is a component of a program.

**操作程序 / Operating Procedure**

- 用于具有预定结果的重复性行动。/ Used for repetitive actions with predetermined outcomes.

#### 1.2 三种安全决策 / Three Types of Security Decisions

- **战略决策 / Strategic Decisions：**设定组织的总体安全目标，并为长期安全目标分配资源。/ Set overall organizational security goals and allocate resources for long-term security objectives.
- **管理决策 / Administrative Decisions：**建立支持安全实施的结构、责任体系和流程。/ Establish structures, responsibility systems, and processes that support security implementation.
- **运营决策 / Operational Decisions：**保证业务流程完整性，并控制日常安全操作。/ Ensure business-process integrity and control daily security operations.

------

### 2. 文化与信息安全 / Culture and Information Security

#### 2.1 文化的定义 / Definition of Culture

文化是一个难以捉摸的概念，无法被直接看见或触摸，只能通过感受和观察进行理解。/ Culture is an elusive concept that cannot be directly seen or touched and can only be understood through experience and observation.

文化是社会或组织成员用来应对外部世界并相互交往的一套共同信念、价值观、习俗和行为体系。/ Culture is a system of shared beliefs, values, customs, and behaviors used by members of a society or organization to interact with the world and one another.

#### 2.2 安全文化的重要性 / Importance of Security Culture

- 文化与组织绩效之间存在较强的相关性。/ There is a strong correlation between culture and organizational performance.
- 强大的组织文化可以改善协调和控制，使员工目标与组织目标保持一致，并提高员工投入程度。/ A strong organizational culture improves coordination and control, aligns employee goals with organizational objectives, and increases employee effort.
- 与文化规范保持一致的管理实践能够建立更强的信息安全。/ Management practices aligned with cultural norms lead to stronger information security.

#### 2.3 安全文化的定义 / Definition of Security Culture

安全文化是所有保护企业信息资源的行为模式的总和。/ Security culture is the totality of behavioral patterns that collectively protect an organization’s information resources.

只有当非语言、技术和语言三个方面都得到清楚理解时，安全文化才能持续存在。/ Security culture can only be sustained when its non-verbal, technical, and verbal aspects are clearly understood.

安全文化可以理解为：当人们独自行动、不受直接监督时，他们在安全方面实际采取的行为。/ Security culture can be understood as what happens to security when people are left to act without direct supervision.

#### 2.4 安全文化薄弱的后果 / Consequences of a Weak Security Culture

- 信息系统无法实现其最初设计的目的。/ Information systems may fail to serve the purposes for which they were originally designed.
- 信息系统施加的规则可能与企业目标普遍不一致。/ Rules imposed by information systems may become inconsistent with corporate objectives.

#### 2.5 文化的三个层次 / Three Levels of Culture

**人工制品 / Artifacts**

人工制品是可见的文化表现，例如锁门、明显部署的防火墙和清楚展示的安全政策。/ Artifacts are visible cultural manifestations, such as locked doors, clearly deployed firewalls, and prominently displayed security policies.

**公开的价值观和规范 / Espoused Values and Norms**

公开的价值观和规范部分可见，并且通常是有意识的，例如良好的沟通、对政策的了解和审计跟踪。/ Espoused values and norms are partially visible and conscious, such as good communication, policy knowledge, and audit trails.

**潜在假设 / Tacit Assumptions**

潜在假设是隐藏且通常无意识的观念，例如个人态度和信念。/ Tacit assumptions are hidden and largely unconscious ideas, such as personal attitudes and beliefs.

------

### 3. 文化网络 / Web of Culture

文化网络由十种相互影响的文化流构成。/ The Web of Culture consists of ten interacting cultural streams.

#### 3.1 互动、关联与生存 / Interaction, Association, and Subsistence

**互动 / Interaction**

- 互动位于“文化宇宙”的中心，其他文化活动都从互动中产生。/ Interaction lies at the center of the “universe of culture,” and other cultural activities grow from it.
- 信息管理者与用户之间的互动同时发生在正式和非正式层面。/ Interaction between information managers and users occurs at both formal and informal levels.

**关联 / Association**

- 信息管理者承担提供相关信息和管理信息系统的重要角色。/ Information managers assume the important role of providing relevant information and managing information systems.
- 信息系统的引入会改变组织内部个人与群体之间的关系。/ The introduction of information systems changes relationships among individuals and groups within an organization.

**生存 / Subsistence**

- 生存涉及物质生活、饮食、工作和收入。/ Subsistence concerns physical livelihood, food, employment, and income.
- 信息系统可能对利益相关者群体的生存问题产生不利影响。/ Information systems may adversely affect the livelihoods of stakeholder groups.

#### 3.2 性别、地域与时间 / Gender, Territoriality, and Temporality

**性别 / Gender**

- 涉及性别差异、婚姻和家庭关系。/ Concerns differences between sexes, marriage, and family relationships.
- 在某些组织中，男性占主导地位的中层管理层可能表现出大男子主义。/ In some organizations, predominantly male middle management may display machismo.
- 组织对男性和女性在行为、态度和认知方面的期望可能不同。/ Organizational expectations of males and females may differ in behavior, attitudes, and perceptions.

**地域性 / Territoriality**

- 涉及空间的划分、事物的位置、开展工作的场所和所有权。/ Concerns the division of space, the location of objects, places where activities occur, and ownership.
- 信息系统和流程可能在组织内部创造许多人为边界。/ Information systems and processes may create many artificial boundaries within an organization.

**时间性 / Temporality**

- 涉及时间的划分、做事的时间、顺序和持续时间。/ Concerns the division of time, when activities occur, their sequence, and their duration.
- 时间性以不同方式融入工作和生活，例如弹性工作时间和随时待命。/ Temporality is integrated into work and life through arrangements such as flexible working hours and being on call.

#### 3.3 学习、游戏、防御与利用 / Learning, Play, Defense, and Exploitation

**学习 / Learning**

- 学习是人类生活的基本活动之一。/ Learning is one of the fundamental activities of life.
- 包括管理发展项目、短期课程和技能提升活动。/ It includes management-development programs, short courses, and skills-uplift activities.
- 信息系统可以为传统学习方式提供有效的替代方案。/ Information systems may provide effective alternatives to traditional learning methods.

**游戏 / Play**

- 游戏会影响企业安全，也可以作为提高安全意识的方法。/ Play affects enterprise security and can also be used to increase security awareness.
- 模拟活动可以帮助组织为潜在灾难做好准备。/ Simulation activities can help organizations prepare for possible disasters.
- 游戏和演练被广泛用于帮助员工熟悉安全漏洞和事件。/ Games and exercises are widely used to familiarize employees with security breaches and incidents.

**防御 / Defense**

- 防御是任何文化中都非常重要的要素。/ Defense is an extremely important element of any culture.
- 良好的防御系统对组织运营的可持续性至关重要。/ A strong defense system is vital to operational sustainability.
- 组织需要在安全控制、组织结构、安全性与可用性之间保持一致和平衡。/ Organizations must maintain alignment and balance among security controls, organizational structures, security, and usability.

**利用 / Exploitation**

- 组织需要适应其运营环境，并合理利用可用资源。/ Organizations need to adapt to their operating environment and make appropriate use of available resources.
- 信息系统越来越多地参与资源规划和管理活动。/ Information systems are increasingly involved in resource planning and management.

------

### 4. 组织文化类型 / Types of Organizational Culture

#### 4.1 层级文化 / Hierarchy Culture

层级文化通常存在于正式化、结构良好的组织中。/ Hierarchy culture is typically found in formalized and well-structured organizations.

大多数用于设置信息系统权限的访问控制技术都具有层级导向。/ Most access-control techniques used to assign information-system privileges have a hierarchical orientation.

典型组织包括州政府、联邦政府机构和军队。/ Typical examples include state governments, federal government agencies, and the military.

“Hierarchy”表示等级制度或层级结构，强调规章制度、明确的上下级关系和权威控制。/ “Hierarchy” refers to a ranked or layered system and emphasizes formal rules, clear chains of command, and authoritative control.

#### 4.2 专门文化 / Adhocracy Culture

专门文化通常存在于从事社区工作或特殊项目的组织中。/ Adhocracy culture is typically found in organizations engaged in community-based work or special projects.

由于安全控制本质上具有一定限制性，因此可能与这种灵活的文化产生冲突。/ Because security controls are restrictive by nature, they may conflict with this flexible culture.

典型组织包括非营利公司和咨询公司。/ Typical examples include nonprofit organizations and consulting firms.

“Adhocracy”由“ad hoc”演变而来，表示灵活、临时、创新且非正式的组织结构。/ “Adhocracy” derives from “ad hoc” and describes a flexible, temporary, innovative, and informal organizational structure.

#### 4.3 宗族文化 / Clan Culture

宗族文化通常存在于强调内部一致性、灵活性、敏感性和员工关怀的小型组织中。/ Clan culture is generally found in smaller organizations that emphasize internal consistency, flexibility, sensitivity, and concern for people.

这种文化更加重视相互信任和责任感。/ This culture places greater emphasis on mutual trust and a sense of obligation.

典型组织包括艺术学校、初创公司和体育组织。/ Typical examples include art schools, startups, and sports organizations.

“Clan”表示氏族、宗族或家族，强调亲密关系、集体归属感和长辈式领导。/ “Clan” refers to a family-like group or tribe and emphasizes close relationships, collective belonging, and paternal-style leadership.

#### 4.4 市场文化 / Market Culture

市场文化倾向于关注长期、可衡量的目标和指标。/ Market culture focuses on long-term, measurable goals and targets.

在这种文化中，安全通常被视为日常运营的障碍，因此持续遵守法规、程序和控制可能比较困难。/ In this culture, security is often viewed as an obstacle to daily operations, making consistent compliance with regulations, procedures, and controls challenging.

典型组织包括银行、零售企业和保险公司。/ Typical examples include banks, retailers, and insurance companies.

“Market”表示市场导向，强调结果、竞争力和外部地位。/ “Market” describes an outcome-oriented and competitive approach focused on external positioning.

#### 4.5 雷达图的应用 / Application of Radar Maps

可以针对安全的不同维度绘制一系列雷达图，包括机密性、完整性、可用性、责任、角色完整性、信任和道德性。/ A series of radar maps can be created for different security dimensions, including confidentiality, integrity, availability, responsibility, integrity of roles, trust, and ethicality.

雷达图可以帮助管理者准确判断组织在各个安全维度上的位置。/ Radar maps can help managers identify the organization’s position in each security dimension.

------

### 5. 安全决策与实施 / Security Decisions and Implementation

#### 5.1 战略决策 / Strategic Decisions

**需要解决的问题 / Problem：**选择能够保证业务顺利运行的安全环境。/ Select an environment that ensures the smooth operation of the business.

**决策性质 / Nature：**在相互竞争的需求之间分配资源。/ Allocate resources among competing needs.

**关键决策 / Key Decisions：**

- 设定安全目标。/ Set security goals and objectives.
- 分配资源。/ Allocate resources.
- 制定基础设施扩展策略。/ Develop infrastructure-expansion strategies.
- 决定研究与开发方向。/ Make research and development decisions.

**主要特征 / Characteristics：**

- 决策通常比较集中。/ Decisions are generally centralized.
- 决策者可能不了解实际操作中的全部细节。/ Decision-makers may have limited knowledge of actual operations.
- 通常属于非重复性决策。/ Decisions are generally non-repetitive.

#### 5.2 管理决策 / Administrative Decisions

**需要解决的问题 / Problem：**建立适当的结构和流程，实现充分的信息处理。/ Create appropriate structures and processes to achieve adequate information handling.

**决策性质 / Nature：**组织、结构设计与实施。/ Organization, structuring, and implementation.

**关键决策 / Key Decisions：**

- 设计组织结构。/ Design the organizational structure.
- 建立权限和责任体系。/ Establish authority and responsibility structures.
- 建立高完整性的业务流程。/ Establish high-integrity business processes.
- 获取所需资源。/ Acquire required resources.

**主要特征 / Characteristics：**

- 平衡战略与运营之间相互冲突的需求。/ Balance conflicting demands between strategy and operations.
- 处理个人目标与群体目标之间的冲突。/ Manage conflicts between individual and group objectives.

#### 5.3 运营决策 / Operational Decisions

**需要解决的问题 / Problem：**优化工作模式以提高效率。/ Optimize work patterns to achieve efficiency gains.

**决策性质 / Nature：**

- 确保业务流程完整性。/ Ensure business-process integrity.
- 安排资源的具体应用。/ Schedule the use of resources.
- 实施监督和控制。/ Perform supervision and control.

**关键决策 / Key Decisions：**

- 确定运营目标。/ Identify operational objectives.
- 计算安全措施的成本。/ Calculate the cost of security initiatives.
- 制定运营控制策略。/ Develop operational-control strategies.
- 制定各项功能的政策和操作程序。/ Establish policies and operating procedures for different functions.

**主要特征 / Characteristics：**

- 决策通常比较分散。/ Decisions are generally decentralized.
- 主要处理已知风险。/ Primarily address known risks.
- 问题和决策具有重复性。/ Problems and decisions are repetitive.
- 由于系统固有的复杂性，可能出现局部最优而非整体最优。/ Inherent complexity may result in suboptimization rather than overall optimization.

三类决策构成递进层级，而不是相互排斥的孤立类别：战略决策确定总体方向，管理决策把战略转化为政策与流程，运营决策负责日常技术和程序的执行。/ The three decision classes form a hierarchy rather than mutually exclusive silos: strategic decisions set the overall direction, administrative decisions translate strategy into policies and processes, and operational decisions handle daily technical and procedural execution.

三种决策相互重叠并彼此补充。/ The three decision types overlap and complement one another.

#### 5.4 例题：三个层次的安全决策 / Example: Security Decisions at Three Levels

**战略层 / Strategic Level**

**决策 / Decision：**制定并实施全面的信息安全治理框架，例如 ISO/IEC 27001，以统一旧系统治理、补丁管理和账号政策。/ Adopt a comprehensive cybersecurity governance framework, such as ISO/IEC 27001, to standardize legacy-system control, patching policies, and account-lifecycle management.

**目的 / Purpose：**确保信息安全获得高层支持和资源分配，并被纳入组织的长期规划。/ Ensure that information security receives senior-management support and resource allocation and is incorporated into long-term organizational planning.

**管理层 / Administrative Level**

**决策 / Decision：**实施账号生命周期管理流程，包括定期审计和账号自动失效机制。/ Introduce account-lifecycle management with regular audits and automatic account-expiry policies.

**目的 / Purpose：**优化身份和访问管理，防止僵尸账号、前员工账号或权限膨胀被滥用。/ Improve identity and access management and prevent the misuse of dormant accounts, former employee accounts, and privilege creep.

**操作层 / Operational Level**

**决策 / Decision：**立即为所有操作系统和服务器安装关键安全补丁，并建立周期性补丁管理制度。/ Deploy critical security patches to all operating systems and servers immediately and enforce a regular patching schedule.

**目的 / Purpose：**修复系统漏洞，降低入侵或勒索软件攻击的风险。/ Address system vulnerabilities and reduce the risk of intrusion or ransomware attacks.

------

### 6. 组织学习与安全规划 / Organizational Learning and Security Planning

#### 6.1 单环学习与双环学习 / Single-Loop and Double-Loop Learning

**单环学习 / Single-Loop Learning**

单环学习根据行动产生的后果判断结果是否匹配预期，然后调整具体行动。/ Single-loop learning evaluates whether the consequences of an action match expectations and then adjusts the action.

> **行动 → 后果 → 匹配或不匹配 → 调整行动 / Action → Consequences → Match or Mismatch → Adjust Action**

**双环学习 / Double-Loop Learning**

双环学习不仅调整行动，还会质疑决定行动的治理变量，比较公开理论和实际使用中的理论，并建立新的治理变量。/ Double-loop learning not only adjusts actions but also questions the governing variables behind them, compares espoused theory with theory-in-use, and develops new governing variables.

> **质疑治理变量 → 发现公开理论与使用中理论 → 建立新的治理变量 / Question Governing Variables → Discover Espoused Theory and Theory-in-Use → Develop New Governing Variables**

#### 6.2 目标网络分析 / Objective Network Analysis

- 识别信息安全广泛的目标范围。/ Identify a broad range of information-security objectives.
- 将目标划分为基本目标和手段目标。/ Classify objectives as fundamental objectives and means objectives.
- 目标应结合具体环境进行定义，以便进行适当排序。/ Objectives should be context-specific so that they can be appropriately ranked.

#### 6.3 软系统方法论 / Soft Systems Methodology

软系统方法论（SSM）同时考虑理想情况和现实世界情况。/ Soft Systems Methodology (SSM) considers both ideal situations and real-world situations.

- **理想情况 / Ideal Situation：**使用系统思维建立概念模型。/ Use systems thinking to develop conceptual models.
- **现实世界情况 / Real-World Situation：**使用现实世界思维理解实际问题。/ Use real-world thinking to understand the actual problem situation.
- 将概念模型与现实问题进行比较。/ Compare conceptual models with the real-world problem situation.
- SSM 是一个迭代过程，不一定按照固定顺序进行。/ SSM is iterative and does not always proceed sequentially.

#### 6.4 安全规划过程 / Security Planning Process

- 系统地识别并解决各种绩效差距。/ Systematically identify and address different performance gaps.
- 在组织内部建立适当的安全流程。/ Build appropriate security processes into the organization.
- 让利益相关者参与规划，并了解他们的需求和期望。/ Involve stakeholders in planning and understand their needs and expectations.

------

### 7. 猎户座安全策略模型 / Orion Security Strategy Model

#### 7.1 模型背景 / Model Background

猎户座安全策略模型由 Helen Armstrong 基于软系统方法论开发。/ The Orion Security Strategy Model was developed by Helen Armstrong based on Soft Systems Methodology.

该模型具有以下特点：/ The model has the following characteristics:

- 让用户对自己工作范围内的信息安全承担责任。/ Encourages users to take responsibility for information security within their work areas.
- 为组织利用用户的实际知识提供机会。/ Provides opportunities for the organization to use employees’ practical knowledge.
- 提高同事对各种安全问题的认识。/ Increases awareness of different security issues among colleagues.
- 将信息安全融入组织成员的整体思维方式。/ Integrates information security into the organizational mindset.

#### 7.2 七个活动阶段 / Seven Activity Stages

1. **承认可能存在安全漏洞 / Acknowledge Possible Security Vulnerabilities：**认识到组织可能面临信息安全漏洞。/ Recognize that the organization may face information-security vulnerabilities.
2. **分析当前安全状况 / Analyze the Current Security Situation：**评估组织目前的安全环境。/ Assess the organization’s current security environment.
3. **分析信息与安全系统 / Analyze Information and Security Systems：**了解现有信息系统与安全控制。/ Understand existing information systems and security controls.
4. **建立理想的信息安全模型 / Model the Ideal Information Security Situation：**描述组织希望达到的安全状态。/ Describe the security state the organization wants to achieve.
5. **比较理想状态与当前状态 / Compare Ideal and Current Security：**识别两种状态之间的差距。/ Identify gaps between the ideal and current states.
6. **识别并分析弥补差距的措施 / Identify and Analyze Gap-Closing Measures：**评估可以解决安全差距的措施。/ Evaluate measures that can address the identified security gaps.
7. **建立并实施安全计划 / Establish and Implement the Security Plan：**制定行动方案并完成实施。/ Develop and implement an action plan.





## 第七周：信息安全标准 / Week 7: Information Security Standards

### 1. 信息安全标准概述 / Overview of Information Security Standards

#### 1.1 为什么需要标准 / Why Standards Are Needed

如果没有标准，我们将生活在一个混乱且缺乏一致性的世界中。/ Without standards, we would live in a chaotic world lacking consistency.

标准旨在回答一个基本问题：**完成某件事情的最佳方式是什么？/ What is the best way of doing this?**

采用标准可以带来以下价值：/ Adopting standards provides the following value:

- 改善风险管理。/ Improve risk management.
- 提高生产力。/ Improve productivity.
- 提供竞争优势。/ Provide a competitive advantage.
- 支持创新。/ Support innovation.
- 帮助组织满足法律和监管要求。/ Help organizations comply with legal and regulatory requirements.

标准广泛应用于交通、建筑、食品和汽车安全等领域。/ Standards are widely used in areas such as traffic, construction, food, and vehicle safety.

------

### 2. 系统安全工程能力成熟度模型 / System Security Engineering Capability Maturity Model

#### 2.1 SSE-CMM基本概念 / SSE-CMM Basic Concepts

**SSE-CMM（系统安全工程能力成熟度模型 / System Security Engineering Capability Maturity Model）**由软件工程研究所（SEI）开发。/ SSE-CMM was developed by the Software Engineering Institute (SEI).

该模型具有以下作用：/ The model serves the following purposes:

- 定义在系统中实施安全的要求。/ Define requirements for implementing security in systems.
- 说明实现 IT 安全所需要的过程。/ Describe the processes used to achieve IT security.
- 定义并评估安全工程过程的成熟度。/ Define and assess the maturity levels of security-engineering processes.

#### 2.2 SSE-CMM发展历史 / SSE-CMM Development History

- **1993年4月 / April 1993：**作为美国国家安全局资助的项目启动。/ Began as an effort sponsored by the National Security Agency.
- **1995年1月 / January 1995：**召开第一次公开的安全工程 CMM 研讨会。/ The first public Security Engineering CMM workshop was held.
- **1996年10月 / October 1996：**发布第一个版本。/ The first version was published.
- **2008年 / 2008：**被纳入 ISO/IEC 21827:2008。/ Incorporated into ISO/IEC 21827:2008.

#### 2.3 SSE-CMM的两个维度 / Two Dimensions of SSE-CMM

**领域 / Domain**

领域是共同定义组织安全工程的全部实践集合，主要由**基础实践（Base Practices）**组成。/ The domain dimension contains all practices that collectively define security engineering within an organization and mainly consists of **Base Practices**.

**能力 / Capability**

能力表示组织管理安全过程并将其制度化的程度，主要由**通用实践（Generic Practices）**组成。/ Capability represents the organization’s ability to manage and institutionalize security processes and mainly consists of **Generic Practices**.

#### 2.4 SSE-CMM架构 / SSE-CMM Architecture

SSE-CMM包含129项基础实践，并被组织到22个过程区域中。/ SSE-CMM contains 129 base practices organized into 22 process areas.

其中61项基础实践涵盖安全工程的主要方面，其余68项涉及项目和组织领域。/ Of these, 61 base practices cover the major aspects of security engineering, while the remaining 68 address project and organizational domains.

#### 2.5 安全工程过程区域示例 / Examples of Security Engineering Process Areas

- **管理安全控制 / Administer Security Controls：**确保安全控制得到正确配置和使用。/ Ensure that security controls are properly configured and used.
- **评估运营安全风险 / Assess Operational Security Risk：**理解系统在特定环境中运行时面临的安全风险。/ Understand the security risks associated with operating a system in a defined environment.
- **攻击安全 / Attack Security：**识别系统漏洞并确定这些漏洞被利用的可能性。/ Identify system vulnerabilities and determine their potential for exploitation.
- **构建保证论证 / Build Assurance Argument：**通过工作产品和过程提供证据，证明客户的安全需求已经得到满足。/ Use work products and processes to provide evidence that the customer’s security needs have been met.
- **协调安全 / Coordinate Security：**确保所有项目团队成员理解并参与安全工程活动。/ Ensure that all project-team members understand and participate in security-engineering activities.

#### 2.6 SSE-CMM能力级别 / SSE-CMM Capability Levels

**级别0：未执行 / Level 0: Not Performed**

组织不存在安全工程过程。/ The organization has no security-engineering processes.

**级别1：非正式执行 / Level 1: Performed Informally**

- 使用临时性的安全管理过程。/ Uses ad hoc security-management processes.
- 安全考虑未被纳入系统设计和开发实践。/ Security considerations are not incorporated into system design and development.
- 缺乏用于避免危机的应急计划。/ Lacks contingency plans for preventing or responding to crises.

**级别2：计划和跟踪 / Level 2: Planned and Tracked**

- 建立了明确的安全政策和程序。/ Defined security policies and procedures have been established.
- 不同项目遵循相同的安全程序。/ The same security procedures are followed across projects.
- 涵盖安全规划、安全风险分析和保证识别。/ Covers security planning, security-risk analysis, and assurance identification.

**级别3：良好定义 / Level 3: Well Defined**

- 建立了标准化的安全工程过程。/ Standardized security-engineering processes have been established.
- 确保过程在整个组织中得到整合并消除冗余。/ Ensures integration across the organization and eliminates redundancy.
- 相关过程区域包括综合安全工程、安全组织和安全协调。/ Relevant process areas include integrated security engineering, security organization, and security coordination.

**级别4：定量控制 / Level 4: Quantitatively Controlled**

- 管理层能够深入了解安全工程过程。/ Management gains insight into security-engineering processes.
- 能够为安全质量制定可衡量的目标。/ Measurable goals can be established for security quality.
- 对安全过程的测量数据进行检查和分析。/ Security-process measurements are examined and analyzed.

**级别5：持续改进 / Level 5: Continuously Improving**

- 安全工程实践达到理想状态。/ Security-engineering practices reach an ideal state.
- 组织持续开展过程改进。/ The organization continuously engages in process improvement.
- 利用反馈修改并进一步改进过程。/ Feedback is used to modify and further improve processes.

------

### 3. ISO/IEC 27000系列 / ISO/IEC 27000 Series

#### 3.1 基本概念 / Basic Concepts

ISO/IEC 27000系列是最常用的信息安全管理标准系列之一，由国际标准化组织（ISO）和国际电工委员会（IEC）共同制定。/ The ISO/IEC 27000 series is one of the most widely used families of information-security management standards and is jointly developed by ISO and IEC.

该系列提供了全面的信息安全控制和最佳实践。/ The series provides a comprehensive set of information-security controls and best practices.

它起源于英国标准协会、英国贸易与工业部以及商业计算机安全中心。/ It originated from the British Standards Institution, the UK Department of Trade and Industry, and the Commercial Computer Security Centre.

#### 3.2 ISO/IEC 27000系列的发展 / Development of the ISO/IEC 27000 Series

- **BS 7799:1995：**信息安全管理系统实践规范。/ Code of practice for information-security management systems.
- **BS 7799-2:1998：**信息安全管理系统规范。/ Specification for information-security management systems.
- **2000年12月 / December 2000：**发布 ISO/IEC 17799:2000。/ ISO/IEC 17799:2000 was published.
- **2006年 / 2006：**ISO/IEC 创建新的27000系列标准。/ ISO/IEC created the new 27000 series.

#### 3.3 ISO/IEC 27000系列的主要标准 / Key ISO/IEC 27000 Standards

- **ISO/IEC 27001:2022：**信息安全、网络安全和隐私保护——信息安全管理系统——要求。/ Information security, cybersecurity and privacy protection—Information security management systems—Requirements.
- **ISO/IEC 27002:2022：**信息安全、网络安全和隐私保护——信息安全控制。/ Information security, cybersecurity and privacy protection—Information security controls.
- **ISO/IEC 27003:2017：**信息技术——安全技术——信息安全管理系统——指导。/ Information technology—Security techniques—Information security management systems—Guidance.
- **ISO/IEC 27005:2021：**信息安全、网络安全和隐私保护——信息安全风险管理指导。/ Information security, cybersecurity and privacy protection—Guidance on managing information-security risks.

#### 3.4 ISO/IEC 27000系列的特点 / Characteristics of the ISO/IEC 27000 Series

- 这些标准被有意设计为具有灵活性的文件。/ These standards are intentionally designed to be flexible.
- 由于技术不断变化，标准通常不针对某项特定技术。/ Because technology continually changes, the standards generally do not prescribe a particular technology.
- 其真正目的在于识别并推广一套信息安全最佳实践。/ Their primary purpose is to identify and promote a set of information-security best practices.

------

### 4. 支付卡行业数据安全标准 / Payment Card Industry Data Security Standard

#### 4.1 PCI DSS基本概念 / PCI DSS Basic Concepts

**PCI DSS（支付卡行业数据安全标准 / Payment Card Industry Data Security Standard）**适用于所有存储、处理或传输持卡人数据的实体。/ PCI DSS applies to every entity that stores, processes, or transmits cardholder data.

它是一项包含安全管理、政策和程序要求的安全标准，主要用于保护账户数据。/ It is a security standard containing requirements for security management, policies, and procedures and primarily focuses on protecting account data.

#### 4.2 PCI DSS的目标与适用范围 / PCI DSS Objectives and Scope

- 促进全球一致的数据安全措施得到广泛采用。/ Facilitate the broad adoption of consistent data-security measures worldwide.
- 定义支付卡数据安全的基本要求。/ Define the foundations of payment-card data security.
- 适用于网络、服务器和应用程序等所有系统组件。/ Apply to all system components, including networks, servers, and applications.
- 覆盖被外包的相关服务。/ Cover relevant outsourced services.
- 为组织提供自我评估问卷。/ Provide organizations with a self-assessment questionnaire.

#### 4.3 PCI DSS的数据保护范围 / PCI DSS Data-Protection Scope

- **主账号 / Primary Account Number（PAN）**
- **持卡人姓名 / Cardholder Name**
- **到期日期 / Expiration Date**
- **服务代码 / Service Code**

#### 4.4 例题：数字卡支付系统采用PCI DSS / Example: Applying PCI DSS to a Digital Card-Payment System

**选定标准 / Selected Standard：PCI DSS v4.0**

**采用理由 / Justification**

- 所有受理银行卡的终端都被要求符合 PCI DSS。/ All card-accepting terminals are required to comply with PCI DSS.
- PCI DSS 提供覆盖加密、身份验证和渗透测试等方面的端到端技术控制。/ PCI DSS provides comprehensive end-to-end technical controls covering encryption, authentication, penetration testing, and related areas.
- PCI DSS 中的加密和访问控制要求可以与《澳大利亚隐私法》的安全要求相互映射。/ PCI DSS encryption and access-control requirements can be mapped to the security requirements of the Australian Privacy Act.

**系统需求 / System Need**

数字卡支付系统需要在开放网络、多品牌设备和高通勤量环境中，确保交易的机密性、完整性和可审计性。/ A digital card-payment system must ensure transaction confidentiality, integrity, and auditability in an open-network, multi-brand, and high-throughput environment.

开放的 NFC 支付环境需要一套全面、统一且可审计的安全基线，因为完全定制的安全控制容易出现错误。/ An open NFC payment environment requires a comprehensive, consistent, and auditable security baseline because bespoke security controls are prone to errors.

**收益1：提高互操作性并降低集成成本 / Benefit 1: Greater Interoperability and Lower Integration Costs**

符合 PCI DSS 的令牌化和 TLS 加密可以使闸机接受不同银行的钱包，而不需要为每个发卡机构开发单独接口。/ PCI DSS-compliant tokenization and TLS encryption allow payment gates to accept wallets from different banks without requiring a separate interface for every issuer.

**收益2：降低合规与安全事件成本 / Benefit 2: Reduced Compliance and Incident Costs**

PCI认证可以证明组织遵循了行业最佳实践，从而降低监管处罚风险。/ PCI certification demonstrates that an organization follows industry best practices, reducing the risk of regulatory penalties.

认证也有助于组织购买网络安全保险，降低数据泄露后的赔偿和诉讼费用。/ Certification may also make it easier to obtain cyber insurance and reduce compensation and litigation costs following a data breach.

------

### 5. COBIT治理与管理框架 / COBIT Governance and Management Framework

#### 5.1 COBIT基本概念 / COBIT Basic Concepts

**COBIT（信息和相关技术控制目标 / Control Objectives for Information and Related Technology）**是一套 IT 治理与管理框架。/ COBIT is a framework for the governance and management of information and technology.

COBIT 2019关注**信息与技术的企业治理（Enterprise Governance of Information and Technology, EGIT）**，适用于日益数字化的组织。/ COBIT 2019 focuses on **Enterprise Governance of Information and Technology (EGIT)** and is designed for increasingly digital organizations.

其主要目的是协调业务与 IT。/ Its primary objective is to align business and IT.

#### 5.2 EGIT的三个目标 / Three EGIT Objectives

- **效益实现 / Benefit Realization**
- **风险优化 / Risk Optimization**
- **资源优化 / Resource Optimization**

#### 5.3 治理与管理的区别 / Difference Between Governance and Management

**治理 / Governance**

- 评估利益相关者的需求并确定企业目标。/ Evaluate stakeholder needs and determine enterprise objectives.
- 通过确定优先级和制定决策来设定方向。/ Set direction through prioritization and decision-making.
- 监控组织绩效和合规情况。/ Monitor organizational performance and compliance.

**管理 / Management**

管理负责计划、构建、运行和监控各种活动，以实现企业已经确定的目标。/ Management plans, builds, runs, and monitors activities to achieve established enterprise objectives.

#### 5.4 COBIT的五个领域 / Five COBIT Domains

- **评估、指导和监控 / Evaluate, Direct and Monitor（EDM）：**主要包含治理目标。/ Primarily contains governance objectives.
- **协调、计划和组织 / Align, Plan and Organize（APO）：**包含管理目标。/ Contains management objectives.
- **构建、获取和实施 / Build, Acquire and Implement（BAI）：**包含管理目标。/ Contains management objectives.
- **交付、服务和支持 / Deliver, Service and Support（DSS）：**包含管理目标。/ Contains management objectives.
- **监控、评估和评价 / Monitor, Evaluate and Assess（MEA）：**包含管理目标。/ Contains management objectives.

#### 5.5 COBIT不是什么 / What COBIT Is Not

- 不是对组织整个 IT 环境的完整描述。/ It is not a complete description of an organization’s IT environment.
- 不是用于组织所有业务流程的框架。/ It is not a framework for organizing all business processes.
- 不是用于管理具体技术的技术框架。/ It is not a technical framework for managing particular technologies.
- 不规定具体的 IT 架构或成本效益矩阵。/ It does not prescribe a specific IT architecture or cost-benefit matrix.

------

### 6. SABSA企业安全架构 / SABSA Enterprise Security Architecture

#### 6.1 SABSA基本概念 / SABSA Basic Concepts

**SABSA（Sherwood应用商业安全架构 / Sherwood Applied Business Security Architecture）**是一套企业安全架构和安全服务管理框架与方法论。/ SABSA is a framework and methodology for enterprise security architecture and security-service management.

它能够满足风险管理、信息保证、治理和连续性管理等多种企业需求。/ It supports a wide range of enterprise needs, including risk management, information assurance, governance, and continuity management.

#### 6.2 SABSA的特点 / SABSA Characteristics

- 是一种可以开放使用的方法论。/ It is an open-use methodology.
- 用于开发风险驱动的企业信息安全架构。/ It is used to develop risk-driven enterprise information-security architectures.
- 所有安全设计都必须来源于对业务安全需求的分析。/ All security designs must be derived from an analysis of business security requirements.

#### 6.3 SABSA六层视图模型 / SABSA Six-Layer View Model

1. **业务视图 / Business View**
2. **架构师视图 / Architect’s View**
3. **设计师视图 / Designer’s View**
4. **构建者视图 / Builder’s View**
5. **技工视图 / Tradesman’s View**
6. **设施经理视图 / Facilities Manager’s View**

#### 6.4 SABSA矩阵的六个问题 / Six Questions of the SABSA Matrix

- **什么 / What：**你在这一层尝试完成什么？/ What are you trying to achieve at this layer?
- **为什么 / Why：**为什么要这样做？/ Why are you doing it?
- **如何 / How：**准备如何实现？/ How are you trying to achieve it?
- **谁 / Who：**谁参与其中？/ Who is involved?
- **哪里 / Where：**在哪里实施？/ Where are you doing it?
- **何时 / When：**何时实施？/ When are you doing it?

#### 6.5 SABSA开发过程 / SABSA Development Process

SABSA开发过程包括：/ The SABSA development process includes:

- SABSA生命周期。/ SABSA lifecycle.
- 安全服务管理框架。/ Security Services Management Framework.
- 策略与规划。/ Strategy and planning.
- 设计与规范。/ Design and specification.
- 实施与创建。/ Implementation and creation.
- 测量与维护。/ Measurement and maintenance.

#### 6.6 SABSA的主要优势 / Key SABSA Benefits

- 避免重复设计已经存在的解决方案。/ Avoid reinventing the wheel.
- 减少对少数技术专家的依赖。/ Reduce dependence on technology experts.
- 提高合理使用经验较少员工的可能性。/ Increase the potential to use less-experienced staff appropriately.
- 更容易利用外部专业支持。/ Make it easier to use external professional assistance.

------

### 7. 标准采用、其他标准与总结 / Standards Adoption, Other Standards, and Summary

#### 7.1 采用标准的操作效益 / Operational Benefits of Standards Adoption

- 避免“重新发明轮子”。/ Avoid reinventing the wheel.
- 减少对技术专家的依赖。/ Reduce dependence on technology experts.
- 在经过适当培训的情况下，更充分地利用经验较少的员工。/ Make better use of less-experienced employees when they are properly trained.
- 更容易获得和利用外部支持。/ Make external assistance easier to obtain and use.

#### 7.2 质量与风险效益 / Quality and Risk Benefits

- 降低风险和错误。/ Reduce risks and errors.
- 提高工作与控制质量。/ Improve the quality of work and controls.
- 提高组织管理和监控安全活动的能力。/ Improve the organization’s ability to manage and monitor security activities.
- 通过提高标准化程度降低成本。/ Reduce costs through increased standardization.

#### 7.3 业务效益 / Business Benefits

- 提高管理层与合作伙伴的信任和信心。/ Improve trust and confidence among management and business partners.
- 帮助组织符合法律和监管要求。/ Help the organization comply with legal and regulatory requirements.
- 支持外部审计和审查。/ Support external audits and reviews.
- 保护组织价值并证明技术投资的价值。/ Safeguard organizational value and demonstrate the value of technology investments.
- 实现对 IT 活动的有效治理。/ Enable effective governance of IT activities.

#### 7.4 其他重要标准与指南 / Other Important Standards and Guidelines

**NIST安全文档 / NIST Security Documents**

- **SP 800-12：**计算机安全手册。/ Computer Security Handbook.
- **SP 800-14：**普遍接受的安全原则与实践。/ Generally Accepted Security Principles and Practices.
- **SP 800-16：**信息技术安全培训要求。/ Information Technology Security Training Requirements.
- **SP 800-18：**制定安全计划指南。/ Guide for Developing Security Plans.
- **SP 800-26：**信息技术系统安全自我评估指南。/ Security Self-Assessment Guide for Information Technology Systems.
- **SP 800-30：**信息技术系统风险管理指南。/ Risk Management Guide for Information Technology Systems.
- **SP 800-34：**信息技术系统应急计划指南。/ Contingency Planning Guide for Information Technology Systems.
- **SP 800-41：**防火墙和防火墙政策指南。/ Guidelines on Firewalls and Firewall Policy.

#### 7.5 主要标准的定位 / Positioning of Major Standards

- **SSE-CMM：**关注安全工程过程的成熟度。/ Focuses on the maturity of security-engineering processes.
- **ISO/IEC 27000系列：**提供全面的信息安全管理最佳实践。/ Provides comprehensive best practices for information-security management.
- **PCI DSS：**专门保护支付卡和持卡人数据。/ Specifically protects payment-card and cardholder data.
- **COBIT：**提供 IT 治理和管理框架。/ Provides an IT governance and management framework.
- **SABSA：**提供企业安全架构方法论。/ Provides an enterprise security-architecture methodology.

#### 7.6 标准应用示例 / Examples of Standards Application

**AS/NZS ISO 31000:2018**

该标准提供风险识别、评估和缓解框架，可以在早期识别并控制较小的软件风险，避免其演变为信息泄露。/ ISO 31000 provides a framework for risk identification, assessment, and treatment, helping organizations control small software risks before they escalate into data breaches.

**PCI DSS**

PCI DSS要求组织配置并维护防火墙以保护持卡人数据，从而减少因错误配置而遭受恶意软件入侵的风险。/ PCI DSS requires organizations to configure and maintain firewalls to protect cardholder data, reducing the risk of malware intrusion caused by misconfiguration.

**COBIT**

COBIT强调 IT 治理和管理流程，可以指导高层管理者持续监督并完成安全改进。/ COBIT emphasizes IT governance and management processes and can guide executives in continuously supervising and completing security improvements.

#### 7.7 实施注意事项 / Implementation Considerations

- 标准应被视为指导，而不是在所有情况下都必须机械执行的严格规则。/ Standards should be treated as guidance rather than rigid rules that must be mechanically applied in every situation.
- 组织需要根据自身环境和需求调整标准。/ Organizations need to tailor standards to their particular environments and requirements.
- 不同标准适用于不同的组织需求和应用环境。/ Different standards are suitable for different organizational needs and operating environments.
- 持续改进是所有信息安全标准的共同主题。/ Continuous improvement is a common theme across information-security standards.



## 第八周：信息安全风险管理 / Week 8: Information Security Risk Management

### 1. 风险管理的基本概念 / Fundamental Concepts of Risk Management

**风险 / Risk**

风险可以定义为“涉及危险暴露的情况”，也可以定义为“可能发生并对目标产生影响的事件的机会”。/ Risk can be defined as “a situation involving exposure to danger” or “the chance of something happening that will have an impact on objectives.”

AS/NZS ISO 31000 将风险定义为：**不确定性对目标的影响。/ The effect of uncertainty on objectives.**

风险通常通过事件或情况及其可能造成的后果进行描述，并由后果与可能性的组合衡量。风险既可能产生负面影响，也可能带来正面机会。/ Risk is usually described in terms of an event or circumstance and its possible consequences and is measured through a combination of consequence and likelihood. Risk may have either negative or positive effects.

- **事件 / Event：**某种特定情况的发生或变化。/ The occurrence or change of a particular set of circumstances.
- **后果 / Consequence：**事件对目标产生的结果。/ The outcome of an event that affects objectives.
- **可能性 / Likelihood：**某件事情发生的机会。/ The chance of something happening.

**漏洞 / Vulnerability**

漏洞是“可被一个或多个威胁利用的资产或资产组的弱点”。/ A vulnerability is a “weakness of an asset or group of assets that can be exploited by one or more threats.” [ISO/IEC 13335-1:2004]

漏洞也是“产品中可能允许攻击者破坏其完整性、可用性或机密性的弱点”。/ A vulnerability is also a “weakness in a product that could allow an attacker to compromise its integrity, availability, or confidentiality.” [Microsoft]

漏洞可能存在于硬件、软件和数据中。/ Vulnerabilities may exist in hardware, software, and data.

**威胁 / Threat**

威胁是“有可能造成损失或伤害的一系列情况”。/ A threat is a “set of circumstances that has the potential to cause loss or harm.” [Charles & Shari Pfleeger]

威胁也可以定义为“可能导致系统或组织受到伤害的不良事件的潜在原因”。/ A threat may also be defined as a “potential cause of an unwanted incident that may result in harm to a system or organization.” [ISO/IEC 13335-1:2004]

**风险管理相关术语 / Risk Management Terminology**

- **风险分析 / Risk Analysis：**理解风险性质并推断风险水平的系统过程。/ A systematic process for understanding the nature of risk and determining its level.
- **风险标准 / Risk Criteria：**用于评估风险重要性的参考条件。/ Terms of reference against which the significance of risk is assessed.
- **风险评估 / Risk Assessment：**包括风险识别、风险分析和风险评价的整体过程。/ The overall process of risk identification, risk analysis, and risk evaluation.
- **风险管理 / Risk Management：**在管理不利影响的同时实现潜在机会的文化、过程和结构。/ The culture, processes, and structures directed toward realizing potential opportunities while managing adverse effects.

**风险管理的目标 / Risk Management Objectives**

- 为决策和规划提供更加可靠、严格的基础。/ Provide a more confident and rigorous basis for decision-making and planning.
- 更好地识别机会和威胁。/ Improve the identification of opportunities and threats.
- 从不确定性和变化中获得价值。/ Gain value from uncertainty and variability.
- 实现主动管理，而不是被动响应。/ Enable proactive rather than reactive management.
- 更有效地分配和使用资源。/ Improve the allocation and use of resources.
- 改善事件管理并减少损失。/ Improve incident management and reduce losses.
- 降低风险成本，包括商业保险费用。/ Reduce the cost of risk, including commercial insurance premiums.
- 提高利益相关者的信心和信任。/ Improve stakeholder confidence and trust.
- 改善法律法规合规性。/ Improve compliance with relevant legislation.
- 改善企业治理。/ Improve corporate governance.

------

### 2. ISO 31000风险管理体系 / ISO 31000 Risk Management System

AS/NZS ISO 31000是一套通用风险管理指南，适用于公共部门、私人企业、政府、社区组织、团体和个人。/ AS/NZS ISO 31000 is a generic risk-management guide applicable to public organizations, private enterprises, governments, community organizations, groups, and individuals.

它可以应用于活动、职能、项目、产品或资产，并规定风险管理过程的主要组成部分。/ It can be applied to an activity, function, project, product, or asset and specifies the main elements of the risk-management process.

其基本思路是：首先识别事件、漏洞和威胁来源，然后评估后果与可能性，最后提出控制措施以降低残余风险。/ Its basic approach is to identify events, vulnerabilities, and threat sources, assess their consequences and likelihood, and propose controls to reduce residual risk.

ISO 31000包含三个核心组成部分：**原则（Principles）**、**框架（Framework）\**和\**过程（Process）**。/ ISO 31000 contains three core components: **Principles**, **Framework**, and **Process**.

**风险管理原则 / Risk Management Principles**

风险管理应当：/ Risk management should:

- 创造和保护价值。/ Create and protect value.
- 成为所有组织过程的组成部分。/ Be an integral part of all organizational processes.
- 成为决策过程的一部分。/ Be part of decision-making.
- 明确处理不确定性。/ Explicitly address uncertainty.
- 保持系统化、结构化和及时性。/ Be systematic, structured, and timely.
- 以最佳可用信息为基础。/ Be based on the best available information.
- 根据组织实际情况进行定制。/ Be tailored to the organization.
- 考虑人为和文化因素。/ Consider human and cultural factors.
- 保持透明和包容。/ Be transparent and inclusive.
- 保持动态、迭代并响应变化。/ Be dynamic, iterative, and responsive to change.
- 促进组织持续改进。/ Facilitate continual organizational improvement.

**风险管理框架 / Risk Management Framework**

管理层的授权和承诺包括：/ Management mandate and commitment include:

- 定义并认可风险管理政策。/ Define and endorse the risk-management policy.
- 确保组织文化与风险管理政策保持一致。/ Align organizational culture with the risk-management policy.
- 建立与组织绩效指标一致的风险管理 KPI。/ Establish risk-management KPIs aligned with organizational performance KPIs.
- 使风险管理与组织战略保持一致。/ Align risk management with organizational strategy.
- 确保符合法律和监管要求。/ Ensure legal and regulatory compliance.
- 分配责任和问责。/ Assign responsibilities and accountabilities.
- 确保提供必要资源。/ Ensure appropriate resource allocation.
- 向利益相关者说明风险管理的价值。/ Communicate the benefits of risk management to stakeholders.
- 持续维护风险管理框架的适用性。/ Maintain the continuing appropriateness of the framework.

**风险管理过程 / Risk Management Process**

1. 沟通和咨询。/ Communicate and consult.
2. 建立背景。/ Establish the context.
3. 识别风险。/ Identify risks.
4. 分析风险。/ Analyze risks.
5. 评价风险。/ Evaluate risks.
6. 处理风险。/ Treat risks.
7. 监控和审查。/ Monitor and review.

**建立外部背景 / Establishing the External Context**

- 商业、社会、监管、文化、竞争、金融和政治环境。/ The business, social, regulatory, cultural, competitive, financial, and political environment.
- 组织的优势、劣势、机会和威胁。/ The organization’s strengths, weaknesses, opportunities, and threats.
- 外部利益相关者。/ External stakeholders.
- 关键业务驱动因素。/ Key business drivers.
- 外部利益相关者的目标。/ Objectives of external stakeholders.
- 外部威胁和机会。/ External threats and opportunities.

**建立内部背景 / Establishing the Internal Context**

- 组织文化、结构、能力、人员、系统和流程。/ Organizational culture, structure, capabilities, people, systems, and processes.
- 组织目标以及用于实现目标的策略。/ Organizational objectives and strategies for achieving them.
- 内部利益相关者。/ Internal stakeholders.
- 风险管理必须在组织目标的背景下进行。/ Risk management must occur within the context of organizational objectives.

**确定风险管理背景 / Defining the Risk Management Context**

- 定义组织、流程、项目或活动及其目标。/ Define the organization, process, project, or activity and its objectives.
- 明确需要作出的决策类型。/ Specify the nature of the decisions that must be made.
- 从时间和位置方面确定项目、活动或职能的范围。/ Define the scope of the project, activity, or function in terms of time and location.
- 确定风险管理活动的深度和广度。/ Define the depth and breadth of risk-management activities.
- 明确包含和排除的内容。/ Specify inclusions and exclusions.
- 明确各部门的角色与责任。/ Define the roles and responsibilities of different organizational units.
- 明确项目或活动与其他项目及组织部门之间的关系。/ Define relationships between the project or activity and other projects or organizational units.

**制定风险标准 / Developing Risk Criteria**

风险标准可以从运营、技术、财务、法律、社会、环境和人道主义等角度制定。/ Risk criteria may be developed from operational, technical, financial, legal, social, environmental, and humanitarian perspectives.

风险标准应反映组织已经确定的背景，并考虑利益相关者的看法以及法律和监管要求。/ Risk criteria should reflect the defined context and consider stakeholder perceptions and legal or regulatory requirements.

风险标准还应根据风险类型和所使用的分析技术进行选择或调整。/ Risk criteria should also be selected or adjusted to suit the risks and analytical techniques being used.

------

### 3. 风险识别、分析与评价 / Risk Identification, Analysis, and Evaluation

**识别风险 / Identify Risks**

全面识别风险非常重要，无论这些风险是否处于组织的直接控制范围内。/ Comprehensive risk identification is essential, regardless of whether the risks are under the organization’s direct control.

风险识别需要回答以下问题：/ Risk identification should answer the following questions:

- 什么事情可能发生？/ What might happen?
- 何时以及在哪里发生？/ When and where might it happen?
- 为什么会发生？/ Why might it happen?
- 如何发生？/ How might it happen?
- 可能的原因和情景是什么？/ What are the possible causes and scenarios?

**风险识别工具 / Risk Identification Tools**

- 本地或海外经验。/ Local or overseas experience.
- 专家判断。/ Expert judgment.
- 结构化访谈。/ Structured interviews.
- 焦点小组讨论。/ Focus-group discussions.
- SWOT分析。/ SWOT analysis.
- 保险理赔报告。/ Insurance-claim reports.
- 事件后报告。/ Post-event reports.
- 个人经验或组织过去的经验。/ Personal experience or previous organizational experience.
- 审计、检查和现场访问的结果。/ Results from audits, inspections, and site visits.
- 调查、问卷和检查清单。/ Surveys, questionnaires, and checklists.
- 历史记录、事件数据库和故障分析。/ Historical records, incident databases, and failure analysis.

**例题一：数字卡支付风险 / Example 1: Digital Card-Payment Risks**

**风险1：设备失窃或恶意软件导致数字卡被盗用 / Risk 1: Stolen Device or Malware Enables Digital-Card Misuse**

- **主要弱点 / Weakness：**钱包应用仅使用单因素身份验证。/ The wallet application uses only single-factor authentication.
- **后果 / Impact：**盗刷和个人数据泄露。/ Fraudulent transactions and personal-data leakage.
- **关键控制 / Control：**启用指纹或人脸识别与 PIN 组合的多因素身份验证。/ Use biometric authentication combined with a PIN as MFA.

**风险2：NFC交易被窃听 / Risk 2: Eavesdropping on NFC Transactions**

- **主要弱点 / Weakness：**无线通信缺少强加密。/ The wireless session lacks strong encryption.
- **后果 / Impact：**卡片克隆和未经授权的支付。/ Card cloning and unauthorized payments.
- **关键控制 / Control：**采用动态密钥交换和端到端 TLS。/ Use dynamic key exchange and end-to-end TLS.

**例题二：企业IT风险 / Example 2: Enterprise IT Risks**

**风险1：硬件过时并缺乏补丁 / Risk 1: Legacy Hardware and Missing Patches**

大量老旧服务器已经不再获得厂商支持，并且除防病毒软件外很少安装安全补丁，因此容易遭到漏洞利用、系统入侵或数据泄露。/ A large fleet of legacy servers is no longer supported by vendors and is rarely patched apart from antivirus updates, exposing the network to exploitation, system compromise, and data breaches.

**风险2：账号数量失控 / Risk 2: Uncontrolled Account Growth**

组织只有324名员工，却存在650个活跃账号，说明可能存在僵尸账号或权限过高的账号。这些账号可能被内部人员或外部攻击者用于权限提升。/ The organization has only 324 employees but 650 active accounts, indicating possible orphaned or over-privileged accounts that may be abused by insiders or external attackers for privilege escalation.

**风险分析 / Analyze Risks**

风险分析的目标包括：/ The goals of risk analysis include:

- 获取有关风险后果和可能性的更多信息。/ Obtain more information about risk consequences and likelihood.
- 更好地理解风险及其原因，以制定处理计划。/ Better understand the risk and its causes in order to develop treatment plans.
- 理解实施控制后仍然存在的残余风险。/ Understand the residual risk remaining after controls are implemented.
- 列出针对已识别风险的现有控制措施。/ Identify existing controls for the recognized risks.

风险可以表示为后果和可能性的函数：/ Risk may be expressed as a function of consequence and likelihood:

$$\text{风险}=f(\text{后果},\text{可能性})\qquad \text{Risk}=f(\text{Consequence},\text{Likelihood})$$

考虑不同后果具有不同权重时：/ When different consequences have different weightings:

$$\text{风险}=f[(\text{后果}\times\text{权重}),\text{可能性}]\qquad \text{Risk}=f[(\text{Consequence}\times\text{Weighting}),\text{Likelihood}]$$

风险分析可以分为**定性分析（Qualitative Analysis）**、**定量分析（Quantitative Analysis）\**和\**半定量分析（Semi-quantitative Analysis）**。/ Risk analysis may be qualitative, quantitative, or semi-quantitative.

**后果评估 / Consequence Assessment**

后果可以使用财务、技术或人员影响等标准进行表达。/ Consequences may be expressed using financial, technical, or human-impact criteria.

后果等级通常包括：**无关紧要、轻微、中等、重大和灾难性。/ Insignificant, Minor, Moderate, Major, and Catastrophic.**

**可能性评估 / Likelihood Assessment**

可能性取决于：/ Likelihood depends on:

- 威胁来源、动机和能力。/ The threat source, motivation, and capability.
- 漏洞的性质。/ The nature of the vulnerability.
- 当前控制措施的有效性。/ The effectiveness of current controls.

可能性可以表示为“可能、或许、不可能”，也可以使用“几乎确定、可能、不太可能、罕见、非常罕见、几乎不可信”等等级。/ Likelihood may be expressed as probable, possible, or improbable, or through levels such as almost certain, likely, unlikely, rare, very rare, and almost incredible.

**定性风险矩阵 / Qualitative Risk Matrix**

| 可能性 / Likelihood       | 无关紧要 / Insignificant | 轻微 / Minor  | 中等 / Moderate | 重大 / Major   | 灾难性 / Catastrophic |
| ------------------------- | ------------------------ | ------------- | --------------- | -------------- | --------------------- |
| 几乎确定 / Almost Certain | 高 / High                | 高 / High     | 极端 / Extreme  | 极端 / Extreme | 极端 / Extreme        |
| 可能 / Likely             | 中 / Moderate            | 高 / High     | 高 / High       | 极端 / Extreme | 极端 / Extreme        |
| 中等 / Moderate           | 低 / Low                 | 中 / Moderate | 高 / High       | 极端 / Extreme | 极端 / Extreme        |
| 不太可能 / Unlikely       | 低 / Low                 | 低 / Low      | 中 / Moderate   | 高 / High      | 极端 / Extreme        |
| 罕见 / Rare               | 低 / Low                 | 低 / Low      | 中 / Moderate   | 高 / High      | 高 / High             |

风险管理方法也可以用于机会分析，即评估正面后果发生的可能性。/ Risk-management methods may also be applied to opportunity analysis by considering the likelihood of positive consequences.

**评价风险 / Evaluate Risks**

- 将分析得到的风险水平与既定风险标准进行比较。/ Compare the analyzed risk level with established risk criteria.
- 根据风险分析结果作出决策。/ Make decisions based on the outcome of risk analysis.
- 确定风险是否需要处理。/ Determine whether the risk requires treatment.
- 确定相关活动是否应该继续进行。/ Determine whether the relevant activity should proceed.
- 确定不同风险的处理优先级。/ Determine priorities for risk treatment.

------

### 4. 风险处理、沟通与持续监控 / Risk Treatment, Communication, and Continuous Monitoring

**风险处理选项 / Risk Treatment Options**

- 避免风险。/ Avoid the risk.
- 改变风险发生的可能性。/ Change the likelihood of the risk.
- 改变风险后果。/ Change the consequences of the risk.
- 与第三方分担或转移风险。/ Share or transfer the risk to a third party.

选择处理方案时，需要考虑成本效益、保险等风险融资方式、法律与社会责任、利益相关者的价值观和看法。风险处理措施本身也可能引入新的风险。/ When selecting a treatment option, the organization should consider cost-benefit analysis, risk financing such as insurance, legal and social responsibilities, and stakeholder values and perceptions. Risk treatment may itself introduce new risks.

**风险规避 / Risk Avoidance**

风险规避是通过取消或改变业务活动，彻底消除特定风险。/ Risk avoidance eliminates a specific risk by cancelling or changing the relevant business activity.

在数字 Opal 卡场景中，运营方可以不推出自己的数字钱包，只允许旅客使用银行信用卡或 Apple Pay。这样运营方无需存储持卡人数据，可以消除因本地存储和应用漏洞造成的数据泄露风险。/ In the digital Opal scenario, the transport authority could avoid launching its own wallet and accept only bank cards or Apple Pay. It would not store cardholder data, eliminating breach risks associated with local storage and application vulnerabilities.

- **优点 / Advantage：**风险接近于零。/ The relevant risk is reduced to almost zero.
- **缺点 / Disadvantage：**失去数字卡带来的品牌黏性、数据分析能力、用户体验优势和后续增值服务。/ The organization loses brand loyalty, data analytics, user-experience benefits, and future value-added services.

**降低风险发生概率 / Changing the Likelihood of Risk**

通过加强控制或改善流程，降低威胁成功利用漏洞的机会。/ Reduce the probability of a threat exploiting a vulnerability by strengthening controls or improving processes.

数字 Opal 卡可以部署设备指纹和行为分析，实时发现异常设备或可疑刷卡行为并阻止欺诈交易。/ The digital Opal system may use device fingerprinting and behavioral analytics to detect suspicious devices or tap-and-pay activity and block fraudulent transactions.

组织还可以定期对移动应用实施渗透测试并及时安装安全补丁，减少恶意软件利用漏洞的机会。/ The organization may also conduct regular penetration testing and timely patching of the mobile application to reduce opportunities for malware exploitation.

- **优点 / Advantage：**在不取消系统功能的情况下显著降低事件发生概率。/ Significantly lowers incident likelihood without removing system functionality.
- **缺点 / Disadvantage：**实施和维护成本较高，需要持续监控与更新。/ Requires higher implementation and maintenance costs and continuous monitoring.

**降低后果严重程度 / Changing the Consequences**

组织承认风险可能发生，但通过冗余设计和缓解措施将负面影响控制在可接受范围。/ The organization accepts that a risk may occur but uses redundancy and mitigation measures to keep its negative impact within tolerable limits.

- 为单笔或每日累计交易设置限额，例如 AU\$30，即使凭据被盗，损失也比较有限。/ Set single-transaction or daily spending limits, such as AU\$30, so stolen credentials cause only limited financial loss.
- 将敏感信息分散存储在彼此隔离的系统中，使攻击者无法通过攻破单个系统获得完整信息。/ Separate sensitive information across isolated systems so that compromising one system does not expose all information.
- **优点 / Advantage：**即使攻击成功，损害仍处于可控范围。/ Even if an attack succeeds, the damage remains controlled.
- **缺点 / Disadvantage：**残余影响仍然存在，组织仍需要事件响应和补偿机制。/ Residual impact remains, so incident-response and compensation mechanisms are still necessary.

**风险分担或转移 / Risk Sharing or Transfer**

风险分担是将部分或全部财务后果转移给合作伙伴、保险公司或外包服务商。/ Risk sharing transfers part or all of the financial consequences to a partner, insurer, or outsourced service provider.

数字 Opal 系统可以使用 Visa Token Service 处理令牌化、风险控制和欺诈责任，也可以购买网络安全保险以承担部分泄露响应和赔偿费用。/ The digital Opal system may use Visa Token Service to handle tokenization, risk controls, and fraud liability and may purchase cyber insurance to cover part of the breach-response and compensation costs.

- **优点 / Advantage：**保留数字卡的创新和体验优势，同时限制重大财务损失。/ Retains the innovation and user-experience benefits of the digital card while limiting major financial losses.
- **缺点 / Disadvantage：**声誉损失和监管罚款可能仍由运营方承担，同时还会产生保险费和合同成本。/ Reputational damage and regulatory penalties may remain with the authority, while insurance premiums and contractual costs are added.

**沟通与咨询 / Communication and Consultation**

沟通与咨询应贯穿风险管理过程的每一个步骤。/ Communication and consultation should occur throughout every stage of the risk-management process.

- 与内部和外部利益相关者保持对话。/ Maintain dialogue with internal and external stakeholders.
- 帮助组织确定风险背景。/ Help define the risk context.
- 确保不同观点都得到考虑。/ Ensure that different viewpoints are considered.
- 明确已识别风险的责任归属。/ Establish ownership of identified risks.
- 确保决策依据得到理解和接受。/ Ensure that the basis for decisions is understood and accepted.
- 建立利益相关者的信任。/ Build stakeholder trust.
- 制定正式的沟通计划。/ Develop a formal communication plan.

**监控与审查 / Monitoring and Review**

监控和审查同样贯穿风险管理全过程。/ Monitoring and review also apply throughout the entire risk-management process.

不断变化的环境可能改变风险、背景、可能性和后果，因此风险管理必须持续更新。/ A changing environment may alter risks, context, likelihood, and consequences, so risk management must be continuously updated.

监控和审查还可以促进经验教训的记录，而记录整个风险管理过程也是良好治理的重要实践。/ Monitoring and review also facilitate the documentation of lessons learned, while recording the complete risk-management process is an important governance practice.

**例题：企业风险管理流程 / Example: Enterprise Risk-Management Process**

1. **建立背景 / Establish the Context：**明确业务目标、老旧硬件、650个活跃账号等 IT 资产现状及监管要求。/ Define business objectives, the current IT environment such as legacy hardware and 650 active accounts, and regulatory requirements.
2. **沟通与咨询 / Communicate and Consult：**与管理层、IT运维和审计团队沟通期望及风险容忍度。/ Consult executives, IT operations, and audit teams regarding expectations and risk tolerance.
3. **识别风险 / Identify Risks：**识别硬件过时、补丁缺失、账号膨胀和备份未验证等问题。/ Identify risks such as outdated hardware, missing patches, excessive accounts, and untested backups.
4. **分析风险 / Analyze Risks：**估算每项风险的可能性及其数据泄露、停机和合规罚款等影响。/ Estimate the likelihood and potential impacts of each risk, including data breaches, downtime, and compliance penalties.
5. **评价风险 / Evaluate Risks：**与组织的风险标准比较，并划分高、中、低优先级。/ Compare the results with organizational risk criteria and assign high, medium, or low priorities.
6. **处理风险 / Treat Risks：**选择避免、降低、转移或接受风险，例如安装补丁、清理账号或购买支持合同。/ Avoid, reduce, transfer, or accept risks through measures such as patching servers, removing unnecessary accounts, or purchasing support contracts.
7. **实施并记录 / Implement and Record：**编写风险处置计划，指定负责人和期限，并保留审计文档。/ Document the treatment plan, assign owners and deadlines, and retain records for auditing.
8. **监控与改进 / Monitor and Improve：**定期检查补丁状态、备份恢复测试和账号清理效果，并根据新威胁更新框架。/ Periodically review patch levels, backup-restoration tests, and account cleanup and update the framework as threats evolve.

**例题：悉尼公共交通数字卡支付 / Example: Digital-Card Payments in Sydney Public Transport**

- **建立背景 / Establish the Context：**分析支付基础设施、旅客行为和 GDPR、澳大利亚隐私法等法律义务。/ Analyze payment infrastructure, traveler behavior, and legal obligations such as the GDPR and Australian Privacy Act.
- **识别风险 / Identify Risks：**识别数据泄露、卡片克隆和中间人攻击等威胁，以及弱加密、不充分认证和移动操作系统漏洞。/ Identify threats such as data breaches, card cloning, and man-in-the-middle attacks and vulnerabilities such as weak encryption, inadequate authentication, and mobile operating-system exploits.
- **分析风险 / Analyze Risks：**使用定性风险矩阵评估严重程度和可能性，例如通过 NFC 克隆卡的后果为“重大”，可能性为“可能”，因此风险为“极端”。/ Use a qualitative risk matrix to assess severity and likelihood; for example, NFC card cloning may have a Major consequence and Likely probability, resulting in an Extreme risk.
- **评价风险 / Evaluate Risks：**将风险与接受标准比较，极端风险必须立即处理。/ Compare risks with acceptance criteria; Extreme risks require immediate treatment.
- **处理风险 / Treat Risks：**使用令牌化、多因素身份验证和符合 PCI DSS 的持卡人数据加密。/ Use tokenization, multi-factor authentication, and PCI DSS-compliant encryption of cardholder data.
- **监控和审查 / Monitor and Review：**持续监控新漏洞、更新威胁模型并定期审查风险等级。/ Continuously monitor new vulnerabilities, update threat models, and periodically review risk levels.
- **沟通和咨询 / Communicate and Consult：**在所有阶段与 IT、法律、运营、支付处理商和隐私官沟通，确保共同理解和风险责任。/ Engage IT, legal, operations, payment processors, and privacy officers at every stage to ensure shared understanding and risk ownership.

------

### 5. 隐私、法律与风险管理评价 / Privacy, Law, and Evaluation of Risk Management

**隐私与个人信息 / Privacy and Personal Information**

个人信息是能够识别个人，或能够被合理用于识别个人的任何信息。/ Personal information is any information that identifies an individual or could reasonably be used to identify them.

个人信息包括姓名、地址、财务详情、个人意见、会员资格、种族背景、健康信息和犯罪记录。/ Personal information includes names, addresses, financial details, opinions, memberships, ethnic background, health information, and criminal records.

个人信息不只包括人口统计数据，还包括照片、IP地址、设备ID、MAC地址、联系人列表、通话记录、位置和已安装的应用程序。/ Personal information is not limited to demographic data; it also includes photographs, IP addresses, device IDs, MAC addresses, contact lists, call histories, locations, and installed applications.

从组织角度看，隐私管理是谨慎处理并保护个人信息的收集、使用、存储和共享。/ From an organizational perspective, privacy management involves carefully handling and protecting the collection, use, storage, and sharing of personal information.

2023年澳大利亚社区隐私态度调查显示，人们确实关心隐私，但不同人对隐私权的了解程度存在差异。/ The 2023 Australian Community Attitudes to Privacy Survey indicates that people care about privacy, although their understanding of privacy rights varies.

**隐私法律框架 / Privacy Legal Framework**

国际、国家、州和城市层面的法律都可能影响信息隐私和保密。/ Laws at international, national, state, and city levels may affect information privacy and secrecy.

法律规范数据、程序和知识产权的使用、开发和所有权。企业内部控制可能不足以实现信息系统安全，因此还需要法律来调查和起诉违法者。/ Laws regulate the use, development, and ownership of data, software, and intellectual property. Internal corporate controls may be insufficient for information-system security, so laws are also needed to investigate and prosecute offenders.

主要隐私法律和制度包括：/ Major privacy laws and regimes include:

- 澳大利亚《隐私法》。/ Australian Privacy Act.
- 澳大利亚隐私原则指南。/ Australian Privacy Principles Guidelines.
- 加州消费者隐私法案（CCPA）。/ California Consumer Privacy Act.
- 公平信用报告法（FCRA）。/ Fair Credit Reporting Act.
- 健康保险可携性与责任法案（HIPAA）。/ Health Insurance Portability and Accountability Act.
- 欧盟《通用数据保护条例》（GDPR）。/ EU General Data Protection Regulation.

**风险管理的益处 / Benefits of Risk Management**

- 为明智决策提供系统化方法。/ Provide a systematic approach to informed decision-making.
- 通过识别和分析更广泛的问题改善结果。/ Improve outcomes by identifying and analyzing a wider range of issues.
- 减少意外事件。/ Reduce surprises.
- 鼓励组织主动寻找机会。/ Encourage opportunity-seeking behavior.
- 改善规划、绩效和有效性。/ Improve planning, performance, and effectiveness.
- 提高经济性和效率。/ Improve economy and efficiency.
- 改善利益相关者关系。/ Improve stakeholder relationships.
- 为决策提供更好的信息。/ Provide better information for decision-making.
- 提升组织声誉。/ Enhance organizational reputation.
- 为董事提供保护。/ Provide protection for directors.
- 改善问责、保证和治理。/ Improve accountability, assurance, and governance.
- 促进个人福祉。/ Support personal well-being.

**风险管理的潜在缺点 / Potential Drawbacks of Risk Management**

- 可能产生虚假的精确性和信心。/ May create a false sense of precision and confidence.
- 实施过程可能比较困难。/ May be difficult to perform.
- 分析结果可能缺乏准确性。/ Results may lack accuracy.
- 可能被视为阻碍热情和创新的过程。/ May be viewed as a barrier to enthusiasm and innovation.

**核心要点 / Key Takeaways**

- 风险管理是系统化、结构化的过程。/ Risk management is a systematic and structured process.
- ISO 31000提供了全面的风险管理框架。/ ISO 31000 provides a comprehensive risk-management framework.
- 风险是后果和可能性的函数。/ Risk is a function of consequence and likelihood.
- 风险管理需要考虑内部环境、外部环境和利益相关者。/ Risk management must consider internal context, external context, and stakeholders.
- 全面的风险识别至关重要。/ Comprehensive risk identification is essential.
- 定性和定量分析方法都具有价值。/ Both qualitative and quantitative analysis methods are valuable.
- 沟通与咨询必须贯穿整个过程。/ Communication and consultation must occur throughout the process.
- 监控和审查可以确保持续改进。/ Monitoring and review support continual improvement.
- 隐私保护已经成为组织的法律与道德责任。/ Privacy protection has become a legal and ethical responsibility for organizations.
- 多种法律框架规范个人信息的处理。/ Multiple legal frameworks regulate the handling of personal information.
- 组织需要建立全面的隐私保护措施。/ Organizations need to establish comprehensive privacy-protection measures.

## 第八周：信息安全风险管理 / Week 8: Information Security Risk Management

### 1. 风险管理的基本概念 / Fundamental Concepts of Risk Management

**风险 / Risk**

风险可以定义为“涉及危险暴露的情况”，也可以定义为“可能发生并对目标产生影响的事件的机会”。/ Risk can be defined as “a situation involving exposure to danger” or “the chance of something happening that will have an impact on objectives.”

AS/NZS ISO 31000 将风险定义为：**不确定性对目标的影响。/ The effect of uncertainty on objectives.**

风险通常通过事件或情况及其可能造成的后果进行描述，并由后果与可能性的组合衡量。风险既可能产生负面影响，也可能带来正面机会。/ Risk is usually described in terms of an event or circumstance and its possible consequences and is measured through a combination of consequence and likelihood. Risk may have either negative or positive effects.

- **事件 / Event：**某种特定情况的发生或变化。/ The occurrence or change of a particular set of circumstances.
- **后果 / Consequence：**事件对目标产生的结果。/ The outcome of an event that affects objectives.
- **可能性 / Likelihood：**某件事情发生的机会。/ The chance of something happening.

**漏洞 / Vulnerability**

漏洞是“可被一个或多个威胁利用的资产或资产组的弱点”。/ A vulnerability is a “weakness of an asset or group of assets that can be exploited by one or more threats.” [ISO/IEC 13335-1:2004]

漏洞也是“产品中可能允许攻击者破坏其完整性、可用性或机密性的弱点”。/ A vulnerability is also a “weakness in a product that could allow an attacker to compromise its integrity, availability, or confidentiality.” [Microsoft]

漏洞可能存在于硬件、软件和数据中。/ Vulnerabilities may exist in hardware, software, and data.

**威胁 / Threat**

威胁是“有可能造成损失或伤害的一系列情况”。/ A threat is a “set of circumstances that has the potential to cause loss or harm.” [Charles & Shari Pfleeger]

威胁也可以定义为“可能导致系统或组织受到伤害的不良事件的潜在原因”。/ A threat may also be defined as a “potential cause of an unwanted incident that may result in harm to a system or organization.” [ISO/IEC 13335-1:2004]

**风险管理相关术语 / Risk Management Terminology**

- **风险分析 / Risk Analysis：**理解风险性质并推断风险水平的系统过程。/ A systematic process for understanding the nature of risk and determining its level.
- **风险标准 / Risk Criteria：**用于评估风险重要性的参考条件。/ Terms of reference against which the significance of risk is assessed.
- **风险评估 / Risk Assessment：**包括风险识别、风险分析和风险评价的整体过程。/ The overall process of risk identification, risk analysis, and risk evaluation.
- **风险管理 / Risk Management：**在管理不利影响的同时实现潜在机会的文化、过程和结构。/ The culture, processes, and structures directed toward realizing potential opportunities while managing adverse effects.

**风险管理的目标 / Risk Management Objectives**

- 为决策和规划提供更加可靠、严格的基础。/ Provide a more confident and rigorous basis for decision-making and planning.
- 更好地识别机会和威胁。/ Improve the identification of opportunities and threats.
- 从不确定性和变化中获得价值。/ Gain value from uncertainty and variability.
- 实现主动管理，而不是被动响应。/ Enable proactive rather than reactive management.
- 更有效地分配和使用资源。/ Improve the allocation and use of resources.
- 改善事件管理并减少损失。/ Improve incident management and reduce losses.
- 降低风险成本，包括商业保险费用。/ Reduce the cost of risk, including commercial insurance premiums.
- 提高利益相关者的信心和信任。/ Improve stakeholder confidence and trust.
- 改善法律法规合规性。/ Improve compliance with relevant legislation.
- 改善企业治理。/ Improve corporate governance.

------

### 2. ISO 31000风险管理体系 / ISO 31000 Risk Management System

AS/NZS ISO 31000是一套通用风险管理指南，适用于公共部门、私人企业、政府、社区组织、团体和个人。/ AS/NZS ISO 31000 is a generic risk-management guide applicable to public organizations, private enterprises, governments, community organizations, groups, and individuals.

它可以应用于活动、职能、项目、产品或资产，并规定风险管理过程的主要组成部分。/ It can be applied to an activity, function, project, product, or asset and specifies the main elements of the risk-management process.

其基本思路是：首先识别事件、漏洞和威胁来源，然后评估后果与可能性，最后提出控制措施以降低残余风险。/ Its basic approach is to identify events, vulnerabilities, and threat sources, assess their consequences and likelihood, and propose controls to reduce residual risk.

ISO 31000包含三个核心组成部分：**原则（Principles）**、**框架（Framework）\**和\**过程（Process）**。/ ISO 31000 contains three core components: **Principles**, **Framework**, and **Process**.

**风险管理原则 / Risk Management Principles**

风险管理应当：/ Risk management should:

- 创造和保护价值。/ Create and protect value.
- 成为所有组织过程的组成部分。/ Be an integral part of all organizational processes.
- 成为决策过程的一部分。/ Be part of decision-making.
- 明确处理不确定性。/ Explicitly address uncertainty.
- 保持系统化、结构化和及时性。/ Be systematic, structured, and timely.
- 以最佳可用信息为基础。/ Be based on the best available information.
- 根据组织实际情况进行定制。/ Be tailored to the organization.
- 考虑人为和文化因素。/ Consider human and cultural factors.
- 保持透明和包容。/ Be transparent and inclusive.
- 保持动态、迭代并响应变化。/ Be dynamic, iterative, and responsive to change.
- 促进组织持续改进。/ Facilitate continual organizational improvement.

**风险管理框架 / Risk Management Framework**

管理层的授权和承诺包括：/ Management mandate and commitment include:

- 定义并认可风险管理政策。/ Define and endorse the risk-management policy.
- 确保组织文化与风险管理政策保持一致。/ Align organizational culture with the risk-management policy.
- 建立与组织绩效指标一致的风险管理 KPI。/ Establish risk-management KPIs aligned with organizational performance KPIs.
- 使风险管理与组织战略保持一致。/ Align risk management with organizational strategy.
- 确保符合法律和监管要求。/ Ensure legal and regulatory compliance.
- 分配责任和问责。/ Assign responsibilities and accountabilities.
- 确保提供必要资源。/ Ensure appropriate resource allocation.
- 向利益相关者说明风险管理的价值。/ Communicate the benefits of risk management to stakeholders.
- 持续维护风险管理框架的适用性。/ Maintain the continuing appropriateness of the framework.

**风险管理过程 / Risk Management Process**

1. 沟通和咨询。/ Communicate and consult.
2. 建立背景。/ Establish the context.
3. 识别风险。/ Identify risks.
4. 分析风险。/ Analyze risks.
5. 评价风险。/ Evaluate risks.
6. 处理风险。/ Treat risks.
7. 监控和审查。/ Monitor and review.

**建立外部背景 / Establishing the External Context**

- 商业、社会、监管、文化、竞争、金融和政治环境。/ The business, social, regulatory, cultural, competitive, financial, and political environment.
- 组织的优势、劣势、机会和威胁。/ The organization’s strengths, weaknesses, opportunities, and threats.
- 外部利益相关者。/ External stakeholders.
- 关键业务驱动因素。/ Key business drivers.
- 外部利益相关者的目标。/ Objectives of external stakeholders.
- 外部威胁和机会。/ External threats and opportunities.

**建立内部背景 / Establishing the Internal Context**

- 组织文化、结构、能力、人员、系统和流程。/ Organizational culture, structure, capabilities, people, systems, and processes.
- 组织目标以及用于实现目标的策略。/ Organizational objectives and strategies for achieving them.
- 内部利益相关者。/ Internal stakeholders.
- 风险管理必须在组织目标的背景下进行。/ Risk management must occur within the context of organizational objectives.

**确定风险管理背景 / Defining the Risk Management Context**

- 定义组织、流程、项目或活动及其目标。/ Define the organization, process, project, or activity and its objectives.
- 明确需要作出的决策类型。/ Specify the nature of the decisions that must be made.
- 从时间和位置方面确定项目、活动或职能的范围。/ Define the scope of the project, activity, or function in terms of time and location.
- 确定风险管理活动的深度和广度。/ Define the depth and breadth of risk-management activities.
- 明确包含和排除的内容。/ Specify inclusions and exclusions.
- 明确各部门的角色与责任。/ Define the roles and responsibilities of different organizational units.
- 明确项目或活动与其他项目及组织部门之间的关系。/ Define relationships between the project or activity and other projects or organizational units.

**制定风险标准 / Developing Risk Criteria**

风险标准可以从运营、技术、财务、法律、社会、环境和人道主义等角度制定。/ Risk criteria may be developed from operational, technical, financial, legal, social, environmental, and humanitarian perspectives.

风险标准应反映组织已经确定的背景，并考虑利益相关者的看法以及法律和监管要求。/ Risk criteria should reflect the defined context and consider stakeholder perceptions and legal or regulatory requirements.

风险标准还应根据风险类型和所使用的分析技术进行选择或调整。/ Risk criteria should also be selected or adjusted to suit the risks and analytical techniques being used.

------

### 3. 风险识别、分析与评价 / Risk Identification, Analysis, and Evaluation

**识别风险 / Identify Risks**

全面识别风险非常重要，无论这些风险是否处于组织的直接控制范围内。/ Comprehensive risk identification is essential, regardless of whether the risks are under the organization’s direct control.

风险识别需要回答以下问题：/ Risk identification should answer the following questions:

- 什么事情可能发生？/ What might happen?
- 何时以及在哪里发生？/ When and where might it happen?
- 为什么会发生？/ Why might it happen?
- 如何发生？/ How might it happen?
- 可能的原因和情景是什么？/ What are the possible causes and scenarios?

**风险识别工具 / Risk Identification Tools**

- 本地或海外经验。/ Local or overseas experience.
- 专家判断。/ Expert judgment.
- 结构化访谈。/ Structured interviews.
- 焦点小组讨论。/ Focus-group discussions.
- SWOT分析。/ SWOT analysis.
- 保险理赔报告。/ Insurance-claim reports.
- 事件后报告。/ Post-event reports.
- 个人经验或组织过去的经验。/ Personal experience or previous organizational experience.
- 审计、检查和现场访问的结果。/ Results from audits, inspections, and site visits.
- 调查、问卷和检查清单。/ Surveys, questionnaires, and checklists.
- 历史记录、事件数据库和故障分析。/ Historical records, incident databases, and failure analysis.

**例题一：数字卡支付风险 / Example 1: Digital Card-Payment Risks**

**风险1：设备失窃或恶意软件导致数字卡被盗用 / Risk 1: Stolen Device or Malware Enables Digital-Card Misuse**

- **主要弱点 / Weakness：**钱包应用仅使用单因素身份验证。/ The wallet application uses only single-factor authentication.
- **后果 / Impact：**盗刷和个人数据泄露。/ Fraudulent transactions and personal-data leakage.
- **关键控制 / Control：**启用指纹或人脸识别与 PIN 组合的多因素身份验证。/ Use biometric authentication combined with a PIN as MFA.

**风险2：NFC交易被窃听 / Risk 2: Eavesdropping on NFC Transactions**

- **主要弱点 / Weakness：**无线通信缺少强加密。/ The wireless session lacks strong encryption.
- **后果 / Impact：**卡片克隆和未经授权的支付。/ Card cloning and unauthorized payments.
- **关键控制 / Control：**采用动态密钥交换和端到端 TLS。/ Use dynamic key exchange and end-to-end TLS.

**例题二：企业IT风险 / Example 2: Enterprise IT Risks**

**风险1：硬件过时并缺乏补丁 / Risk 1: Legacy Hardware and Missing Patches**

大量老旧服务器已经不再获得厂商支持，并且除防病毒软件外很少安装安全补丁，因此容易遭到漏洞利用、系统入侵或数据泄露。/ A large fleet of legacy servers is no longer supported by vendors and is rarely patched apart from antivirus updates, exposing the network to exploitation, system compromise, and data breaches.

**风险2：账号数量失控 / Risk 2: Uncontrolled Account Growth**

组织只有324名员工，却存在650个活跃账号，说明可能存在僵尸账号或权限过高的账号。这些账号可能被内部人员或外部攻击者用于权限提升。/ The organization has only 324 employees but 650 active accounts, indicating possible orphaned or over-privileged accounts that may be abused by insiders or external attackers for privilege escalation.

**风险分析 / Analyze Risks**

风险分析的目标包括：/ The goals of risk analysis include:

- 获取有关风险后果和可能性的更多信息。/ Obtain more information about risk consequences and likelihood.
- 更好地理解风险及其原因，以制定处理计划。/ Better understand the risk and its causes in order to develop treatment plans.
- 理解实施控制后仍然存在的残余风险。/ Understand the residual risk remaining after controls are implemented.
- 列出针对已识别风险的现有控制措施。/ Identify existing controls for the recognized risks.

风险可以表示为后果和可能性的函数：/ Risk may be expressed as a function of consequence and likelihood:

$$\text{风险}=f(\text{后果},\text{可能性})\qquad \text{Risk}=f(\text{Consequence},\text{Likelihood})$$

考虑不同后果具有不同权重时：/ When different consequences have different weightings:

$$\text{风险}=f[(\text{后果}\times\text{权重}),\text{可能性}]\qquad \text{Risk}=f[(\text{Consequence}\times\text{Weighting}),\text{Likelihood}]$$

风险分析可以分为**定性分析（Qualitative Analysis）**、**定量分析（Quantitative Analysis）\**和\**半定量分析（Semi-quantitative Analysis）**。/ Risk analysis may be qualitative, quantitative, or semi-quantitative.

**后果评估 / Consequence Assessment**

后果可以使用财务、技术或人员影响等标准进行表达。/ Consequences may be expressed using financial, technical, or human-impact criteria.

后果等级通常包括：**无关紧要、轻微、中等、重大和灾难性。/ Insignificant, Minor, Moderate, Major, and Catastrophic.**

**可能性评估 / Likelihood Assessment**

可能性取决于：/ Likelihood depends on:

- 威胁来源、动机和能力。/ The threat source, motivation, and capability.
- 漏洞的性质。/ The nature of the vulnerability.
- 当前控制措施的有效性。/ The effectiveness of current controls.

可能性可以表示为“可能、或许、不可能”，也可以使用“几乎确定、可能、不太可能、罕见、非常罕见、几乎不可信”等等级。/ Likelihood may be expressed as probable, possible, or improbable, or through levels such as almost certain, likely, unlikely, rare, very rare, and almost incredible.

**定性风险矩阵 / Qualitative Risk Matrix**

| 可能性 / Likelihood       | 无关紧要 / Insignificant | 轻微 / Minor  | 中等 / Moderate | 重大 / Major   | 灾难性 / Catastrophic |
| ------------------------- | ------------------------ | ------------- | --------------- | -------------- | --------------------- |
| 几乎确定 / Almost Certain | 高 / High                | 高 / High     | 极端 / Extreme  | 极端 / Extreme | 极端 / Extreme        |
| 可能 / Likely             | 中 / Moderate            | 高 / High     | 高 / High       | 极端 / Extreme | 极端 / Extreme        |
| 中等 / Moderate           | 低 / Low                 | 中 / Moderate | 高 / High       | 极端 / Extreme | 极端 / Extreme        |
| 不太可能 / Unlikely       | 低 / Low                 | 低 / Low      | 中 / Moderate   | 高 / High      | 极端 / Extreme        |
| 罕见 / Rare               | 低 / Low                 | 低 / Low      | 中 / Moderate   | 高 / High      | 高 / High             |

风险管理方法也可以用于机会分析，即评估正面后果发生的可能性。/ Risk-management methods may also be applied to opportunity analysis by considering the likelihood of positive consequences.

**评价风险 / Evaluate Risks**

- 将分析得到的风险水平与既定风险标准进行比较。/ Compare the analyzed risk level with established risk criteria.
- 根据风险分析结果作出决策。/ Make decisions based on the outcome of risk analysis.
- 确定风险是否需要处理。/ Determine whether the risk requires treatment.
- 确定相关活动是否应该继续进行。/ Determine whether the relevant activity should proceed.
- 确定不同风险的处理优先级。/ Determine priorities for risk treatment.

------

### 4. 风险处理、沟通与持续监控 / Risk Treatment, Communication, and Continuous Monitoring

**风险处理选项 / Risk Treatment Options**

- 避免风险。/ Avoid the risk.
- 改变风险发生的可能性。/ Change the likelihood of the risk.
- 改变风险后果。/ Change the consequences of the risk.
- 与第三方分担或转移风险。/ Share or transfer the risk to a third party.

选择处理方案时，需要考虑成本效益、保险等风险融资方式、法律与社会责任、利益相关者的价值观和看法。风险处理措施本身也可能引入新的风险。/ When selecting a treatment option, the organization should consider cost-benefit analysis, risk financing such as insurance, legal and social responsibilities, and stakeholder values and perceptions. Risk treatment may itself introduce new risks.

**风险规避 / Risk Avoidance**

风险规避是通过取消或改变业务活动，彻底消除特定风险。/ Risk avoidance eliminates a specific risk by cancelling or changing the relevant business activity.

在数字 Opal 卡场景中，运营方可以不推出自己的数字钱包，只允许旅客使用银行信用卡或 Apple Pay。这样运营方无需存储持卡人数据，可以消除因本地存储和应用漏洞造成的数据泄露风险。/ In the digital Opal scenario, the transport authority could avoid launching its own wallet and accept only bank cards or Apple Pay. It would not store cardholder data, eliminating breach risks associated with local storage and application vulnerabilities.

- **优点 / Advantage：**风险接近于零。/ The relevant risk is reduced to almost zero.
- **缺点 / Disadvantage：**失去数字卡带来的品牌黏性、数据分析能力、用户体验优势和后续增值服务。/ The organization loses brand loyalty, data analytics, user-experience benefits, and future value-added services.

**降低风险发生概率 / Changing the Likelihood of Risk**

通过加强控制或改善流程，降低威胁成功利用漏洞的机会。/ Reduce the probability of a threat exploiting a vulnerability by strengthening controls or improving processes.

数字 Opal 卡可以部署设备指纹和行为分析，实时发现异常设备或可疑刷卡行为并阻止欺诈交易。/ The digital Opal system may use device fingerprinting and behavioral analytics to detect suspicious devices or tap-and-pay activity and block fraudulent transactions.

组织还可以定期对移动应用实施渗透测试并及时安装安全补丁，减少恶意软件利用漏洞的机会。/ The organization may also conduct regular penetration testing and timely patching of the mobile application to reduce opportunities for malware exploitation.

- **优点 / Advantage：**在不取消系统功能的情况下显著降低事件发生概率。/ Significantly lowers incident likelihood without removing system functionality.
- **缺点 / Disadvantage：**实施和维护成本较高，需要持续监控与更新。/ Requires higher implementation and maintenance costs and continuous monitoring.

**降低后果严重程度 / Changing the Consequences**

组织承认风险可能发生，但通过冗余设计和缓解措施将负面影响控制在可接受范围。/ The organization accepts that a risk may occur but uses redundancy and mitigation measures to keep its negative impact within tolerable limits.

- 为单笔或每日累计交易设置限额，例如 AU\$30，即使凭据被盗，损失也比较有限。/ Set single-transaction or daily spending limits, such as AU\$30, so stolen credentials cause only limited financial loss.
- 将敏感信息分散存储在彼此隔离的系统中，使攻击者无法通过攻破单个系统获得完整信息。/ Separate sensitive information across isolated systems so that compromising one system does not expose all information.
- **优点 / Advantage：**即使攻击成功，损害仍处于可控范围。/ Even if an attack succeeds, the damage remains controlled.
- **缺点 / Disadvantage：**残余影响仍然存在，组织仍需要事件响应和补偿机制。/ Residual impact remains, so incident-response and compensation mechanisms are still necessary.

**风险分担或转移 / Risk Sharing or Transfer**

风险分担是将部分或全部财务后果转移给合作伙伴、保险公司或外包服务商。/ Risk sharing transfers part or all of the financial consequences to a partner, insurer, or outsourced service provider.

数字 Opal 系统可以使用 Visa Token Service 处理令牌化、风险控制和欺诈责任，也可以购买网络安全保险以承担部分泄露响应和赔偿费用。/ The digital Opal system may use Visa Token Service to handle tokenization, risk controls, and fraud liability and may purchase cyber insurance to cover part of the breach-response and compensation costs.

- **优点 / Advantage：**保留数字卡的创新和体验优势，同时限制重大财务损失。/ Retains the innovation and user-experience benefits of the digital card while limiting major financial losses.
- **缺点 / Disadvantage：**声誉损失和监管罚款可能仍由运营方承担，同时还会产生保险费和合同成本。/ Reputational damage and regulatory penalties may remain with the authority, while insurance premiums and contractual costs are added.

**沟通与咨询 / Communication and Consultation**

沟通与咨询应贯穿风险管理过程的每一个步骤。/ Communication and consultation should occur throughout every stage of the risk-management process.

- 与内部和外部利益相关者保持对话。/ Maintain dialogue with internal and external stakeholders.
- 帮助组织确定风险背景。/ Help define the risk context.
- 确保不同观点都得到考虑。/ Ensure that different viewpoints are considered.
- 明确已识别风险的责任归属。/ Establish ownership of identified risks.
- 确保决策依据得到理解和接受。/ Ensure that the basis for decisions is understood and accepted.
- 建立利益相关者的信任。/ Build stakeholder trust.
- 制定正式的沟通计划。/ Develop a formal communication plan.

**监控与审查 / Monitoring and Review**

监控和审查同样贯穿风险管理全过程。/ Monitoring and review also apply throughout the entire risk-management process.

不断变化的环境可能改变风险、背景、可能性和后果，因此风险管理必须持续更新。/ A changing environment may alter risks, context, likelihood, and consequences, so risk management must be continuously updated.

监控和审查还可以促进经验教训的记录，而记录整个风险管理过程也是良好治理的重要实践。/ Monitoring and review also facilitate the documentation of lessons learned, while recording the complete risk-management process is an important governance practice.

**例题：企业风险管理流程 / Example: Enterprise Risk-Management Process**

1. **建立背景 / Establish the Context：**明确业务目标、老旧硬件、650个活跃账号等 IT 资产现状及监管要求。/ Define business objectives, the current IT environment such as legacy hardware and 650 active accounts, and regulatory requirements.
2. **沟通与咨询 / Communicate and Consult：**与管理层、IT运维和审计团队沟通期望及风险容忍度。/ Consult executives, IT operations, and audit teams regarding expectations and risk tolerance.
3. **识别风险 / Identify Risks：**识别硬件过时、补丁缺失、账号膨胀和备份未验证等问题。/ Identify risks such as outdated hardware, missing patches, excessive accounts, and untested backups.
4. **分析风险 / Analyze Risks：**估算每项风险的可能性及其数据泄露、停机和合规罚款等影响。/ Estimate the likelihood and potential impacts of each risk, including data breaches, downtime, and compliance penalties.
5. **评价风险 / Evaluate Risks：**与组织的风险标准比较，并划分高、中、低优先级。/ Compare the results with organizational risk criteria and assign high, medium, or low priorities.
6. **处理风险 / Treat Risks：**选择避免、降低、转移或接受风险，例如安装补丁、清理账号或购买支持合同。/ Avoid, reduce, transfer, or accept risks through measures such as patching servers, removing unnecessary accounts, or purchasing support contracts.
7. **实施并记录 / Implement and Record：**编写风险处置计划，指定负责人和期限，并保留审计文档。/ Document the treatment plan, assign owners and deadlines, and retain records for auditing.
8. **监控与改进 / Monitor and Improve：**定期检查补丁状态、备份恢复测试和账号清理效果，并根据新威胁更新框架。/ Periodically review patch levels, backup-restoration tests, and account cleanup and update the framework as threats evolve.

**例题：悉尼公共交通数字卡支付 / Example: Digital-Card Payments in Sydney Public Transport**

- **建立背景 / Establish the Context：**分析支付基础设施、旅客行为和 GDPR、澳大利亚隐私法等法律义务。/ Analyze payment infrastructure, traveler behavior, and legal obligations such as the GDPR and Australian Privacy Act.
- **识别风险 / Identify Risks：**识别数据泄露、卡片克隆和中间人攻击等威胁，以及弱加密、不充分认证和移动操作系统漏洞。/ Identify threats such as data breaches, card cloning, and man-in-the-middle attacks and vulnerabilities such as weak encryption, inadequate authentication, and mobile operating-system exploits.
- **分析风险 / Analyze Risks：**使用定性风险矩阵评估严重程度和可能性，例如通过 NFC 克隆卡的后果为“重大”，可能性为“可能”，因此风险为“极端”。/ Use a qualitative risk matrix to assess severity and likelihood; for example, NFC card cloning may have a Major consequence and Likely probability, resulting in an Extreme risk.
- **评价风险 / Evaluate Risks：**将风险与接受标准比较，极端风险必须立即处理。/ Compare risks with acceptance criteria; Extreme risks require immediate treatment.
- **处理风险 / Treat Risks：**使用令牌化、多因素身份验证和符合 PCI DSS 的持卡人数据加密。/ Use tokenization, multi-factor authentication, and PCI DSS-compliant encryption of cardholder data.
- **监控和审查 / Monitor and Review：**持续监控新漏洞、更新威胁模型并定期审查风险等级。/ Continuously monitor new vulnerabilities, update threat models, and periodically review risk levels.
- **沟通和咨询 / Communicate and Consult：**在所有阶段与 IT、法律、运营、支付处理商和隐私官沟通，确保共同理解和风险责任。/ Engage IT, legal, operations, payment processors, and privacy officers at every stage to ensure shared understanding and risk ownership.

------

### 5. 隐私、法律与风险管理评价 / Privacy, Law, and Evaluation of Risk Management

**隐私与个人信息 / Privacy and Personal Information**

个人信息是能够识别个人，或能够被合理用于识别个人的任何信息。/ Personal information is any information that identifies an individual or could reasonably be used to identify them.

个人信息包括姓名、地址、财务详情、个人意见、会员资格、种族背景、健康信息和犯罪记录。/ Personal information includes names, addresses, financial details, opinions, memberships, ethnic background, health information, and criminal records.

个人信息不只包括人口统计数据，还包括照片、IP地址、设备ID、MAC地址、联系人列表、通话记录、位置和已安装的应用程序。/ Personal information is not limited to demographic data; it also includes photographs, IP addresses, device IDs, MAC addresses, contact lists, call histories, locations, and installed applications.

从组织角度看，隐私管理是谨慎处理并保护个人信息的收集、使用、存储和共享。/ From an organizational perspective, privacy management involves carefully handling and protecting the collection, use, storage, and sharing of personal information.

2023年澳大利亚社区隐私态度调查显示，人们确实关心隐私，但不同人对隐私权的了解程度存在差异。/ The 2023 Australian Community Attitudes to Privacy Survey indicates that people care about privacy, although their understanding of privacy rights varies.

**隐私法律框架 / Privacy Legal Framework**

国际、国家、州和城市层面的法律都可能影响信息隐私和保密。/ Laws at international, national, state, and city levels may affect information privacy and secrecy.

法律规范数据、程序和知识产权的使用、开发和所有权。企业内部控制可能不足以实现信息系统安全，因此还需要法律来调查和起诉违法者。/ Laws regulate the use, development, and ownership of data, software, and intellectual property. Internal corporate controls may be insufficient for information-system security, so laws are also needed to investigate and prosecute offenders.

主要隐私法律和制度包括：/ Major privacy laws and regimes include:

- 澳大利亚《隐私法》。/ Australian Privacy Act.
- 澳大利亚隐私原则指南。/ Australian Privacy Principles Guidelines.
- 加州消费者隐私法案（CCPA）。/ California Consumer Privacy Act.
- 公平信用报告法（FCRA）。/ Fair Credit Reporting Act.
- 健康保险可携性与责任法案（HIPAA）。/ Health Insurance Portability and Accountability Act.
- 欧盟《通用数据保护条例》（GDPR）。/ EU General Data Protection Regulation.

**风险管理的益处 / Benefits of Risk Management**

- 为明智决策提供系统化方法。/ Provide a systematic approach to informed decision-making.
- 通过识别和分析更广泛的问题改善结果。/ Improve outcomes by identifying and analyzing a wider range of issues.
- 减少意外事件。/ Reduce surprises.
- 鼓励组织主动寻找机会。/ Encourage opportunity-seeking behavior.
- 改善规划、绩效和有效性。/ Improve planning, performance, and effectiveness.
- 提高经济性和效率。/ Improve economy and efficiency.
- 改善利益相关者关系。/ Improve stakeholder relationships.
- 为决策提供更好的信息。/ Provide better information for decision-making.
- 提升组织声誉。/ Enhance organizational reputation.
- 为董事提供保护。/ Provide protection for directors.
- 改善问责、保证和治理。/ Improve accountability, assurance, and governance.
- 促进个人福祉。/ Support personal well-being.

**风险管理的潜在缺点 / Potential Drawbacks of Risk Management**

- 可能产生虚假的精确性和信心。/ May create a false sense of precision and confidence.
- 实施过程可能比较困难。/ May be difficult to perform.
- 分析结果可能缺乏准确性。/ Results may lack accuracy.
- 可能被视为阻碍热情和创新的过程。/ May be viewed as a barrier to enthusiasm and innovation.

**核心要点 / Key Takeaways**

- 风险管理是系统化、结构化的过程。/ Risk management is a systematic and structured process.
- ISO 31000提供了全面的风险管理框架。/ ISO 31000 provides a comprehensive risk-management framework.
- 风险是后果和可能性的函数。/ Risk is a function of consequence and likelihood.
- 风险管理需要考虑内部环境、外部环境和利益相关者。/ Risk management must consider internal context, external context, and stakeholders.
- 全面的风险识别至关重要。/ Comprehensive risk identification is essential.
- 定性和定量分析方法都具有价值。/ Both qualitative and quantitative analysis methods are valuable.
- 沟通与咨询必须贯穿整个过程。/ Communication and consultation must occur throughout the process.
- 监控和审查可以确保持续改进。/ Monitoring and review support continual improvement.
- 隐私保护已经成为组织的法律与道德责任。/ Privacy protection has become a legal and ethical responsibility for organizations.
- 多种法律框架规范个人信息的处理。/ Multiple legal frameworks regulate the handling of personal information.
- 组织需要建立全面的隐私保护措施。/ Organizations need to establish comprehensive privacy-protection measures.





Pasted markdown(20260817-095008).md

File

## 第九周：信息安全的法律与企业治理 / Week 9: Legal Aspects and Corporate Governance for Information Security

### 1. 信息安全法律与网络犯罪 / Information Security Law and Cybercrime

**为什么需要法律 / Why Laws Are Necessary**

- 国际、国家、州和城市层面的法律都可能影响信息隐私与保密。/ Laws at international, national, state, and city levels may affect information privacy and secrecy.
- 法律规范数据、程序和知识产权的使用、开发与所有权。/ Laws regulate the use, development, and ownership of data, software, and intellectual property.
- 企业内部控制可能不足以保证信息安全。/ Internal corporate controls may be insufficient to ensure information security.
- 法律为调查和起诉违法者提供依据。/ Laws provide a basis for investigating and prosecuting offenders.

**法律面临的挑战 / Legal Challenges**

- 法律本质上通常是被动的，往往在问题出现之后才作出回应。/ Law is generally reactive and often responds only after problems emerge.
- 约束网络犯罪的法律仍在不断发展和变化。/ Laws designed to restrain cybercriminals are still developing and evolving.
- 不同州、国家和国际司法管辖区之间缺乏统一的法律。/ Uniform laws are lacking across state, national, and international jurisdictions.
- 全球需要就网络犯罪行为的定义、适当的处罚和间接问题的处理机制形成共识。/ Global consensus is needed on definitions of cybercrime, appropriate penalties, and mechanisms for addressing indirect issues.

**犯罪的类型 / Types of Crime**

- **民事犯罪 / Civil Crime：**针对私人个体或公司的违法行为。/ An unlawful act committed against a private individual or corporation.
- **刑事犯罪 / Criminal Act：**针对国家或社会公共利益的犯罪行为。/ A criminal act committed against the state or public interest.

**电子犯罪的特点 / Characteristics of Electronic Crime**

- 电子数据的存储与传输不再要求用户本人出现在现场。/ Electronic data storage and transmission no longer require the user’s physical presence.
- 用户可能不会被数据管理者直接观察到。/ Users may not be directly observable to data gatekeepers.
- 匿名性使犯罪者难以被识别。/ Anonymity makes criminals difficult to identify.
- 犯罪者可能难以被逮捕并送上法庭。/ Offenders may be difficult to apprehend and bring to trial.
- 现代组织以电子方式存储大量信息，扩大了潜在攻击范围。/ Modern organizations store large amounts of information electronically, expanding the potential attack surface.

**IT犯罪的定义与起诉困难 / Difficulties in Defining and Prosecuting IT Crime**

- IT犯罪本身难以准确定义。/ IT crime is difficult to define precisely.
- IT快速发展，但法律体系适应速度较慢。/ Information technology evolves rapidly, while legal systems adapt slowly.
- 法律界可能缺乏对 IT 和相关技术的充分理解。/ The legal community may lack sufficient understanding of IT and related technologies.
- 创建和修改法律是一个缓慢且复杂的过程。/ Creating and amending laws is a slow and complex process.
- 调查人员、律师或法院可能缺乏必要的 IT 素养。/ Investigators, lawyers, or courts may lack the necessary IT literacy.
- 数字证据可能是无形的，难以使用传统方法处理。/ Digital evidence may be intangible and difficult to handle using traditional methods.
- 信息和 IT 资产的价值可能难以确定。/ The value of information and IT assets may be difficult to determine.
- 社会和政治层面对 IT 犯罪影响可能缺乏统一认识。/ Society and political institutions may lack a shared understanding of the impact of IT crime.
- 犯罪复杂性、作恶者的年龄以及组织对负面宣传的担忧也可能阻碍起诉。/ Crime complexity, the perpetrator’s age, and organizational fear of negative publicity may also discourage prosecution.

**美国《计算机欺诈和滥用法》 / Computer Fraud and Abuse Act（CFAA）**

- 1984年首次引入，用于保护政府或国防用途的计算机。/ Introduced in 1984 to protect computers used by government or defense.
- 1986年扩展至“联邦利益计算机”。/ Extended in 1986 to protect “federal interest computers.”
- 1996年进一步扩展至参与州际和国际商务的计算机。/ Amended in 1996 to protect computers involved in interstate and international commerce.
- 保护范围包括未经授权的访问、传播破坏性代码、贩卖计算机密码和计算机欺诈。/ Covers unauthorized access, transmission of damaging code, trafficking in computer passwords, and computer fraud.

**美国《计算机安全法》 / Computer Security Act（CSA）1987**

该法律旨在标准化并加强政府及其承包商计算机的安全，同时培训工作人员维持适当的安全级别。/ This law was intended to standardize and strengthen security for government and contractor computers and to train personnel to maintain appropriate security levels.

**美国《健康保险可携性与责任法》 / Health Insurance Portability and Accountability Act（HIPAA）**

HIPAA通过广泛的立法措施促进更完善的医疗服务体系。所有处理个人健康信息（PHI）的公司都必须遵守 HIPAA。/ HIPAA promotes a better healthcare-delivery system through broad legislative measures. All organizations handling Personal Health Information (PHI) must comply with HIPAA.

积极影响包括：/ Positive effects include:

- 对标识符进行标准化，提高沟通效率。/ Standardizing identifiers to enable effective communication.
- 提高医疗服务提供者对 PHI 风险的认识。/ Increasing healthcare providers’ awareness of risks associated with PHI.
- 通过安全监控与更新提高问责。/ Improving accountability through security monitoring and updates.
- 通过灾难规划改善医疗服务的连续性和质量。/ Improving healthcare continuity and quality through disaster planning.

消极影响包括：/ Negative effects include:

- 医疗组织为实现合规投入多年时间和超过170亿美元。/ Healthcare organizations spent years and more than \$17 billion pursuing compliance.
- 法律解释和合规过程复杂。/ Legal interpretation and compliance are complex.
- 组织可能面临罚款、处罚和生产力损失。/ Organizations may face fines, penalties, and productivity losses.

**美国《爱国者法》 / USA PATRIOT Act（2001）**

该法全称为“通过提供拦截和阻止恐怖主义所需的适当工具来团结和加强美国法”。/ Its full name is the “Uniting and Strengthening America by Providing Appropriate Tools Required to Intercept and Obstruct Terrorism Act.”

其目标是为执法机构提供调查和逮捕涉嫌策划或实施恐怖活动人员所需的工具，并扩展 ECPA、FISA 和 CFAA 等法律。/ Its goal is to provide law-enforcement agencies with tools to investigate and apprehend suspected terrorists and to extend laws such as the ECPA, FISA, and CFAA.

**美国《联邦信息安全管理法》 / Federal Information Security Management Act（FISMA）2002**

FISMA要求建立事件检测和报告机制、业务连续性计划、正式发布的安全政策与程序以及风险评估计划。/ FISMA requires incident-detection and reporting structures, business-continuity plans, formally defined security policies and procedures, and risk-assessment programs.

IT主管需要对安全政策管理负责，NIST为相关实施提供支持。/ IT executives are accountable for managing security policies, with implementation support provided by NIST.

**澳大利亚主要法律 / Major Australian Laws**

- 《网络犯罪法2001》/ Cybercrime Act 2001
- 《电子交易法1999》/ Electronic Transactions Act 1999
- 《澳大利亚示范刑法典》/ Australian Model Criminal Code
- 《联邦隐私法1988》/ Commonwealth Privacy Act 1988
- 《垃圾邮件法2003》/ Spam Act 2003
- 《监控设备法2004》/ Surveillance Devices Act 2004

澳大利亚《网络犯罪法》主要处理：/ The Australian Cybercrime Act primarily covers:

- 为实施严重犯罪而进行的未经授权访问、修改或损害。/ Unauthorized access, modification, or impairment undertaken to commit a serious offense.
- 造成损害的未经授权数据修改。/ Unauthorized modification of data resulting in impairment.
- 未经授权损害电子通信。/ Unauthorized impairment of electronic communications.
- 持有数据并意图实施计算机犯罪。/ Possession of data with the intention of committing a computer offense.

------

### 2. 数字取证与证据保管 / Digital Forensics and Evidence Custody

**数字取证的定义 / Definition of Digital Forensics**

数字取证是应用科学知识收集、分析、记录和呈现与计算机犯罪相关的数字证据，使其能够用于法律程序和法庭。/ Digital forensics applies scientific knowledge to collect, analyze, document, and present digital evidence related to computer crime so that it can be used in legal proceedings and courts.

**数字取证的类型 / Types of Digital Forensics**

- **实时计算机取证 / Real-Time Computer Forensics：**使用 Wireshark 等工具观察实时传输的数据。/ Uses tools such as Wireshark to observe the live transmission of data.
- **重构或事后计算机取证 / Reconstructive or Post-Facto Computer Forensics：**通过追踪或提取数据，重建或揭示已经发生的数据活动和过程。/ Reconstructs or reveals previous data activities and processes through tracing or extraction.

**数字取证检查流程 / Digital Forensics Examination Process**

> **扣押 → 获取 → 分析 → 报告 / Seizure → Acquisition → Analysis → Reporting**

**证据保管链 / Chain of Custody**

证据保管链是案件调查期间证据项目被处理的完整顺序。/ The chain of custody is the complete sequence in which an item of evidence is handled during an investigation.

完整的证据保管链必须清楚说明数字证据如何被发现、获取、运输、调查、保存，以及如何在不同人员之间交接和处理。/ A proper chain of custody must clearly describe how digital evidence was discovered, acquired, transported, investigated, preserved, transferred, and handled by different parties.

必须记录以下信息：/ The following information must be documented:

- 数字证据是什么？/ What is the digital evidence?
- 数字证据在哪里被发现？/ Where was the digital evidence found?
- 数字证据如何被获取？/ How was the digital evidence acquired?
- 数字证据如何被运输、保存和处理？/ How was the digital evidence transported, preserved, and handled?
- 数字证据如何被检查？/ How was the digital evidence examined?
- 证据何时被访问、由谁访问以及出于什么目的？/ When was the evidence accessed, by whom, and for what purpose?
- 数字证据在调查过程中如何被使用？/ How was the digital evidence used during the investigation?

**数字取证工具 / Digital Forensics Tools**

- **Wireshark：**网络协议分析器。/ Network protocol analyzer.
- **CAINE（Computer Aided Investigative Environment）：**用于数字取证的 Linux 发行版。/ A Linux distribution designed for digital forensics.
- **Kali Linux：**包含渗透测试和取证工具的操作系统。/ An operating system containing penetration-testing and forensic tools.
- **Autopsy：**包含案件管理功能的端到端取证工具。/ An end-to-end forensic tool that includes case management.
- **Guymager：**磁盘镜像工具。/ A disk-imaging tool.
- **F-Response：**商业远程取证工具。/ A commercial remote-forensics tool.
- **EnCase：**综合性商业取证平台。/ A comprehensive commercial forensics platform.

------

### 3. 企业治理与信息安全 / Corporate Governance and Information Security

**治理的定义 / Definition of Governance**

治理是“治理、控制主体或对主体行使权威的行为或方式，以及相关监管体系”。/ Governance is “the act or manner of governing, exercising control or authority over subjects, and the related system of regulation.” [Oxford English Dictionary]

ISACA将治理定义为董事会和执行管理层履行的一组责任与实践，其目标包括提供战略方向、确保目标实现、确认风险得到适当管理，以及验证企业资源得到负责任的使用。/ ISACA defines governance as a set of responsibilities and practices exercised by the board and executive management to provide strategic direction, ensure objectives are achieved, confirm that risks are appropriately managed, and verify that enterprise resources are used responsibly.

**信息的重要性 / Importance of Information**

“一个人的判断不可能优于其判断所依据的信息。”/ “A person’s judgment cannot be better than the information on which it is based.” [Arthur Hays Sulzberger]

信息可以被定义为“被赋予相关性和目的的数据”。/ Information may be defined as “data endowed with relevance and purpose.”

知识由信息产生，并以有组织信息的形式被获取、传输和存储。/ Knowledge is created from information and is captured, transmitted, and stored as organized information.

**为什么需要治理 / Why Governance Is Necessary**

- 信息和 IT 系统对几乎所有组织的运营都至关重要。/ Information and IT systems are critical to the operation of almost every organization.
- 对信息的依赖已经成为业务不可或缺的一部分。/ Reliance on information has become an indispensable part of business.
- 在许多组织中，信息本身就是业务。/ In many organizations, information is the business itself.
- 信息技术的持续发展带来了巨大收益，同时也产生了新的风险。/ Continuing advances in information technology create major benefits but also introduce new risks.
- 管理层必须保持竞争力、从 IT 中获得更大收益，并对组织绩效提供更强的保证。/ Management must remain competitive, obtain greater value from IT, and provide stronger assurance of organizational performance.

Peter Drucker认为，技术扩散和信息商品化使信息成为与土地、劳动力和资本同等重要的资源。/ Peter Drucker argued that the diffusion of technology and the commodification of information have transformed information into a resource equal in importance to land, labor, and capital.

**治理面临的挑战 / Governance Challenges**

- 信息安全首先是管理问题，而不只是技术问题。/ Information security is primarily a management issue, not merely a technical issue.
- 治理责任不能被下放给中层管理人员。/ Governance responsibility cannot be relegated to middle management.
- 真正的领导必须来自组织最高层。/ Effective leadership must come from the top of the organization.
- 组织文化必须支持安全、可靠的运营。/ Organizational culture must support secure and reliable operations.
- 购买安全技术通常比改变组织文化容易。/ Purchasing security technology is usually easier than changing organizational culture.
- 所有安全失败都可以被视为流程失败，而所有流程失败最终都是管理失败。/ Every security failure may be viewed as a process failure, and every process failure is ultimately a management failure.

建立有利于安全运营的组织文化，通常比实施技术解决方案更具有挑战性。/ Establishing an organizational culture that supports secure operations is generally more challenging than implementing a technical solution.

------

### 4. 治理角色、责任与安全实施 / Governance Roles, Responsibilities, and Security Implementation

**所有者 / Owners**

- 负责提供风险资本、确保监督并行使投票权。/ Responsible for providing risk equity, ensuring oversight, and exercising voting rights.
- 对自己负责。/ Accountable to themselves.

**董事会 / Board of Directors**

- 负责聘用管理层。/ Responsible for hiring management.
- 对所有者负责。/ Accountable to the owners.
- 为治理提供战略方向和推动力。/ Provides strategic direction and momentum for governance.
- 提供必要的承诺和资源。/ Provides the necessary commitment and resources.
- 确保安全战略与业务战略共同制定。/ Ensures security strategy is developed together with business strategy.
- 设定明确的期望和目标。/ Establishes clear expectations and objectives.
- 使用监督机制和指标确保董事会意图得到落实。/ Uses oversight mechanisms and metrics to ensure that board intentions are implemented.

**首席执行官 / Chief Executive Officer（CEO）**

- 负责组织的运营稳定性和盈利能力。/ Responsible for organizational stability and profitability.
- 对所有者和董事会负责。/ Accountable to the owners and board of directors.

**管理层 / Management**

- 负责维持运营稳定性和盈利能力。/ Responsible for maintaining operational stability and profitability.
- 对 CEO 和董事会负责。/ Accountable to the CEO and board.
- 实施有效的信息安全治理并落实组织战略目标。/ Implements effective information-security governance and organizational strategic objectives.
- 与业务流程负责人进行整合与合作。/ Integrates and cooperates with business-process owners.

有效安全治理的成功取决于执行管理层的领导和持续支持。/ The success of effective security governance depends on executive leadership and continuing support.

**安全指导委员会 / Security Steering Committee**

- 信息安全影响组织的所有方面，因此需要让所有相关利益者参与。/ Information security affects every part of the organization, so all relevant stakeholders should participate.
- 为不同部门和利益相关者提供有效的沟通渠道。/ Provides an effective communication channel for departments and stakeholders.
- 帮助改变组织行为，建立更有利于安全的文化。/ Helps modify organizational behavior and create a culture more supportive of good security.

**例题：创建智能咖啡机自动化流程 / Example: Creating an Automated Smart-Coffee Routine**

可以使用以下方法建立自动启动咖啡机的 IoT 流程：/ The following methods may be used to create an IoT routine that automatically starts a coffee machine:

- **官方应用程序 / Native Applications：**使用 LIFX 和 TP-Link 的官方应用连接和控制设备。/ Use the official LIFX and TP-Link applications to connect and control devices.
- **智能家居平台 / Smart-Home Platforms：**使用 Google Home、Amazon Alexa 或 Apple HomeKit 设置触发器。/ Use Google Home, Amazon Alexa, or Apple HomeKit to create triggers.
- 这些平台连接 LIFX 和 TP-Link 云账号，当一个设备触发时，通过互联网向另一个设备发送指令。/ These platforms connect LIFX and TP-Link cloud accounts and send commands over the Internet when one device is triggered.
- **自动化服务 / Automation Services：**使用 IFTTT 或 SmartThings 建立“如果灯关闭，则打开插座”等自动化规则。/ Use IFTTT or SmartThings to create rules such as “If the light turns off, turn on the smart plug.”

可能参与该流程的相关方包括：/ Parties involved in the routine may include:

- **设备制造商 / Device Manufacturers：**LIFX 和 TP-Link 等企业负责硬件及设备通信协议。/ Companies such as LIFX and TP-Link provide the hardware and manage device-communication protocols.
- **平台提供商 / Platform Providers：**Amazon Alexa 和 Google 等平台处理用户命令与自动化逻辑。/ Platforms such as Amazon Alexa and Google process user commands and automation logic.
- **互联网服务提供商 / Internet Service Providers：**负责将 IoT 指令传输至云服务器。/ Transmit IoT commands to cloud servers.
- **云服务提供商 / Cloud Providers：**AWS 和 Azure 等服务托管用户数据与自动化程序。/ Services such as AWS and Azure host user data and automation routines.
- **第三方自动化服务商 / Third-Party Automation Providers：**IFTTT 等服务充当不同设备和平台之间的数据桥梁。/ Services such as IFTTT act as data bridges between different devices and platforms.

------

### 5. 治理指标、成果与价值 / Governance Metrics, Outcomes, and Value

**治理测量原则 / Governance Measurement Principle**

> **无法测量的事物就无法被管理。/ What cannot be measured cannot be managed.**

治理指标主要包括：/ Governance metrics primarily include:

- **关键目标指标 / Key Goal Indicators（KGIs）**
- **关键绩效指标 / Key Performance Indicators（KPIs）**
- **关键成功因素 / Critical Success Factors（CSFs）**

安全治理的有效性可能难以进行准确的定量测量。/ The effectiveness of security governance may be difficult to measure accurately in quantitative terms.

良好的安全治理应根据安全机制运行的有效性、效率和长期趋势进行评估。/ Good security governance should be evaluated according to the effectiveness, efficiency, and long-term trends of security mechanisms.

**有效安全治理的六大成果 / Six Outcomes of Effective Security Governance**

- **战略一致性 / Strategic Alignment：**使安全活动与业务战略保持一致，以支持组织目标。/ Align security activities with business strategy to support organizational objectives.
- **风险管理 / Risk Management：**采用适当措施，将风险及其潜在影响控制在可接受水平。/ Apply appropriate measures to manage risks and potential impacts to an acceptable level.
- **业务流程保证与融合 / Business Process Assurance and Convergence：**整合所有相关保证流程，使业务能够高效地端到端运行。/ Integrate relevant assurance processes so business activities operate effectively from end to end.
- **投资优化 / Investment Optimization：**优化信息安全投资以支持业务目标。/ Optimize information-security investments in support of business objectives.
- **资源管理 / Resource Management：**高效、有效地使用组织资源。/ Use organizational resources efficiently and effectively.
- **绩效测量 / Performance Measurement：**监控并报告安全流程，确保实现业务目标。/ Monitor and report security processes to ensure that business objectives are achieved.

**战略一致性指标 / Strategic Alignment Metrics**

- 通过客户满意度调查、投诉和控制分析，确认安全活动没有实质性阻碍业务。/ Use customer-satisfaction surveys, complaints, and control analysis to confirm that security activities do not materially hinder business.
- 评估安全计划是否支持在线交易和电子商务等业务活动。/ Assess whether the security program enables activities such as online trading and electronic business.
- 通过可接受的中断和损失水平，判断安全活动是否提供稳定且可预测的运营。/ Use acceptable levels of outages and losses to determine whether security activities provide predictable and robust operations.

**风险管理指标 / Risk Management Metrics**

- 比较安全投入成本与风险评估结果，衡量成本效益。/ Compare security expenditure with risk-assessment outcomes to measure cost-effectiveness.
- 观察未修复漏洞是否持续减少。/ Monitor whether open vulnerabilities are continually decreasing.
- 评估对新风险的检测和响应能力是否持续改善。/ Assess whether detection and response to new risks are continually improving.

**业务流程保证指标 / Business Process Assurance Metrics**

- 确认信息资产保护没有缺口。/ Confirm that no gaps exist in information-asset protection.
- 确保已经识别所有保证流程。/ Ensure that all assurance processes have been identified.
- 确保风险评估覆盖完整的端到端业务流程。/ Ensure that risk assessments cover complete end-to-end business processes.
- 明确定义角色、责任和简洁的交互接口。/ Clearly define roles, responsibilities, and concise interfaces.

**良好治理在合规与风险方面的价值 / Compliance and Risk Benefits of Good Governance**

- 改善法律和监管合规。/ Improve legal and regulatory compliance.
- 降低承担民事或刑事责任的可能性。/ Reduce the potential for civil or criminal liability.
- 提供政策合规保证。/ Provide assurance of policy compliance.
- 提高业务运营的可预测性。/ Increase the predictability of business operations.

**良好治理在运营方面的价值 / Operational Benefits of Good Governance**

- 提供优化有限资源分配的结构和框架。/ Provide a structure and framework for optimizing the allocation of limited resources.
- 确保关键决策不是基于错误信息作出的。/ Ensure that critical decisions are not based on faulty information.
- 为综合、有效的安全计划建立基础。/ Establish a foundation for a comprehensive and effective security program.

**良好治理对利益相关者的价值 / Stakeholder Benefits of Good Governance**

- 确保组织对关键资产的保护承担责任。/ Ensure accountability for safeguarding critical assets.
- 提高客户和其他利益相关者的信任。/ Increase the trust of customers and other stakeholders.

**核心要点 / Key Takeaways**

- 网络犯罪法律仍在发展，并面临犯罪定义、起诉和国际协调方面的挑战。/ Cybercrime laws are still developing and face challenges involving crime definition, prosecution, and international coordination.
- 数字取证是法律程序的重要组成部分，需要严格维护证据保管链。/ Digital forensics is an important part of legal proceedings and requires a strict chain of custody.
- 不同司法管辖区具有不同的法律框架和要求。/ Different jurisdictions have different legal frameworks and requirements.
- 有效的信息安全治理需要董事会、执行管理层和指导委员会共同参与。/ Effective information-security governance requires the participation of the board, executive management, and steering committee.
- 治理首先是管理问题，而不只是技术问题。/ Governance is primarily a management issue, not merely a technical issue.
- 组织需要建立明确的角色、责任和问责结构。/ Organizations need clear roles, responsibilities, and accountability structures.
- 成功的治理需要适当指标和持续监控。/ Successful governance requires appropriate metrics and continuous monitoring.





 第九周：信息安全的法律与企业治理 / Week 9: Legal Aspects and Corporate Governance for Information Security

### 1. 信息安全法律与网络犯罪 / Information Security Law and Cybercrime

**为什么需要法律 / Why Laws Are Necessary**

- 国际、国家、州和城市层面的法律都可能影响信息隐私与保密。/ Laws at international, national, state, and city levels may affect information privacy and secrecy.
- 法律规范数据、程序和知识产权的使用、开发与所有权。/ Laws regulate the use, development, and ownership of data, software, and intellectual property.
- 企业内部控制可能不足以保证信息安全。/ Internal corporate controls may be insufficient to ensure information security.
- 法律为调查和起诉违法者提供依据。/ Laws provide a basis for investigating and prosecuting offenders.

**法律面临的挑战 / Legal Challenges**

- 法律本质上通常是被动的，往往在问题出现之后才作出回应。/ Law is generally reactive and often responds only after problems emerge.
- 约束网络犯罪的法律仍在不断发展和变化。/ Laws designed to restrain cybercriminals are still developing and evolving.
- 不同州、国家和国际司法管辖区之间缺乏统一的法律。/ Uniform laws are lacking across state, national, and international jurisdictions.
- 全球需要就网络犯罪行为的定义、适当的处罚和间接问题的处理机制形成共识。/ Global consensus is needed on definitions of cybercrime, appropriate penalties, and mechanisms for addressing indirect issues.

**犯罪的类型 / Types of Crime**

- **民事犯罪 / Civil Crime：**针对私人个体或公司的违法行为。/ An unlawful act committed against a private individual or corporation.
- **刑事犯罪 / Criminal Act：**针对国家或社会公共利益的犯罪行为。/ A criminal act committed against the state or public interest.

**电子犯罪的特点 / Characteristics of Electronic Crime**

- 电子数据的存储与传输不再要求用户本人出现在现场。/ Electronic data storage and transmission no longer require the user’s physical presence.
- 用户可能不会被数据管理者直接观察到。/ Users may not be directly observable to data gatekeepers.
- 匿名性使犯罪者难以被识别。/ Anonymity makes criminals difficult to identify.
- 犯罪者可能难以被逮捕并送上法庭。/ Offenders may be difficult to apprehend and bring to trial.
- 现代组织以电子方式存储大量信息，扩大了潜在攻击范围。/ Modern organizations store large amounts of information electronically, expanding the potential attack surface.

**IT犯罪的定义与起诉困难 / Difficulties in Defining and Prosecuting IT Crime**

- IT犯罪本身难以准确定义。/ IT crime is difficult to define precisely.
- IT快速发展，但法律体系适应速度较慢。/ Information technology evolves rapidly, while legal systems adapt slowly.
- 法律界可能缺乏对 IT 和相关技术的充分理解。/ The legal community may lack sufficient understanding of IT and related technologies.
- 创建和修改法律是一个缓慢且复杂的过程。/ Creating and amending laws is a slow and complex process.
- 调查人员、律师或法院可能缺乏必要的 IT 素养。/ Investigators, lawyers, or courts may lack the necessary IT literacy.
- 数字证据可能是无形的，难以使用传统方法处理。/ Digital evidence may be intangible and difficult to handle using traditional methods.
- 信息和 IT 资产的价值可能难以确定。/ The value of information and IT assets may be difficult to determine.
- 社会和政治层面对 IT 犯罪影响可能缺乏统一认识。/ Society and political institutions may lack a shared understanding of the impact of IT crime.
- 犯罪复杂性、作恶者的年龄以及组织对负面宣传的担忧也可能阻碍起诉。/ Crime complexity, the perpetrator’s age, and organizational fear of negative publicity may also discourage prosecution.

**美国《计算机欺诈和滥用法》 / Computer Fraud and Abuse Act（CFAA）**

- 1984年首次引入，用于保护政府或国防用途的计算机。/ Introduced in 1984 to protect computers used by government or defense.
- 1986年扩展至“联邦利益计算机”。/ Extended in 1986 to protect “federal interest computers.”
- 1996年进一步扩展至参与州际和国际商务的计算机。/ Amended in 1996 to protect computers involved in interstate and international commerce.
- 保护范围包括未经授权的访问、传播破坏性代码、贩卖计算机密码和计算机欺诈。/ Covers unauthorized access, transmission of damaging code, trafficking in computer passwords, and computer fraud.

**美国《计算机安全法》 / Computer Security Act（CSA）1987**

该法律旨在标准化并加强政府及其承包商计算机的安全，同时培训工作人员维持适当的安全级别。/ This law was intended to standardize and strengthen security for government and contractor computers and to train personnel to maintain appropriate security levels.

**美国《健康保险可携性与责任法》 / Health Insurance Portability and Accountability Act（HIPAA）**

HIPAA通过广泛的立法措施促进更完善的医疗服务体系。所有处理个人健康信息（PHI）的公司都必须遵守 HIPAA。/ HIPAA promotes a better healthcare-delivery system through broad legislative measures. All organizations handling Personal Health Information (PHI) must comply with HIPAA.

积极影响包括：/ Positive effects include:

- 对标识符进行标准化，提高沟通效率。/ Standardizing identifiers to enable effective communication.
- 提高医疗服务提供者对 PHI 风险的认识。/ Increasing healthcare providers’ awareness of risks associated with PHI.
- 通过安全监控与更新提高问责。/ Improving accountability through security monitoring and updates.
- 通过灾难规划改善医疗服务的连续性和质量。/ Improving healthcare continuity and quality through disaster planning.

消极影响包括：/ Negative effects include:

- 医疗组织为实现合规投入多年时间和超过170亿美元。/ Healthcare organizations spent years and more than \$17 billion pursuing compliance.
- 法律解释和合规过程复杂。/ Legal interpretation and compliance are complex.
- 组织可能面临罚款、处罚和生产力损失。/ Organizations may face fines, penalties, and productivity losses.

**美国《爱国者法》 / USA PATRIOT Act（2001）**

该法全称为“通过提供拦截和阻止恐怖主义所需的适当工具来团结和加强美国法”。/ Its full name is the “Uniting and Strengthening America by Providing Appropriate Tools Required to Intercept and Obstruct Terrorism Act.”

其目标是为执法机构提供调查和逮捕涉嫌策划或实施恐怖活动人员所需的工具，并扩展 ECPA、FISA 和 CFAA 等法律。/ Its goal is to provide law-enforcement agencies with tools to investigate and apprehend suspected terrorists and to extend laws such as the ECPA, FISA, and CFAA.

**美国《联邦信息安全管理法》 / Federal Information Security Management Act（FISMA）2002**

FISMA要求建立事件检测和报告机制、业务连续性计划、正式发布的安全政策与程序以及风险评估计划。/ FISMA requires incident-detection and reporting structures, business-continuity plans, formally defined security policies and procedures, and risk-assessment programs.

IT主管需要对安全政策管理负责，NIST为相关实施提供支持。/ IT executives are accountable for managing security policies, with implementation support provided by NIST.

**澳大利亚主要法律 / Major Australian Laws**

- 《网络犯罪法2001》/ Cybercrime Act 2001
- 《电子交易法1999》/ Electronic Transactions Act 1999
- 《澳大利亚示范刑法典》/ Australian Model Criminal Code
- 《联邦隐私法1988》/ Commonwealth Privacy Act 1988
- 《垃圾邮件法2003》/ Spam Act 2003
- 《监控设备法2004》/ Surveillance Devices Act 2004

澳大利亚《网络犯罪法》主要处理：/ The Australian Cybercrime Act primarily covers:

- 为实施严重犯罪而进行的未经授权访问、修改或损害。/ Unauthorized access, modification, or impairment undertaken to commit a serious offense.
- 造成损害的未经授权数据修改。/ Unauthorized modification of data resulting in impairment.
- 未经授权损害电子通信。/ Unauthorized impairment of electronic communications.
- 持有数据并意图实施计算机犯罪。/ Possession of data with the intention of committing a computer offense.

------

### 2. 数字取证与证据保管 / Digital Forensics and Evidence Custody

**数字取证的定义 / Definition of Digital Forensics**

数字取证是应用科学知识收集、分析、记录和呈现与计算机犯罪相关的数字证据，使其能够用于法律程序和法庭。/ Digital forensics applies scientific knowledge to collect, analyze, document, and present digital evidence related to computer crime so that it can be used in legal proceedings and courts.

**数字取证的类型 / Types of Digital Forensics**

- **实时计算机取证 / Real-Time Computer Forensics：**使用 Wireshark 等工具观察实时传输的数据。/ Uses tools such as Wireshark to observe the live transmission of data.
- **重构或事后计算机取证 / Reconstructive or Post-Facto Computer Forensics：**通过追踪或提取数据，重建或揭示已经发生的数据活动和过程。/ Reconstructs or reveals previous data activities and processes through tracing or extraction.

**数字取证检查流程 / Digital Forensics Examination Process**

> **扣押 → 获取 → 分析 → 报告 / Seizure → Acquisition → Analysis → Reporting**

**证据保管链 / Chain of Custody**

证据保管链是案件调查期间证据项目被处理的完整顺序。/ The chain of custody is the complete sequence in which an item of evidence is handled during an investigation.

完整的证据保管链必须清楚说明数字证据如何被发现、获取、运输、调查、保存，以及如何在不同人员之间交接和处理。/ A proper chain of custody must clearly describe how digital evidence was discovered, acquired, transported, investigated, preserved, transferred, and handled by different parties.

必须记录以下信息：/ The following information must be documented:

- 数字证据是什么？/ What is the digital evidence?
- 数字证据在哪里被发现？/ Where was the digital evidence found?
- 数字证据如何被获取？/ How was the digital evidence acquired?
- 数字证据如何被运输、保存和处理？/ How was the digital evidence transported, preserved, and handled?
- 数字证据如何被检查？/ How was the digital evidence examined?
- 证据何时被访问、由谁访问以及出于什么目的？/ When was the evidence accessed, by whom, and for what purpose?
- 数字证据在调查过程中如何被使用？/ How was the digital evidence used during the investigation?

**数字取证工具 / Digital Forensics Tools**

- **Wireshark：**网络协议分析器。/ Network protocol analyzer.
- **CAINE（Computer Aided Investigative Environment）：**用于数字取证的 Linux 发行版。/ A Linux distribution designed for digital forensics.
- **Kali Linux：**包含渗透测试和取证工具的操作系统。/ An operating system containing penetration-testing and forensic tools.
- **Autopsy：**包含案件管理功能的端到端取证工具。/ An end-to-end forensic tool that includes case management.
- **Guymager：**磁盘镜像工具。/ A disk-imaging tool.
- **F-Response：**商业远程取证工具。/ A commercial remote-forensics tool.
- **EnCase：**综合性商业取证平台。/ A comprehensive commercial forensics platform.

------

### 3. 企业治理与信息安全 / Corporate Governance and Information Security

**治理的定义 / Definition of Governance**

治理是“治理、控制主体或对主体行使权威的行为或方式，以及相关监管体系”。/ Governance is “the act or manner of governing, exercising control or authority over subjects, and the related system of regulation.” [Oxford English Dictionary]

ISACA将治理定义为董事会和执行管理层履行的一组责任与实践，其目标包括提供战略方向、确保目标实现、确认风险得到适当管理，以及验证企业资源得到负责任的使用。/ ISACA defines governance as a set of responsibilities and practices exercised by the board and executive management to provide strategic direction, ensure objectives are achieved, confirm that risks are appropriately managed, and verify that enterprise resources are used responsibly.

**信息的重要性 / Importance of Information**

“一个人的判断不可能优于其判断所依据的信息。”/ “A person’s judgment cannot be better than the information on which it is based.” [Arthur Hays Sulzberger]

信息可以被定义为“被赋予相关性和目的的数据”。/ Information may be defined as “data endowed with relevance and purpose.”

知识由信息产生，并以有组织信息的形式被获取、传输和存储。/ Knowledge is created from information and is captured, transmitted, and stored as organized information.

**为什么需要治理 / Why Governance Is Necessary**

- 信息和 IT 系统对几乎所有组织的运营都至关重要。/ Information and IT systems are critical to the operation of almost every organization.
- 对信息的依赖已经成为业务不可或缺的一部分。/ Reliance on information has become an indispensable part of business.
- 在许多组织中，信息本身就是业务。/ In many organizations, information is the business itself.
- 信息技术的持续发展带来了巨大收益，同时也产生了新的风险。/ Continuing advances in information technology create major benefits but also introduce new risks.
- 管理层必须保持竞争力、从 IT 中获得更大收益，并对组织绩效提供更强的保证。/ Management must remain competitive, obtain greater value from IT, and provide stronger assurance of organizational performance.

Peter Drucker认为，技术扩散和信息商品化使信息成为与土地、劳动力和资本同等重要的资源。/ Peter Drucker argued that the diffusion of technology and the commodification of information have transformed information into a resource equal in importance to land, labor, and capital.

**治理面临的挑战 / Governance Challenges**

- 信息安全首先是管理问题，而不只是技术问题。/ Information security is primarily a management issue, not merely a technical issue.
- 治理责任不能被下放给中层管理人员。/ Governance responsibility cannot be relegated to middle management.
- 真正的领导必须来自组织最高层。/ Effective leadership must come from the top of the organization.
- 组织文化必须支持安全、可靠的运营。/ Organizational culture must support secure and reliable operations.
- 购买安全技术通常比改变组织文化容易。/ Purchasing security technology is usually easier than changing organizational culture.
- 所有安全失败都可以被视为流程失败，而所有流程失败最终都是管理失败。/ Every security failure may be viewed as a process failure, and every process failure is ultimately a management failure.

建立有利于安全运营的组织文化，通常比实施技术解决方案更具有挑战性。/ Establishing an organizational culture that supports secure operations is generally more challenging than implementing a technical solution.

------

### 4. 治理角色、责任与安全实施 / Governance Roles, Responsibilities, and Security Implementation

**所有者 / Owners**

- 负责提供风险资本、确保监督并行使投票权。/ Responsible for providing risk equity, ensuring oversight, and exercising voting rights.
- 对自己负责。/ Accountable to themselves.

**董事会 / Board of Directors**

- 负责聘用管理层。/ Responsible for hiring management.
- 对所有者负责。/ Accountable to the owners.
- 为治理提供战略方向和推动力。/ Provides strategic direction and momentum for governance.
- 提供必要的承诺和资源。/ Provides the necessary commitment and resources.
- 确保安全战略与业务战略共同制定。/ Ensures security strategy is developed together with business strategy.
- 设定明确的期望和目标。/ Establishes clear expectations and objectives.
- 使用监督机制和指标确保董事会意图得到落实。/ Uses oversight mechanisms and metrics to ensure that board intentions are implemented.

**首席执行官 / Chief Executive Officer（CEO）**

- 负责组织的运营稳定性和盈利能力。/ Responsible for organizational stability and profitability.
- 对所有者和董事会负责。/ Accountable to the owners and board of directors.

**管理层 / Management**

- 负责维持运营稳定性和盈利能力。/ Responsible for maintaining operational stability and profitability.
- 对 CEO 和董事会负责。/ Accountable to the CEO and board.
- 实施有效的信息安全治理并落实组织战略目标。/ Implements effective information-security governance and organizational strategic objectives.
- 与业务流程负责人进行整合与合作。/ Integrates and cooperates with business-process owners.

有效安全治理的成功取决于执行管理层的领导和持续支持。/ The success of effective security governance depends on executive leadership and continuing support.

**安全指导委员会 / Security Steering Committee**

- 信息安全影响组织的所有方面，因此需要让所有相关利益者参与。/ Information security affects every part of the organization, so all relevant stakeholders should participate.
- 为不同部门和利益相关者提供有效的沟通渠道。/ Provides an effective communication channel for departments and stakeholders.
- 帮助改变组织行为，建立更有利于安全的文化。/ Helps modify organizational behavior and create a culture more supportive of good security.

**例题：创建智能咖啡机自动化流程 / Example: Creating an Automated Smart-Coffee Routine**

可以使用以下方法建立自动启动咖啡机的 IoT 流程：/ The following methods may be used to create an IoT routine that automatically starts a coffee machine:

- **官方应用程序 / Native Applications：**使用 LIFX 和 TP-Link 的官方应用连接和控制设备。/ Use the official LIFX and TP-Link applications to connect and control devices.
- **智能家居平台 / Smart-Home Platforms：**使用 Google Home、Amazon Alexa 或 Apple HomeKit 设置触发器。/ Use Google Home, Amazon Alexa, or Apple HomeKit to create triggers.
- 这些平台连接 LIFX 和 TP-Link 云账号，当一个设备触发时，通过互联网向另一个设备发送指令。/ These platforms connect LIFX and TP-Link cloud accounts and send commands over the Internet when one device is triggered.
- **自动化服务 / Automation Services：**使用 IFTTT 或 SmartThings 建立“如果灯关闭，则打开插座”等自动化规则。/ Use IFTTT or SmartThings to create rules such as “If the light turns off, turn on the smart plug.”

可能参与该流程的相关方包括：/ Parties involved in the routine may include:

- **设备制造商 / Device Manufacturers：**LIFX 和 TP-Link 等企业负责硬件及设备通信协议。/ Companies such as LIFX and TP-Link provide the hardware and manage device-communication protocols.
- **平台提供商 / Platform Providers：**Amazon Alexa 和 Google 等平台处理用户命令与自动化逻辑。/ Platforms such as Amazon Alexa and Google process user commands and automation logic.
- **互联网服务提供商 / Internet Service Providers：**负责将 IoT 指令传输至云服务器。/ Transmit IoT commands to cloud servers.
- **云服务提供商 / Cloud Providers：**AWS 和 Azure 等服务托管用户数据与自动化程序。/ Services such as AWS and Azure host user data and automation routines.
- **第三方自动化服务商 / Third-Party Automation Providers：**IFTTT 等服务充当不同设备和平台之间的数据桥梁。/ Services such as IFTTT act as data bridges between different devices and platforms.

------

### 5. 治理指标、成果与价值 / Governance Metrics, Outcomes, and Value

**治理测量原则 / Governance Measurement Principle**

> **无法测量的事物就无法被管理。/ What cannot be measured cannot be managed.**

治理指标主要包括：/ Governance metrics primarily include:

- **关键目标指标 / Key Goal Indicators（KGIs）**
- **关键绩效指标 / Key Performance Indicators（KPIs）**
- **关键成功因素 / Critical Success Factors（CSFs）**

安全治理的有效性可能难以进行准确的定量测量。/ The effectiveness of security governance may be difficult to measure accurately in quantitative terms.

良好的安全治理应根据安全机制运行的有效性、效率和长期趋势进行评估。/ Good security governance should be evaluated according to the effectiveness, efficiency, and long-term trends of security mechanisms.

**有效安全治理的六大成果 / Six Outcomes of Effective Security Governance**

- **战略一致性 / Strategic Alignment：**使安全活动与业务战略保持一致，以支持组织目标。/ Align security activities with business strategy to support organizational objectives.
- **风险管理 / Risk Management：**采用适当措施，将风险及其潜在影响控制在可接受水平。/ Apply appropriate measures to manage risks and potential impacts to an acceptable level.
- **业务流程保证与融合 / Business Process Assurance and Convergence：**整合所有相关保证流程，使业务能够高效地端到端运行。/ Integrate relevant assurance processes so business activities operate effectively from end to end.
- **投资优化 / Investment Optimization：**优化信息安全投资以支持业务目标。/ Optimize information-security investments in support of business objectives.
- **资源管理 / Resource Management：**高效、有效地使用组织资源。/ Use organizational resources efficiently and effectively.
- **绩效测量 / Performance Measurement：**监控并报告安全流程，确保实现业务目标。/ Monitor and report security processes to ensure that business objectives are achieved.

**战略一致性指标 / Strategic Alignment Metrics**

- 通过客户满意度调查、投诉和控制分析，确认安全活动没有实质性阻碍业务。/ Use customer-satisfaction surveys, complaints, and control analysis to confirm that security activities do not materially hinder business.
- 评估安全计划是否支持在线交易和电子商务等业务活动。/ Assess whether the security program enables activities such as online trading and electronic business.
- 通过可接受的中断和损失水平，判断安全活动是否提供稳定且可预测的运营。/ Use acceptable levels of outages and losses to determine whether security activities provide predictable and robust operations.

**风险管理指标 / Risk Management Metrics**

- 比较安全投入成本与风险评估结果，衡量成本效益。/ Compare security expenditure with risk-assessment outcomes to measure cost-effectiveness.
- 观察未修复漏洞是否持续减少。/ Monitor whether open vulnerabilities are continually decreasing.
- 评估对新风险的检测和响应能力是否持续改善。/ Assess whether detection and response to new risks are continually improving.

**业务流程保证指标 / Business Process Assurance Metrics**

- 确认信息资产保护没有缺口。/ Confirm that no gaps exist in information-asset protection.
- 确保已经识别所有保证流程。/ Ensure that all assurance processes have been identified.
- 确保风险评估覆盖完整的端到端业务流程。/ Ensure that risk assessments cover complete end-to-end business processes.
- 明确定义角色、责任和简洁的交互接口。/ Clearly define roles, responsibilities, and concise interfaces.

**良好治理在合规与风险方面的价值 / Compliance and Risk Benefits of Good Governance**

- 改善法律和监管合规。/ Improve legal and regulatory compliance.
- 降低承担民事或刑事责任的可能性。/ Reduce the potential for civil or criminal liability.
- 提供政策合规保证。/ Provide assurance of policy compliance.
- 提高业务运营的可预测性。/ Increase the predictability of business operations.

**良好治理在运营方面的价值 / Operational Benefits of Good Governance**

- 提供优化有限资源分配的结构和框架。/ Provide a structure and framework for optimizing the allocation of limited resources.
- 确保关键决策不是基于错误信息作出的。/ Ensure that critical decisions are not based on faulty information.
- 为综合、有效的安全计划建立基础。/ Establish a foundation for a comprehensive and effective security program.

**良好治理对利益相关者的价值 / Stakeholder Benefits of Good Governance**

- 确保组织对关键资产的保护承担责任。/ Ensure accountability for safeguarding critical assets.
- 提高客户和其他利益相关者的信任。/ Increase the trust of customers and other stakeholders.

**核心要点 / Key Takeaways**

- 网络犯罪法律仍在发展，并面临犯罪定义、起诉和国际协调方面的挑战。/ Cybercrime laws are still developing and face challenges involving crime definition, prosecution, and international coordination.
- 数字取证是法律程序的重要组成部分，需要严格维护证据保管链。/ Digital forensics is an important part of legal proceedings and requires a strict chain of custody.
- 不同司法管辖区具有不同的法律框架和要求。/ Different jurisdictions have different legal frameworks and requirements.
- 有效的信息安全治理需要董事会、执行管理层和指导委员会共同参与。/ Effective information-security governance requires the participation of the board, executive management, and steering committee.
- 治理首先是管理问题，而不只是技术问题。/ Governance is primarily a management issue, not merely a technical issue.
- 组织需要建立明确的角色、责任和问责结构。/ Organizations need clear roles, responsibilities, and accountability structures.
- 成功的治理需要适当指标和持续监控。/ Successful governance requires appropriate metrics and continuous monitoring.



## 第十周：隐私演进格局——误区、风险与监管 / Week 10: The Evolving Landscape of Privacy—Myths, Risks, and Regulation

### 1. 数据隐私的定义、误区与现实案例 / Definition, Myths, and Real-World Cases of Data Privacy

**隐私的本质 / Essence of Privacy**

从数据生命周期的角度看，隐私的核心是**不可追溯性（Untraceability）**，即发布或处理后的数据无法被追溯到任何特定个人。/ From a data-lifecycle perspective, the essence of privacy is **untraceability**, meaning that released or processed data cannot be traced back to a particular individual.

**误区1：数据隐私并不重要 / Myth 1: Data Privacy Is No Big Deal**

滴滴出行案例表明，不负责任的数据披露甚至可能威胁生命。攻击者将行程需求数据集与乘客评价数据集关联，据此识别受害者，并引发了2018年5月和8月的两起谋杀案。/ The Didi ridesharing case shows that irresponsible data disclosure may even threaten human life. The attacker linked a travel-demand dataset with a passenger-review dataset, identified the victims, and committed two murders in May and August 2018.

**误区2：隐私与安全是一回事 / Myth 2: Privacy and Security Are the Same**

安全问题主要关注未经授权的访问，而隐私问题还包括数据在合法访问或使用过程中产生的无意信息泄露。两者相互关联，但目标和解决方法并不完全相同。/ Security primarily concerns unauthorized access, while privacy also concerns unintended information leakage during otherwise authorized access or use. They are related but have different goals and solutions.

**误区3：保护隐私只需删除个人ID / Myth 3: Privacy Is Only About Removing Personal IDs**

仅删除姓名等直接标识符并不足以实现匿名。“野马”案例说明，即使姓名被移除，独特的属性组合仍然可能识别个人。隐私处理中经常低估**准标识符（Quasi-identifiers）**的识别能力。/ Removing direct identifiers such as names is insufficient for anonymity. The “Mustang” example shows that a unique combination of attributes may identify an individual even when the name has been removed. The identifying power of **quasi-identifiers** is often underestimated.

**误区4：大型公司一定会保护用户隐私 / Myth 4: Big Companies Surely Protect User Privacy**

Facebook–Cambridge Analytica丑闻说明，大型平台并不必然能够保护隐私。Facebook在2010年允许第三方应用访问用户及其朋友的数据，最终导致约8700万用户的数据在未经同意的情况下被收集并用于政治广告。/ The Facebook–Cambridge Analytica scandal shows that large platforms do not necessarily protect privacy. In 2010, Facebook allowed third-party applications to access users’ and friends’ data, resulting in data from approximately 87 million users being collected without consent and used for political advertising.

**例题：为什么简单的IoT设备操作也会产生隐私问题？/ Example: Why Can Simple IoT Operations Create Privacy Risks?**

即使用户只是开关电灯和插座，设备仍可能生成起床时间、位置和使用习惯等个人信息。如果缺乏严格的隐私控制，这些数据可能被用于用户画像、行为跟踪，甚至被出售给第三方。/ Even when a user merely turns lights or plugs on and off, the devices may generate personal information such as wake-up times, location, and usage habits. Without strong privacy controls, this data may be used for profiling, behavioral tracking, or sale to third parties.

这种数据处理违反了数据最小化原则，并在平台缺乏透明度、数据未经用户同意被保存或第三方进行二次使用时进一步扩大风险。/ Such processing violates the principle of data minimization, particularly when platforms lack transparency, data is stored without consent, or third parties use it for secondary purposes.

这个案例既体现了“大公司一定会保护隐私”的误区，也反映了数据关联和重识别攻击的现实风险。/ This example reflects both the myth that large companies will necessarily protect privacy and the practical risks of data linkage and re-identification attacks.

**Ausgrid能源数据案例 / Ausgrid Energy-Consumption Data Case**

Ausgrid公开的家庭太阳能电力数据包含158个工作日的家庭用电模式。研究人员通过标准化互相关分析发现，不同家庭的用电模式可能具有明显的独特性。/ Ausgrid’s open solar-home electricity dataset contains household electricity-consumption patterns from 158 weekdays. Normalized cross-correlation analysis showed that individual households may have highly distinctive usage patterns.

将2012年12月22日至2013年1月9日的用电数据与邮政编码信息结合后，数据的独特性可能导致私人信息泄露。因此，即使数据表面上已经匿名，仍可能暴露个人的生活规律。/ Combining electricity-consumption data from 22 December 2012 to 9 January 2013 with postcode information may disclose private information because of the uniqueness of usage patterns. Therefore, even apparently anonymous electricity data may reveal personal lifestyles.

------

### 2. 重识别风险与隐私标准 / Re-identification Risks and Privacy Criteria

**重识别攻击 / Re-identification Attack**

重识别是确定数据集中的某条记录属于特定个人的过程。仅删除个人身份信息（PII）并不足以防止重识别。/ Re-identification is the process of determining that a particular record in a dataset belongs to a specific individual. Removing personally identifiable information (PII) alone is insufficient to prevent it.

研究显示，美国约87%的人口可以通过性别、五位邮政编码和出生日期的组合被唯一识别。/ Research indicates that approximately 87% of the US population may be uniquely identified using a combination of gender, five-digit ZIP code, and date of birth.

**信息位理论 / Information-Bits Theory**

一个典型澳大利亚人的身份大约由25位信息保护，因为：

$$2^{25} > 27.8\text{ million}$$

当攻击者掌握超过25位与某个人相关的信息时，就可能从澳大利亚人口中唯一识别该个人。/ A typical Australian is protected by approximately 25 bits of information because 225 exceeds Australia’s population of 27.8 million. Once an adversary knows more than 25 bits about an individual, re-identification may become possible.

**1. k-匿名 / k-Anonymity**

k-匿名要求：

$$\Pr[x \mid y,B] \le k_1$$

它保证每个个体至少与其他 k−1 个个体无法区分。/ It ensures that each individual is indistinguishable from at least k−1 other individuals.

**2. 信息泄露标准 / Information-Leakage Criterion**

信息泄露可以使用互信息或条件熵进行衡量：

$$I(x;y) \le w$$

或者：

$$H(x \mid y) \ge v$$

该标准用于量化发布结果中泄露了多少有关原始数据的信息。/ This criterion uses mutual information or conditional entropy to quantify how much information about the original data is exposed by the released output.

**3. 差分隐私 / Differential Privacy**

差分隐私要求相邻数据集产生某一输出的概率保持相近：

$$\Pr[y \mid x] \le e^{\varepsilon}\Pr[y \mid x']$$

差分隐私可以被视为一种概率性的N-匿名机制，也是强度较高的隐私保护标准。/ Differential privacy may be viewed as a probabilistic form of N-anonymity and is one of the strongest privacy-protection criteria.

------

### 3. 数据保护与AI监管 / Data-Protection and AI Regulation

**欧盟《通用数据保护条例》 / EU General Data Protection Regulation（GDPR）**

GDPR于2016年通过，被视为世界上最严格的数据隐私与安全法律之一。它可以适用于任何针对欧盟相关个人或收集其数据的组织，即使该组织位于欧盟以外。/ Adopted in 2016, the GDPR is regarded as one of the world’s strictest data-privacy and security laws. It may apply to any organization targeting or collecting data relating to people in the EU, even if the organization is located outside the EU.

GDPR规定了八项主要数据权利：第一，知情权；第二，访问权；第三，更正权；第四，删除权；第五，限制处理权；第六，数据可携带权；第七，反对权；第八，与自动化决策和用户画像有关的权利。/ The GDPR establishes eight major data rights: the right to be informed, right of access, right to rectification, right to erasure, right to restrict processing, right to data portability, right to object, and rights relating to automated decision-making and profiling.

**美国《加州消费者隐私法》 / California Consumer Privacy Act（CCPA）**

CCPA于2018年通过，赋予消费者更多控制企业所收集个人信息的权利，可以被视为保护强度相对较弱的GDPR式制度。/ Adopted in 2018, the CCPA gives consumers greater control over personal information collected by businesses and may be viewed as a less stringent counterpart to the GDPR.

**美国《加州隐私权法》 / California Privacy Rights Act（CPRA）**

CPRA于2020年通过，对CCPA进行了显著修改和扩展，因此也被称为“CCPA 2.0”。该法的执行于2023年7月开始，其保护体系更加接近GDPR。/ Adopted in 2020, the CPRA significantly amended and expanded the CCPA and is therefore known as “CCPA 2.0.” Enforcement began in July 2023, and its protections are more comparable to the GDPR.

**澳大利亚《隐私法》 / Australian Privacy Act 1988**

澳大利亚《隐私法》旨在促进和保护个人隐私，并规范澳大利亚政府机构以及年营业额超过300万澳元的组织。/ The Australian Privacy Act promotes and protects individual privacy and regulates Australian government agencies and organizations with annual turnover exceeding AUD 3 million.

**澳大利亚《隐私修正法》 / Australian Privacy Amendment Act 2012**

2012年的修正法引入了**澳大利亚隐私原则（Australian Privacy Principles, APPs）**，规范政府机构和部分私营组织对个人信息的处理。/ The 2012 amendment introduced the **Australian Privacy Principles (APPs)**, which regulate personal-information handling by government agencies and some private organizations.

**美国AI行政命令 / US AI Executive Order**

美国AI行政命令关注建立AI安全与保障标准、保护美国人的隐私，以及促进公平与民权。/ The US AI Executive Order focuses on establishing AI safety and security standards, protecting Americans’ privacy, and advancing equity and civil rights.

**欧盟《人工智能法案》 / EU AI Act**

欧盟AI法案采用基于风险的方法，要求AI系统保持安全、透明、可追溯、非歧视并兼顾环境责任。/ The EU AI Act adopts a risk-based approach and requires AI systems to be safe, transparent, traceable, non-discriminatory, and environmentally responsible.

**澳大利亚自愿AI安全标准 / Australian Voluntary AI Safety Standard**

澳大利亚工业、科学与资源部（DISR）发布了安全和负责任AI咨询的中期回应，并采用包含十项防护栏的风险框架。/ Australia’s Department of Industry, Science and Resources (DISR) released an interim response to the consultation on safe and responsible AI and adopted a risk-based framework containing ten guardrails.

澳大利亚国家AI中心与 CSIRO Data61、Human Technology Institute（HTI）和 Gradient Institute 等机构合作，形成了基于最佳实践的自愿AI安全框架。/ The National AI Centre worked with CSIRO Data61, the Human Technology Institute (HTI), the Gradient Institute, and other organizations to develop a voluntary AI safety framework based on current best practices.

与隐私直接相关的防护栏包括数据治理与质量保证、隐私保护与安全、透明度与可解释性，以及人类监督与控制。/ Guardrails directly related to privacy include data governance and quality assurance, privacy protection and security, transparency and explainability, and human oversight and control.

------

### 4. AI隐私风险与攻击 / AI Privacy Risks and Attacks

**误区1：AI过于复杂，所以隐私无法管理 / Myth 1: AI Is Too Complex for Privacy to Be Managed**

AI的自回归过程可以表示为：

$$x_{t+1}=f(x_1,\ldots,x_i,\ldots,x_t)$$

函数 f 的参数和输入 xi 都可能包含私人信息。AI的复杂性不应成为忽视隐私的理由。/ Both the parameters of function f and the input xi may contain private information. The complexity of AI should not be used as an excuse for ignoring privacy.

**误区2：让AI忘记数据就能保护隐私 / Myth 2: Privacy Can Be Protected Simply by Asking AI to Forget Data**

机器遗忘并不等于从数据库中简单删除一条记录。私人信息可能仍保留在模型参数中，因此真正的遗忘需要更加复杂的技术与方法。/ Machine unlearning is not equivalent to simply deleting a record from a database. Private information may remain in model parameters, so effective forgetting requires more sophisticated techniques and methods.

**误区3：AI隐私只涉及训练数据 / Myth 3: AI Privacy Is Only About Training Data**

隐私风险不仅存在于模型训练阶段，也存在于推理和输出阶段。模型输出可能泄露训练数据中的信息，因此需要覆盖完整AI生命周期的隐私保护。/ Privacy risks exist not only during training but also during inference and output generation. Model outputs may reveal training information, so privacy protection must cover the entire AI lifecycle.

**1. 成员推理攻击 / Membership Inference Attack（MIA）**

成员推理攻击试图计算：

$$\Pr[h \in x_{\mathrm{train}} \mid y]$$

攻击者通过观察模型输出，判断某条特定记录是否曾出现在训练集中。攻击方式可以基于神经网络，也可以基于似然差异。/ The attacker analyzes model outputs to determine whether a particular record appeared in the training dataset. The attack may be neural-network-based or likelihood-based.

**2. 属性推理攻击 / Attribute Inference Attack（AIA）**

属性推理攻击的目标可以表示为：

$$I(s;y)$$

攻击者利用模型泄露的信息推断目标个体的敏感属性，并可能基于模型特征训练专门的攻击模型。/ The attacker uses information exposed by the model to infer a target individual’s sensitive attributes and may train a dedicated attack model using model features.

**3. 梯度反演攻击 / Gradient Inversion Attack（GIA）**

梯度反演攻击试图计算：

$$\Pr[x \mid y]$$

攻击者利用共享的梯度更新，通过优化真实梯度与重构样本梯度之间的差异，反向恢复模型训练时使用的原始输入。/ The attacker uses shared gradient updates to reconstruct original training inputs by minimizing the difference between real gradients and gradients generated from reconstructed samples.

**GPT训练数据提取案例 / GPT Training-Data Extraction Example**

通过类似“催眠”的重复提示方式，GPT可能开始输出真实个人的地址、电话号码和电子邮箱等训练数据。原笔记记录 OpenAI 于2024年11月发布补丁，并于2025年3月发布最终解决方案。/ Through repeated prompts resembling “hypnotherapy,” GPT may begin revealing training data such as real addresses, phone numbers, and email addresses. The original notes state that OpenAI released a patch in November 2024 and a final solution in March 2025.

------

### 5. 隐私保护技术与实际缓解措施 / Privacy-Preservation Techniques and Practical Mitigation

**1. 数据访问控制 / Data Access Control**

限制数据访问权限，并使用基于角色的访问控制，使用户只能访问完成工作所必需的数据。/ Restrict data-access permissions and use role-based access control so that users can access only the data necessary for their work.

**2. 数据匿名化、掩码与抑制 / Data Anonymization, Masking, and Suppression**

移除、替换或隐藏敏感信息，并使用 k-匿名和 l-多样性等机制降低个人被识别的风险。/ Remove, replace, or conceal sensitive information and use mechanisms such as k-anonymity and l-diversity to reduce identification risk.

**3. 数据扰动 / Data Perturbation**

向数据中添加噪声以保护个人隐私，差分隐私是典型的数据扰动机制。/ Add noise to data to protect individual privacy; differential privacy is a typical perturbation mechanism.

**4. 数据合成 / Data Synthesis**

创建保持真实数据统计特征的合成数据，并以此替代真实个人数据进行分析。/ Generate synthetic data that preserves the statistical properties of real data and use it for analysis instead of actual personal records.

**5. 隐私感知AI训练 / Privacy-Aware AI Training**

在模型训练过程中直接加入隐私保护，例如使用差分隐私随机梯度下降（DP-SGD）。/ Integrate privacy protection directly into model training, for example through Differentially Private Stochastic Gradient Descent (DP-SGD).

**6. AI输出扰动 / AI Output Perturbation**

在模型输出阶段加入噪声，在隐私保护和结果效用之间取得平衡。/ Add noise during the model-output stage to balance privacy protection against output utility.

**7. 同态加密 / Homomorphic Encryption**

直接对加密数据执行计算，无需先解密数据，从而降低计算过程中的隐私暴露。/ Perform computations directly on encrypted data without decrypting it first, reducing privacy exposure during processing.

**8. 安全多方计算 / Secure Multi-Party Computation**

允许多个参与方共同完成计算，而不向其他参与方披露各自的原始数据。/ Allow multiple parties to compute a joint result without revealing their raw data to one another.

**9. 联邦学习与分布式学习 / Federated and Distributed Learning**

模型在本地数据上进行训练，仅共享模型更新并在全局进行聚合，从而避免直接共享原始数据。/ Train models locally and share only model updates for global aggregation, avoiding direct transfer of raw data.

**例题：如何缓解IoT安全与隐私威胁？/ Example: How Can IoT Security and Privacy Threats Be Mitigated?**

**强身份验证与访问控制 / Strong Authentication and Access Control：**启用多因素身份验证和强密码，防止他人未经授权访问 IoT 设备。/ Enable MFA and strong passwords to prevent unauthorized access to IoT devices.

**定期更新软件和固件 / Regular Software and Firmware Updates：**确保智能设备固件和配套应用保持最新，以修复已知漏洞。/ Keep smart-device firmware and associated applications up to date to patch known vulnerabilities.

**安全通信通道 / Secure Communication Channels：**在设备与云端之间使用 TLS或SSL 等加密协议，防止数据被窃听。/ Use encrypted protocols such as TLS or SSL for communication between devices and the cloud to prevent eavesdropping.

**数据最小化与本地处理 / Data Minimization and Local Processing：**减少与云服务商共享的个人数据，并尽可能在设备本地完成处理。/ Minimize personal data shared with cloud providers and process data locally whenever possible.

**可信厂商与透明隐私政策 / Trusted Vendors and Transparent Privacy Policies：**选择声誉良好、数据处理方式透明且重视隐私的设备制造商。/ Select reputable IoT vendors with transparent and privacy-conscious data-handling practices.

**网络分段 / Network Segmentation：**使用独立子网或 VLAN 将 IoT 设备与主网络隔离，限制攻击者横向移动。/ Isolate IoT devices from the main network using separate subnets or VLANs to restrict lateral movement.

**设备与日志监控 / Device and Log Monitoring：**定期监控设备行为并检查访问日志，及时发现异常活动。/ Regularly monitor device behavior and review access logs to identify anomalous activity.

**OpenAI隐私实践 / OpenAI Privacy Practices**

技术措施包括对模型进行微调，使其拒绝泄露个人信息的请求；在可行时从训练数据中移除个人信息；通过使用条款和政策限制侵犯隐私的用途；监控用户获取敏感信息的尝试；以及建立自动化模型评估。/ Technical measures include fine-tuning models to reject requests for personal information, removing personal information from training data where feasible, restricting privacy-invasive uses through terms and policies, monitoring attempts to obtain sensitive information, and developing automated model evaluations.

在数据管理方面，隐私保护型数据混淆可以提高隐私，但通常会降低AI效用。相关内容可能被用于训练模型，但需要同时采取隐私保护措施。/ In data management, privacy-preserving obfuscation may increase privacy but usually reduces AI utility. Content may be used for model training, but privacy-protection measures are required.

**透明度悖论 / Transparency Paradox**

披露训练数据和AI模型信息可以显著提高AI透明度，但也可能造成严重的隐私风险。即使只披露模型架构类型，也可能帮助攻击者设计具有针对性的隐私攻击。/ Disclosing training data and AI-model information may significantly improve transparency but may also create serious privacy risks. Even revealing only the model-architecture type may help attackers design targeted privacy attacks.

近期研究表明，深度学习模型的架构会影响其隐私风险，CNN和Transformer在面对不同隐私攻击时可能具有不同表现。/ Recent research suggests that deep-learning architecture affects privacy risk and that CNNs and Transformers may behave differently under privacy attacks.

------

### 6. 隐私与数据效用的权衡 / Privacy–Utility Trade-off

**差分隐私的基本关系 / Fundamental Differential-Privacy Relationship**

$$\text{噪声}\uparrow\;\Rightarrow\;\varepsilon\downarrow\;\Rightarrow\;\text{隐私}\uparrow\qquad \text{Noise}\uparrow\;\Rightarrow\;\varepsilon\downarrow\;\Rightarrow\;\text{Privacy}\uparrow$$

但是：

$$\text{噪声}\uparrow\;\Rightarrow\;\text{数据效用}\downarrow\qquad \text{Noise}\uparrow\;\Rightarrow\;\text{Data Utility}\downarrow$$





因此，隐私与数据效用之间存在根本性权衡。实际目标是在足够小的 ε 下仍然获得合理的数据分析或模型性能。/ Therefore, a fundamental trade-off exists between privacy and data utility. The practical objective is to achieve reasonable analytical or model performance while keeping ε sufficiently small.

**Optus数据泄露的教训 / Lessons from the Optus Data Breach**

第一，组织应遵循数据最小化原则，只收集与业务直接相关且确实必要的个人信息。/ First, organizations should follow data minimization and collect only personal information that is directly relevant and necessary.

第二，不应将所有敏感信息集中保存在单一数据库中。/ Second, all sensitive information should not be concentrated in one database.

第三，不应以明文形式保存信用卡信息。/ Third, credit-card information should not be stored in plaintext.

第四，组织必须采取合理措施，防止信息遭到误用、干扰、丢失或未经授权的访问。/ Fourth, organizations must take reasonable steps to protect information against misuse, interference, loss, and unauthorized access.

**核心结论 / Key Conclusions**

隐私保护个人身份和敏感信息，严重的隐私违规甚至可能威胁生命。组织需要在隐私、数据分析、AI性能和创新之间取得平衡。/ Privacy protects personal identity and sensitive information, and severe privacy violations may even threaten human life. Organizations must balance privacy against data analytics, AI performance, and innovation.

GDPR、CCPA、CPRA和澳大利亚《隐私法》构成主要的数据监管框架，AI法案和自愿AI安全标准则代表新兴监管方向。/ The GDPR, CCPA, CPRA, and Australian Privacy Act form major data-regulation frameworks, while AI legislation and voluntary AI safety standards represent emerging regulatory approaches.

访问控制、匿名化、抑制、数据扰动、数据合成和隐私感知AI训练等技术可以降低隐私风险。/ Technologies such as access control, anonymization, suppression, data perturbation, synthetic data, and privacy-aware AI training can reduce privacy risks.

AI同时带来了成员推理、属性推理和梯度反演等新型攻击，因此隐私保护技术必须持续发展，并在创新与个人权利之间寻找合理平衡。/ AI also introduces new attacks such as membership inference, attribute inference, and gradient inversion. Privacy-preservation techniques must therefore continue to evolve while balancing innovation against individual rights.



## 第十一周：近期趋势的影响——人工智能 / Week 11: Impact of Recent Trends—Artificial Intelligence

### 1. 人工智能的基础与发展 / AI Fundamentals and Development

**人工智能 / Artificial Intelligence**

人工智能是计算机系统执行通常需要人类智能才能完成的任务的能力，包括推理、学习、解决问题和理解自然语言。/ Artificial intelligence is the ability of computer systems to perform tasks that normally require human intelligence, including reasoning, learning, problem-solving, and understanding natural language.

**AI的层次结构 / AI Hierarchy**

第一层是**机器学习（Machine Learning）**，它使计算机能够从数据中学习并作出决策，而不需要针对每种情况进行显式编程。/ The first level is **Machine Learning**, which enables computers to learn from data and make decisions without being explicitly programmed for every situation.

第二层是**深度学习（Deep Learning）**，它是机器学习的子集，主要使用人工神经网络处理和分析信息。/ The second level is **Deep Learning**, a subset of machine learning that uses artificial neural networks to process and analyze information.

第三层是**生成式人工智能（Generative AI）**，它可以生成在特征上类似训练数据的新内容。/ The third level is **Generative AI**, which generates new content designed to resemble its training data.

第四层是**大语言模型（Large Language Models, LLMs）**，它是主要用于生成文本数据的生成式AI模型。/ The fourth level is **Large Language Models (LLMs)**, a category of generative AI primarily designed to generate textual data.

**AI的发展背景 / Development Context of AI**

AI并不是一个新概念，它自20世纪50年代起就已经存在。当前AI迅速发展的主要原因是可用数据量大幅增加、计算能力显著提升、处理器更强、内存速度更快，以及云计算技术得到普及。/ AI is not a new concept and has existed since the 1950s. Its recent rapid development has been driven by the availability of large datasets, significantly improved computing power, more powerful processors, faster memory, and widespread cloud computing.

**监督学习 / Supervised Learning**

监督学习使用带标签的数据集训练算法，使其能够预测结果和识别模式。/ Supervised learning uses labeled datasets to train algorithms to predict outcomes and recognize patterns.

**无监督学习 / Unsupervised Learning**

无监督学习使用没有标签的数据，让算法自行发现数据中的模式、结构和分组。/ Unsupervised learning uses unlabeled data and allows algorithms to discover patterns, structures, and groupings.

**生成式AI / Generative AI**

生成式AI识别现有数据中的模式和结构，并根据这些规律生成新的内容。/ Generative AI identifies patterns and structures in existing data and uses them to generate new content.

------

### 2. AI驱动的网络攻击 / AI-Powered Cyberattacks

**攻击自动化 / Attack Automation**

传统网络攻击通常需要攻击者进行大量人工操作。AI和生成式AI可以自动执行攻击过程中的多个阶段，减少人工干预并提高攻击效率。/ Traditional cyberattacks generally require extensive manual involvement. AI and generative AI can automate multiple stages of the attack process, reducing human intervention and increasing attack efficiency.

**高效数据收集 / Efficient Data Gathering**

侦察通常是网络攻击的第一个阶段。AI工具可以快速收集和分析大量公开数据，显著缩短研究时间，同时提高数据的准确性与完整性。/ Reconnaissance is generally the first stage of a cyberattack. AI tools can rapidly collect and analyze large amounts of public information, significantly shortening the research phase while improving accuracy and completeness.

**攻击定制化 / Attack Customization**

攻击者可以利用数据抓取技术收集并分析公开信息，然后生成高度个性化、相关且及时的攻击内容。这种能力特别适合社会工程攻击。/ Attackers can scrape and analyze public information and then generate highly personalized, relevant, and timely attack content. This capability is particularly useful for social-engineering attacks.

**适应不断变化的环境 / Adapting to Evolving Conditions**

攻击需要适应快速变化的网络环境。AI系统可以通过持续学习和实时反馈不断更新攻击策略。/ Attacks must adapt to rapidly changing network environments. AI systems can continuously update their attack strategies through ongoing learning and real-time feedback.

**连续学习 / Continuous Learning**是使用新数据逐步更新系统知识。/ **Continuous learning** incrementally updates system knowledge using new data.

**强化学习 / Reinforcement Learning**通过尝试不同行动，并根据环境反馈调整策略。/ **Reinforcement learning** explores different actions and refines strategies based on environmental feedback.

**勒索软件 / Ransomware**

勒索软件通过锁定或加密文件限制用户访问，并要求支付赎金以恢复访问，或者防止敏感数据被公开。/ Ransomware restricts access by locking or encrypting files and demands payment to restore access or prevent sensitive information from being exposed.

AI可以改进勒索软件的侦察和漏洞评估能力，还可以帮助恶意软件根据实时环境修改代码，从而逃避安全检测。/ AI can improve ransomware reconnaissance and vulnerability assessment and help malicious code adapt in real time to evade detection.

**社会工程攻击 / Social Engineering**

社会工程攻击通过操纵人类行为实现攻击目标。AI可以帮助攻击者识别理想的组织或个人目标，并创建高度个性化的诱骗内容。/ Social-engineering attacks manipulate human behavior to achieve malicious objectives. AI can help attackers identify suitable organizational or individual targets and create highly personalized deceptive content.

LLM可以生成更加自然的钓鱼邮件，深度伪造技术则可以模拟真实人物的声音或外貌，从而欺骗受害者。/ LLMs can generate more convincing phishing emails, while deepfake technologies can imitate real people’s voices or appearances to deceive victims.

**对抗性AI与机器学习 / Adversarial AI and Machine Learning**

对抗性攻击的目标是通过操纵输入、训练数据或模型本身，破坏AI或机器学习系统的正常行为。/ Adversarial attacks aim to disrupt the normal behavior of AI or machine-learning systems by manipulating inputs, training data, or the model itself.

**投毒攻击 / Poisoning Attack**向训练数据集注入虚假或经过修改的样本，降低模型的准确性或植入恶意行为。/ A **poisoning attack** injects false or altered samples into the training dataset to reduce model accuracy or introduce malicious behavior.

**逃避攻击 / Evasion Attack**在模型推理期间对输入作出细微修改，使模型产生错误分类。/ An **evasion attack** subtly modifies inputs during inference so that the model produces an incorrect classification.

**模型篡改 / Model Tampering**是对模型结构、参数或行为进行未经授权的修改。/ **Model tampering** involves unauthorized changes to a model’s structure, parameters, or behavior.

------

### 3. AI如何改善网络安全 / How AI Improves Cybersecurity

**威胁检测 / Threat Detection**

威胁检测是识别已知安全威胁的过程。传统方法主要依赖预先定义的规则或攻击签名。/ Threat detection is the process of identifying known security threats. Traditional approaches primarily rely on predefined rules or attack signatures.

AI方法可以使用大型带标签数据集训练机器学习模型，使其识别安全数据中的复杂模式。/ AI-based approaches train machine-learning models on large labeled datasets so that they can identify complex patterns in security data.

**威胁猎取 / Threat Hunting**

威胁猎取超越了已知威胁检测，主动寻找以前未知的威胁。它要求安全团队深入理解系统、网络和用户在正常条件下的行为。/ Threat hunting goes beyond known-threat detection and proactively searches for previously unknown threats. It requires an in-depth understanding of normal system, network, and user behavior.

AI可以高效分析大量数据，将已知的正常行为与异常或意外行为区分开。/ AI can efficiently analyze large datasets and distinguish known normal behavior from anomalous or unexpected activity.

**威胁情报 / Threat Intelligence**

威胁情报专注于收集和分析信息，以理解不断变化的威胁环境。传统方法需要人工分析大量数据，耗时且容易出错。/ Threat intelligence focuses on collecting and analyzing information to understand the evolving threat landscape. Traditional methods require manual analysis of large datasets and are time-consuming and error-prone.

LLM可以自动总结、关联和解释威胁信息。例如，Google Threat Intelligence可以使用Gemini分析文件并生成定制摘要。/ LLMs can automatically summarize, correlate, and interpret threat information. For example, Google Threat Intelligence can use Gemini to analyze files and generate customized summaries.

**合规监控 / Compliance Monitoring**

网络安全合规通常需要大量文档、持续监控和频繁审计。自然语言处理算法可以协助组织理解监管文本。/ Cybersecurity compliance generally requires extensive documentation, continuous monitoring, and frequent audits. Natural-language-processing algorithms can help organizations interpret regulatory texts.

AI工具还可以把法律和监管要求映射到组织内部的具体控制措施与政策。/ AI tools can also map legal and regulatory requirements to specific organizational controls and policies.

**风险管理 / Risk Management**

传统风险管理复杂且需要大量资源。AI可以快速分析大量非结构化数据，提高风险识别和分析的效率。/ Traditional risk management is complex and resource-intensive. AI can rapidly analyze large volumes of unstructured data, improving risk-identification and analysis efficiency.

AI也可以应用于模型风险管理，包括回测、模型验证和压力测试。/ AI may also be applied to model-risk management, including back-testing, model validation, and stress testing.

**为什么重用通用大语言模型 / Why General-Purpose LLMs Are Repurposed**

通用LLM已经在大型数据集上完成训练，并具备对人类语言、逻辑、推理、事实和一般知识的基础理解。/ General-purpose LLMs are trained on large datasets and already possess a basic understanding of human language, logic, reasoning, facts, and general knowledge.

在此基础上进行微调，可以提高模型在特定任务中的准确性、相关性和任务匹配程度。/ Fine-tuning these models can improve their accuracy, relevance, and task alignment for a particular use case.

------

### 4. AI系统面临的安全、隐私与访问控制问题 / Security, Privacy, and Access-Control Challenges in AI

**训练数据质量 / Training-Data Quality**

AI训练高度依赖大型数据集。如果训练数据不正确、不完整或存在偏见，模型可能生成错误或误导性的结果。/ AI training relies heavily on large datasets. If the data is incorrect, incomplete, or biased, the model may generate inaccurate or misleading results.

**AI幻觉 / AI Hallucination**是AI模型生成表面合理但实际上不正确或具有误导性的内容。/ An **AI hallucination** is content generated by an AI model that appears plausible but is inaccurate or misleading.

训练数据中的偏见也可能出现在模型输出中，并进一步影响下游决策。/ Bias in training data may also appear in model outputs and adversely affect downstream decision-making.

**不可解释的AI / Inscrutable AI**

深度学习模型的决策过程通常难以被人类理解，因此也被称为“黑盒模型”。/ The decision-making processes of deep-learning systems are often difficult for humans to understand, so they are commonly described as “black-box models.”

缺乏可解释性可能引发偏见与公平问题，增加风险分析难度，造成监管挑战，并削弱用户信任。/ A lack of explainability may create bias and fairness concerns, make risk analysis more difficult, cause regulatory challenges, and reduce user trust.

**数据隐私 / Data Privacy**

训练AI模型通常需要访问大量数据，这可能违反GDPR和CCPA等隐私法规。/ Training AI models generally requires access to large datasets, which may create conflicts with privacy laws such as the GDPR and CCPA.

隐私保护还需要与模型准确性、透明度和数据效用等目标进行权衡。/ Privacy protection must also be balanced against objectives such as model accuracy, transparency, and data utility.

AI模型可能遭受成员推理攻击、属性推理攻击和梯度反演攻击。/ AI models may be exposed to membership-inference, attribute-inference, and gradient-inversion attacks.

**传统系统的访问控制 / Access Control in Traditional Systems**

传统访问控制主要保护文件、API和数据库等静态数据对象。它通常根据角色和权限进行配置，例如强制访问控制（MAC）、自主访问控制（DAC）和基于角色的访问控制（RBAC）。/ Traditional access control protects static data objects such as files, APIs, and databases. It is generally configured using roles and permissions through mechanisms such as Mandatory Access Control (MAC), Discretionary Access Control (DAC), and Role-Based Access Control (RBAC).

这些控制可以在操作系统和应用程序层面实施。/ These controls can be enforced at the operating-system and application levels.

**AI与LLM的访问控制 / Access Control in AI and LLM Systems**

AI系统不仅需要控制对静态数据的访问，还需要控制对模型推断知识和生成内容的访问。/ AI systems must control not only access to static data but also access to inferred knowledge and generated content.

这种访问控制并不直接，因为模型知识可能存储在权重和嵌入中。简单要求模型“忘记”信息通常无法真正删除这些知识。/ This type of access control is not straightforward because model knowledge may be stored in weights and embeddings. Simply asking a model to “forget” information generally does not remove that knowledge.

AI系统需要结合提示过滤、输出编辑和微调边界等控制。即使如此，巧妙设计的提示仍可能绕过基本过滤并提取受保护的信息。/ AI systems require controls such as prompt filtering, output redaction, and fine-tuning boundaries. Even then, carefully designed prompts may bypass basic filtering and extract protected information.

------

### 5. AI标准、风险治理与信息安全管理 / AI Standards, Risk Governance, and Information Security Management

**NIST AI风险管理框架 / NIST AI Risk Management Framework**

NIST AI风险管理框架旨在帮助组织管理AI风险，促进可信且负责任的AI系统开发。/ The NIST AI Risk Management Framework helps organizations manage AI risks and promote the trustworthy and responsible development of AI systems.

该框架包括四项核心功能。/ The framework contains four core functions.

**1. 治理 / Govern：**确保组织建立管理AI风险所需的系统、流程和工具。/ Ensure that the organization develops the systems, processes, and tools required to manage AI risks.

**2. 映射 / Map：**识别AI系统的风险特征，并结合具体使用场景理解这些风险。/ Identify AI-system risk profiles and contextualize them for particular use cases.

**3. 测量 / Measure：**有效评估、测量并持续跟踪已经识别的风险。/ Effectively assess, measure, and track identified risks.

**4. 管理 / Manage：**根据预测影响确定风险优先级并采取措施。/ Prioritize and address risks according to their projected impact.

**广岛AI进程框架 / Hiroshima AI Process Framework**

广岛AI进程框架是第一个同时包含指导原则和行为准则的国际AI框架。/ The Hiroshima AI Process Framework is the first international AI framework to include both guiding principles and a code of conduct.

其目标是促进安全、可靠且值得信赖的先进AI系统，并包含11项指导原则。/ Its goal is to promote safe, secure, and trustworthy advanced AI systems through 11 guiding principles.

**正式信息安全管理与AI / Formal Information Security Management and AI**

在治理和政策制定方面，组织应把AI相关政策纳入企业级安全战略。/ In governance and policy development, organizations should incorporate AI-related policies into enterprise security strategy.

在风险管理方面，应把AI风险管理纳入更广泛的企业风险管理体系。/ In risk management, AI risks should be incorporated into the broader enterprise-risk management framework.

在合规方面，组织应定期更新合规程序，以反映AI标准和法规的持续变化。/ In compliance, organizations should regularly update their programs to reflect evolving AI standards and regulations.

**非正式信息安全管理与AI / Informal Information Security Management and AI**

组织应培养理解AI风险的安全文化，把AI驱动攻击纳入员工培训，并教育员工如何在业务流程中安全使用AI工具。/ Organizations should cultivate a security culture that understands AI risks, include AI-powered attacks in employee training, and educate staff on the safe use of AI tools in business processes.

**技术信息安全管理与AI / Technical Information Security Management and AI**

组织可以部署AI驱动的入侵检测系统、安全信息和事件管理系统以及恶意软件检测工具。/ Organizations may deploy AI-driven intrusion-detection systems, Security Information and Event Management systems, and malware-detection tools.

组织还需要保护机器学习模型免受对抗性攻击，并保护向AI模型提供数据的管道。/ Organizations must also protect machine-learning models from adversarial attacks and secure the data pipelines that feed AI systems.

在身份与访问管理中，可以使用AI行为分析检测异常用户行为，也可以通过自适应身份验证动态调整访问控制机制。/ In identity and access management, AI-based behavioral analytics may detect abnormal user activity, while adaptive authentication may dynamically adjust access-control mechanisms.

------

### 6. AI网络安全的未来 / Future of AI in Cybersecurity

**积极趋势 / Positive Trends**

AI在网络安全中的作用将继续扩大，并提高威胁检测和预测的性能。/ The role of AI in cybersecurity will continue to grow and improve threat-detection and prediction performance.

安全运营团队可以利用AI自动执行更多重复且繁琐的工作。/ Security-operations teams may use AI to automate more repetitive and tedious work.

安全专业人员仍然会有较高需求，因为最复杂的安全事件仍需要人类判断、调查和决策。/ Security professionals will remain in high demand because the most complex incidents will still require human judgment, investigation, and decision-making.

**未来挑战 / Future Challenges**

网络攻击者同样会利用AI，实施更加复杂的社会工程攻击，并开发更难检测的恶意软件。/ Cyberattackers will also use AI to conduct more sophisticated social-engineering attacks and develop malware that is more difficult to detect.

**双刃剑效应 / Double-Edged Sword Effect**

AI既能增强网络攻击，也能提高网络防御能力。这将在恶意使用AI的攻击者与利用AI增强检测和响应的安全人员之间形成持续的军备竞赛。/ AI can enhance both cyberattacks and cyberdefense. This creates an ongoing arms race between adversaries using AI maliciously and security professionals using it to improve detection and response.

**核心结论 / Key Conclusions**

AI既是强大的网络安全工具，也是潜在威胁。攻击者和防御者都在使用AI，因此组织必须平衡其收益与风险。/ AI is both a powerful cybersecurity tool and a potential threat. Attackers and defenders are both using it, so organizations must balance its benefits against its risks.

AI系统的复杂性使传统安全控制更加难以实施，因此需要新的标准、风险框架和最佳实践。数据隐私与模型透明度是其中的关键问题。/ The complexity of AI systems makes traditional security controls more difficult to implement, creating a need for new standards, risk frameworks, and best practices. Data privacy and model transparency are key concerns.

组织需要从正式管理、非正式文化和技术控制三个层面整合AI安全，持续监控威胁环境，并投资AI安全能力和人才培养。/ Organizations need to integrate AI security across formal management, informal culture, and technical controls, continuously monitor the evolving threat landscape, and invest in AI-security capabilities and talent development.

 第十二周：新兴信息系统应用——区块链 / Week 12: Emerging Information Systems Applications—Blockchain

### 1. 区块链的意义与基本结构 / Significance and Basic Structure of Blockchain

**为什么区块链重要 / Why Blockchain Matters**

现代社会中的信息系统能够直接控制物理世界。美国 Colonial Pipeline 遭受网络攻击的事件说明，信息系统安全问题可能对关键基础设施和现实社会造成大范围影响。/ Information systems can directly control the modern physical world. The cyberattack against the US Colonial Pipeline shows that information-security incidents may have widespread effects on critical infrastructure and society.

持续增长的区块链交易量反映了该技术不断提高的重要性和接受度。澳大利亚计算机协会发布的《Blockchain 2030》报告也强调了区块链的长期战略价值。/ The continuing growth of blockchain transaction volume reflects its increasing importance and acceptance. The Australian Computer Society’s Blockchain 2030 report also emphasizes its long-term strategic value.

区块链等分布式系统可以减少单点故障风险，并提供保护数字资产的新型安全模式。/ Distributed systems such as blockchains may reduce single points of failure and provide new security models for protecting digital assets.

**区块链的抽象定义 / Abstract Definition of Blockchain**

区块链可以表示为：

$$G=\langle B,P\rangle$$

其中，G 是一个有向无环图（DAG），B 是区块集合，P 是连接区块的指针集合。/ Here, G is a directed acyclic graph (DAG), B is the set of blocks, and P is the set of pointers connecting the blocks.

$$\langle b_0,b_1\rangle \in P$$

表示从当前区块 b1 指向前一个区块 b0 的指针。该指针实际上是当前区块所包含的前一区块哈希值。/ This represents a pointer from the current block b1 to the previous block b0. The pointer is represented by the hash of the previous block stored in the current block.

**创世区块 / Genesis Block**

创世区块是所有参与者最初都知道的特殊区块，也是整个区块链的起点。/ The genesis block is a special block initially known by all participants and forms the starting point of the blockchain.

**区块的结构 / Block Structure**

每个区块包含数据、指向相关数据或前一区块的指针，以及对应的数据哈希。链式结构确定了交易的时间顺序，密码学哈希则用于保护数据完整性和不可变性。/ Each block contains data, pointers to related data or the previous block, and corresponding hashes. The chained structure establishes temporal ordering, while cryptographic hashing protects integrity and immutability.

------

### 2. 分布式账本与比特币交易 / Distributed Ledgers and Bitcoin Transactions

**分布式账本的特点 / Distributed-Ledger Properties**

区块链账本具有**不可变性（Immutability）**，即交易通常只能被追加到账本，而不能随意删除或修改。/ A blockchain ledger provides **immutability**, meaning that transactions can generally only be appended and cannot be arbitrarily deleted or changed.

区块链还具有**假名性（Pseudonymity）**。参与者通常通过区块链地址而不是真实姓名被识别，但假名并不等同于完全匿名。/ Blockchain also provides **pseudonymity**. Participants are generally identified through blockchain addresses rather than real names, although pseudonymity does not mean complete anonymity.

**区块链的技术组件 / Technical Components**

区块链使用基于八卦协议的覆盖网络传播信息。参与节点形成对等网络，每个节点既可以作为客户端，也可以作为服务器，矿工同样属于这些参与节点。/ Blockchain uses a gossip-based overlay network to distribute information. Participants form a peer-to-peer network in which each node may act as both a client and a server, with miners operating as participating nodes.

系统使用公钥密码学，参与者通过私钥签署交易。分布式共识机制则决定特定索引位置应当接受哪个区块。/ The system uses public-key cryptography, and participants sign transactions with private keys. Distributed consensus determines which block should be accepted at a particular index.

**比特币交易广播 / Bitcoin Transaction Broadcasting**

假设用户发起“从我的账户向 Alice 转账10 BTC”的交易，该交易首先通过八卦协议广播到网络。/ Suppose a user initiates a transaction transferring 10 BTC from their account to Alice. The transaction is first broadcast to the network through the gossip protocol.

接收到交易的节点会检查其有效性。验证通过后，节点将交易继续转发给邻居，同时把交易加入内存池，等待矿工将其打包进区块。/ Nodes receiving the transaction check its validity. After validation, they forward it to neighboring nodes and add it to the memory pool, where it waits to be included in a block.

**交易验证 / Transaction Validation**

每个比特币节点在转发交易前都会根据一套较长的检查清单进行验证。只有通过验证的交易才会被添加到本地内存池。/ Every Bitcoin node validates a transaction against an extensive checklist before forwarding it. Only valid transactions are added to the local memory pool.

------

### 3. 挖矿、区块构建与工作量证明 / Mining, Block Construction, and Proof of Work

**挖矿的定义 / Definition of Mining**

挖矿是向比特币货币供应中加入新比特币的过程，同时也通过工作量证明保护系统免受欺诈交易和账本篡改。/ Mining is the process through which new bitcoins are added to the monetary supply. It also protects the system against fraudulent transactions and ledger manipulation through proof of work.

**挖矿奖励 / Mining Rewards**

矿工的收入由新创建的比特币和区块内所有交易的手续费组成。当前每个区块的新币奖励为3.125 BTC，并大约每四年减半一次。/ Mining income consists of newly created bitcoins and transaction fees from all transactions included in the block. The current block subsidy is 3.125 BTC and is approximately halved every four years.

**交易选择 / Transaction Selection**

矿工从内存池中选择交易，并倾向于优先包含较早或价值较高的交易。原笔记中的交易优先级公式为：

$$\text{Priority}=\frac{\sum(\text{Input Value}\times\text{Input Age})}{\text{Transaction Size}}$$

过去的区块构建规则会为高优先级交易预留前50 KB空间。/ Miners select transactions from the memory pool and tend to prioritize older or higher-value transactions. Earlier block-construction rules reserved the first 50 KB for high-priority transactions.

**币基交易 / Coinbase Transaction**

币基交易是区块中的第一笔特殊交易，用于向矿工支付奖励。/ The coinbase transaction is the first special transaction in a block and pays the miner’s reward.

$$\text{总奖励}=\text{区块奖励}+\text{总交易手续费}\qquad \text{Total Reward}=\text{Block Subsidy}+\text{Total Transaction Fees}$$

按照当前奖励计算：

$$\text{总奖励}=3.125\,\mathrm{BTC}+\text{总交易手续费}$$

**区块头 / Block Header**

区块头包含前一区块哈希、默克尔根、难度目标和随机数等重要内容。/ A block header contains the previous block hash, Merkle root, difficulty target, nonce, and other important information.

**前一区块哈希 / Previous Block Hash**

前一区块头的哈希已经被网络接受。新区块通过保存这一哈希与前一区块连接。/ The previous block-header hash is already known and accepted by the network. A new block links to the previous block by storing this hash.

**默克尔根 / Merkle Root**

默克尔根是使用默克尔树对区块内所选交易生成的摘要。/ A Merkle root is a summary of the selected transactions in a block, generated using a Merkle tree.

默克尔树是一种二叉哈希树，可以高效概括大型数据集并验证其完整性。检查某笔交易是否包含在树中，最多需要大约 $2\log_2(N)$ 次哈希计算。/ A Merkle tree is a binary hash tree that efficiently summarizes a large dataset and verifies its integrity. Checking whether a transaction is included requires at most approximately $2\log_2(N)$ hash calculations.

**难度目标与随机数 / Difficulty Target and Nonce**

矿工重复计算区块头的哈希，并持续改变随机数，直到结果低于难度目标。/ Miners repeatedly hash the block header while changing the nonce until the resulting hash is below the difficulty target.

工作量证明过程可以表示为：

$$F(\mathrm{block},\mathrm{nonce})=\operatorname{SHA256}(\operatorname{SHA256}(\mathrm{nonce},\mathrm{block}))<\text{Difficulty Target}$$

哈希结果无法提前预测，也不存在能够直接找到正确结果的明显模式，因此矿工只能不断改变输入并重复尝试。/ Hash results cannot be predicted in advance, and there is no obvious pattern for directly finding the correct result. Miners must repeatedly modify the input and try again.

找到合适的随机数需要大量时间和计算资源，但验证随机数是否正确非常容易。难度目标越小，找到有效随机数就越困难。/ Finding a suitable nonce requires substantial time and computing resources, while verifying it is easy. The smaller the difficulty target, the harder it is to find a valid nonce.

**难度调整 / Difficulty Adjustment**

比特币大约每2016个区块调整一次挖矿难度，相当于约两周一次，其目标是将平均区块间隔保持在10分钟左右。/ Bitcoin adjusts mining difficulty approximately every 2,016 blocks, or around every two weeks, to maintain an average block interval of about ten minutes.

原笔记中的调整公式为：

$$\text{新难度}=\text{旧难度}\times\frac{20160\text{ 分钟}}{\text{最后 2016 个区块的实际时间}}$$

$$\text{New Difficulty}=\text{Old Difficulty}\times\frac{20160\text{ Minutes}}{\text{Actual Time for Last 2016 Blocks}}$$

**奖励减半 / Block-Reward Halving**

比特币挖矿奖励每210,000个区块减半一次，大约每四年发生一次。2009年1月，每个区块的奖励为50 BTC，目前为3.125 BTC。/ Bitcoin’s mining reward is halved every 210,000 blocks, approximately every four years. It began at 50 BTC per block in January 2009 and is currently 3.125 BTC.

预计到2140年，当约20.99999998百万枚比特币全部发行后，系统将不再产生新的比特币。/ Around 2140, when approximately 20.99999998 million bitcoins have been issued, no new bitcoins will be created.

有限且不断减少的发行量形成固定货币供应，使比特币无法像法定货币一样通过增发而产生货币通胀。因此，比特币通常被认为具有内在的通缩倾向。/ Finite and diminishing issuance creates a fixed monetary supply. Bitcoin cannot be inflated through additional printing in the same way as fiat currency and is therefore often described as inherently deflationary.

------

### 4. 共识机制与安全攻击 / Consensus and Security Attacks

**比特币共识 / Bitcoin Consensus**

比特币节点在任何给定时间选择累积工作量最大的有效区块链。它通常也是包含最多区块的链，但真正的判断标准是累积难度，而不只是区块数量。/ Bitcoin nodes select the valid blockchain with the greatest cumulative proof of work at any given time. This is usually the chain containing the most blocks, but the actual criterion is cumulative difficulty rather than block count alone.

当两条链长度相同时，其中累计工作量证明更高的链会被优先接受。/ When two chains have equal length, the chain with the greater cumulative proof of work is preferred.

**分叉处理 / Fork Handling**

节点通常维护三类区块：主区块链、次级链和孤块。/ Nodes generally maintain three categories of blocks: the main blockchain, secondary chains, and orphan blocks.

当新区块到达时，节点根据区块头中的“前一区块哈希”字段，将它连接到已有链的正确位置。/ When a new block arrives, the node uses the “previous block hash” field to connect it to the appropriate existing chain.

**交易确认 / Transaction Confirmation**

给定确认参数 $k$，当区块链深度达到 $i+k$ 时，可以认为索引 $i$ 处的区块已经被决定。/ Given a confirmation parameter $k$, a block at index $i$ may be considered decided when the chain reaches depth $i+k$.

原笔记中，比特币采用 $k=7$，以太坊采用 $k=12$。/ In the original notes, Bitcoin uses $k=7$, while Ethereum uses $k=12$.

**女巫攻击 / Sybil Attack**

女巫攻击是恶意用户伪造大量身份或节点的攻击。/ A Sybil attack occurs when a malicious user creates many false identities or nodes.

如果攻击者能够生成足够多的故障节点，使 $f\ge n/3$，某些拜占庭容错共识机制可能无法继续达成共识。/ If an attacker creates enough faulty nodes such that $f\ge n/3$, some Byzantine fault-tolerant consensus mechanisms may be unable to reach agreement.

**51%攻击 / 51% Attack**

当单一实体控制超过50%的网络算力时，它可能实施双花攻击，并尝试重写部分交易历史。/ When a single entity controls more than 50% of network hash power, it may perform double-spending attacks and attempt to rewrite part of the transaction history.

**算力军备竞赛 / Hash-Power Arms Race**

比特币挖矿硬件经历了从 CPU、GPU、FPGA 到 ASIC 的发展。ASIC矿机使网络算力大幅上升，但也带来了更高的能源消耗。/ Bitcoin mining hardware has evolved from CPUs to GPUs, FPGAs, and ASICs. ASIC mining caused a major increase in hash power but also substantially increased energy consumption.

原笔记指出，比特币的碳足迹可以与新西兰相比，反映了工作量证明机制带来的环境问题。/ The original notes compare Bitcoin’s carbon footprint with that of New Zealand, illustrating the environmental concerns associated with proof of work.

------

### 5. 区块链的安全价值与应用类型 / Security Value and Types of Blockchain

**去中心化信任 / Decentralized Trust**

区块链使互不信任的参与方能够共同验证交易，而不必完全依赖单一的可信第三方。/ Blockchain allows mutually untrusted parties to verify transactions collectively without relying entirely on a single trusted intermediary.

**防篡改审计 / Tamper-Evident Auditing**

每个区块都具有时间戳，并通过哈希与前一区块连接，因此区块链能够提供可追溯、可核查且难以篡改的审计记录。/ Each block is timestamped and connected to the previous block through hashing, allowing blockchain to provide traceable, verifiable, and tamper-evident audit records.

**规则自动执行 / Automated Rule Execution**

智能合约可以按照预先确定的规则自动执行结算和其他操作，减少人工干预与纠纷。/ Smart contracts can automatically execute settlements and other operations according to predefined rules, reducing manual intervention and disputes.

**权利与义务对等 / Equal Rights and Obligations**

参与节点遵循相同协议，并根据区块链类型共同拥有读取、写入或验证交易的权利和义务。/ Participating nodes follow the same protocol and, depending on the blockchain type, share rights and obligations relating to reading, writing, and validating transactions.

> **区块链的核心优势在于去中心化共识和防篡改账本，尤其适合需要跨组织验证交易真伪的场景。/ Blockchain excels at decentralized consensus and tamper-evident ledgers, particularly when strong cross-party verification is required.**

**判断是否适合使用区块链 / Assessing Whether Blockchain Is Appropriate**

PWC提出的应用评估问题包括：

1. 是否有多个参与方共享数据？/ Are multiple parties sharing data?
2. 是否有多个参与方更新数据？/ Are multiple parties updating the data?
3. 交易或记录是否需要验证？/ Is verification of transactions or records required?
4. 现有验证是否增加了成本和复杂性？/ Does the existing verification process add cost and complexity?
5. 参与方之间的交互是否对时间敏感？/ Are interactions between participants time-sensitive?
6. 不同用户的交易是否相互依赖？/ Do transactions by different users depend on one another?

只有在这些问题表明存在分布式验证和共享账本需求时，区块链才可能是合理选择。/ Blockchain is more likely to be appropriate when these questions reveal a genuine need for distributed verification and a shared ledger.

**公有链 / Public Blockchain**

公有链允许任何人加入，所有参与者都可以验证区块并读取区块中的数据，因此属于无许可区块链。/ A public blockchain allows anyone to join, validate blocks, and read block data and is therefore permissionless.

**联盟链 / Consortium Blockchain**

联盟链根据成员共识接受新节点，并按照预先定义的规则验证区块。数据读取权限可以受到限制，因此属于许可型区块链。/ A consortium blockchain accepts new nodes through member consensus and validates blocks according to predefined rules. Read access may be restricted, making it permissioned.

**私有链 / Private Blockchain**

私有链的节点由某个权威机构选择，区块通常由中央权威进行验证，数据读取权限也可以受到限制，因此同样属于许可型区块链。/ In a private blockchain, nodes are selected by an authority, blocks are generally validated by a central authority, and read access may be restricted. It is also permissioned.

------

### 6. 区块链的挑战与核心结论 / Blockchain Challenges and Key Conclusions

**可扩展性 / Scalability**

原笔记指出，比特币每秒大约只能处理7笔交易，并受到1 MB区块大小的限制。较低的吞吐量会限制区块链在高频业务场景中的应用。/ The original notes state that Bitcoin processes approximately seven transactions per second and is constrained by a 1 MB block-size limit. Low throughput may limit blockchain use in high-frequency business environments.

**隐私 / Privacy**

区块链参与者可能读取链上的交易信息。即使参与者使用假名地址，交易分析仍可能揭示身份或行为模式。/ Blockchain participants may be able to read transaction information. Even when pseudonymous addresses are used, transaction analysis may reveal identities or behavioral patterns.

**互操作性 / Interoperability**

市场上存在数千条不同区块链，包括大量加密货币网络。这些区块链之间可能使用不同协议和数据格式，因此互操作十分困难。/ Thousands of different blockchains exist, including many cryptocurrency networks. They may use different protocols and data formats, making interoperability difficult.

**治理 / Governance**

区块链引入了新的分布式决策方式。如果参与者不了解其运作机制，就可能不愿意接受或采用这种治理模式。/ Blockchain introduces new forms of distributed decision-making. Participants may be reluctant to adopt this form of governance if they do not understand how it works.

**其他挑战 / Other Challenges**

公有区块链还面临运营风险、公共政策和法律框架不完善、恶意攻击防范以及金融稳定性等问题。/ Public blockchains also face operational risks, incomplete public-policy and legal frameworks, malicious attacks, and financial-stability concerns.

**技术创新 / Technical Innovation**

区块链提供了分布式信任机制。工作量证明通过计算成本保护网络，但同时消耗大量能源。共识机制则用于处理分布式系统中的拜占庭将军问题。/ Blockchain provides a distributed trust mechanism. Proof of work protects the network through computational cost but consumes substantial energy. Consensus mechanisms address the Byzantine Generals Problem in distributed systems.

**信息安全价值 / Information-Security Value**

区块链可以减少单点故障，提供不可篡改的审计记录，在缺乏互信的环境中建立可验证的信任，并支持自动和透明的规则执行。/ Blockchain may reduce single points of failure, provide tamper-evident audit trails, establish verifiable trust in low-trust environments, and support automated and transparent rule execution.

**实际应用原则 / Practical Application Principles**

组织在采用区块链前，必须确认业务是否真正需要分布式账本和跨组织共识，同时考虑性能、隐私、治理、能源消耗和法律风险。/ Before adopting blockchain, an organization must confirm that the business genuinely requires a distributed ledger and cross-organizational consensus while considering performance, privacy, governance, energy consumption, and legal risks.

组织还需要根据使用场景，在公有链、联盟链和私有链之间选择合适的架构。/ Organizations must also select an appropriate architecture—public, consortium, or private—according to the use case.




