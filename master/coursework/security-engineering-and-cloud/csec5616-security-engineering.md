# CSEC5616 — Security Engineering

## 1. 第一周 - 安全工程导论总结 / Week 1 - Introduction to Security Engineering Summary

### 1. 安全工程基础概念 / Security Engineering Basic Concepts

- 工程与安全工程定义：工程是应用科学和数学解决问题的学科

- 安全工程意味着构思、设计和实现能够产生预期答案的硬件和软件

- 即使面对恶意、错误或意外也能正常工作

- 超越了简单的容错，需要容忍对手的活动

- Engineering and Security Engineering Definition:

- Engineering is the application of science and maths to solve problems

- Security engineering means conceiving, designing, and implementing hardware and software that produces expected answers

- Works even when confronted with malice, error, or mischance

- Goes beyond simple fault tolerance, tolerates opponent activities

- 撒旦计算机编程问题：

- "我们的任务是编程一台在最不方便的时刻给出微妙且恶意错误答案的计算机"        问题在于存在敌对对手      没有完美安全的系统

- 安全是多方面的，需要跨学科专业知识

- Programming Satan's Computer:

- "Our task is to program a computer that gives answers which are subtly and maliciously wrong at the most inconvenient possible moment"

- The problem is the presence of a hostile opponent

- No such thing as a perfectly secure system

- Security is multi-faceted, requires cross-disciplinary expertise

### 2. 安全工程框架 / Security Engineering Framework

- 策略（Policy）：定义我们要实现的目标，说明保持系统安全的含义，由高层管理制定（确保业务连续性、合规等），不定义如何实现，只定义要达到什么

- Policy:Defines what we mean to achieve, States what it means to keep the system secure, Set by higher management (business continuity, compliance)

- Doesn't define how to achieve, rather what to achieve

- 机制（Mechanisms）：实现策略的工具和技术，包括：加密、防篡改硬件、加密哈希等，初学者常只关注机制，仅是安全框架的一个方面

- Mechanisms:Machinery to implement policies

- Includes: encryption, tamper-resistant hardware, cryptographic hashes

- Beginners often focus only on mechanisms

- Only one aspect of security framework

- 保证（Assurance）：对每个机制的可靠性程度,机制如何良好地协同工作,需要专业评估常用安全机制的保证水平,当前安全的机制未来可能不安全（如量子计算威胁）

- Assurance:How much reliance on each mechanism, How well mechanisms work together,Professional estimates of assurance levels needed,Current secure mechanisms may not be secure in future

- 激励（Incentives）：系统守护者和维护者的工作动机,攻击者试图破坏策略的动机,不同业务面临不同攻击者（国家行为者、网络犯罪等）,威胁建模：理解可能威胁并优先防御机制

- Incentives:Motive of people guarding and maintaining system,Motive of attackers to defeat policy,Different attackers for different businesses,Threat modeling: understanding threats and prioritizing defenses

### 3. 安全目标 / Security Goals

- 机密性（Confidentiality）：限制谁可以访问明文形式数据的机制效果,访问控制是机密性的一种形式,包括保护秘密内容的义务,通常通过加密实现

- Confidentiality:

- Effect of mechanisms limiting who can access data in plaintext

- Access control is a form of confidentiality

- Includes obligation to protect secrets

- Commonly achieved through encryption

- 数据/消息完整性（Integrity）：允许验证者检查消息或数据是否被修改,无法有效防止传输中的修改,重要的是能够检测此类更改,防篡改证据，而非防篡改

- Data/Message Integrity:

- Allows verifier to check if message/data modified

- Cannot effectively defend against modification in transit

- Important effect is detecting changes

- Tampering-evident, not tampering-resistant

- 真实性（Authenticity）：

- 允许验证者确定消息或数据的来源

- 有效实现通常也意味着完整性

- 在加密协议中还意味着新鲜性

- 不同于认证过程

- Authenticity:

- Allows verifier to determine origin of message/data

- Effective implementation usually implies integrity

- In cryptographic protocols implies freshness

- Different from authentication process

- 其他安全目标：

- 授权：确定实体是否允许执行操作

- 问责制：确定哪个实体负责某个行动

- 不可否认性：实体不能成功否认责任

- 可否认性：能够拒绝承担责任

- 可用性：即使在攻击期间也能提供服务

- 隐私：实体决定释放或隐藏信息的权利

- Other Security Goals:

- Authorization: determine if entity allowed to execute action

- Accountability: determine which entity responsible for action

- Non-repudiation: entity cannot deny responsibility

- Deniability: capability to reject responsibility

- Availability: providing services when needed during attacks

- Privacy: entity's right to determine information release

### 4. 安全攻击类型 / Types of Security Attacks

- 被动攻击与主动攻击：

- 被动攻击：窃听或监控传输，目标是获取信息

- 主动攻击：修改数据流或创建虚假流

- 主动攻击分类：重放、伪装、消息修改、拒绝服务

- ITU-T X.800建议定义的分类

- Passive and Active Attacks:

- Passive: eavesdropping or monitoring transmissions

- Active: modification of data stream or false stream creation

- Active categories: replay, masquerade, modification, denial of service

- Classification defined in ITU-T Recommendation X.800

- 攻击向量：黑客获取未授权访问的特定方法或路径,网络钓鱼：使用欺诈性邮件窃取信息,恶意软件：设计用于损害或利用系统,中间人攻击：拦截双方通信

- Attack Vectors:

- Specific method for unauthorized access

- Phishing: fraudulent emails to steal information

- Malware: software designed to harm systems

- Person-in-the-Middle: intercept communications

### 1. 安全与可靠性工程 vs 保安工程的区别

- 可靠性工程/安全工程

- 处理可预测的问题

- 设备故障、磁盘故障、电源故障

- 可以计算故障概率

- 容易制定应对计划

- Reliability/Safety Engineering handles predictable problems:

- Equipment failures, disk failures, power failures

- Can calculate failure probabilities

- Easy to plan for these issues

- 保安工程

- 应对不可预测的威胁

- 来自智能对手的主动攻击

- 难以预测和防范

- Security Engineering deals with unpredictable threats:

- Active attacks from intelligent opponents

- Difficult to predict and mitigate

### 2. 中间人攻击 (MITM Attack)

- 定义： 攻击者潜伏在两个通信方之间，窃听或篡改数据。

- Definition: The attacker positions themselves between two communicating parties to eavesdrop on or tamper with data.

- 常见例子：

- 破解TLS加密

- 在数据线上安装窃听设备

- Common examples:

- Attacks on TLS with broken authentication

- Sniffing devices clipped into data buses

### 3. 拒绝服务攻击 (DoS Attack)

- 普通DoS攻击

- 攻击方式： 发送大量请求，耗尽服务器资源，使正常用户无法访问。

- Attack method: Sending massive requests to exhaust server resources, making the service unavailable to legitimate users.

- 分布式拒绝服务攻击 (DDoS)

- 特点：

- 从多个地点同时发起攻击

- 极难区分攻击流量和正常流量

- 常用"放大"技术（如DNS放大）

- Characteristics:

- Coordinated attacks from multiple locations

- Extremely difficult to separate attack traffic from normal traffic

- Often uses "amplification" tactics (e.g., DNS amplification)

### 4. 供应链攻击 (Supply Chain Attack)

- 攻击手法： 在可信软件或硬件中植入恶意代码。

- Attack method: Inserting malicious code into trusted software or hardware.

- 影响范围：

- 感染所有使用该产品的客户

- 一次攻击可影响成百上千个受害者

- 具有极高的"投资回报率"

- Impact scope:

- Infects all customers using the product

- One attack can affect hundreds or thousands of victims

- Highly cost-effective for attackers

- 攻击面：

- 系统中可达和可利用的漏洞,网络攻击面,软件攻击面

- 人为攻击面

- Attack Surfaces:

- Reachable and exploitable vulnerabilities,Network attack surface,Software attack surface,Human attack surface

### 5. 银行安全案例 / Bank Security Case Study

- 策略层面：

- 总体目标：正确的账户余额,多个应用程序协同运行

- 多人协同工作（巨大攻击面、内部攻击）

- 众多子目标：ATM、网上银行、银行间转账

- Policy Level:

- Overall goal: Correct account balances

- Many applications running together

- Many people working together (huge attack surface)

- Many sub-goals: ATMs, online banking, bank transfers

- 机制层面：

- 强大的记账程序和访问控制

- 异常检测系统（如异常转账）

- 四眼原则：大额转账需2+签名

- ATM使用强加密（认证）

- Mechanisms Level:

- Strong bookkeeping and access control

- Anomaly detection systems

- Four-eyes principle: 2+ signatures for large transfers

- ATMs use strong cryptography

- 保证和激励：

- 最大威胁可能是内部人员

- 加密不能防御钓鱼攻击

- 攻击者目标：在不被发现的情况下获取客户资金

- 守卫和管理员需要仔细筛选和审查

- Assurance and Incentives:

- Biggest threat probably insiders

- Cryptography doesn't defend against phishing

- Attacker goal: get customer money without detection

- Guards and admins need careful screening

### 6. 基本安全设计原则 / Fundamental Security Design Principles

- 核心原则：

- 机制经济性：设计应尽可能简单和小巧

- 故障安全默认：基于许可而非排除的访问决策

- 完全中介：每次访问都必须检查

- 开放设计：安全机制设计应公开而非秘密

- Core Principles:

- Economy of mechanism: simple and small as possible

- Fail-safe defaults: permission-based access decisions

- Complete mediation: every access must be checked

- Open design: mechanism design should be open

- 权限原则：

- 权限分离：需要多个权限属性才能访问

- 最小权限：使用完成任务所需的最小权限集

- 最少共同机制：最小化不同用户共享的功能

- 心理可接受性：不应过度干扰用户工作

- Privilege Principles:

- Separation of privilege: multiple attributes required

- Least privilege: minimal privileges necessary

- Least common mechanism: minimize shared functions

- Psychological acceptability: not interfere unduly with work

- 架构原则：

- 隔离：关键资源应与公共访问隔离

- 封装：基于面向对象功能的特定隔离形式

- 模块化：作为独立保护模块开发安全功能

- 分层：多重重叠保护方法

- 最小惊讶：以最不可能惊讶用户的方式响应

- Architecture Principles:

- Isolation: critical resources isolated from public

- Vulnerable resources such as web servers are isolated from more valued resources such as finance systems.

- Encapsulation: specific isolation based on OO functionality

- Modularity: security functions as separate modules

- Layering: multiple overlapping protection approaches

- Least astonishment: respond in least surprising way

## 2.第二周 - 可用性与心理学总结 / Week 2 - Usability & Psychology Summary

### 1. 安全可用性基础 / Usability of Security Basics

- 安全中的人为因素：

- "只有业余者攻击机器；专业人士瞄准人"

- 人是网络安全链中最薄弱的环节

- 80%-90%的安全漏洞由人为错误造成

- 理论安全性与有效安全性之间存在差距

- Human Factors in Security:"Only amateurs attack machines; professionals target people"

- People are the weakest link in the cybersecurity chain

- 80%-90% of breaches caused by human error

- Gap exists between theoretical and effective security

- 心理可接受性原则：安全机制不应使资源访问比没有该机制时更困难, 必须考虑使用者的能力、知识和心智模型, 开发者常基于自己的期望设计机制, 低门槛要求可能与高安全性目标冲突

- Principle of Psychological Acceptability:

- Security mechanism should not make resource more difficult to access

- Must consider abilities, knowledge, and mental models of users

- Developers design based on their own expectations

- Low threshold requirements can conflict with higher security goals

### 2. 人为错误分类 / Categories of Human Errors

- 技能失误（Slips and Lapses）：经常执行的动作成为技能，但可能出现失误, 例如：打错URL被钓鱼网站利用, 属于技能层面的错误, 通常是无意识的失误

- Skill-based Failures:

- Actions performed often become skills but can slip

- Example: Typo squatters exploit wrong URL entries

- Errors at the skill level

- Usually unconscious mistakes

- 规则错误（Mistakes）：遵循错误规则导致的错误

- 例如：错误地信任HTTPS或银行名称

- 属于规则层面的错误

- 选择了不适当的行动规则

- Rule-based Errors:

- Errors from following the wrong rule

- Example: Trusting HTTPS or bank name incorrectly

- Mistakes at the rule level

- Inappropriate rule selection

- 认知限制（Limitations）：

- 人们不理解问题或假装理解,属于认知层面的限制,知识或理解能力的根本限制,影响决策质量

- Cognitive Limitations:,People don't understand or pretend they do,Limitations at cognition level,Fundamental limits in knowledge or understanding, Affects decision quality

### 3. 人类心理偏见 / Biases in the Human Mind

- 前景理论与风险误判：人们厌恶损失，使用各种启发式方法做决策,"促销即将结束"比"现在购买"更有说服力

- 锚定效应：基于初始猜测进行判断

- 可得性启发：容易回忆的事物影响预测

- Prospect Theory and Risk Misperception:

- People dislike losing and use heuristics for decisions

- "Sale ends soon" more persuasive than "Get it now"

- Anchoring effect: judgment based on initial guess

- Availability heuristic: easy recall affects predictions

- 现时偏见与双曲贴现：过度重视当前回报而忽视未来

- 导致拒绝安全更新, 隐私悖论：声称重视隐私但不采取行动,忽视证书错误警告

- Present Bias & Hyperbolic Discounting:

- Stronger weight to present payoffs

- Causes decline of security updates

- Privacy paradox: say they care but don't act

- Ignore certificate error warnings

- 聚类错觉：在随机数据中看到模式的倾向,支持不合理的秩序信念,钓鱼攻击中被利用,创建虚假的熟悉感和可信度

- Clustering Illusion:

- Tendency to see patterns in random data

- Supports irrational belief in order

- Exploited in phishing attacks

- Creates false familiarity and credibility

### 4. 影响决策的技术 / Techniques to Influence Decision Making

- 六大影响技术：**互惠原则：**人们感到需要回报恩惠,**承诺与一致性：**避免认知失调,**社会认同：**寻求他人认可**,喜好偏见：**更容易服从喜欢的人**,权威尊重：**服从权威人物,**稀缺性：**害怕错过机会

- Six Influence Techniques:

- Reciprocity: need to return favors

- Commitment and consistency: avoid cognitive dissonance

- Social proof: seek approval of others

- Like bias: comply with people they like

- Authority: deference to authority figures

- Scarcity: fear of missing out

- 用户条件反射：让用户习惯于以特定方式反应,导致自动反应而不思考例如：警告对话框的"点击消除"反应,证书错误警告被忽视

- User Conditioning:

- Getting users habituated to react specifically

- Leads to automatic reactions without thinking

- Example: "click-away" response to warnings

- Certificate errors routinely ignored

### 5. 密码的可用性与安全性 / Usability and Security of Passwords

- 三大关注点：用户能否正确输入密码？用户能否记住密码？用户是否会泄露密码？

- Three Broad Concerns:

- Will user enter passwords correctly?

- Will user remember the password?

- Will user disclose the password?

- 过时的密码建议：定期更改密码（30/60/90天）→ 导致更弱的密码,复杂性规则要求 → Password123!符合但不安全,长度限制（6-12字符）→ 限制了真正的安全性,特殊字符要求 → 可预测的替换模式

- Outdated Password Advice:

- Regular password changes → leads to weaker passwords

- Complexity rules → Password123! complies but insecure

- Length restrictions (6-12 chars) → limits real security

- Special character requirements → predictable substitutions

- 现代密码方法：检查密码是否在字典中,检查是否在攻击者常用列表中,检查常见替换（4代替A，3代替E）,使用密码管理器

- Modern Password Approaches:

- Check if password in dictionary

- Check if on attacker's common list

- Check common substitutions (4 for A, 3 for E)

- Use password managers

### 6. 创建安全易记密码 / Creating Secure and Memorable Passwords

- 密码短语与骰子方法：随机选择7-12个词典单词,单词更容易记忆，可连成故事,提供合理的高安全性,缺点：打字较多

- Passphrases and Dice Method:

- Randomly choose 7-12 dictionary words

- Words easier to memorize with stories

- Provides reasonably high security

- Drawback: much typing

- 句子首字母法：选择难忘的句子，提取首字母

- 例："Wow! 62 students, all in this class" → W!62s,aitc

- 包含大小写、数字和特殊字符, 易于扩展和个性化

- Letters-from-a-Sentence:Choose memorable sentence, pick first letters Example: "Wow! 62 students, all in this class" → W!62s,aitc

- Includes upper/lower case, digits, special chars

- Easily extended and personalized

- PAO方法（人-动作-对象）：

- 使用视觉线索和不寻常意象 例：达斯·维达在珠穆朗玛峰骑小马,形成密码：DVrapoMtE!,利用视觉记忆优势

- PAO Method (Person-Action-Object):

- Uses visual cues and unusual imagery

- Example: Darth Vader riding pony on Mt Everest

- Forms password: DVrapoMtE!

- Leverages visual memory advantages

### 7. 安全的用户体验设计 / UX/UI Design for Security

- 心智模型：描述用户如何感知系统,借鉴用户生活中的相关经验,设计师可利用引导安全决策,包括可供性、约束和惯例

- Mental Models:Describe how users perceive systems, Borrow from related life experiences,Designers can steer secure decisions, Include affordance, constraints, conventions

- 设计原则：可供性：引导用户正确使用的元素, 约束：用户不能轻易做出错误选择, 惯例：可识别的元素（如暂停符号）,整合利益相关者视角

- Design Principles:

- Affordance: elements guiding correct use

- Constraints: prevent wrong choices easily

- Conventions: recognizable elements

- Integrate stakeholders' perspectives

- 社会工程防护：

- 网络钓鱼是21世纪主要策略

- 利用真实银行邮件修改URL

- 创建虚假登录窗口

- 利用社会验证和聚类错觉

- Social Engineering Protection:

- Phishing is main 21st century tactic

- Reuse genuine bank emails with changed URLs

- Create fake login windows

- Exploit social validation and clustering illusion

### 1. 访问控制总结 / Week 3 - Access Control Summary

### 1. 访问控制基础概念 / Access Control Basic Concepts

- 访问控制定义：访问控制是安全策略的重要组成部分,旨在控制对资源和资产的访问,解决诸如"银行客户能否访问银行金库"等问题,在参考框架中由策略指定，通过机制实现

- Access Control Definition:

- Access control is an important element of security policy

- Aims to control access to resources and assets

- Addresses questions like "Can a bank customer access the bank vault?"Specified in policy within reference framework, implemented by mechanisms

- 核心概念：

- 认证（Authentication）：获取另一方身份证据的过程,授权（Authorization）：向一方分配特权的过程,主体（Subjects）：人、组、进程等,对象（Objects）：文件、进程等资源

- Core Concepts:

- Authentication: Process of acquiring evidence of identity

- Authorization: Allocation of privilege to a party

- Subjects: People, groups, processes, etc.

- Objects: Files, processes, and other resources

### 2. 访问控制类型 / Access Control Types

- 自主访问控制（DAC）：

- 基于对象所有者的身份进行访问控制,主体可以将其对象的权限传递给其他主体,提供高度灵活性,由主体控制权限分配

- 任何有实际访问计算机权限的人都可以控制计算机的一切： anyone with physical access to a computer controlled all of it

- Discretionary Access Control (DAC):

- Access based on identity of owning subject

- Subjects can pass privileges to other subjects

- High level of flexibility

- Much control by subjects

- 强制访问控制（MAC）：由外部实体（安全策略管理员）定义访问权限,通过"安全内核"检查安全属性,确定主体是否允许与对象交互,提供高度严格性

- Mandatory Access Control (MAC):

- External entity (security policy administrator) defines access

- 'Security kernel' checks via security attributes

- Determines if subject allowed to interact with object

- High level of rigour

### 3. 操作系统访问控制 / Operating System Access Control

- 访问控制列表（ACLs）：定义主体对对象的访问权限,对象与ACL关联,ACL条目包含用户ID和操作映射,在所有UNIX系统和Windows中普遍存在

- Access Control Lists (ACLs):

- Define access of subjects to objects

- Objects associated with ACL

- Entry contains user ID with mapping to operations

- Common in all UNIX systems and Windows

- Unix/Linux文件权限：每个用户有UID和GID,文件权限分为所有者、组和其他用户,读/写/执行（R/W/X）三种基本权限

- 特殊权限位：SUID、SGID、粘滞位

- Unix/Linux File Permissions:

- Each user has UID and GID

- File permissions for owner, group, and others

- Read/Write/Execute (R/W/X) basic permissions

- Special permission bits: SUID, SGID, Sticky bit

### 4. 移动操作系统访问控制 / Mobile OS Access Control

- iOS访问控制：

- 多种用户权限，主要用于隐私保护

- 传感器值只读（Biba模型）

- 硬件支持和签名软件

- 应用沙箱：应用无法访问其他应用的文件

- iOS Access Control:

- Many user permissions, often for privacy

- Read-only for sensor values (Biba model)

- Hardware support and signed software

- App sandboxing: apps cannot access files of other apps

- Android访问控制：

- 类似的权限系统但支持多种硬件平台

- 存储权限问题：应用内部和公共存储

- 更宽松的API（如应用可代发短信）

- Google Play商店控制不如Apple严格

- Android Access Control:

- Similar permission system supporting various hardware

- Storage issues: app-internal and public storage

- More permissive API (e.g., apps can send SMS)

- Google Play Store less tightly controlled than Apple's

### 5. 中间件访问控制 / Middleware Access Control

- 中间件特点：¥

- 可以在同一主机或分布式系统上

- 包括消息代理、RPC等

- 巨大的复杂性，容易配置错误

- 建议保护中间件免受外部访问

- Middleware Characteristics:

- Can be on same host or distributed

- Includes message brokers, RPCs

- Huge complexity, easily misconfigured

- Protect middleware from external access if possible

- 数据库访问控制：

- DBMS有自己的访问控制机制

- 需要用户名和密码连接

- SQL标准定义细粒度访问控制方法

- 还允许特定的完整性控制

- Database Access Control:

- DBMSes have their own access control

- Requires username and password to connect

- SasQL standard defines fine-grained access control

- Also allows specific integrity controls

### 6. 沙箱和虚拟化 / Sandboxing and Virtualization

- 沙箱技术：

- 屏蔽环境防止恶意应用干扰

- 提供有限的API进行交互

- 例如：Java applets、浏览器中的JavaScript

- 问题：沙箱可能被突破

- Sandboxing:

- Shielded environment preventing malicious interference

- Provides limited API for interaction

- Examples: Java applets, JavaScript in browser

- Problem: sandbox can be broken out of

- 虚拟化技术：

- 虚拟机模拟计算机系统

- 不同程度：完全虚拟化、准虚拟化、容器

- 管理程序在ring -1中管理VM

- 提高攻击者的攻击难度

- Virtualization:

- VMs emulate computer systems

- Varying degrees: full, para-virtualization, containers

- Hypervisor manages VMs in ring -1

- Raises the bar for attackers

### 7. 硬件访问控制 / Hardware Access Control

- 内存保护：CPU支持进程内存分配隔离，段寻址：使用段寄存器和地址寄存器，分段错误：访问地址空间外内存时触发，保护读和写操作

- Memory Protection:

- CPUs support keeping processes' memory apart

- Segment addressing: segment and address registers

- Segmentation fault: raised on invalid memory access

- Protects both read and write operations

- 特权执行：

- CPU具有分层模式（环）

- 不同特权类别的环分离

- Intel现代CPU有9个环

- ARM有独立的特权寄存器

- Privileged Execution:

- CPUs have layered modes (rings)

- Rings separated with different privilege classes

- Modern Intel CPUs have 9 rings

- ARM has separate registers with different privileges

### 8. 安全策略模型 / Security Policy Models

- Bell-LaPadula模型：

- 经典的多级安全（MLS）策略模型

- 不能向上读（No read up）：简单安全属性

- 不能向下写（No write down）：*-属性

- 侧重于机密性，结合DAC和MAC

- Bell-LaPadula Model:

- Classic security policy model for MLS

- No read up: Simple Security property

- No write down: *-property

- Focuses on confidentiality, combines DAC and MAC

- Biba模型：

- 解决完整性而非机密性问题

- 只能向上读：仅读取自己级别或更高级别的数据

- 只能向下写：仅写入自己级别或更低级别的数据

- 调用属性：不能获取更高级别对象的访问权限

- Biba Model:

- Addresses integrity, not confidentiality

- Read up: only read data at own level or higher

- Write down: only write data at own level or lower

- Invocation property: cannot obtain access to higher level objects

### 9. Docker容器技术 / Docker Container Technology

- Docker特点：

- 最初用于持续集成和交付（CI/CD）

- 对容器的抽象层

- 快速启动和删除，资源占用少

- Docker守护进程以root权限运行

- Docker Features:

- Initial use case: continuous integration and delivery

- Abstraction over containers

- Fast to spin up and delete, easy on resources

- Docker daemon runs as root

- 安全性考虑：

- 应用在容器中被沙箱化

- 容器间应用无法通信

- 虽非为访问控制设计，但提供额外隔离

- 提高了攻击难度

- Security Considerations:

- Apps sandboxed in containers

- Apps cannot communicate across containers

- While not designed for access control, provides separation

- Raises the bar for attacks

### 10. 关键要点 / Key Takeaways

- 访问控制包 含认证、授权和权限管理三个核心要素,DAC提供灵活性，MAC提供严格性，实际系统常结合使用,操作系统通过ACL、文件权限和进程隔离实现访问控制,硬件支持（内存保护、CPU环）是访问控制的基础,Bell-LaPadula关注机密性，Biba关注完整性现代系统采用多层防御，结合OS、中间件和硬件保护

- Access control encompasses authentication, authorization, and privilege management

- DAC provides flexibility, MAC provides rigour, real systems often combine both

- Operating systems implement access control through ACLs, file permissions, and process isolation

- Hardware support (memory protection, CPU rings) forms the foundation of access control

- Bell-LaPadula focuses on confidentiality, Biba focuses on integrity

- Modern systems employ defense in depth, combining OS, middleware, and hardware protections

### 4.对称密码学总结 / Symmetric Cryptography Summary

### 1. 密码学基础概念 / Cryptography Basic Concepts

- 密码学定义：

- 密码学是安全传输数据的科学，包括空间和时间两个维度

- 空间维度：在物理距离上传输

- 时间维度：数据在未来长时间内保持安全

- 主要关注：机密性、完整性、认证

- Cryptography Definition:

- The science of securely transmitting data, spatially and temporally

- Spatially: over a physical distance

- Temporally: data stays secure long into the future

- Main concerns: Confidentiality, Integrity, Authentication

- 基本组成要素：明文：未加密的原始数据,加密：使用密码函数和密钥对明文编码,密文：加密的结果,解密：使用解密函数和密钥解码密文

- Basic Components:

- Plaintext: non-encrypted, unprotected data

- Encryption: encode plaintext using cipher function and key

- Ciphertext: the outcome of encryption

- Decryption: decode ciphertext using decipher function and key

### 2. Kerckhoff原则 / Kerckhoff's Principle

- 原则内容：密码系统的安全性必须仅依赖于密钥的安全性

- 而不依赖于算法或其他任何东西的保密性,密码机制通常公开披露，经过公开竞争产生,多专家分析能更快发现机制的弱点

- Principle Content:

- Security must depend only on the security of cryptographic keys

- Never on the mechanism or anything else being secret

- Cryptographic mechanisms are usually publicly disclosed

- Many experts analyzing can find weaknesses faster

### 3. 历史密码 / Historical Ciphers

- 凯撒密码单字母替换密码的特例,每个字母简单地移位n个位置,保留了自然语言的字母频率特征,容易通过频率分析破解

- Caesar Cipher:

- Special case of monoalphabetic substitution

- Every letter shifted by n positions

- Preserves natural language letter frequency

- Easy to break through frequency analysis

- 维吉尼亚密码：使用关键词进行多字母替换,对每个关键词字母使用不同的移位值,可通过Kasiski测试或Friedman测试破解,寻找重复模式确定密钥长度

- Vigenère Cipher:

- Uses keyword for polyalphabetic substitution

- Different shift value for each keyword letter

- Can be broken using Kasiski test or Friedman test

- Find repeated patterns to determine key length

### 4. 现代密码设计目标 / Modern Cipher Design Goals

- 扩散（Diffusion）：模糊明文中的统计特征,每个密文符号必须依赖多个明文符号,明文中一位翻转应改变密文的一半位

- Diffusion:

- Blur statistically significant characteristics in plaintext

- Every ciphertext symbol must depend on many plaintext symbols, A bit flip in plaintext should change half the ciphertext bits

- 混淆（Confusion）：模糊密文和密钥之间的依赖关系,密文中的每个符号必须依赖密钥中的多个符号,使密钥和密文的关系尽可能复杂

- Confusion:Blur dependency between ciphertext and key

- Each symbol in ciphertext must depend on several symbols in key

- Make relationship between key and ciphertext as complex as possible

### 5. 一次性密码本（OTP）/ One-Time Pad

- 完美安全性条件：密钥必须真正随机,密钥长度至少等于明文长度,密钥绝不能重复使用，即使部分也不行,满足条件时提供完美安全性

- Perfect Security Conditions:

- Key must be truly random

- Key length at least as long as plaintext

- Key never used twice, not even in part

- Provides perfect security when conditions met

- 实际限制：条件通常太难实现

- 只在极高价值场合使用（如红色电话），对大多数应用不实用

- Practical Limitations:

- Conditions usually too hard to achieve

- Used only in extremely high-value situations (e.g., red telephone)

- Impractical for most applications

### 6. 流密码和分组密码 / Stream and Block Ciphers

- 流密码：

- 从密钥生成密钥流

- 使用伪随机函数产生密钥流

- 通过XOR操作结合明文和密钥流

- 挑战：密钥流必须尽可能不可预测

- Stream Ciphers:

- Generate keystream from secret key

- Use pseudo-random functions to generate keystream

- Combine plaintext and keystream using XOR

- Challenge: keystream must be as unpredictable as possible

- 分组密码：

- 通过S盒实现替换

- 通过P盒实现置换

- 多轮执行以改善扩散和混淆

- 使用Feistel网络或SPN结构

- Block Ciphers:

- Substitution implemented via S-boxes

- Permutation implemented via P-boxes

- Multiple rounds to improve diffusion and confusion

- Use Feistel network or SPN structure

### 7. DES和3DES / DES and 3DES

- DES特性：

- 1977年发布，1979年标准化，56位密钥，16轮Feistel结构，使用8个S盒和1个P盒，现已不安全（密钥太短）

- DES Characteristics:

- Published in 1977, standardized in 1979

- 56-bit key, 16-round Feistel structure

- Uses 8 S-boxes and 1 P-box

- No longer secure (key too short)

- 3DES改进：

- 作为DES的替代品

- 168位密钥，无暴力破解风险

- 使用2个或3个密钥

- 执行三次DES操作

- 3DES Improvements:

- Purpose: DES replacement

- 168-bit key, no brute-force attack

- Has 2 or 3 keys

- Performs three DES operations

### 8. 高级加密标准（AES）/ Advanced Encryption Standard

- AES特点：当前互联网上的事实标准分组密码,通过公开竞争选出（Rijndael算法）,支持128、192、256位密钥长度,使用有限域GF(2^8)上的算术运算

- AES Features:

- Current de-facto block cipher on Internet

- Chosen in open competition (Rijndael algorithm)

- Supports 128, 192, 256-bit key lengths

- Uses arithmetic in finite field GF(2^8)

- AES轮函数操作：字节替换（SubBytes）：使用S盒进行字节替换,行移位（ShiftRows）：简单的置换操作,列混合（MixColumns）：使用GF(2^8)上的算术,轮密钥加（AddRoundKey）：与扩展密钥进行XOR

- AES Round Operations:

- SubBytes: Byte-by-byte substitution using S-box

- ShiftRows: Simple permutation

- MixColumns: Uses arithmetic over GF(2^8)

- AddRoundKey: Simple bitwise XOR with expanded key

### 9. 分组密码模式 / Block Cipher Modes

- 电子密码本模式（ECB）：最简单但不安全的模式,相同明文块产生相同密文块,不推荐使用（除教学外）

- Electronic Codebook (ECB):

- Simplest but insecure mode

- Same plaintext blocks produce same ciphertext blocks

- Not recommended (except for teaching)

- 密码块链接模式（CBC）：每个明文块与前一个密文块XOR后加密,需要初始化向量（IV）,提供更好的安全性

- Cipher Block Chaining (CBC):

- Each plaintext block XORed with previous ciphertext before encryption

- Requires initialization vector (IV)

- Provides better security

- 其他模式：密码反馈模式（CFB）,输出反馈模式（OFB）,计数器模式（CTR）,认证加密模式（GCM、CCM）

- Other Modes:

- Cipher Feedback Mode (CFB)

- Output Feedback Mode (OFB)

- Counter Mode (CTR)

- Authenticated Encryption modes (GCM, CCM)

### 10. 伪随机数生成器 / Pseudorandom Number Generators

- 密码学安全的PRNG（CSPRNG）要求：,计算上不可行暴力破解种子值,输出序列与真随机不可区分,攻击者唯一选择是知道种子

- CSPRNG Requirements:

- Computationally infeasible to brute-force seed value

- Output sequence indistinguishable from true randomness

- Only option for attacker is to know the seed

- 应用场景：密钥分发和相互认证方案,会话密钥生成,RSA公钥加密算法的密钥生成,对称流加密的比特流生成

- Applications:

- Key distribution and reciprocal authentication schemes

- Session key generation

- Key generation for RSA public-key encryption

- Bit stream generation for symmetric stream encryption

### 1. 非对称密码学总结 / Asymmetric Cryptography Summary

### 1. 公钥密码学基础 / Public-Key Cryptography Basics

公钥密码学原理：

范式转变：每个参与者有一对密钥（公钥和私钥）

任何人都可使用接收者的公钥加密消息

只有拥有私钥的接收者能解密

也称为非对称密码学

基于具有特定性质的数学难题

Public-Key Cryptography Principles:

Paradigm shift: Each participant has a key pair (public and private key)

Anyone can encrypt messages using receiver's public key

Only receiver with private key can decrypt

Also known as asymmetric cryptography

Based on mathematical problems with specific properties

应用领域：加密/解密：保护数据机密性，数字签名：提供认证和不可否认性，密钥交换：安全建立共享密钥

主要算法：RSA、Diffie-Hellman、椭圆曲线、DSS

Application Areas:

Encryption/Decryption: Protect data confidentiality

Digital Signatures: Provide authentication and non-repudiation

Key Exchange: Securely establish shared keys

Main algorithms: RSA, Diffie-Hellman, Elliptic Curve, DSS

### 2. 陷门函数性质 / Trapdoor Function Properties

陷门函数要求：

计算函数值f(x) = y必须快速，计算逆函数f^(-1)(y) = x计算上不可行，除非拥有特殊信息（陷门信息）

推论：从公钥计算私钥必须计算上不可行

Trapdoor Function Requirements:

Computing function value f(x) = y must be fast

Computing inverse f^(-1)(y) = x must be computationally infeasible

Unless possessing special information (trapdoor information)

Corollary: Computing private key from public key must be computationally infeasible

经典陷门问题：离散对数问题：在模p下计算离散对数计算上不可行（Diffie-Hellman）RSA问题：在模n下计算e次根计算上不可行

两个问题都具有"有额外信息就容易计算"的性质

Classic Trapdoor Problems:

Discrete Logarithm Problem: Computing discrete logarithm modulo p is computationally infeasible (Diffie-Hellman)

RSA Problem: Computing e-th root modulo n is computationally infeasible

Both problems become easy with additional information

### 3. RSA密码系统 / RSA Cryptosystem

RSA密钥生成：选择两个大素数p和q，p ≠ q

计算n = p × q，φ(n) = (p-1)(q-1),选择公钥指数e，满足1 < e < φ(n)，gcd(e,φ(n)) = 1,计算私钥d，满足d ≡ e^(-1) mod φ(n), 公钥：(n, e)；私钥：(n, d)

RSA Key Generation:

### 1. Choose two large primes p and q, p ≠ q

### 1. Calculate n = p × q, φ(n) = (p-1)(q-1)

### 1. Choose public exponent e, where 1 < e < φ(n), gcd(e,φ(n)) = 1

Calculate private key d, where e✖d mod φ(n) = 1

Public key: (n, e); Private key: (n, d)

RSA加密解密：

加密：c ≡ m^e mod n，解密：m ≡ c^d mod n，只能加密Z/nZ中的数字，需要字符到数字的映射

RSA Encryption/Decryption:

Encryption: c ≡ m^e mod n

Decryption: m ≡ c^d mod n

Can only encrypt numbers in Z/nZ

Requires character-to-number mapping

### 4. RSA安全性 / RSA Security

安全基础：

在Z/nZ中获取e次根计算上不可行（除非知道d）

对大素数p和q，分解n=pq计算上不可行

p和q必须非常大（RSA密钥长度：2048位及以上）

p和q不能太接近（避免快速分解）

Security Foundation:

Obtaining e-th root in Z/nZ is computationally infeasible (unless knowing d)

Factoring n=pq for large primes is computationally infeasible

p and q must be very large (RSA key length: 2048 bits and above)

p and q must not be too close (avoids fast factoring)

五种攻击方式：

暴力破解：尝试所有可能的私钥，数学攻击：等价于因数分解的各种方法，时序攻击：依赖解密算法的运行时间，硬件故障攻击：在处理器中诱导硬件故障，选择密文攻击：利用RSA算法的性质（如可塑性）

Five Attack Approaches:

Brute force: Try all possible private keys

Mathematical attacks: Various methods equivalent to factorization

Timing attacks: Depend on decryption algorithm runtime

Hardware fault-based attacks: Induce hardware faults in processor

Chosen ciphertext attacks: Exploit RSA algorithm properties (e.g., malleability)

### 5. RSA填充的必要性 / Necessity of RSA Padding

不使用填充的问题：

可塑性：攻击者可预测性修改密文（如将c变为c×2^e mod n）

无语义安全：攻击者可预先计算可能的消息并匹配密文

确定性加密使选择明文攻击成为可能

缺乏随机性

Problems Without Padding:

Malleability: Attacker can make predictable changes to ciphertext (e.g., change c to c×2^e mod n)

No semantic security: Attacker can pre-compute likely messages and match ciphertext

Deterministic encryption enables chosen plaintext attacks

Lack of randomness

解决方案：使用复杂填充方案增加随机性，现代标准：OAEP（最优非对称加密填充）填充至关重要但实现不简单 永远不要在生产环境中自己实现RSA

Solution:Use sophisticated padding schemes to add randomness

Modern standard: OAEP (Optimal Asymmetric Encryption Padding)

Padding is crucial but non-trivial

Never implement RSA yourself for production

------------------------------------------------------

RSA Malleability Principle

RSA malleability refers to the property that if we have ciphertext c = m^e mod n, then for any integer k, the ciphertext c' = c × k^e mod n corresponds to plaintext m' = m × k mod n.

Calculation Steps

Step 1: Construct New Ciphertext

Given:Original ciphertext: c = 28

Multiplier: k = 4， Public key: (e, n) = (7, 33)

Calculate k^e mod n = 4^7 mod 33:

Therefore: 4^7 ≡ 16 (mod 33)

New ciphertext:

c' = c × k^e mod n = 28 × 16 mod 33 = 448 mod 33 = 448 - 13×33 = 448 - 429 = 19

Step 2: Decrypt New Ciphertext

m' = (c')^d mod n = 19^3 mod 33

Calculate 19^3: 19^2 = 361 ≡ 361 - 10×33 = 361 - 330 = 31 (mod 33)     19^3 = 19 × 31 = 589 ≡ 589 - 17×33 = 589 - 561 = 28 (mod 33)

Therefore: m' = 28

Step 3: Verify Malleability Relationship

Check: m' = m × k mod n

m × k mod n = 7 × 4 mod 33 = 28 mod 33 = 28 ✓

Calculated result: m' = 28 ✓

Verification successful!

### 6. 混合加密 / Hybrid Encryption

为什么需要混合加密：

问题1：公钥密码学速度慢（RSA比AES慢100-1000倍）

问题2：需要数字到字符的映射才实用

解决方案：使用公钥密码学建立对称密钥

Why Hybrid Encryption:

Problem 1: Public-key cryptography is slow (RSA is 100-1000 times slower than AES)

Problem 2: Need number-to-character mapping to be useful

Solution: Use public-key crypto to establish symmetric keys

混合加密流程：生成随机对称密钥k

使用对称密钥加密消息：c_m = Enc_k(m)

使用接收者公钥加密对称密钥：c_k = Enc_PK(k)

发送(c_k, c_m)

Hybrid Encryption Process:

Generate random symmetric key k

Encrypt message with symmetric key: c_m = Enc_k(m)

Encrypt symmetric key with receiver's public key: c_k = Enc_PK(k)   Send (c_k, c_m)

### 7. Diffie-Hellman密钥交换 / Diffie-Hellman Key Exchange

DH协议流程

### 1.计算交换的公开值 公开参数：大素数p=23和生成元g=5

Alice选择秘密值a=6，计算X = g^a mod p，发送X

X = g^a mod p = 5^6 mod 23=8

Bob选择秘密值b=15，计算Y = g^b mod p，发送Y

Y = g^b mod p = 5^15 mod 23=19

### 2.计算共享密钥Alice计算k = Y^a mod p= 19^6 mod 23=2

Bob计算k = X^b mod p=8^15 mod 23=2

双方得到相同密钥k = g^(ab) mod p= 5^(6×15) mod 23 = 5^90 mod 23

DH Protocol Flow:

### 1. Public parameters: Large prime p and generator g

Alice chooses secret a, computes X = g^a mod p, sends X

Bob chooses secret b, computes Y = g^b mod p, sends Y

### 1. Alice computes k = Y^a mod p

Bob computes k = X^b mod p

Both obtain same key k = g^(ab) mod p

安全性基础：

离散对数问题：从X、p、g计算a计算上不可行，需要解决离散对数问题：找到a使得 5^a ≡ 8 (mod 23)同样，要从Y = 19计算出b，需要解决：找到b使得 5^b ≡ 19 (mod 23)

攻击者无法在不知道a或b的情况下计算k

前提：p必须非常大

Security Foundation:

Discrete Logarithm Problem: Computing a from X, p, g is computationally infeasible

Attacker cannot compute k without knowing a or b

Prerequisite: p must be very large

### 8. 中间人攻击 / Person-in-the-Middle Attack

攻击过程：

攻击者截获Alice和Bob的通信

选择自己的秘密值c和d

向Alice发送X' = g^c mod p，向Bob发送Y' = g^d mod p

X' = g^c mod p = 2^7 mod 29 = 128 ≡ 128 - 4×29 = 128 - 116 = 12

Y' = g^d mod p = 2^10 mod 29 = 2^8 × 2^2 = 24 × 4 = 96 ≡ 96 - 3×29 = 96 - 87 = 9

与Alice建立密钥k1，与Bob建立密钥k2

Alice计算  k₁ = (X')^a mod p = 12^5 mod 29=12

Eve也计算 k₁ = X^c mod p = 3^7 mod 29=12

Bob计算：k₂ = (Y')^b mod p = 9^12 mod 29=24

Eve也计算：k₂ = Y^d mod p = 7^10 mod 29=24

可以解密、修改并重新加密所有通信

Attack Process:

Attacker intercepts communication between Alice and Bob

Chooses own secret values c and d

Sends X' = g^c mod p to Alice, Y' = g^d mod p to Bob

Establishes key k1 with Alice, key k2 with Bob

Can decrypt, modify, and re-encrypt all communication

防御措施：

密钥交换协议缺乏参与者认证

解决方案：数字签名和公钥证书，需要可信第三方或PKI基础设施

Defense Measures:

Key exchange protocol lacks participant authentication

Solution: Digital signatures and public-key certificates

Requires trusted third party or PKI infrastructure

### 9. 椭圆曲线密码学（ECC）/ Elliptic Curve Cryptography (ECC)

ECC Basics:

Based on elliptic curve equation: y² = x³ + ax + b

Can define elliptic curves over finite fields

Define group operations on curve points

Elliptic curve discrete logarithm problem harder than modular arithmetic

ECC Advantages:

Shorter key lengths (about 300-500 bits)

Better performance at same security level

Suitable for resource-constrained environments

Widely adopted in modern cryptographic systems

### 10. 后量子密码学 / Post-Quantum Cryptography

量子计算威胁：

Shor算法可高效分解大数和计算离散对数

RSA、Diffie-Hellman、ECC将变得脆弱

Grover算法对对称密码提供二次加速

对称密钥的有效安全级别减半

Quantum Computing Threats:

Shor's algorithm can efficiently factor large numbers and compute discrete logarithms

RSA, Diffie-Hellman, ECC will become vulnerable

Grover's algorithm provides quadratic speedup for symmetric ciphers

Effective security level of symmetric keys is halved

应对策略：

对称密码：加倍密钥长度（256位提供128位安全性）

后量子密码学：基于格、编码、哈希的密码系统

正在标准化新的抗量子算法

过渡期需要混合使用经典和后量子算法

Countermeasures:

Symmetric crypto: Double key sizes (256-bit provides 128-bit security)

Post-quantum cryptography: Lattice-based, code-based, hash-based systems

New quantum-resistant algorithms being standardized

Transition period requires hybrid use of classical and post-quantum algorithms

6 密码学哈希与数字签名总结 / Cryptographic Hashes and Digital Signatures Summary

### 1. 密码学哈希函数 / Cryptographic Hash Functions

哈希函数基础：

目标是确保消息完整性，验证接收的消息与发送的消息相同

将可变长度输入转换为固定长度输出 h = H(M)

也称为消息摘要（digest）

常见函数：SHA-2、SHA-3、RIPEMD160（MD5和SHA1已不安全）

Hash Function Basics:

Goal is to ensure message integrity, verify received message is same as sent

Converts variable-length input to fixed-length output h = H(M)

Also called message digest

Common functions: SHA-2, SHA-3, RIPEMD160 (MD5 and SHA1 no longer secure)

应用场景：

消息认证：验证消息完整性

数字签名：使用私钥加密哈希值

密码存储：单向密码文件

入侵检测和病毒检测

构建伪随机函数（PRF）或伪随机数生成器（PRNG）

Applications:

Message authentication: Verify message integrity

Digital signatures: Encrypt hash value with private key

Password storage: One-way password files

Intrusion detection and virus detection

Construct pseudorandom functions (PRF) or pseudorandom number generators (PRNG)

### 2. 安全要求 / Security Requirements

抗原像性（Pre-image Resistance）：

给定哈希值y，计算上不可行找到输入x使得H(x) = y

防止攻击者从哈希值反推原始输入

并非不可能，但计算上不可行使其在实践中太困难

Pre-image Resistance:

Given hash value y, computationally infeasible to find input x such that H(x) = y

Prevents attacker from deriving original input from hash value

Not impossible, but computational infeasibility makes it too hard in practice

抗第二原像性（Second Pre-image Resistance）：

给定输入x，计算上不可行找到另一个输入x'使得H(x) = H(x')

防止攻击者找到产生相同哈希值的替代输入

保护已知消息不被替换

Second Pre-image Resistance:

Given input x, computationally infeasible to find another input x' such that H(x) = H(x')

Prevents attacker from finding alternative input with same hash value

Protects known messages from being replaced

抗碰撞性（Collision Resistance）：

计算上不可行找到任意两个不同输入x和x'使得H(x) = H(x')

抗碰撞性蕴含抗第二原像性（但不蕴含抗原像性）

生日攻击：n位输出需要2^(n/2)次尝试有50%概率找到碰撞 例如，若n = 64，只需约2^32次尝试。

Collision Resistance:

Computationally infeasible to find any pair (x, x') where x ≠ x' such that H(x) = H(x')

Collision resistance implies second pre-image resistance (but not pre-image resistance)

Birthday attack: n-bit output needs 2^(n/2) attempts for 50% chance of collision  For instance, if n = 64, then 2^32 attempts suffice.

### 3. 安全哈希算法（SHA）/ Secure Hash Algorithm (SHA)

SHA-2系列：

包括SHA-224、SHA-256、SHA-384、SHA-512

SHA-512：处理最大长度小于2^128位的输入，输出512位摘要

以1024位块处理输入，使用64位字，执行80轮运算

广泛应用于TLS/SSL、SSH、IPSec等安全协议

SHA-2 Family:

Includes SHA-224, SHA-256, SHA-384, SHA-512

SHA-512: Processes input up to 2^128 bits, outputs 512-bit digest

Processes input in 1024-bit blocks, uses 64-bit words, performs 80 rounds

Widely implemented in security protocols like TLS/SSL, SSH, IPSec

SHA-3系列：

内部结构不同于SHA-1和SHA-2

使用海绵结构（sponge construction）：吸收阶段和挤压阶段

具有比特率r（块大小）和容量c参数

2015年由NIST发布的最新SHA家族成员

SHA-3 Family:

Internally different from SHA-1 and SHA-2

Uses sponge construction: absorbing phase and squeezing phase

Has bitrate r (block size) and capacity c parameters

Latest SHA family member released by NIST in 2015

### 4. 消息认证码（MAC）/ Message Authentication Codes (MAC)

MAC概念：需要Alice和Bob共享密钥的特殊标签, 创建MAC标签t，使攻击者无法为不同消息找到有效的MAC, 必须具有密码学哈希函数的抗性属性, 即使知道其他(m,t)组合，也计算不可行预测新消息的正确MAC

MAC Concept:

Special tags requiring Alice and Bob to share a secret key

Creates MAC tag t such that attacker cannot find valid MAC for different message

Must have resistance properties of cryptographic hash functions

Computationally infeasible to predict correct MAC for new message even knowing other (m,t) pairs

HMAC结构：

公式：HMAC(k,m) = H((k⊕opad) || H((k⊕ipad) || m))

H可以是任何密码学哈希函数：SHA-3、SHA-2等

ipad和opad是公开已知的常量位串

是最常见的MAC形式

HMAC Structure:

Formula: HMAC(k,m) = H((k⊕opad) || H((k⊕ipad) || m))

H can be any cryptographic hash function: SHA-3, SHA-2, etc.

ipad and opad are publicly known constant bit strings

Most common form of MACs

### 5. 认证加密（AE/AEAD）/ Authenticated Encryption (AE/AEAD)

四种方法：先哈希后加密：发送Enc_k(m, H(m))，先MAC后加密：发送Enc_k1(m, MAC_k2(m))，用于SSL/TLS

先加密后MAC：发送Enc_k1(m), MAC_k2(Enc_k1(m))，用于IPSe，独立加密和认证：发送Enc_k1(m), MAC_k2(m)，用于SSH

Four Approaches:

Hash then encrypt: send Enc_k(m, H(m))   首先对明文生成MAC，再将明文与MAC一起加密。该结构用于TLS协议，但容易因实现失误而出错。

A Message Authentication Code (MAC) is computed on the plaintext first, and then both the plaintext and the MAC are encrypted together. This method is used in protocols like TLS but is prone to implementation mistakes.

MAC then encrypt: send Enc_k1(m, MAC_k2(m)), used in SSL/TLS2. 先加密再MAC (Encrypt-then-MAC)

先对明文加密，然后对密文生成MAC。该结构被用于IPSec协议，被认为是最安全的方式，因为可在解密前验证完整性。The message is first encrypted, and a MAC is then calculated over the ciphertext. This construction, used in IPSec, is considered the most secure because the integrity check can be performed before decryption.

Encrypt then MAC: send Enc_k1(m), MAC_k2(Enc_k1(m)) , used in IPSec 并行MAC加密 (MAC-and-Encrypt) 明文分别进行认证与加密。这种方式被SSH协议采用，支持并行处理并具备一定灵活性。The plaintext is authenticated and encrypted independently. Used in SSH, this method supports parallel processing and flexibility.

Encrypt and MAC: send Enc_k1(m), MAC_k2(m), used in SSH。4. 哈希后加密 (Hash-then-Encrypt)先计算消息的哈希值再加密。此方法较少使用，但在某些场景下仍然有效。A hash is computed on the message and then the result is encrypted. This method is less commonly used but still valid in some contexts.

常见AEAD模式：

CCM（Counter with CBC-MAC）：为IEEE 802.11 WiFi设计，GCM（Galois/Counter Mode）：可并行化，高吞吐量低延迟，允许在加密同时计算MAC，GCM是当前最强的块模式，但实现细节很脆弱

Common AEAD Modes:

CCM (Counter with CBC-MAC): Designed for IEEE 802.11 WiFi

GCM (Galois/Counter Mode): Parallelizable, high throughput with low latency

Allows computing MAC in parallel to encryption

GCM is currently strongest block mode but brittle in implementation

### 6. 数字签名 / Digital Signatures

数字签名原理：

使用公钥密码学实现类似MAC的功能, Bob用私钥加密消息哈希值：Sig_B(m) = Enc_kd,B(h(m)), 任何知道Bob公钥的人都可以验证签名, 攻击者需要知道私钥才能篡改消息

Digital Signature Principles:

Achieves MAC-like functionality using public-key cryptography

Bob encrypts message hash with private key: Sig_B(m) = Enc_kd,B(h(m))

Anyone knowing Bob's public key can verify the signature

Attacker needs private key to alter the message

数字签名算法：

使用安全哈希算法（SHA）仅提供数字签名功能，不能用于加密或密钥交换,包括DSA（数字签名算法）和ECDSA（椭圆曲线DSA）,是公钥密码学最重要的发展之一

Digital Signature Algorithms:

Uses Secure Hash Algorithm (SHA)

Provides only digital signature function, cannot be used for encryption or key exchange

Includes DSA (Digital Signature Algorithm) and ECDSA (Elliptic Curve DSA)

Most important development from work on public-key cryptography

SSH (Secure Shell) 是一种网络协议，用于在不安全的网络上提供安全的远程登录和其他网络服务。它通过加密技术确保数据传输的机密性和完整性。

SSH (Secure Shell) is a network protocol that provides secure remote login and other network services over an insecure network. It ensures confidentiality and integrity of data transmission through encryption.

### 1. 认证与密钥分发总结 / Authentication and Key Distribution Summary

### 1. 密钥分发问题 / Key Distribution Problem

Boyd定理：

在没有安全信道的情况下，两个实体无法建立认证会话

除非存在一个可以在两者之间进行中介的实体

双方都必须信任该实体并与其有安全信道

这解释了为什么需要可信第三方

Boyd's Theorem:

Two entities cannot establish an authenticated session without a secure channel

Unless there exists an entity that can mediate between them

Both parties must trust this entity and have secure channels with it

This explains why trusted third parties are necessary

密钥分发选项：

无第三方：物理安全运输密钥（昂贵且不可扩展）

有第三方：密钥分发中心（KDC）用于对称密钥

有第三方：公钥基础设施（PKI）用于非对称密钥

Key Distribution Options:

Without third party: Physical secure shipment of keys (expensive and not scalable)

With third party: Key Distribution Centers (KDC) for symmetric keys

With third party: Public Key Infrastructure (PKI) for asymmetric keys

### 2. 对称密钥分发 / Symmetric Key Distribution

使用对称加密的密钥分发：

基于密钥层次结构：主密钥和会话密钥

主密钥：KDC与终端系统共享，通过非密码学方式分发

会话密钥：用于终端系统间通信，使用主密钥加密传输

Needham-Schroeder协议是经典实现

Key Distribution Using Symmetric Encryption:

Based on key hierarchy: master keys and session keys

Master key: Shared between KDC and end systems, distributed non-cryptographically

Session key: For communication between end systems, transmitted encrypted with master key

Needham-Schroeder protocol is the classic implementation

使用非对称加密的密钥分发：

解决中间人攻击问题,使用公钥加密对称密钥,结合随机数（nonce）确保新鲜性,提供机密性和认证

Key Distribution Using Asymmetric Encryption:

Solves person-in-the-middle attack problem

Uses public key to encrypt symmetric keys

Combines with nonces to ensure freshness

Provides confidentiality and authentication

### 3. 公钥分发方法 / Public Key Distribution Methods

四种可能方式：

公开宣告：任何人都可伪造，不安全

公开目录：更安全但目录权威可能被攻破

公钥权威：基于Needham-Schroeder，可能成为瓶颈

公钥证书：最佳选项，现今使用的方法

Four Possible Approaches:

Public announcement: Anyone can forge, insecure

Public directory: More secure but directory authority can be compromised

Public-key authority: Based on Needham-Schroeder, may become bottleneck

Public-key certificates: Best option, what we use today

### 4. X.509证书 / X.509 Certificates

证书定义：标识符与公钥之间的密码学绑定,由可信第三方（证书颁发机构CA）创建,包含公钥、所有者标识、CA签名和时间戳,X.509是定义证书格式的标准

Certificate Definition:

Cryptographic binding between identifier and public key

Created by trusted third party (Certificate Authority - CA)

Contains public key, owner ID, CA signature, and timestamp

X.509 is the standard defining certificate format

X.509证书内容：

版本号、序列号、签名算法,颁发者和主体信息,有效期（起始和结束日期）,公钥信息, 扩展字段（v3）

X.509 Certificate Contents:

Version, serial number, signature algorithm

Issuer and subject information

Validity period (start and end dates)

Public key information

Extensions (v3)

### 5. 公钥基础设施（PKI）/ Public Key Infrastructure (PKI)

PKI组成：

证书颁发机构（CA）：签发和管理证书

注册机构（RA）：验证身份

证书存储库：存储和分发证书

证书撤销机制：CRL和OCSP

PKI Components:

Certificate Authority (CA): Issues and manages certificates

Registration Authority (RA): Verifies identities

Certificate repository: Stores and distributes certificates

Certificate revocation mechanisms: CRL and OCSP

身份验证级别：

基础验证：域名所有权证明（放置文件或接收邮件）

扩展验证：使用法律文件，更昂贵但更可信

验证过程是PKI安全的关键环节

Identity Verification Levels:

Baseline verification: Domain ownership proof (place file or receive email)

Extended verification: Uses legal documents, more expensive but more trustworthy

Verification process is critical to PKI security

### 6. 证书撤销 / Certificate Revocation

证书撤销列表（CRL）：CA发布的已撤销证书列表

按序列号标识证书,必须有时间戳和签名,客户端应定期下载更新（实际上很少做）

Certificate Revocation Lists (CRL):

List of revoked certificates published by CA

Certificates identified by serial number

Must be timestamped and signed

Clients should download and update regularly (rarely done in practice)

在线证书状态协议（OCSP）：

允许实时撤销检查

查询-响应模型

响应必须签名

比CRL更高效

Online Certificate Status Protocol (OCSP):

Allows live revocation checks

Query-response model

Response must be signed

More efficient than CRL

### 7. 身份认证 / Authentication

认证定义（Menezes等）：一方通过获取确凿证据确信另一方身份的过程,确保第二方实际参与了协议, 需要：确凿证据、至少两方参与、第二方的参与

Authentication Definition (Menezes et al.):

Process whereby one party is assured of the identity of a second party

Through acquisition of corroborative evidence

Requires: corroborative evidence, at least two parties, actual participation

认证因素分类：

拥有因素：用户拥有的东西（物理密钥、手机）

固有因素：用户的生物特征（指纹、虹膜、面部）

知识因素：用户知道的信息（密码、安全问题）

Authentication Factor Categories:

Possession: Something the user has (physical key, phone)

Inherence: Something the user is (fingerprints, iris, face)

Knowledge: Something the user knows (passwords, security questions)

### 8. 多因素认证 / Multi-Factor Authentication

MFA优势：

需要多个不同类别的因素

显著提高安全性

特殊形式：双因素认证（2FA）

针对性攻击需要更多努力

MFA Advantages:

Requires multiple factors from different categories

Significantly increases security

Special form: Two-factor authentication (2FA)

Targeted attacks require more effort

MFA限制：

增加用户负担（心理可接受性）

同类别多因素不一定更强

社会工程仍可能绕过

实施必须考虑用户体验

MFA Limitations:

Increases user burden (psychological acceptability)

Multiple factors from same category not necessarily stronger

Social engineering can still bypass

Implementation must consider user experience

### 9. 认证和密钥建立（AKE）/ Authentication and Key Establishment (AKE)

挑战-响应协议：

使用随机数（nonce）防止重放攻击

Bob发送挑战，Alice必须正确响应

证明Alice参与了当前通信

可使用时间戳替代随机数

Challenge-Response Protocol:

Uses nonces to prevent replay attacks

Bob sends challenge, Alice must respond correctly

Proves Alice participated in current communication

Timestamps can replace nonces in some cases

会话密钥原则：总是从主密钥生成会话密钥,每个会话使用一次然后删除,永不重用会话密钥,双方都应参与密钥创建

Session Key Principles:

Always generate session keys from master keys

Use for one session then delete

Never reuse session keys

Both parties should be involved in key creation

### 10. Kerberos协议 / Kerberos Protocol

Kerberos特性：基于Needham-Schroeder协议,广泛部署的认证和访问控制协议,使用票据（ticket）概念访问服务,支持联邦多个管理域

Kerberos Features:

Based on Needham-Schroeder protocol

Widely deployed authentication and access control protocol

Uses ticket concept to access services

Supports federation of multiple administrative domains

Kerberos流程：

客户端向AS请求票据授予票据（TGT）

AS返回加密的TGT

客户端使用TGT向TGS请求服务票据

TGS返回服务票据

客户端使用服务票据访问服务器

可选：服务器向客户端认证

Kerberos Flow:

Client requests Ticket-Granting Ticket (TGT) from AS

AS returns encrypted TGT

Client uses TGT to request service ticket from TGS

TGS returns service ticket

Client uses service ticket to access server

Optional: Server authenticates to client

8 Network Security: Protocols Summary

### 1. TCP/IP模型和协议基础 / TCP/IP Model and Protocol Basics

TCP/IP四层模型：

应用层：HTTP、FTP、TELNET、NTP、DHCP、DNS等应用协议  传输层：TCP（可靠传输）、UDP（不可靠传输）

网络层：IP、ARP、ICMP等协议  网络接口层：以太网、光纤、路由器、交换机等物理设备

TCP/IP Four-Layer Model:

Application Layer: HTTP, FTP, TELNET, NTP, DHCP, DNS protocols

Transport Layer: TCP (reliable), UDP (unreliable)

Network Layer: IP, ARP, ICMP protocols

Network Interface Layer: Ethernet, fiber, routers, switches

协议定义：

定义消息的格式和发送接收顺序,控制网络实体间的通信活动

规定消息传输和接收时采取的动作,例如：HTTP用于Web文档传输，SMTP用于电子邮件

Protocol Definition:

Defines format and order of messages sent and received

Controls communication activities between network entities

Specifies actions taken on message transmission and receipt

Examples: HTTP for web document transfer, SMTP for email

### 2. 网络攻击类型 / Types of Network Attacks

被动攻击：消息窃听和通信方识别,流量分析,不修改数据，只是监听

Passive Attacks:

Eavesdropping of messages and party identification

Traffic analysis

No data modification, only monitoring

主动攻击：消息伪造和重放攻击,插入或删除消息,伪装身份（Masquerade）,拒绝服务攻击（DoS）

Active Attacks:Message forging and replay attacksInsert or delete messages, Identity masquerade, Denial of Service (DoS) attacks

### 3. 应用层安全：OAuth和OpenID / Application Layer Security: OAuth and OpenID

OAuth特性: 授权标准，允许用户授权第三方访问其账户部分内容,设计用于HTTP，网站可使用定义的流程

包含资源所有者、客户端、授权服务器和资源服务器

使用令牌（Token）进行授权

OAuth Characteristics:Authorization standard allowing users to grant third-party access to parts of their accounts

Designed for HTTP, websites can use defined flows

Includes Resource Owner, Client, Authorization Server, and Resource Server

Uses tokens for authorization

OpenID功能：身份认证协议，使用OAuth流程,与OAuth互补，专注于用户身份验证, 已成为云服务标准（Google、Microsoft Azure、Facebook）

OpenID Functions:Authentication protocol using OAuth flows

Complementary to OAuth, focuses on user authentication

Became standard for cloud services (Google, Microsoft Azure, Facebook)

### 4. 传输层安全：TLS / Transport Layer Security: TLS

TLS设计原理：

位于TCP和应用层之间的通用安全层（第4.5层）

重用套接字抽象，应用程序读写TLS套接字

提供加密、完整性和源认证，最新版本是TLS 1.3（2018年标准化）

TLS Design Rationale:

Generic security layer between TCP and application layer (layer 4.5)

Reuses socket abstraction, applications read/write to TLS sockets

Provides encryption, integrity, and origin authentication

Latest version is TLS 1.3 (standardized in 2018)

TLS握手流程：

客户端发送随机数和支持的密码套件

服务器响应随机数、证书和Diffie-Hellman参数

客户端验证证书并发送自己的DH值

双方计算共享密钥并使用MAC确认

TLS Handshake Flow:

Client sends nonce and supported cipher suites

Server responds with nonce, certificate,

and Diffie-Hellman parameters

Client verifies certificate and sends its DH value

Both parties compute shared key and confirm with MAC

### 5. TLS 1.3改进 / TLS 1.3 Improvements

主要变化：

只允许AEAD密码（如AES-GCM、ChaCha20-Poly1305）

Diffie-Hellman成为默认密钥交换方式

ServerHello后立即开始加密

支持1-RTT和0-RTT模式

Major Changes:

Only AEAD ciphers allowed (e.g., AES-GCM, ChaCha20-Poly1305)

Diffie-Hellman now default key exchange

Encryption starts immediately after ServerHello

Supports 1-RTT and 0-RTT modes

性能优化：

1-RTT：客户端在一个往返时间后即可发送应用数据

0-RTT：使用预共享密钥，无需等待即可发送数据

但0-RTT缺乏前向安全性和重放保护

Performance Optimization:

1-RTT: Client can send application data after just one round trip

0-RTT: Using pre-shared key, can send data without waiting

But 0-RTT lacks forward secrecy and replay protection

### 6. 网络层安全：IPSec / Network Layer Security: IPSec

IPSec组件：

安全关联数据库（SAD）：存储协商的安全参数

安全策略数据库（SPD）：定义保护策略

ESP（封装安全载荷）：提供认证、完整性和机密性

AH（认证头）：提供IP头部和载荷的认证和完整性

IKEv2：互联网密钥交换协议

IPSec Components:

Security Association Database (SAD): Stores negotiated security parameters

Security Policy Database (SPD): Defines protection policies

ESP (Encapsulating Security Payload): Provides authentication, integrity, confidentiality

AH (Authentication Header): Provides authentication and integrity for IP header and payload

IKEv2: Internet Key Exchange protocol

IPSec模式：

传输模式：端点相同，只保护载荷

隧道模式：网关负责保护，封装整个IP包

常用于构建VPN（虚拟专用网络）

IPSec Modes:

Transport Mode: Same endpoints, protects only payload

Tunnel Mode: Gateways responsible, encapsulates entire IP packet

Commonly used to build VPNs (Virtual Private Networks)

IPSec简介IPSec提供网络层安全。IP层安全包括三个功能区：验证、保密和密钥管理。身份验证机制确保接收到的数据包确实是由数据包标头中标识为来源的一方传输的。保密机制使通信节点能够对信息进行加密，以防止第三方窃听。密钥管理机制涉及密钥的安全交换。IPSec将其保护机制嵌入IP有效载荷。IPSec provides security at Network Layer. IP-level security encompasses three functional areas: authentication, confidentiality, and key management. The authentication mechanism assures that a received packet was transmitted by the party identified as the source in the packet header. The confidentiality facility enables communicating nodes to encrypt messages to prevent eavesdropping by third parties. The key management facility is concerned with the secure exchange of keys. IPSec embeds its protective mechanisms as IP payloads.

TLS与IPSec的区别TLS不保护TCP数据包信息的任何部分（如端口号或网段号），而IPSec则为实际IP数据包提供验证和完整性保护。此外，TLS在用户空间中运行，允许在应用层实施和管理。相比之下，IPSec必须在内核空间运行，这意味着其配置仅限于系统管理员。Unlike TLS, which does not protect any part of the TCP packet information such as port numbers or segment numbers, IPSec provides authentication and integrity protection for the actual IP packets. Additionally, TLS operates in user space, allowing it to be implemented and managed at the application level. In contrast, IPSec must be run in kernel space, meaning its configuration is restricted to system administrators.

### 7. IPSec与TLS对比 / IPSec vs TLS Comparison

主要区别：TLS保护TCP载荷，IPSec保护IP包  TLS可在用户空间运行，IPSec需要内核空间，TLS由应用程序控制，IPSec由管理员配置  IPSec可保护所有IP层流量，TLS只保护特定应用

Key Differences:

TLS protects TCP payloads, IPSec protects IP packets

TLS can run in user space, IPSec needs kernel space

TLS controlled by applications, IPSec configured by admins

IPSec can protect all IP-layer traffic, TLS only specific applications

### 8. 密码协议分层 / Cryptographic Protocols by Layer

各层常见协议：

链路层：WPA3、WPA2（已破解：WPA、WEP）

网络层：IPSec和IKEv2

传输层：TLS（TCP）、DTLS（UDP）

应用层：OpenID、OAuth、DNSSEC

Common Protocols by Layer:

Link Layer: WPA3, WPA2 (broken: WPA, WEP)

Network Layer: IPSec and IKEv2

Transport Layer: TLS (for TCP), DTLS (for UDP)

Application Layer: OpenID, OAuth, DNSSEC

### 9. 安全协议选择考虑 / Security Protocol Selection Considerations

选择因素：

应用场景：Web应用选TLS，网络互联选IPSec

控制级别：用户级别选TLS，系统级别选IPSec

性能需求：考虑握手延迟和加密开销

兼容性：考虑现有系统和标准支持

Selection Factors:

Use case: TLS for web apps, IPSec for network interconnection

Control level: TLS for user-level, IPSec for system-level

Performance needs: Consider handshake latency and encryption overhead

Compatibility: Consider existing systems and standard support

PSec运行模式

a. 隧道模式 (Tunnel Mode)

隧道模式通过将整个IP数据包封装在一个带有新IP标头的新数据包内来保护整个IP数据包。原始数据包（添加了AH或ESP）成为有效载荷。这就隐藏了原始源/目的地，至少在一端是网关（如防火墙/路由器）时使用。它允许本身不运行IPsec的主机进行安全通信。

Tunnel mode protects the entire IP packet by encapsulating it inside a new packet with a new IP header. The original packet (with AH or ESP added) becomes the payload. This hides the original source/destination and is used when at least one end is a gateway (e.g., firewall/router). It allows secure communication for hosts that don't run IPsec themselves.

b. 传输模式 (Transport Mode)

传输模式只保护IP数据包的有效载荷（如TCP/UDP段），而不保护报头。它用于端到端主机通信（如客户端-服务器）。在IPv4中，它保护IP报头之后的数据；在IPv6中，它包括扩展报头，但目的地选项除外（有时）。

Transport mode protects only the payload (e.g., TCP/UDP segment) of an IP packet, not the header. It is used for end-to-end host communication (like client-server). In IPv4, it protects data after the IP header; in IPv6, it includes extension headers except destination options (sometimes).

VPN（虚拟专用网络）

虚拟专用网络（VPN）是在公共网络（运营商网络或互联网）内配置的专用网络，目的是利用大型网络的规模经济和管理设施。

A virtual private network (VPN) is a private network that is configured within a public network (a carrier's network or the Internet) in order to take advantage of the economies of scale and management facilities of large networks.

### 1. Network Security: Firewalls

### 1. 防火墙基本概念 / Firewall Basic Concepts

- 防火墙源于建筑防火设计，网络中作用类似中世纪城堡护城河：在一个严格控制点限制进出，防止攻击者接近其他防御，网络防火墙不同于主机防火墙，安装在受保护子网与不可信网络之间

- Firewall originates from building fire prevention, acts like medieval castle moat in networks:

- Restricts entry/exit at one carefully controlled point

- Prevents attackers from getting close to other defenses

- Network firewalls differ from host-based firewalls

- Installed between protected subnet and untrusted network

### 2. 防火墙视角 / Firewall Perspectives

- 视角1（局域网管理员）：

- 入站：从互联网到本地网络

- 出站：从本地网络到互联网

- 视角2（防火墙手册）：

- 每个接口都有入站和出站数据包

- View 1 (LAN Administrator):

- Incoming: From Internet to local network

- Outgoing: From local network to Internet

- View 2 (Firewall Manual):

- Each interface has incoming and outgoing packets

### 3. 防火墙配置策略 / Firewall Configuration Strategies

- 白名单（默认拒绝）：未明确允许的全部拒绝，安全性更高，最佳实践推荐

- 黑名单（默认允许）：

- 未明确禁止的全部允许，用户使用更方便，安全性较低

- Whitelisting (Default Deny):

- Everything not explicitly permitted is denied

- Higher security

- Best practice recommendation

- Blacklisting (Default Permit):

- Everything not explicitly forbidden is permitted

- Less hassle for users

- Lower security

### 4. 防火墙规则组成 / Firewall Rule Components

- 匹配条件：接口、MAC地址、IP地址、协议、端口、标志位、状态匹配

- 动作：接受（Accept）丢弃/拒绝（Drop/Reject）记录（Log）

- Match Conditions:

- Interface, MAC addresses, IP addresses

- Protocols, ports, flags

- Stateful matches

- Actions:

- Accept    Drop/Reject   Log

### 5. 有状态与无状态防火墙 / Stateful vs Stateless Firewalls

- 有状态匹配：

- 使用IP五元组跟踪连接：(源IP, 目标IP, 协议, 源端口, 目标端口)

- 连接状态：NEW（首个数据包）、ESTABLISHED（后续数据包）   对已建立连接更高效   UDP跟踪是近似的

- 无状态匹配：不维护状态信息，每个数据包独立评估，配置更困难，更容易出错，规则少时可能更快

- Stateful Matching:

- Tracks connections using IP-5-tuple: (Src IP, Dst IP, Protocol, Src Port, Dst Port)

- Connection states: NEW (first packet), ESTABLISHED (following packets)

- More efficient for established connections

- UDP tracking is approximative

- Stateless Matching:

- No state information maintained

- Each packet evaluated independently

- Harder to configure correctly

- May be faster with few rules

### 6. TCP握手和标志位 / TCP Handshake and Flags

- TCP三次握手：

- 客户端发送SYN，服务器响应SYN/ACK，客户端确认ACK

- 数据传输中所有包都设置ACK，UDP无状态信息

- TCP three-way handshake:

- Client sends SYN

- Server responds SYN/ACK

- Client confirms ACK

- All data packets have ACK set

- UDP has no state information

### 7. 常见防火墙错误 / Common Firewall Mistakes

- 配置错误：管理接口暴露，IPv4/IPv6规则不一致

- 规则遮蔽（永远不会匹配的规则），出站规则过于宽松

- 欺骗保护不足：

- 出站：只允许属于自己的源IP

- 入站：阻止无效源IP（本地IP、私有IP）

- Configuration Errors:

- Management interface exposure

- Inconsistent IPv4/IPv6 rules

- Rule shadowing (rules that never match)

- Overly permissive outbound rules

- Insufficient Spoofing Protection:

- Outbound: Only allow source IPs that belong to you

- Inbound: Block invalid source IPs (local IPs, private IPs)

### 8. 防火墙局限性 / Firewall Limitations

- 防火墙无法防护：恶意内部人员，绕过防火墙的连接，全新威胁，允许流量中的病毒，配置错误，不执行加密操作

- Firewalls cannot protect against:

- Malicious insiders

- Connections bypassing the firewall

- Completely new threats

- Viruses in allowed traffic

- Configuration errors

- Does not perform cryptographic operations

### 9. 常见防火墙架构 / Common Firewall Architectures

- 简单包过滤：单个防火墙，两个接口，基本保护级别

- 双宿主主机：堡垒主机作为防火墙和应用代理，单点故障，性能瓶颈

- 屏蔽子网（DMZ）：

- 两个防火墙之间的非军事区，托管公共服务器和代理

- 更好的内网保护，需要两个防火墙或三网卡  在内网和外网之间设置的缓冲区域

- Simple Packet Filter:

- Single firewall with two interfaces

- Basic protection level

- Dual-Homed Host:

- Bastion host as firewall and application proxy

- Single point of failure

- Performance bottleneck

- Screened Subnet (DMZ):

- Demilitarized zone between two firewalls

- Hosts public servers and proxy

- Better internal network protection

- Requires two firewalls or 3+ interfaces

### 10. 关键要点 / Key Takeaways

- 默认拒绝（白名单）是推荐的安全实践

- 规则顺序显著影响安全性和性能，有状态防火墙通常更容易正确配置，适当的欺骗保护需要入站和出站规则，DMZ架构通过纵深防御提供更好的安全性，防火墙只是安全的一层，有其固有局限性

- Default deny (whitelisting) is recommended security practice

- Rule order significantly impacts security and performance

- Stateful firewalls are generally easier to configure correctly

- Proper spoofing protection requires both inbound and outbound rules

- DMZ architecture provides better security through defense in depth

- Firewalls are one layer of security with inherent limitations

- 防火墙规则分析 / Firewall Rules Analysis

- 网络拓扑说明 / Network Topology

- 内网用户： Alice (1.1.1.4)，Bob (1.1.1.2)

- 防火墙接口： eth0（内网侧），eth1（外网侧），eth3（服务器侧）

- 外部服务器： WWW服务器 (1.1.5.3)，DNS服务器 (1.1.5.8)

- 网段： 内网 1.1.1.0/24，外网通过Internet，服务器网段 1.1.5.0/x

- 逐条规则分析 / Rule-by-Rule Analysis

- 规则A (Rule A)： 阻止来自1.1.0.0/16网段通过eth1接口的所有流量  目的： 防止外网冒充内网IP地址的欺骗攻击

- Drop all traffic from 1.1.0.0/16 subnet incoming via eth1 interface Anti-spoofing protection: Rule A prevents IP address spoofing

- Purpose： Prevent IP spoofing attacks from external networks impersonating internal IPs

- 规则B (Rule B)：允许来自内网(1.1.1.0/24)的TCP流量访问外部的80端口(HTTP)，源端口需>1023 目的： 允许内网用户浏览外部网站

- Allow TCP traffic from internal network (1.1.1.0/24) to external port 80 (HTTP), source port >1023

- Purpose： Allow internal users to browse external websites

- 规则C (Rule C)：

- 中文： 允许从外部80端口返回到内网(1.1.1.0/24)高端口(>1023)的TCP响应流量，需要ACK标志

- English： Allow TCP response traffic from external port 80 to internal high ports (>1023), requires ACK flag

- 目的： 允许HTTP响应数据返回给内网用户

- Purpose： Allow HTTP response data to return to internal users  Web browsing: Rules B and C allow internal users to browse external site

- 规则D (Rule D)：

- 中文： 允许从WWW服务器(1.1.5.3)的80端口返回到任意目标高端口的TCP流量，需要ACK标志

- English： Allow TCP traffic from WWW server (1.1.5.3) port 80 to any destination high port, requires ACK flag

- 目的： 允许内部WWW服务器的HTTP响应

- Purpose： Allow HTTP responses from internal WWW server

- 规则E (Rule E)：

- 中文： 允许从任意源的高端口访问WWW服务器(1.1.5.3)的80端口

- English： Allow TCP traffic from any source high port to WWW server (1.1.5.3) port 80

- 目的： 允许外部用户访问内部WWW服务器

- Purpose： Allow external users to access internal WWW server

- Web hosting: Rules D and E allow hosting internal web services

- 规则F (Rule F)：

- 中文： 允许从DNS服务器(1.1.5.8)的53端口向任意目标高端口发送UDP流量

- English： Allow UDP traffic from DNS server (1.1.5.8) port 53 to any destination high port

- 目的： 允许DNS服务器向客户端发送DNS响应

- Purpose： Allow DNS server to send DNS responses to clients

- 规则G (Rule G)：

- 中文： 允许从任意源的高端口向DNS服务器(1.1.5.8)的53端口发送UDP流量

- English： Allow UDP traffic from any source high port to DNS server (1.1.5.8) port 53

- 目的： 允许DNS查询请求到达DNS服务器

- Purpose： Allow DNS query requests to reach DNS server

- DNS resolution: Rules F and G allow DNS queries and responses

- 规则H (Rule H)：

- 中文： 默认拒绝规则 - 阻止所有其他未匹配的流量

- English： Default deny rule - drop all other unmatched traffic

- 目的： 实施最小权限原则，只允许明确授权的流量

- Purpose： Implement principle of least privilege, only allow explicitly authorized traffic

- Default deny: Rule H ensures unauthorized traffic is blocked

- IP欺骗攻击 | IP Spoofing Attack说明：攻击者伪造源IP地址冒充内部主机Note: Attackers forge source IP to impersonate internal hosts防范：必须有规则明确拒绝外部伪造内部IP的数据包Prevention: Must have rules explicitly rejecting external packets with spoofed internal IPs

- DDoS攻击 | DDoS Attack说明：通过海量流量使服务瘫痪Note: Overwhelming services with massive traffic防范：需有流量限制或特定攻击特征过滤Prevention: Requires traffic rate limiting or filtering based on attack signatures

- XSS攻击 | XSS Attack说明：在网页中注入恶意脚本代码Note: Injecting malicious scripts into web pages防范：通常不是防火墙，而是应用层的防范Prevention: Usually not firewall-based, but application-layer defense

- 防火墙规则的执行是从上到下依次匹配，一旦某条规则匹配成功并处理了数据包，后续规则将不再执行。如果后面的规则与前面的规则功能重复或冲突，则后面的规则会成为无效规则（Shadowed规则）。检查方法：• 从上到下逐条检查，确保每条规则都有机会执行• 默认拒绝规则必须放在最后一条

- • 识别并消除被遮蔽的规则Firewall rules are executed in a top-down sequential order. Once a rule matches and processes a packet, subsequent rules are not evaluated. If a later rule duplicates or conflicts with an earlier rule's functionality, the later rule becomes ineffective (Shadowed).Checking Method:• Review rules from top to bottom to ensure each rule can be executed• Default deny rule must be placed last

- • Identify and eliminate shadowed rules

- Stateful Firewall

- Rule A：允许已建立连接的数据流量通过 | Allow Established Connections

- Automatically allows subsequent traffic for legitimately established connections (e.g., after TCP handshake), eliminating the need for manual return traffic rules.

- Rule B：防止IP欺骗 | Prevent IP Spoofing

- Blocks attacks from external networks using spoofed internal IP addresses.

- Rule C：允许内部用户新建HTTP连接 | Allow Internal Users' New HTTP Connections

- Allows internal users to initiate web browsing requests

- Rule D：允许Web服务器对外连接 | Allow Web Server Outbound Connections

- Allows server to access external web resources (e.g., microservice calls).

- Rule E：允许DNS服务器对外查询 | Allow DNS Server Outbound Queries

- Allows DNS server to initiate domain name queries.

- Rule F：允许访问DNS服务器 | Allow Access to DNS Server

- Allows users to request DNS resolution services.

- Rule G：默认拒绝规则 | Default Deny Rule

- Denies all traffic not matching previous rules.

### 10.软件安全
### 1. 软件安全受多个因素影响：

语言安全：内存安全、类型安全

API安全：使用不安全的函数

依赖项：第三方库的安全性

可用工具：识别漏洞的工具  
Software security is influenced by multiple factors:

Language safety: Memory safety, type safety

API safety: Use of unsafe functions

Dependencies: Security of third-party libraries

Available tools: Tools to identify vulnerabilities

### 1. 内存段 / Memory Segments

- 主存储器 (Main Memory / RAM)主存储器或随机存取存储器（RAM）是一种快速、易失的存储区域，可临时保存运行程序所需的数据和指令。它位于CPU外部。RAM是CPU的主要工作区，在程序执行过程中存储程序数据和指令。RAM比CPU寄存器大得多，可以存储大量信息。不过，它的速度也比寄存器慢得多。CPU寄存器提供单周期数据访问，而从RAM访问数据通常需要多个CPU周期。CPU不断从RAM中获取指令和数据，执行指令和数据，并根据需要将结果存储回RAM。

- Main memory, or Random Access Memory (RAM), is a fast, volatile storage area that temporarily holds data and instructions needed by a running program. It is located outside the CPU. RAM acts as the CPU's primary working area, providing storage for program data and instructions during execution. RAM is much larger than CPU registers and can store a vast amount of information. However, it is also significantly slower than registers. While CPU registers provide single-cycle access to data, accessing data from RAM typically takes multiple CPU cycles. The CPU continuously fetches instructions and data from RAM, executes them, and stores results back into RAM as needed.

- C语言内存模型包含：

文本段（代码段）：存储程序指令

数据段：存储初始化的全局/静态变量

BSS段：存储未初始化的全局/静态变量

堆：动态内存分配（向上增长）

栈：函数调用和局部变量（向下增长）  
C memory model contains:

Text segment (Code segment): Stores program instructions

Data segment: Stores initialized global/static variables

BSS segment: Stores uninitialized global/static variables

Heap: Dynamic memory allocation (grows upward)

Stack: Function calls and local variables (grows downward)

### 3. 栈帧和寄存器 / Stack Frame and Registers
关键寄存器：

EBP/RBP：基址指针（栈基址）

ESP/RSP：栈指针（栈顶）

EIP/RIP：指令指针（下一条指令地址）

栈帧包含：函数参数,返回地址,保存的基址指针,局部变量  
Key registers:

EBP/RBP: Base pointer (stack base)

ESP/RSP: Stack pointer (stack top)

EIP/RIP: Instruction pointer (next instruction address)

Stack frame contains:

Function arguments

Return address

Saved base pointer

Local variables

### 4. 缓冲区溢出攻击 / Buffer Overflow Attacks
栈缓冲区溢出发生在：函数创建固定大小缓冲区,不检查输入长度,使用strcpy()等不安全函数,溢出覆盖返回地址,控制程序执行流

攻击步骤：插入恶意输入（shellcode,覆盖返回地址,跳转执行恶意代码

Stack buffer overflow occurs when:

### 1. Function creates fixed-size buffer

### 1. No input length checking

### 1. Uses unsafe functions like strcpy()

### 1. Overflow overwrites return address

5 . Controls program execution flow

Attack steps:

Insert malicious input (shellcode)

Overwrite return address

Jump to execute malicious code

### 5. 防御措施 / Defense Mechanisms

编程语言选择：使用内存安全语言（Java、Python）

代码分析：静态/动态代码分析

编译器级别： StackGuard（金丝雀值）堆栈防护/金丝雀 (StackGuard/Canaries)在返回地址之前放置一个随机金丝雀值。在函数返回之前，它检查金丝雀是否被更改。如果是，则检测到溢出。

Places a random canary value before the return address. Before a function returns, it checks if the canary was changed. If so, an overflow is detected.

StackShield（备份返回地址）堆栈屏蔽 (StackShield)

将返回地址复制到安全位置。在函数结束时，它验证是否被更改。如果是，则恢复原始地址。防止返回地址覆盖。仅限于返回地址；不如金丝雀通用。

Copies the return address to a safe location. At function end, it verifies if it was altered. If so, restores the original. Prevents return address overwrite. Limited to return address; less versatile than canaries.

操作系统级别： DEP（数据执行保护）

标记不可执行区域，硬件级支持，阻止代码执行

ASLR（地址空间布局随机化）

随机化内存布局，增加攻击难度，动态变化

Language choice: Use memory-safe languages (Java, Python)

Code analysis: Static/dynamic code analysis

Compiler level:

StackGuard (Canary values)

StackShield (Backup return address)

OS level:

DEP (Data Execution Prevention)

How it works: Marks non-executable regions: Marks certain memory areas as non-executable (such as data segments, heap, stack)

Hardware-level support: Utilizes CPU's NX bit (No-eXecute) functionality

Blocks code execution: Even if attackers successfully inject malicious code, it cannot be executed in data regions

Protection effectiveness: Prevents execution of injected malicious code in data buffers

Converts code injection attacks into denial-of-service attacks

ASLR (Address Space Layout Randomization)

How it works: Randomizes memory layout: Each time a program starts, it randomly changes the locations of executable files, libraries, heap, and stack in memory

Increases attack difficulty: Attackers cannot predict memory addresses, making it difficult to accurately locate code jump targets

Dynamic changes: Memory layout changes every time the application restarts

Protection effectiveness: Makes it difficult for attackers to predict process memory address space

Significantly increases the difficulty of executing arbitrary code through memory vulnerabilities

### 6. 常见编程错误 / Common Programming Errors

不安全函数：strcpy、gets、sprintf等，空终止错误：字符串缺少结束符，整数溢出：计算结果超出变量范围

格式化字符串错误：用户输入作为格式参数

释放后使用/双重释放：内存管理错误

Unsafe functions: strcpy, gets, sprintf, etc.

Null termination errors: Missing string terminators

Integer overflow: Calculation exceeds variable range

Format string errors: User input as format parameter

Use after free/Double free: Memory management errors

### 7. 软件供应链安全 / Software Supply Chain Security
风险来源：第三方库：依赖项可能包含漏洞，包管理器：npm、pypi等可能被攻击，容器化：恶意Docker镜，传递性依赖：间接依赖的安全问题，缓解措施，使用依赖检查工具

定期更新和打补丁，使用多因素认证保护代码访问

A supply chain attack is a cybersecurity threat where attackers do not directly attack the final target, but instead attack weaker security elements in the target system's supply network.

Attack third-party suppliers, software dependency libraries, or hardware components

Plant malicious code or backdoors at some point in the supply chain

Distribute to end users through legitimate update channels  
Risk sources:

Third-party libraries: Dependencies may contain vulnerabilities

Package managers: npm, pypi, etc. may be compromised

Containerization: Malicious Docker images

Transitive dependencies: Security issues in indirect dependencies

Mitigations:

Use dependency checker tools

Regular updates and patching

Use MFA to protect code access

### 8. 零日漏洞 / Zero-Day Vulnerabilities

尚未公开披露的漏洞

蜜罐：诱捕和研究攻击者

行为分析：监测异常命令序列

Definition: Vulnerabilities not yet publicly disclosed

Detection methods:

Honeypots: Trap and study attackers

Behavioral analysis: Monitor abnormal command sequence

### 1. web安全

### 1. Web技术基础（核心组建）

- 核心组件：

- URL结构

- URL的完整格式是：协议://登录信息@地址:端口/路径?查询#片段

- 端口默认使用协议指定的端口（HTTP使用80，HTTPS使用443）

- 地址通常使用域名表示，很少使用IP地址

- 路径为空时请求网站根目录，服务器会返回默认文件如index.html或index.php

- The full URL format is:protocol://login.password@ address : port/path?query#fragment

- Port defaults to protocol-assigned ports (HTTP uses 80, HTTPS uses 443)

- Address is typically indicated by domain name, rarely by IP address

- Empty path requests webroot, server returns default files like index.html or index.php

- 域名系统(DNS)

- DNS用于将域名映射到IP地址，最初只支持英文字母

- 国际化域名(IDN)使用Punycode编码，以xn--开头

- 存在同形字攻击风险，如使用希腊字母伪装成英文字母的钓鱼网站

- DNS maps domain names to IP addresses, initially only supported English alphabet

- Internationalized Domain Names (IDN) use Punycode encoding, prefixed with xn--

- Vulnerable to homoglyph attacks, where phishing sites use Greek letters to impersonate English letters

- HTTP/HTTPS协议

- HTTP是无状态协议，每个请求都是独立的，不维护连接信息

- 支持多种请求方法：GET（获取数据）、POST（提交数据）、PUT（更新）、DELETE（删除）

- 参数可通过URL查询字符串、请求头或请求体发送

- HTTPS是HTTP通过TLS加密传输，提供机密性和完整性保护

- HTTP/2使用二进制格式，支持多路复用，提高性能

- HTTP is a stateless protocol, each request is independent with no connection information

- Supports multiple request methods: GET (retrieve data), POST (submit data), PUT (update), DELETE (remove)

- Parameters can be sent via URL query string, headers, or request body

- HTTPS is HTTP over TLS encryption, providing confidentiality and integrity

- HTTP/2 uses binary format, supports multiplexing for better performance

- Web技术栈

- HTML（超文本标记语言）：定义网页内容和文档结构

- CSS（层叠样式表）：控制元素的渲染和视觉表现

- JavaScript：提供客户端编程能力，实现动态交互和实时修改DOM

- XML（可扩展标记语言）：用于定义自定义文档格式，支持语法验证

- JSON（JavaScript对象表示法）：轻量级数据交换格式，无模式定义

- HTML (Hypertext Markup Language): Defines web content and document structure

- CSS (Cascading Style Sheets): Controls element rendering and visual presentation

- JavaScript: Provides client-side programming for dynamic interaction and DOM manipulation

- XML (Extensible Markup Language): Defines custom document formats with grammar validation

- JSON (JavaScript Object Notation): Lightweight data exchange format without schema definition

### 2. Web安全的主要问题核心挑战：

- 异构环境Heterogeneous Environment

- Web应用涉及多种不同技术的集成，每种技术都可能成为攻击点，包括前端技术、后端语言、数据库系统、第三方库等，攻击面随着技术栈的复杂度增加而扩大

- Web applications integrate multiple different technologies, each potentially an attack point

- Includes frontend tech, backend languages, database systems, third-party libraries

- Attack surface grows with technology stack complexity

- 带内信令In-band Signaling

- 控制信号和内容数据在同一通道传输，没有明确分离

- 恶意构造的内容可能被解释为控制命令

- 导致注入攻击成为可能，如SQL注入、XSS等

- Control signals and content data transmitted in same channel without clear separation

- Maliciously crafted content may be interpreted as control commands

- Enables injection attacks like SQL injection, XSS, etc.

- 高价值目标High-Value Target (HVT)

- Web应用存储和处理大量敏感数据

- 包括用户密码、信用卡信息、个人身份信息、商业机密

- 数据泄露可能造成严重的经济损失和隐私侵犯

- Web applications store and process large amounts of sensitive data

- Includes user passwords, credit card information, personal identity data, business secrets

- Data breaches can cause severe financial loss and privacy violations

- 访问控制机制：Access Control Mechanisms:

- 基于会话的访问控制 Session-based Access Control

- 用户通过HTML表单提交凭据进行身份验证

- 服务器创建会话状态并生成唯一的会话标识符

- 会话ID通过Cookie发送给浏览器，后续请求携带此ID

- 服务器必须在每次请求时验证会话ID的有效性

- Users submit credentials through HTML forms for authentication

- Server creates session state and generates unique session identifier

- Session ID sent to browser via Cookie, included in subsequent requests

- Server must validate session ID validity on every request

- 基于令牌的访问控制（JWT）Token-based Access Control (JWT - JSON Web Token)

- 将授权信息编码在令牌中，服务器不需要存储会话状态

- JWT包含头部、载荷和签名三部分，使用密钥签名防止篡改

- 适合分布式系统和微服务架构，便于横向扩展

- 主要挑战是令牌撤销困难，通常通过缩短有效期解决

- Encodes authorization information in token, server doesn't store session state

- JWT contains header, payload, and signature, using key signing to prevent tampering

- Suitable for distributed systems and microservices, enables horizontal scaling

- Main challenge is token revocation difficulty, usually solved by shorter expiry

![5616 A4 1 copy image 1](<../assets/CSEC5616_assets/image-001.png>)

- 同源策略（SOP） Same-Origin Policy (SOP)

- 浏览器的核心安全机制，限制不同源之间的交互

- 源由协议、主机和端口三元组定义

- JavaScript只能访问同源的资源，防止恶意脚本窃取其他网站数据

- Core browser security mechanism limiting cross-origin interactions

- Origin defined by protocol, host, and port triple

- JavaScript can only access same-origin resources, preventing malicious scripts from stealing other sites' data

- 跨域资源共享（CORS）Cross-Origin Resource Sharing (CORS)

- 为了满足现代Web应用的需求，允许受控的跨域访问

- 服务器通过Access-Control-Allow-Origin头指定允许的源

- 支持预检请求机制处理复杂的跨域请求

- Enables controlled cross-origin access for modern web application needs

- Server specifies allowed origins via Access-Control-Allow-Origin header

- Supports preflight request mechanism for complex cross-origin requests

### 3. 常见Web攻击及防护

- SQL注入攻击

- 攻击原理

- 攻击者在输入中插入SQL代码片段

- 应用程序直接拼接字符串构建SQL查询

- 恶意SQL代码被数据库执行，可能导致数据泄露、删除或修改，例如：输入 ' OR 1=1; -- 可能返回所有记录

- SQL Injection

- Attackers insert SQL code fragments in input

- Application directly concatenates strings to build SQL queries data

![5616 A4 1 copy image 2](<../assets/CSEC5616_assets/image-002.png>)

![5616 A4 1 copy image 3](<../assets/CSEC5616_assets/image-003.png>)

- Example: input ' OR 1=1; -- might return all records

- 防护措施

- 使用参数化查询或预编译语句，将数据与SQL结构分离

- 采用存储过程限制可执行的操作

- 使用ORM（对象关系映射）框架自动处理SQL生成

- 对所有用户输入进行严格验证和转义

- Use parameterized queries or prepared statements to separate data from SQL structure

- Employ stored procedures to limit executable operations

- Use ORM (Object-Relational Mapping) frameworks for automatic SQL generation

- Strictly validate and escape all user input

- 跨站脚本攻击（XSS） Cross-Site Scripting (XSS)

- 反射型XSS Reflected XSS

- 恶意脚本通过URL参数或表单提交到服务器

- 服务器将脚本直接包含在响应中返回给用户

- 需要诱导用户点击恶意链接才能触发攻击

- 常见于搜索功能、错误消息显示等场景

- Malicious script submitted to server via URL parameters or forms

![5616 A4 1 copy image 4](<../assets/CSEC5616_assets/image-004.png>)

![5616 A4 1 copy image 5](<../assets/CSEC5616_assets/image-005.png>)

- Server directly includes script in response returned to user

- Requires tricking user to click malicious link to trigger attack

- Common in search functions, error message displays

- 存储型XSS  Stored XSS

- 恶意脚本被永久存储在服务器端（数据库、文件等）

- 当其他用户访问包含恶意脚本的页面时自动执行

- 影响范围更广，危害更大，不需要用户交互

- 常见于评论系统、用户资料、论坛帖子等

- Malicious script permanently stored on server (database, files, etc.)

- Automatically executes when other users visit pages containing malicious script

- Broader impact, greater harm, no user interaction needed

- Common in comment systems, user profiles, forum posts

- XSS防护  XSS Protection

- 服务器端对所有用户输入进行HTML实体编码

- 使用内容安全策略（CSP）限制可执行脚本的来源

- 采用白名单方式验证输入，拒绝包含危险字符的输入

- 使用成熟的模板引擎自动处理输出编码

- Server-side HTML entity encoding for all user inputUse Content Security Policy (CSP) to restrict executable script sources

- Whitelist validation for input, reject input containing dangerous characters

- Use mature template engines for automatic output encoding

- 跨站请求伪造（CSRF）Cross Site Request Forgery

- 攻击原理

- 利用浏览器自动发送Cookie的特性

- 攻击者构造恶意请求，诱导已登录用户的浏览器发送

- 服务器无法区分请求是用户主动发起还是被诱导

- 可能导致未授权的资金转账、密码修改等操作

- Exploits browser's automatic cookie sending behavior

- Attacker crafts malicious request, tricks logged-in user's browser to send it

![5616 A4 1 copy image 6](<../assets/CSEC5616_assets/image-006.png>)

- Server cannot distinguish between user-initiated and induced requests

- May result in unauthorized fund transfers, password changes

- CSRF防护 Cross-Site Request Forgery prevention

- 为每个会话生成唯一的CSRF令牌

- 在所有状态改变的表单中包含CSRF令牌字段

- 服务器验证请求中的令牌与会话中的令牌是否匹配

- 使用SameSite Cookie属性限制跨站请求时的Cookie发送

- Generate unique CSRF token for each session

- Include CSRF token field in all state-changing forms

- Server validates request token matches session token

- Use SameSite Cookie attribute to restrict cookie sending in cross-site requests

- 其他安全考虑

- 供应链安全

- 现代Web应用大量使用第三方库和CDN资源

- 使用子资源完整性（SRI）验证外部资源的哈希值

- 实施内容安全策略（CSP）限制可加载的资源来源

- 定期审查和更新依赖项，及时修复已知漏洞

- Supply chains

- Modern web apps heavily use third-party libraries and CDN resources

- Use Subresource Integrity (SRI) to verify external resource hashes

- Implement Content Security Policy (CSP) to restrict loadable resource sources

- Regularly review and update dependencies, promptly fix known vulnerabilities

- 密码存储安全 Passwords

- 绝不以明文或可逆加密方式存储密码

- 使用加盐哈希，每个用户使用唯一的随机盐值

- 采用慢速哈希算法（bcrypt、Argon2、PBKDF2）增加破解难度

- 设置合适的工作因子，使单次哈希计算需要约50毫秒

- Never store passwords in plaintext or reversible encryption

- Use salted hashing with unique random salt for each user

- Employ slow hash algorithms (bcrypt, Argon2, PBKDF2) to increase cracking difficulty

- Set appropriate work factor so single hash calculation takes about 50ms

- 日志安全 Logging

- Web服务器默认记录所有请求URL，包括GET参数

- 避免在URL中传输敏感信息（密码、会话ID、个人信息）

- 敏感操作应使用POST请求，数据放在请求体中

- 定期审查和清理包含敏感信息的日志文件

- Web servers log all request URLs by default, including GET parameters

- Avoid transmitting sensitive information in URLs (passwords, session IDs, personal info)

- Sensitive operations should use POST requests with data in request body

- Regularly review and clean log files containing sensitive information

- 关键原则和最佳实践

- 输入验证原则

- 永远不要信任任何用户输入，包括表单、URL参数、Cookie、HTTP头

- 在服务器端进行所有验证，客户端验证只是用户体验优化

- 使用白名单定义允许的输入，而不是黑名单过滤危险输入

- 对不同上下文使用适当的编码（HTML、URL、JavaScript、SQL）

- Never trust any user input including forms, URL parameters, cookies, HTTP headers

- Perform all validation server-side, client-side validation is only UX optimization

- Use whitelists to define allowed input, not blacklists to filter dangerous input

![5616 A4 1 copy image 7](<../assets/CSEC5616_assets/image-007.png>)

- Use appropriate encoding for different contexts (HTML, URL, JavaScript, SQL)    A buffer zone established between the internal network and external network 在内部网络和外部网络之间建立的缓冲区

![5616 A4 1 copy image 8](<../assets/CSEC5616_assets/image-008.png>)

- 安全开发实践

- 使用经过安全审计的成熟框架和库

![5616 A4 1 copy image 9](<../assets/CSEC5616_assets/image-009.png>)

- 保持所有组件和依赖项更新到最新版本

- 实施纵深防御策略，在多个层面部署安全措施

- 定期进行安全测试，包括渗透测试和代码审计

- 建立安全事件响应流程，快速处理发现的漏洞

- Use mature frameworks and libraries that have undergone security audits

- Keep all components and dependencies updated to latest versions

- Implement defense-in-depth strategy with security measures at multiple layers

- Conduct regular security testing including penetration testing and code audits

- Establish security incident response procedures for quick vulnerability handling

![5616 A4 1 copy image 10](<../assets/CSEC5616_assets/image-010.png>)

![5616 A4 1 copy image 11](<../assets/CSEC5616_assets/image-011.png>)

![5616 A4 1 copy image 12](<../assets/CSEC5616_assets/image-012.png>)

![5616 A4 1 copy image 13](<../assets/CSEC5616_assets/image-013.png>)

![5616 A4 1 copy image 14](<../assets/CSEC5616_assets/image-014.png>)

![5616 A4 1 copy image 15](<../assets/CSEC5616_assets/image-015.png>)

![5616 A4 1 copy image 16](<../assets/CSEC5616_assets/image-016.png>)

![5616 A4 1 copy image 17](<../assets/CSEC5616_assets/image-017.png>)

![5616 A4 1 copy image 18](<../assets/CSEC5616_assets/image-018.png>)

![5616 A4 1 copy image 19](<../assets/CSEC5616_assets/image-019.png>)

![5616 A4 1 copy image 20](<../assets/CSEC5616_assets/image-020.png>)

![5616 A4 1 copy image 21](<../assets/CSEC5616_assets/image-021.png>)

![5616 A4 1 copy image 22](<../assets/CSEC5616_assets/image-022.png>)

![5616 A4 1 copy image 23](<../assets/CSEC5616_assets/image-023.png>)

![5616 A4 1 copy image 24](<../assets/CSEC5616_assets/image-024.png>)
