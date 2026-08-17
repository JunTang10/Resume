# CSEC5619 — Applied Cryptography

## 第一章.密码学基础概念

基本原则1.Basic Concepts of Cryptography

【W2】 不可预测性 vs. 均匀分布 (Unpredictability vs. Uniform):

·  x ← {0,1}^100 表示 x 是一个从所有100位二进制串的集合中均匀随机抽取出来的字符串。

· “均匀”意味着集合中每一个具体的字符串（比如 00...0 或者 11...1）被抽到的概率都是完全相同的，即 1/2^100。

· 因为这个概率极其微小，对于任何攻击者 A 来说，想猜中 x（即 Pr[A→x]）是几乎不可能的。这就是“不可预测性”的来源。恢复整个 x 是非常困难的。

Unpredictability vs. Uniform Distribution:

x ← {0,1}^100 means x is a string chosen uniformly at random from the set of all possible 100-bit binary strings.

"Uniform" implies that every single string (e.g., 00...0 or 11...1) has an equal probability of being selected, which is 1/2^100.

Because this probability is infinitesimally small, it's nearly impossible for an adversary A to guess x (i.e., Pr[A→x] is tiny). This is the basis of "unpredictability." Fully recovering x is computationally har

· 克尔克霍夫原则 (Kerckhoff's Principle):

·  这是现代密码学的一个基本原则。它指出，一个密码系统的安全性不应该依赖于对加密算法本身的保密，而只应该依赖于对密钥（Key）的保密。

换句话说，我们必须假设攻击者完全知道我们用的是什么加密算法（如AES、DES等），系统的安全防线只有密钥。

Kerckhoff's Principle:

This is a fundamental principle of modern cryptography. It states that the security of a cryptosystem should not depend on the secrecy of the algorithm itself, but only on the secrecy of the key.

In other words, we must assume the adversary knows our encryption algorithm (e.g., AES, DES) completely. The only line of defense is the key.

Kerckhoff原则：安全性依赖于密钥的保密性，而不是算法的保密性

安全性定义：密钥必须具有不可预测性和均匀随机性/·  Confidentiality 机密性

·  ·  Cannot impersonate 无法冒充

对抗模型：考虑攻击者的能力、目标和资源

完美保密性（Perfect Secrecy）

定义：即使看到密文，也无法获得关于明文的任何信息

Goal 目标：攻击者无法恢复哪怕一位明文信息 Goal: Recover 1-bit info

🛠️Capability 能力：能够访问 1 个密文，拥有无限计算资源（理论最强模型）

🔒 明文与密文是 独立的（independent）  
🔒 密文 不泄露任何信息（not even 1 bit）

数学表达式：Pr[M=m|C=c] = Pr[M=m]

实现：一次性密码本（OTP）

Fundamental Principles:  
Kerckhoff’s Principle: Security depends on the secrecy of the key, not on the secrecy of the algorithm.  
Definition of Security: Keys must be unpredictable and uniformly random.  
· Confidentiality  
· Cannot impersonate  
Adversarial Model: Consider the attacker’s capabilities, objectives, and resources.

Perfect Secrecy  
Definition: Even after observing the ciphertext, no information about the plaintext can be obtained.  
Goal: An attacker cannot recover even a single bit of information about the plaintext.  
Capability: The attacker can access one ciphertext and has unlimited computational resources (theoretically the strongest model).  
Plaintext and ciphertext are independent.  
The ciphertext leaks no information (not even one bit).

Mathematical Expression: Pr[M = m | C = c] = Pr[M = m]  
Implementation: One-Time Pad (OTP)

#### h1-Q1: 完美安全加密的组合

问题：将完美安全的加密方案 Enc(k,m) 修改为 Enc′((k1,k2),m) := (Enc(k1,k2), Enc(k2,m))，是否仍然完美安全？

答案：是的，仍然完美安全

- Enc(k1,k2) 不泄露关于 k2 的信息

- Enc(k2,m) 不泄露关于 m 的信息

- 即使计算出 k1⊕m，由于密钥不重用，方案仍保持完美安全

题目考查的是对完美安全定义的深入理解：

- 即使攻击者看到 Enc(k1,k2) 和 Enc(k2,m)

- 由于密钥的独立性和随机性，仍然满足 Pr[M=m|C=c] = Pr[M=m]

- 这正是完美安全的核心要求

Q1: Combining Perfectly Secure Encryptions

Problem: Modify a perfectly secure scheme Enc(k, m) to Enc′((k₁, k₂), m) := (Enc(k₁, k₂), Enc(k₂, m)). Does it remain perfectly secure?  
Answer: Yes, it remains perfectly secure.  
Enc(k₁, k₂) leaks no information about k₂.  
Enc(k₂, m) leaks no information about m.  
Even if one computes k₁ ⊕ m, since keys are never reused, the scheme still maintains perfect secrecy.

This question tests a deep understanding of the definition of perfect secrecy: Even if the attacker sees Enc(k₁, k₂) and Enc(k₂, m), because of the independence and randomness of the keys, it still holds that Pr[M = m | C = c] = Pr[M = m]. That is the core requirement of perfect secrecy.

Q1. (10 points) Let Enc(k, m) be a perfect secure encryption, define Enc′((k1, k2), m) := (Enc(k1, k2),Enc(k2, m)). Whether it is still perfect secure? Briefly explain.

设 Enc(k,m)是一个完美安全（Perfectly Secure）的加密方案。现在定义新的加密函数如下：Enc′((k1,k2),m):=(Enc(k1,k2),Enc(k2,m))请问是否仍然是完美安全的？请简要解释原因。

yes

we keep k1, k2 secret

Enc(k1,k2) doesn't leak any information about k2

Enc(k2, m) doesn't leak any information about m

it is still perfect secure

for example, use OTP

Enc'((k1,k2),m) = (Enc(k1,k2), Enc(k2,m))

= k1⊕k2, k2⊕m

even we can get k1⊕m

still perfect secure (we do not reuse the key)

“是的。我们将 k₁ 和 k₂ 保密；

Enc(k₁,k₂) 不会泄露关于 k₂ 的任何信息，

Enc(k₂,m) 不会泄露关于 m 的任何信息，因此它仍然是完美安全的。  
例如，使用一次性密码本（OTP）：

Enc'((k1,k2),m) = (Enc(k1,k2), Enc(k2,m))

= k1⊕k2, k2⊕m

即使我们可以算出 k1⊕m ，由于密钥不重用，方案仍然保持完美安全。”

前面对后面加密，不会泄漏后面  dec是解密

opt 就是异或加密

## 第二章.一次性密码本（OTP）

【W2】对称加密 (Symmetric Encryption, SE) 及其安全性

1. 什么是安全 (What is Security?):

保密性 (Confidentiality): 确保信息不被未授权的第三方读取。这是加密最主要的目标。

不可伪装 (Cannot impersonate): 也称为认证（Authentication），确保通信的对方是其所声称的身份。虽然这里提到了，但对称加密本身主要解决的是保密性问题。

What is Security?:

Confidentiality: Ensuring that information is not read by unauthorized parties. This is the primary goal of encryption.

Cannot impersonate: Also known as Authentication, this ensures that the party you are communicating with is who they claim to be. While mentioned here, symmetric encryption primarily addresses confidentiality.

对称加密的语法 (Syntax of SE):

一个对称加密方案通常由三个算法组成，并且这些算法都是公开的：

KG(λ): 密钥生成算法。输入一个安全参数 λ（比如128），输出一个长度为 λ 的随机密钥 k。

Enc(m, k): 加密算法。输入明文 m 和密钥 k，输出密文 c。笔记中 c ← uniform 是一个理想目标，即希望输出的密文看起来是完全随机的。

Dec(c, k): 解密算法。输入密文 c 和密钥 k，输出原始明文 m。

Syntax of Symmetric Encryption (SE):

A symmetric encryption scheme typically consists of three public algorithms:

KG(λ): The Key Generation algorithm. It takes a security parameter λ (e.g., 128) and outputs a random key k of length λ.

Enc(m, k): The Encryption algorithm. It takes a plaintext message m and a key k and outputs a ciphertext c. The note c ← uniform signifies an ideal goal: the output ciphertext should appear completely random.

Dec(c, k): The Decryption algorithm. It takes a ciphertext c and a key k and outputs the original plaintext m.

安全模型 (Security Model):

为了严格地讨论“安全”，我们需要一个框架来定义威胁，这就是安全模型。它主要刻画了攻击者 (Adversary, Adv)。

攻击者的目标 (Goal): 他想做什么？可能是恢复整个明文 m，恢复部分 m，甚至只是 m 的一个比特，或者是恢复密钥 k。目标越小，对加密方案的安全要求越高。

攻击者的能力 (Capability): 他能获取什么信息？可能只能看到一个密文（Ciphertext, CT），或者多个，甚至无限个密文。

攻击者的资源 (Resources): 他有多少计算能力和时间？是无限的还是有限的？

·  To formally discuss "security," we need a framework to define threats. This is the security model, which characterizes the Adversary (Adv).

·  Adversary's Goal: What does the adversary want to achieve? It could be recovering the entire message m, part of m, a single bit of m, or even the key k. The smaller the goal, the stronger the security requirement for the scheme.

·  Adversary's Capability: What information can the adversary access? They might see one ciphertext (CT), multiple ciphertexts, or even an unlimited number.

·  Adversary's Resources: How much computational power and time do they have? Is it unlimited or bounded?

完美保密 (Perfect Secrecy) 与一次性密码本 (One-Time Pad, OTP)

完美保密的定义:

这是密码学中最强的安全级别。

它要求攻击者在拥有无限计算资源并且看到一个密文的情况下，对明文的了解也不会增加任何一点。

·  Definition of Perfect Secrecy:

·  This is the strongest possible level of security in cryptography.

It requires that an adversary with unlimited computational resources, even after observing a ciphertext, learns absolutely nothing new about the plaintext.

·  ·

用概率论的语言描述就是：在看到密文 c 后，某个明文是 m₀ 的概率，和没看到 c 之前完全一样 (Pr[M = m₀ | C = c] = Pr[M = m₀])。这意味着密文 c 没有泄露关于明文 M 的任何信息，两者是统计独立的。

In probabilistic terms: the probability of the message being m₀ given the ciphertext c is the same as the probability before seeing c (Pr[M = m₀ | C = c] = Pr[M = m₀]). This means the ciphertext c and the plaintext M are statistically independent.

一次性密码本 (OTP):

OTP是唯一能实现完美保密的加密方案。

工作原理:

密钥 k 是一个和明文 m 等长的真随机字符串。

加密: c = m ⊕ k (⊕ 是异或操作)。

解密: m = c ⊕ k。

为什么它能实现完美保密？ 证明的核心思想是：对于任意一个给定的密文 c，以及任意一个可能的明文 m₀，都存在一个唯一的密钥 k (k = c ⊕ m₀) 可以将其映射。因为密钥 k 是完全随机的，所以任何明文都是等可能地生成了该密文。因此，观察到密文 c 并不能让你对哪个明文更“可能”有多一分的了解。

One-Time Pad (OTP):

OTP is the only known encryption scheme that achieves perfect secrecy.

How it works:

The key k is a truly random string that is at least as long as the plaintext m.

Encryption: c = m ⊕ k (where ⊕ is the XOR operation).

Decryption: m = c ⊕ k.

Why is it perfectly secure? The core idea of the proof is: for any given ciphertext c and any possible plaintext m₀, there exists a unique key k (k = c ⊕ m₀) that maps them. Since the key k is chosen uniformly at random, every possible plaintext is an equally likely candidate for having produced the ciphertext c. Therefore, observing c gives you no additional information to favor one plaintext over another.

OTP的致命缺点:

密钥长度: 密钥 k 的长度必须大于等于明文 m 的长度 (|K| ≥ |M|)。给1GB的文件加密就需要1GB的密钥，这在密钥分发和管理上是巨大的挑战。

密钥复用: 密钥绝对不能使用超过一次。如果同一个密钥 k 被用来加密两个不同的明文 m₁ 和 m₂，攻击者截获两个密文 c₁ 和 c₂ 后，可以计算 c₁ ⊕ c₂ = (m₁ ⊕ k) ⊕ (m₂ ⊕ k) = m₁ ⊕ m₂。这虽然没有直接恢复 m₁ 或 m₂，但泄露了它们之间的关系，对于有规律的文本（如英文、代码）来说，这通常足以破解大部分内容。

Fatal Flaws of OTP:

Key Length: The key k must be at least as long as the message m (|K| ≥ |M|). Encrypting a 1GB file requires a 1GB key, which is a massive challenge for key distribution and management.

Key Reuse: A key must never be used more than once. If the same key k is used to encrypt two different messages m₁ and m₂, an adversary who intercepts the two ciphertexts c₁ and c₂ can compute c₁ ⊕ c₂ = (m₁ ⊕ k) ⊕ (m₂ ⊕ k) = m₁ ⊕ m₂. While this doesn't directly reveal m₁ or m₂, it leaks their relationship, which is often enough to break much of the content for structured data (like English text or code).

一次性密码本（OTP）虽然能实现完美保密，但其“密钥与明文等长”和“密钥不能复用”的致命缺点使其在实践中几乎不可用。这就引出了本讲的核心议题：我们能否牺牲一点理论上的“完美”，来换取一个在现实世界中足够安全且实用的加密方案？

答案是肯定的。这需要我们重新定义“安全”，从“信息论安全”（对手有无限计算能力也无法破解）走向“计算安全”（对手在有限的、现实的时间内无法破解）。

the One-Time Pad (OTP), while achieving perfect secrecy, is impractical due to its fatal flaws—the key must be as long as the message, and it cannot be reused. This leads to the central theme of this lecture: can we sacrifice a bit of theoretical "perfection" in exchange for a cryptographic scheme that is both secure enough and practical for the real world?

The answer is yes. This requires us to redefine "security," moving from "information-theoretic security" (unbreakable even with infinite computing power) to "computational security" (unbreakable within a realistic, finite amount of time).

### 2.One-Time Pad (OTP)

构造 :密钥生成：均匀随机k

加密：c = k ⊕ m

解密：m = c ⊕ k

缺点

关键长度必须与消息等长。这个限制是固有的（inherent）

任务 1 —— 解决“密钥 ≥ 明文”难题  
OTP 要求密钥长度不短于消息长度。现代流密码（stream ciphers）通过 伪随机密钥流生成器 让短种子扩展成长密钥流，从而规避这一硬性限制。

密钥只能使用一次 Key Used Once 如果攻击者能看到多个密文，并且它们用的是同一个密钥 k，那么就会泄露两个明文之间的关系  密钥必须只用一次 → 实际中管理非常困难

任务 2 —— 解决“密钥只能用一次”难题  
使用安全的密钥派生或状态更新机制（例：CTR / GCM 模式），在不重复密钥的前提下支持多条消息加密。

#### 规约证明

- 证明某个方案在添加某种机制后仍然安全

- 使用归约技术：如果新方案不安全，则原方案也不安全

Construction

Key generation: k ← uniformly random

Encryption: c = k ⊕ m

Decryption: m = c ⊕ k

Drawbacks

Key length must be at least as long as the message. This limitation is inherent.  
Task 1 – Solve the “Key ≥ Plaintext” problem  
OTP requires the key length to be no shorter than the message length. Modern stream ciphers use a pseudorandom keystream generator to expand a short seed into a long keystream, thereby circumventing this rigid restriction.

Key must be used only once. If an attacker sees multiple ciphertexts encrypted under the same key k, relationships between plaintexts are leaked. Managing single-use keys in practice is very difficult.  
Task 2 – Solve the “Key Used Only Once” problem  
Use secure key-derivation or state-update mechanisms (e.g., CTR/GCM mode) to support multiple message encryptions without reusing the same key.

Reduction Proof

Prove that adding a mechanism preserves security.

Use reduction: if the new scheme is insecure, then the original scheme would also be insecure.

#### h1-Q6: PRF 的输入输出调整

问题：F1(K,x) := E(K,x‖0)‖E(K,x‖1) 是否仍为 PRF？

答案：是的，仍然是 PRF

- 通过归约证明：如果能区分 F1，就能区分原始的 E

Q6: Adjusting PRF Inputs and Outputs  
Problem: Define  
 F₁(K, x) := E(K, x‖0)‖E(K, x‖1).  
Is F₁ still a PRF?  
Answer: Yes, it remains a PRF (by reduction: any distinguisher for F₁ yields one for the original E).

#### 构造说明

原始PRF: E: K × X → Y新构造: F1(K,x) := E(K,x‖0)‖E(K,x‖1)

输入输出变化：

- 输入域：从 X 变为 X（实际上是输入的有效长度减1）

- 输出域：从 Y 变为 Y × Y（输出长度翻倍）

#### 安全性证明（归约论证）

定理：如果 E 是安全的PRF，那么 F1 也是安全的PRF。

- F1 的安全性完全依赖于原始PRF E 的安全性

- 输入扩展（x → x‖0, x‖1）不会泄露信息

- 输出拼接（y1‖y2）保持伪随机性

#### 为什么这个构造是安全的？

1. 输入的独立性

- 对于不同的 x，(x‖0) 和 (x‖1) 是不同的输入

- 对于同一个 x，(x‖0) 和 (x‖1) 也是不同的输入

- PRF E 对不同输入给出独立的伪随机输出

2. 输出的拼接

- 两个独立的伪随机值的拼接仍然是伪随机的

- 没有明显的模式或结构可以利用

3. 完美的模拟

- 归约中的模拟是完美的，没有信息损失

- 区分 F1 的能力直接转化为区分 E 的能力

#### 一般化原理

这个构造展示了PRF的一个重要性质：

- 域扩展：可以安全地扩展PRF的输入域

- 输出拼接：可以安全地增加PRF的输出长度

- 归约安全性：新构造的安全性归约到原始PRF

#### 实际应用

这种技术在实践中很有用：

- 块密码模式：CTR模式就使用了类似的计数器扩展

- 密钥派生：从一个PRF密钥生成多个子密钥

- 流密码：扩展PRF输出来生成长密钥流

#### 对比其他构造

安全的扩展：

- F1(K,x) = E(K,x‖0)‖E(K,x‖1) ✅

- F2(K,x) = E(K,x)‖E(K,x+1) ✅

不安全的扩展：

- F3(K,x) = E(K,x)‖E(K,x) ❌（重复）

- F4(K,x) = E(K,x)‖K ❌（泄露密钥）

Construction Details

Original PRF: E: K × X → Y,New PRF: F₁(K, x) = E(K, x‖0)‖E(K, x‖1)

Input/Output Changes

Input domain: still X (effectively one bit shorter per branch)

Output domain: from Y to Y × Y (output length doubled)

Security Proof (Reduction)

Theorem: If E is a secure PRF, then F₁ is also a secure PRF.

Security of F₁ depends entirely on E.

Input extension (x → x‖0, x‖1) leaks no information.

Output concatenation (y₁‖y₂) remains pseudorandom.

Why This Is Secure

1.Input independence

For any x, x‖0 and x‖1 are distinct inputs.

E produces independent pseudorandom outputs for each.

2.Output concatenation

Concatenating two independent pseudorandom values is still pseudorandom.

3.Perfect simulation

The reduction simulator is perfect; a distinguisher for F₁ directly yields one for E.

Generalization Principles

Domain extension: safely extend PRF input domain.

Output concatenation: safely increase PRF output length.

Reduction security: new construction’s security reduces to the original PRF.

Practical Applications

Block-cipher modes (e.g., CTR) use similar counter-extension.

Key derivation: generate multiple subkeys from one PRF key.

Stream ciphers: extend PRF output to a long keystream.

Comparison with Other Constructions

Secure extensions:

F₁(K,x)=E(K,x‖0)‖E(K,x‖1) ✅

F₂(K,x)=E(K,x)‖E(K,x+1) ✅

Insecure extensions:

F₃(K,x)=E(K,x)‖E(K,x) ❌ (duplicate outputs)

F₄(K,x)=E(K,x)‖K ❌ (key leakage)

Q6. (10 points) Given a PRF E : K × {0, 1}n → {0, 1}m, we construct F1 : K × {0, 1}n−1 → {0, 1}2m as follows: F1(K, x) := E(K, x∥0)∥E(K, x∥1). Is F1(K, ·) still a PRF? If yes, give a brief proof; if not, give a brief attack showing the violation of the PRF definition.

在实践中，通常情况下，良好的分组密码，如AES（或一些精心设计的散列，如SHA256）被认为是一个PRF。然而，分组密码，顾名思义，工作在固定长度的块上，例如，AES只工作在128位的消息上。以下是调整PRF输入/输出长度的两种可能方法：给定一个PRF E: K × {0,1}n→{0,1}m，我们构造F1: K × {0,1}n−1→{0,1}2m如下：F1(K, x):= E(K, x∥0)∥E（K, x∥1）。F1（K，·）还是PRF吗？如果是，给出一个简短的证明；如果没有，给出一个简短的攻击，显示对PRF定义的违反。

it is a PRF

suppose it is not, we can distinguish F1(K,x) from a random string

then for any E(K,x||b), we can query E(K,x||1-b) to compute F1(K,x)

and distinguish E(K,x||b) from the random string with the same probability

它是一个 PRF

假设不是，我们可以将 F1(K,x) 与随机串区分

那么对于任意 E(K,x‖b)，我们可以查询 E(K,x‖1-b) 来计算 F1(K,x)

并以相同的概率将 E(K,x‖b) 与随机串区分

详解

F₁ 的构造：

对任意 x，F₁(K,x) = E(K, x‖0) ‖ E(K, x‖1)

简要理由：

1. E 本身是 PRF，对任何输入都输出伪随机

2. F₁ 只是将 E 在 x‖0 和 x‖1 上的输出拼接，不引入新漏洞

3. 如果能区分 F₁(K,·) 与真随机串，就可以固定一分支调用区分器，将 E(K,·) 与真随机串区分开来

4. 这违背了 E 是安全 PRF 的假设，因此 F₁ 必然也是 PRF

Construction of F₁:

For any x, F₁(K, x) = E(K, x‖0) ‖ E(K, x‖1)

Brief rationale:

1. E is a PRF, producing pseudorandom output for any input.

2. F₁ merely concatenates E’s outputs on x‖0 and x‖1, introducing no new vulnerability.

3. If one could distinguish F₁(K,·) from a truly random string, one could fix one branch and use that distinguisher to distinguish E(K,·) from random.

4. This contradicts the assumption that E is a secure PRF, so F₁ must also be a PRF.

## 第三章.秘密共享（Secretsharing）

【w2】应用 - 秘密共享 (Secret Sharing)

尽管OTP有缺点，但其核心思想（用一个随机数去“掩盖”一个秘密）非常有用。秘密共享就是一个经典应用。

1. (2, 2)-秘密共享:

目标: 将秘密 s 分成两个份额 s₁ 和 s₂。必须同时拥有 s₁ 和 s₂ 才能恢复 s，只拥有其中任何一个都无法获得关于 s 的任何信息。

安全构造:

Share(s): 随机生成一个和 s 等长的 k。令 s₁ = s ⊕ k (相当于用OTP加密)，s₂ = k。

Rec(s₁, s₂): 计算 s₁ ⊕ s₂ 即可恢复 s。

安全性: 只看到 s₁ 等于只看到一个OTP的密文，无法得知 s。只看到 s₂ 等于只看到一个随机密钥，也无法得知 s。

Despite OTP's flaws, its core idea (using a random value to "mask" a secret) is very powerful. Secret sharing is a classic application.

(2, 2)-Secret Sharing:

Goal: To split a secret s into two shares, s₁ and s₂, such that both are required to recover s. Possessing only one share reveals no information about s.

A Secure Construction:

Share(s): Generate a random key k of the same length as s. Let s₁ = s ⊕ k (an OTP encryption) and s₂ = k.

Rec(s₁, s₂): Simply compute s₁ ⊕ s₂ to recover s.

Security: Seeing s₁ is like seeing an OTP ciphertext; it reveals nothing about s. Seeing s₂ is like seeing a random key; it also reveals nothing about s.

1. (t, n)-秘密共享 (Shamir's Secret Sharing):

这是一个更通用的方案，目标是将秘密 s 分成 n 个份额，集齐任意 t 个份额就可以恢复秘密，但少于 t 个则完全无法恢复。

核心思想: 基于一个数学事实——t个点可以唯一确定一个 t-1 次的多项式。

~~~~~构造 (以(2,3)-秘密共享为例):

我们要共享秘密 s。我们构造一条直线（1次多项式）f(x) = ax + b。

将秘密 s 设为这条线的截距，即 b = s。

随机选择一个斜率 a。

三个份额就是这条直线上的三个点：s₁ = f(1), s₂ = f(2), s₃ = f(3)。

恢复: 任意两个点（比如 s₁ 和 s₂）都能唯一确定这条直线，从而计算出截距 f(0) = s。

安全: 只拥有一个点，你可以在这个点上画出无数条直线，无法确定唯一的截距，因此无法得知 s。

推广到 (t, n)-SS: 构造一个 t-1 次多项式 f(x) = a_{t-1}x^{t-1} + ... + a₁x + s，其中 s 是秘密，a₁ 到 a_{t-1} 是随机选取的系数。生成 n 个份额 sᵢ = f(i)。任意 t 个点都可以通过多项式插值法恢复出整个多项式，从而得到 f(0) = s。

2. (t, n)-Secret Sharing (Shamir's Secret Sharing):

This is a more general scheme. The goal is to split a secret s into n shares, where any t of them can reconstruct the secret, but any t-1 or fewer shares reveal nothing.

Core Idea: Based on the mathematical fact that t points uniquely define a polynomial of degree t-1.

~~~Construction (using (2,3)-sharing as an example):

We want to share a secret s. We construct a line (a polynomial of degree 1): f(x) = ax + b.

We embed the secret s as the y-intercept of the line, so b = s.

We choose a random slope a.

The three shares are three points on this line: s₁ = f(1), s₂ = f(2), s₃ = f(3).

Reconstruction: Any two points (e.g., s₁ and s₂) are sufficient to uniquely define the line and thus calculate its y-intercept f(0) = s.

Security: With only one point, you can draw infinite lines through it, so you cannot determine the unique intercept, and thus you learn nothing about s.

Generalization to (t, n)-SS: Construct a polynomial of degree t-1: f(x) = a_{t-1}x^{t-1} + ... + a₁x + s, where s is the secret and coefficients a₁ through a_{t-1} are chosen randomly. Generate n shares sᵢ = f(i). Any t points can be used to reconstruct the polynomial via interpolation, revealing f(0) = s.

3.Secret Sharing (Secret Sharing)

(t,n)门限方案

任何一个贡献都可以重构秘密

短缺个捐助无法获得秘密的任何信息

沙米尔秘密共享

目标：任意两个片段可以恢复 secret，任意一个泄露 0 信息

“Any 2 reconstruct!”

“Any 1 leaks nothing!”

这就是 Shamir Secret Sharing 的经典用途，构造更复杂，依赖多项式插值等数论方法

✅ 特性总结

| 特性 | 描述 |
| --- | --- |
| 正确性 (Correctness) | 任意 t个分享可以重建 f(x)，从而求出 s=f(0) |
| 安全性 (Security) | 少于 t个分享对 s完全没有信息（保密性） |
| 应用 | 分布式密钥管理、MPC、加密投票、冷启动恢复、核按钮等 |

(t, n) Threshold Scheme

Any t shares can reconstruct the secret.

Fewer than t shares reveal no information about the secret.

Shamir Secret Sharing

Goal: Any 2 shares reconstruct the secret; any 1 share leaks zero information.  
(“Any 2 reconstruct!”  
“Any 1 leaks nothing!”)

This is the classic use of Shamir’s scheme, which is constructed using polynomial interpolation over a finite field.

Feature Summary  
Property   Description  
Correctness   Any t shares interpolate f(x) to recover s = f(0).  
Security   Fewer than t shares give zero information about s.

Applications  Distributed key management,Multi-party computation (MPC),Encrypted voting,Cold-boot recovery,Nuclear launch controls

#### ----------------------------------------

#### h1-Q10: 门限密钥分发

问题：设计三个代理服务器的 2-out-of-3 门限方案

方案：

- 生成 S1, S2，计算 S3 = mk ⊕ S1 ⊕ S2

- 代理 1：(S1, S2)，代理 2：(S1, S3)，代理 3：(S2, S3)

- 用户需要至少两个代理的份额才能重构密钥

Q10: 2-out-of-3 Threshold Key Distribution  
Problem: Design a 2-out-of-3 threshold scheme across three proxy servers.

Scheme:

Choose random S1 and S2; compute S3 = mk ⊕ S1 ⊕ S2.

Distribute shares:Proxy 1: (S1, S2)Proxy 2: (S1, S3),proxy 3: (S2, S3)

Any two proxies’ shares suffice to reconstruct mk.

#### 方案分析

##### 1. 正确性 (Correctness)

用户需要至少两个代理的份额才能恢复 mk以下是重建密钥的步骤：

- 从 代理 1 和代理 2： 获取 S1,S2,S3​。

由公式 S3=mk⊕S1⊕S2，可得：

mk=S3⊕S1⊕S2

S_2mk=S3​⊕S1​⊕S2​

- 从 代理 1 和代理 3：

获取 S1,S2,S3，同样可重建 mk。

- 从 代理 2 和代理 3：

获取 S1,S3,S2同样可重建 mk

结论：任意两个代理的份额足以重建密钥 mkmkmk，满足正确性。

##### 安全性 (Security)

- 如果只有 1 个代理的份额：

- 代理 1：只有 S1,S2，但缺少 S3，无法重建 mk。

- 代理 2：只有 S1,S3​，但缺少 S2，无法重建 mk。

- 代理 3：只有 S2,S3但缺少 S1，无法重建 mk。

由于 S1​ 和 S2 是随机生成的，单个代理的份额无法推测出任何有用信息

结论：少于 2 个代理的份额对 mkmkmk 无法提供任何信息，满足安全性。

Scheme Analysis

Correctness (Correctness)

The user needs at least two proxies’ shares to recover mk. Steps to reconstruct the key:

1.From Proxy 1 and Proxy 2:

Obtain S₁, S₂, S₃.

Since S₃ = mk ⊕ S₁ ⊕ S₂, compute mk = S₃ ⊕ S₁ ⊕ S₂.

2.From Proxy 1 and Proxy 3:

Obtain S₁, S₂, S₃; reconstruct mk in the same way.

3.From Proxy 2 and Proxy 3:

Obtain S₁, S₃, S₂; reconstruct mk in the same way.

Conclusion: Any two proxies’ shares suffice to reconstruct mk, satisfying correctness.

2.Security (Security)

If only one proxy’s shares are available:

Proxy 1 has only S₁ and S₂, but lacks S₃; cannot reconstruct mk.

Proxy 2 has only S₁ and S₃, but lacks S₂; cannot reconstruct mk.

Proxy 3 has only S₂ and S₃, but lacks S₁; cannot reconstruct mk.

Since S₁ and S₂ are randomly generated, a single proxy’s shares leak no useful information.

Conclusion: Fewer than two proxies’ shares provide no information about mk, satisfying security.

#### 应用场景

- 分布式密钥管理： 密钥被安全分布到多个代理中，只有满足门限条件的代理才能重建密钥。

- 冷启动恢复： 系统管理员可以通过任意两个代理恢复系统密钥。

- 加密投票： 投票结果由多个代理分发和验证，保证安全性和正确性。

- 核按钮：  需要至少 2 名授权人员的确认才能触发操作，保证安全性

#### 总结

- 该方案通过 XOR 操作分配密钥份额，满足 Shamir Secret Sharing 的“2-out-of-3”门限方案的要求。

- 正确性：任意两个代理可重建密钥。

- 安全性：单个代理的份额对密钥无任何信息泄露。

- 该方法适用于多种分布式系统和安全场景。

Applications

1.Distributed key management: only a threshold of proxies can recover the key.

2.Cold-boot recovery: system administrators can restore the key using any two proxies.

3.Encrypted voting: results are split across proxies to ensure security and correctness.

4.Nuclear launch controls: requires at least two authorized parties to agree.

Summary

Shares are assigned via XOR to satisfy a “2-out-of-3” threshold.

Correctness: any two proxies reconstruct the key.

Security: a single proxy’s shares reveal nothing.

Widely applicable to distributed systems and high-security scenarios.

#### ----------------------------------------

Q10. (10 points) In some settings, the movie distribution center may only delegate the subscriber management (i.e., the user key distribution) to some proxies. However, since the master secret of the movie distribution center is critical for the security of the whole system, delegating it to a single proxy  
is a bit too risky (as the proxy can simply get the secret key and decrypt everything). Can you generalize your idea in Q9 and design a key derivation method such that there are three proxy servers, and only when a user obtains shares from at least two of them user i can obtain a valid secret key ki? But any single share (or any single proxy) is not sufficient. Also, users can never reconstruct the secret keys of either the proxy or the content distribution center. Moreover, please pair the key derivation with a proper encryption algorithm to actually enable the secure content distribution to users (the movie distribution server encrypts/encodes the movie and sends some ci to the user i), and describe the ci generation procedure, assuming you have some secure encryption library Enc(key, message) to use already.

在某些情况下，电影分发中心可能仅将订阅者管理（即用户密钥分发）委托给一些代理。然而，由于电影分发中心的主密钥对于整个系统的安全性至关重要，将其委托给单个代理风险太大（因为代理可以简单地获取密钥并解密所有内容）。能否将您在 Q9 中的想法进行推广，并设计一种密钥派生方法，使得有三个代理服务器，只有当用户从其中至少两个代理服务器获取份额时，用户 i 才能获得有效的密钥 ki？但任何单个份额（或任何单个代理）都不足以获取。此外，用户永远无法重建代理或内容分发中心的密钥。另外，请将密钥派生与适当的加密算法相结合，以实际实现向用户的安全内容分发（电影分发服务器对电影进行加密/编码，并向用户 i 发送一些 ci），并假设您已经有一些安全加密库 Enc(key, message) 可用，请描述 ci 的生成过程。

key derivation method:

1. The movie distribution center generates 2 uniform random numbers S1 and S2, and calculates S3 = mk ⊕ S2 ⊕ S2.

2. The movie distribution center shares (S1, S2) to proxy 1, (S1, S3) to proxy 2, and (S2, S3) to proxy 3.

3. For subscriber i, the movie distribution center sends the unique user name id_i to each proxy.

4. Each proxy generates the secret key using a PRF E with the shares as the key. For example, for proxy 1: k_i1 = (E(S1, id_i), E(S2, id_i)).

5. The user can obtain shares from at least two of the proxies to get all shares of the secret key (i.e., E(S1, id_i), E(S2, id_i), and E(S3, id_i)). Then the user can calculate the valid secret key k_i = E(S1, id_i) ⊕ E(S2, id_i) ⊕ E(S3, id_i).

By using the above method, none of the proxies can learn any information about the master key mk, and the subscriber requires the shares from at least 2 proxies to get all shares of the secret key. The valid secret key k_i for subscriber i is only known between the movie distribution center and the subscriber, such that the proxy can not decrypt the movie using the master key or the subscriber's secret key.

密钥派生方法：

1. 内容分发中心生成两个均匀随机数 S1 和 S2，并计算 S3 = mk ⊕ S2 ⊕ S2。

2. 内容分发中心将 (S1, S2) 分发给代理 1，将 (S1, S3) 分发给代理 2，将 (S2, S3) 分发给代理 3。

3. 对于订阅者 i，内容分发中心将唯一用户名 id_i 发送给每个代理。

4. 每个代理使用其持有的两份随机数作为密钥，通过伪随机函数 E 生成订阅密钥份额。例如，代理 1 生成 k_i1 = (E(S1, id_i), E(S2, id_i))。

5. 用户从至少两个代理处获取输出（即 E(S1, id_i)、E(S2, id_i) 和 E(S3, id_i)），然后计算有效订阅密钥

k_i = E(S1, id_i) ⊕ E(S2, id_i) ⊕ E(S3, id_i)。

通过上述方法，任何单个代理都无法获知主密钥 mk；订阅者需要至少两台代理提供份额才能恢复出完整的订阅密钥 k_i。订阅者 i 的有效订阅密钥 k_i 仅在内容分发中心和订阅者之间共享，代理无法使用主密钥或订阅密钥解密电影。

密钥派生方法（Key Derivation Method）是指从一个初始秘密值（如主密钥、口令、Diffie–Hellman 共享秘密等）安全、可控地生成一个或多个密钥的算法／流程，主要特点：

1.输入

主密钥（Master Key）、预共享密钥

密码（Password）

共享秘密（如 DH 输出）

随机盐（Salt）、上下文信息（Info）

2.核心目标

扩展性：产生比输入更长或更多的密钥材料

不可区分：输出的每一位对无密钥者看都伪随机

抗碰撞：不同上下文或不同用户导出的密钥相互独立

3.典型构件

PRF/HMAC（如 HKDF）

密码散列函数（如 PBKDF2、scrypt、Argon2）

XOR／Shamir 门限分享（阈值密钥派生）

密钥协商 KDF（如 TLS/SSH 中的 DH KDF）

4.基本流程

提取（Extract）：用 HMAC/散列从原始秘密和盐生成中间密钥

扩展（Expand）：用中间密钥生成所需长度的会话密钥或多个子密钥

Key Derivation Method is a process/algorithm that securely and deterministically derives one or more keys from an initial secret value (e.g., a master key, password, Diffie–Hellman shared secret, etc.). Main characteristics:

1. **Inputs**

- Master key or pre-shared key

- Password

- Shared secret (e.g., DH output)

- Salt and context information (Info)

2. **Core Goals**

- **Expandability**: produce key material longer or in greater quantity than the input

- **Indistinguishability**: every output bit is pseudorandom to anyone without the key

- **Collision resistance**: keys derived for different contexts or users are independent

3. **Typical Building Blocks**

- **PRF/HMAC** (e.g., HKDF)

- **Cryptographic hash functions** (e.g., PBKDF2, scrypt, Argon2)

- **XOR/Shamir threshold sharing** (threshold key derivation)

- **Key-agreement KDFs** (e.g., the DH KDF in TLS/SSH)

4. **Basic Workflow**

1. **Extract**: derive a pseudorandom key (PRK) from the original secret and salt via HMAC or hash

2. **Expand**: generate the required session key(s) or subkeys of desired length from the PRK

## 第四章.计算安全性4. Computational Security

【w3 】为了建立计算安全的框架，我们需要对“攻击者”和“成功破解”进行更现实的定义。

- 现实的攻击者 (Realistic Attacker) = 高效算法 (Efficient Algorithm)

在计算理论中，“高效”通常等同于多项式时间 (Polynomial Time)。

一个算法的运行时间 T 是输入长度 n 的一个多项式函数，例如 n², n³ 或 100n⁶。这类算法被认为是可行的 (feasible)。

与之相对的是指数时间 (Exponential Time)，例如 2^n。当 n 增大时，其增长速度极快，被认为是不可行的 (infeasible)。笔记中的例子 2^100 秒远超宇宙年龄，形象地说明了这一点。

因此，我们假设攻击者只能使用概率多项式时间 (Probabilistic Polynomial Time, PPT) 算法。这意味着攻击者是高效的，但不是无限强大的。

- Realistic Attacker = Efficient Algorithm

In computational theory, "efficient" is equated with Polynomial Time.

An algorithm's running time T is a polynomial function of the input length n, such as n², n³, or 100n⁶. Such algorithms are considered feasible.

The opposite is Exponential Time, like 2^n, which grows so rapidly with n that it's considered infeasible. The note's example of 2^100 seconds, far exceeding the age of the universe, illustrates this perfectly.

Therefore, we model our adversary as a Probabilistic Polynomial Time (PPT) algorithm. This means the adversary is efficient but not all-powerful.

- 微不足道的成功概率 = 可忽略函数 (Negligible Function)

既然攻击者能力有限，我们也不再要求他完全无法成功，而是要求其成功的概率极其微小，小到可以忽略不计。

如何定义“小”？ 这就是可忽略函数 neg(n) 的概念。一个函数 f(n) 是可忽略的，如果它比任何反比多项式函数 1/n^c (对于任意常数 c > 0) 下降得都快。

直观理解: 随着安全参数 n 的增长，neg(n) 会迅速趋近于0，比 1/n², 1/n³ 等任何你能想到的多项式分之一都要快。

例子: 2⁻ⁿ 是可忽略的，而 1/n³ (多项式) 或 1/log n (比多项式慢) 都不是。

重要性质: 多项式 × 可忽略 = 可忽略。这个性质至关重要，它意味着即使一个攻击者将一个成功概率为“可忽略”的攻击重复“多项式”次，总的成功概率仍然是“可忽略”的。

小结：计算安全的定义是：对于任何PPT攻击者，其成功破解密码系统的概率是可忽略的。这个模型虽然比完美保密弱，但足以抵御所有现实中的攻击。

To build the framework for computational security, we need more realistic definitions for both the "adversary" and what it means to "succeed."

- Trivial Success Probability = Negligible Function

Since the adversary's power is limited, we no longer demand zero chance of success. Instead, we require that the probability of success is extremely small, so small that it can be ignored.

How to define "small"? This is the concept of a Negligible Function, neg(n). A function f(n) is negligible if it decreases faster than any inverse polynomial function 1/n^c (for any positive constant c).

Intuitive Understanding: As the security parameter n grows, neg(n) approaches zero much faster than 1/n², 1/n³, or any other inverse polynomial you can think of.

Examples: 2⁻ⁿ is negligible, while 1/n³ (a polynomial) or 1/log n (decreases slower than a polynomial) are not.

Key Property: poly(n) × neg(n) = neg(n). This property is crucial. It means that even if an adversary repeats an attack with a "negligible" success probability for a "polynomial" number of times, the total success probability remains "negligible."

Summary: The definition of Computational Security is: for any PPT adversary, their probability of breaking the cryptosystem is negligible. This model, while weaker than perfect secrecy, is strong enough to defend against all realistic attacks.

【原始】

概念转变

从完美安全到计算安全

允许可忽略的失败概率

限制攻击者为演示式时间

关键定义

可忽略函数：比任何计算式的倒数都小

计算不可区分性：计算式时间攻击者无法区分

Conceptual Shift

From perfect security to computational security

Allow negligible failure probability

Restrict attackers to probabilistic polynomial‐time

Key Definitions

Negligible Function: smaller than the reciprocal of any polynomial

Computational Indistinguishability: no probabilistic polynomial‐time attacker can distinguish

#### Q2: 可忽略函数的识别

问题：判断哪些函数适合描述密码方案中的小故障概率

关键标准：可忽略函数必须随 n 增长而无限趋近于 0

- (a) 1000^(-99999) - 不适合（常数）

- (b) 1000^(-log₂n) - 不适合（不趋于零）

- (c) n^89347/3^n - 适合（指数衰减）

- (d) e^(-log₂n^1000) - 不适合（有限次幂的逆）

Q2: Identifying Negligible Functions

Problem: Determine which functions suitably describe a small failure probability in a cryptosystem

Key Criterion: Negligible functions must tend to 0 as n grows

* (a) 1000^(–99999) – Not suitable (constant)

* (b) 1000^(–log₂ n) – Not suitable (does not tend to zero)

* (c) n^89347 / 3^n – Suitable (exponential decay)

* (d) e^(–log₂ n^1000) – Not suitable (inverse of finite power)

* (e) n^(–log₂ n) – Suitable (super‐polynomial decay)

- (e) n^(-log₂n) - 适合（超指数衰减）

·  从完美安全到计算安全"

·  可忽略函数是计算安全性的核心概念

·  用于量化"允许可忽略的失败概率"

计算不可区分性：多项式时间攻击者无法区分

• “From perfect security to computational security”

• Negligible functions are the core concept of computational security

• They quantify the “allowed negligible failure probability”

Computational Indistinguishability: no polynomial‐time attacker can distinguish

Q2. (5 points) Decide whether the following functions are suitable to characterize small failure prob-ability in cryptographic schemes, and explain briefly.

决定下列函数是否适合描述密码方案中的小故障概率，并简要说明。  
(a) 1000−99999  
(b) 1000− log2 n  
(c) n89347/3n  
(d) e− log2 n1000  
(e) n− log2 n

常见函数（如(a)）显然不趋零，排除。

线性减对数（如（b））不趋于零，也排除。

分子演示式、分母指数（如(c)）属于经典的可忽略函数。

![7.20 5619 课程大纲 copy image 1](<../assets/CSEC5619_assets/image-001.png>)

有限次幂的逆算式（如(d)），形式上是(1/n)帕(1/n)^{\text{平常}}（1/ n ）帕，只能战胜有限阶的1/nc1/n^c1/ nc，不符合“对任何ccc”的要求。

超演示式衰减（如(e)），这里的指数自身还随日志⁡n\log n日志​n增长，因此下调幅度超过了预期(1/n)c（1/n）^c（1/ n ）c，满足可忽略函数的定义

极小失败概率是要使n 变动时无限趋近于0

## 第五章.随机生成器（PRG）5.Pseudorandom Generator (PRG)

##### [w3]伪随机性——解决密钥长度问题的钥匙

有了计算安全的框架，我们就可以着手解决OTP的问题了。核心思想在讲义的示意图中已经画出：

短的真随机密钥 (K) → [拉伸/Stretch] → 长的、看起来随机的密钥 (K*)

然后我们就可以用这个长密钥 K* 当作OTP的密钥来加密消息 M。这里的关键问题是，K* 并不是真的随机，那么它需要满足什么性质才能保证安全呢？

##### Pseudorandomness - The Key to Solving the Key-Length Problem

With the framework of computational security, we can now tackle OTP's problem. The core idea is depicted in the lecture notes' diagram:

Short, truly random key (K) → [Stretch] → Long, random-looking key (K*)

We can then use this long key K* as the key for an OTP-like encryption of message M. The critical question is, since K* is not truly random, what property must it satisfy to guarantee security?

“看起来一样好” = 计算不可区分性 (Computational Indistinguishability)

1. 讲义用图灵测试做了个类比：如果一个高效的“区分器”（测试程序）无法有效地区分一个东西是来自AI还是来自人类，我们就说这个AI通过了图灵测试。

1. 类似地，如果对于任何PPT区分器 D，它拿到一个字符串后，无法有效判断这个字符串是来自某个程序 D₁ 的输出，还是来自一个真随机源 D₂ 的输出，我们就说 D₁ 和 D₂ 的输出是计算上不可区分的。

1. 形式化定义: | Pr[D(x)=1 | x←D₁] − Pr[D(x)=1 | x←D₂] | ≤ neg(λ)。

1. Pr[D(x)=1 | x←D₁] 表示 D 认为 x 来自 D₁ 的概率。

1. 这个公式的含义是：D 区分 D₁ 和 D₂ 的“优势”是一个可忽略的函数。

"As Good As" = Computational Indistinguishability

- The lecture uses the Turing Test as an analogy: if an efficient "distinguisher" (a test program) cannot reliably tell whether it's interacting with an AI or a human, we say the AI passes the test.

- Similarly, if for any PPT distinguisher D, given a string, it cannot reliably determine whether the string came from a procedure D₁ or a truly random source D₂, we say the outputs of D₁ and D₂ are computationally indistinguishable.

- Formal Definition: | Pr[D(x)=1 | x←D₁] − Pr[D(x)=1 | x←D₂] | ≤ neg(λ).

- Pr[D(x)=1 | x←D₁] is the probability that D outputs 1 (e.g., says "it's from D₁") when given an output from D₁.

- The formula means that the "advantage" D has in distinguishing D₁ from D₂ is a negligible function.

伪随机生成器 (Pseudorandom Generator, PRG)

1. PRG就是实现上述“拉伸”功能的具体工具。它是一个满足以下两个条件的确定性算法：

1. 扩展性 (Expansion): 输入一个短的种子 s（{0,1}^ℓ），输出一个更长的字符串 x（{0,1}^n，其中 n > ℓ）。

1. 伪随机性 (Pseudorandomness): 当种子 s 是真随机时，其输出 PRG(s) 与一个同样长度的真随机字符串 x 是计算上不可区分的。

1. 这意味着，没有PPT算法能看出PRG的输出和真随机数之间有统计上的差异。

Pseudorandom Generator (PRG)

- A PRG is the concrete tool that performs this "stretching." It is a deterministic algorithm that satisfies two conditions:

- Expansion: It takes a short input seed s (from {0,1}^ℓ) and produces a longer output string x (in {0,1}^n, where n > ℓ).

- Pseudorandomness: When the seed s is truly random, its output PRG(s) is computationally indistinguishable from a truly random string x of the same length n.

- This means no PPT algorithm can find any statistical difference between a PRG's output and a truly random string.

### 一、基本定义与动机

OTP的缺陷：关键长度必须与消息一样长

需求：用短密钥加密长消息Short key ⇒ Long pad PRG 让短密钥扩展成长序列，从而模拟一次一密的随机覆盖。

一、Basic Definition and Motivation

OTP’s drawback: key length must equal message length

Need: Short key ⇒ long pad

PRG expands a short key into a long sequence, simulating a one-time pad.

### 二、PRG的形式化定义

G: {0,1}ⁿ → {0,1}^(n+l)

输入：n位随机种子

输出：(n+l)位的α随机序列

l是延伸长度（stretch）

二、Formal Definition of PRG

G: {0,1}ⁿ → {0,1}^(n+l)

Input: n-bit random seed

Output: (n+l)-bit pseudorandom sequence

l is the stretch length

### 三、安全性规定：

对于任何 PPT（概率演示时间）攻击者 A：

|Pr[A(G(s))=1] - Pr[A(r)=1]| ≤ negl(n)

其中：

s ← {0,1}ⁿ 均匀随机选择

r ← {0,1}^(n+l) 均匀随机选择

negl(n)是可忽略函数

安全性：输出与真随机不可区分

基于单向函数构造

三、Security Requirement:

For any PPT attacker A:

|Pr[A(G(s)) = 1] – Pr[A(r) = 1]| ≤ negl(n)

where:

s ← {0,1}ⁿ uniformly at random

r ← {0,1}^(n+l) uniformly at random

negl(n) is a negligible function

Security means PRG output is indistinguishable from truly random.

### 四、计算不可区分性

核心概念：

如果输入是均匀随机的，PRG的输出应该“看起来”是随机的

对计算设定的攻击者而言，α随机与真随机不可区分

图灵测试类别比：

复制

测试者D ← {真随机字符串, PRG输出}

D尝试区分两者

如果D无法有效区分，则PRG是安全的

4.Computational Indistinguishability

Core idea:

If the seed is uniform, PRG output “looks” random

No PPT attacker can tell pseudorandom from true random

Turing-test style:

Challenger D receives either a true random string or PRG output

D tries to distinguish them

If D cannot do so effectively, the PRG is secure

### 五、PRG的构造

1. 从单向函数构造PRG

Goldreich-Levin定理：

给定单向函数f，可以构造一位扩展的PRG：

G(s,r) = (f(s), r, ⟨s,r⟩)

其中⟨s,r⟩是s和r的内积

2.扩展PRG的长度

从一比特划分多比特：

G: {0,1}ⁿ → {0,1}^(n+1) （一比特扩展）

G': {0,1}ⁿ → {0,1}^(2n) （加倍长度）

可以迭代构造任意式长度的PRG

构造方法：

G₁(s) = G(s₁)||G(s₂) 其中 G(s) = (s₁,s₂)

五、Constructions of PRG

1.From a one-way function

Goldreich–Levin theorem:

Given a one-way function f, one can construct a 1-bit stretch PRG:

G(s, r) = (f(s), r, ⟨s, r⟩)

where ⟨s, r⟩ is the inner product of s and r.

2.Extending PRG’s length

From one-bit to multi-bit stretch:

G: {0,1}ⁿ → {0,1}^(n+1) (1-bit stretch)

G′: {0,1}ⁿ → {0,1}^(2n) (doubling)

One can iterate this process to obtain arbitrary stretch.

Construction method:

G₁(s) = G(s₁) ‖ G(s₂)where G(s) = (s₁, s₂)

### 六、PRG的性质

1.不可预测性等价于α随机性

引理：PRG是伪随机的当且仅当它是不可预测的时

给定前i位，无法预测第i+1位

这提供了另一种理解PRG安全性的角度

2. PRG作为单向函数

问题：PRG是否一定是单向函数？

答案：不一定

反例构造：

G'(s) = {

0000...0 如果 s = 10101...0

G(s)     否则

}

这个修改后的G'仍然是PRG（因为特殊种子的概率可忽略），但不是单向函数

六、Properties of PRG

1.Unpredictability is equivalent to pseudorandomness

Lemma: A PRG is pseudorandom if and only if it is unpredictable.

Given the first i bits, one cannot predict the (i + 1)-th bit.

This provides another way to understand PRG security.

2.PRG as a one-way function

Question: Is a PRG necessarily a one-way function?

Answer: Not necessarily.

Counterexample:

G′(s) = {

0000…0 if s = 10101…0

G(s) otherwise

}

This modified G′ is still a PRG (because the special seed occurs with negligible probability), but it is not a one-way function.

---------------------------------------------------------------

Q3: 伪随机生成器的扩展

#### 从 G:{0,1}^100 → {0,1}^200 构造 G1(x) := G(x0)‖x1

分析：

- 问题1： 均匀种子时：G1 仍然是安全的 PRG，因为 G(x0) 是伪随机的，x1 是均匀的

- 问题2：非均匀种子时：G1 不安全，因为 x1 的偏差会在输出中体现

Q3: Extension of a Pseudorandom Generator

Problem: From G: {0,1}^100 → {0,1}^200 construct

G₁(x) := G(x₀) ‖ x₁

Analysis:

Uniform seed: G₁ remains secure because G(x₀) is pseudorandom and x₁ is uniform.

Non-uniform seed: G₁ is insecure because any bias in x₁ appears in the output.

设定：

原PRG：G: {0,1}¹⁰⁰ → {0,1}²⁰⁰

- 新构造：G1(x) := G(x0)‖x1，其中 x = x0‖x1，|x0|=100，|x1|=100

情况1：均匀种子

- x0, x1 都是均匀随机的

- G(x0) 是伪随机的（200位）

- x1 是真随机的（100位）

组合后的300位输出仍然计算上不可区分于真随机

In-depth analysis:

Setup:

Original PRG: G: {0,1}^100 → {0,1}^200

New construction: G₁(x) := G(x₀) ‖ x₁, where x = x₀ ‖ x₁, |x₀| = 100, |x₁| = 100

Case 1: Uniform seed

x₀ and x₁ are both uniformly random

G(x₀) is a 200-bit pseudorandom string

x₁ is a 100-bit truly random string

The combined 300-bit output is computationally indistinguishable from random

情况2：非均匀种子

- 如果种子有偏差，x1 部分会直接暴露这种偏差

- 攻击者可以通过观察输出的后100位来检测偏差

违反了PRG的安全性要求

Case 2: Non-uniform seed

If the seed has bias, the x₁ portion directly exposes that bias

An attacker can detect the bias by examining the last 100 bits

This violates the PRG security requirement

关键洞察： 这道题考查了PRG安全性定义中的一个重要细节：

- PRG的安全性基于均匀随机种子的假设

- 如果种子不均匀，安全性保证失效

- 直接输出部分种子信息会破坏伪随机性

相关概念：

- 种子质量的重要性：第5章提到"常见错误：使用弱随机源"

- 构造方法的谨慎性：不是所有组合都能保持安全性

- 计算不可区分性：需要考虑所有可能的区分器

Key insight:

PRG security relies on the uniformity of the seed

Non-uniform seeds break the security guarantee

Revealing part of the seed directly undermines pseudorandomness

Related concepts:

Importance of seed quality (see “common mistake: using a weak randomness source”)

Caution in PRG design: not all combinations preserve security

Computational indistinguishability: all possible distinguishers must be considered

Q3. (10 points) A good pseudorandom generator G : {0, 1}100 → {0, 1}200 is used to stretch a short random seed to be a longer pseudorandom string. (1) Due to the nice property of pseudorandomness, we can easily adapt it to another pseudorandom generator that extends 200-bit seed to 300 bits. For example, for a uniform bit string x = x0∥x1 where x0 and x1 are k-bit strings and ∥ denotes string concatenation, define G1(x) := G(x0)∥x1. G1 is not a secure PRG. Is it correct?

1. Would G1 be a secure PRG if the seed is not uniform? If yes, briefly explain. If not, could you give a counter-example?

一个好的伪随机生成器G:{0,1}100→{0,1}200用于将短随机种子拉伸为更长的伪随机字符串。(1)由于伪随机的良好特性，我们可以很容易地将其应用于另一个伪随机生成器，将200位种子扩展到300位。例如，对于一个均匀位字符串x = x0∥x1，其中x0和x1是k位字符串，∥表示字符串连接，定义G1(x):= G(x0)∥x1。

(2)如果种子不一致，G1 会是一个安全的 PRG 吗？如果是，请简要解释一下。如果不是，能举一个反例吗？

1.G₁ is still a secure PRG. Because G₁ stretches a 2k-bit string to 3k bits, the expansion condition is satisfied.

Since x₀ is uniform, and G is a good pseudorandom generator, G(x₀) is pseudorandom. Because G(x₀) and x₁ are independent and x₁ is uniform, G(x₀)∥x₁ is itself indistinguishable from uniform on {0,1}³ᵏ. Hence the pseudorandomness condition holds and G₁ is still a secure PRG.

2. G₁ will not be a secure PRG if the seed is not uniform. In that case x₁ is not uniform, so G(x₀)∥x₁ is not uniform and can be easily distinguished from true randomness.

For example, if the least-significant bit of x is always 0, then the least-significant bit of G₁(x) will always be 0, which an attacker can detect (distinguishing G₁’s output from uniform).

1.G₁ 仍然是一个安全的伪随机生成器。因为 G₁ 将 2k 位字符串扩展到 3k 位，满足扩展条件。由于 x₀ 是均匀随机的，且 G 是一个优秀的伪随机生成器，所以 G(x₀) 是伪随机的。又因为 G(x₀) 与 x₁ 独立且 x₁ 均匀随机，拼接后的 G(x₀)∥x₁ 在 {0,1}³ᵏ 上与均匀分布的 3k 位字符串不可区分，满足伪随机性条件。因此，G₁ 仍然是一个安全的 PRG。

2.如果种子不是均匀随机，G₁ 就不会是安全的 PRG。在这种情况下 x₁ 不再均匀，G(x₀)∥x₁ 也就不是均匀字符串，能够被轻易区分。

例如，如果 x 的最低有效位始终为 0，那么 G₁(x) 的最低有效位也将始终为 0，攻击者即可区分 Pr[D(G(x₀)∥x₁)=1] 与 Pr[D(r)=1]。

1. 基本概念

真随机数（True Random）：源自物理过程（如热噪声、放射性衰变等），不可预测且不可复现；

伪随机数（Pseudorandom）：由种子（seed）及确定性算法生成，同一次种子可复现；但如果算法和种子足够保密，其输出对多项式时间的攻击者而言，与真随机序列不可区分。

1. Basic Concepts

True Randomness arises from physical processes (e.g. thermal noise, radioactive decay), is unpredictable, and cannot be reproduced.

Pseudorandomness is generated from a short, fixed “seed” by a deterministic algorithm; the same seed always yields the same output, but if the seed and algorithm remain secret, the output is computationally indistinguishable from true randomness.

密码学安全的伪随机数生成器（PRG）

一个长度扩展型G: {0,1}^k -> {0,1}^{ℓ(k)},   ℓ(k) > k

要满足：

扩展性：输出比输入“种子”更长；

不可区分性：给定 G(s)（s均匀），任意多项式时间算法无法把它和同长度的真随机比特串区分开来，其成功概率仅比随机猜测多项式意义下可忽略的量。

这种“计算上不可区分”的性质，是衡量伪随机数在密码学中可用性的核心标准。

#### Cryptographically Secure PRNGs (PRNG)

#### length‐expanding PRNG:G: {0,1}^k -> {0,1}^{ℓ(k)},   ℓ(k) > k

must satisfy two properties:

Stretching: the output is longer than the input seed.

Indistinguishability: for a uniform seed sss, no polynomial‐time algorithm can tell G(s)G(s)G(s) apart from a truly random ℓ(k)\ell(k)ℓ(k)-bit string except with negligible advantage.

3. 安全性与不确定性

计算不可区分：即使知道生成算法，却因种子隐藏，攻击者在多项式时间内无法预测下一个比特或察觉统计偏差。

前向安全性（Forward security）：在某些 PRNG 设计中，即便内部状态（seed）泄露，也不能倒推出之前生成的输出。

后向安全性（Backward security）：新输出不受旧状态泄露影响。

3. Security and Unpredictability

Computational Indistinguishability: even knowing the algorithm, an attacker cannot in polynomial time predict future bits or detect statistical bias without the seed.

Forward Security: in some designs, revealing the internal state does not allow recovery of earlier outputs.

Backward Security: past or future outputs remain secure if only the current state is compromised.

4. 常见实例与应用

线性同余法（LCG）：速度快但统计性质弱，不适用于高安全场景；

Blum–Blum–Shub（基于大素数分解难题），Yarrow、Fortuna 等：用于操作系统的加密服务（如 /dev/urandom）；

基于分组密码或哈希函数的 DRBG（NIST SP 800-90A 推荐）：在 TLS、VPN、加密协议里广泛采用

4. Common Examples & Applications

Linear Congruential Generators (LCGs): fast but with weak statistical and security properties—unsuitable for high‐security needs.

Blum–Blum–Shub, Yarrow, Fortuna: CSPRNGs based on hard problems (e.g. integer factorization) or entropy pooling, used by operating systems (e.g. /dev/urandom).

NIST SP 800-90A DRBGs: constructions based on block ciphers or hash functions, widely deployed in TLS, VPNs, and other cryptographic protocols.

5. 小结

伪随机数生成器在效率、可复现和安全性之间做平衡：

效率：算法必须足够快以满足大规模数据需求；

可控性：可通过种子复制或保存随机流；

安全性：在密码学场景下，要求对手在可接受的计算资源下无法区分或预测其输出。

5. Summary

A cryptographically secure PRNG balances:

Efficiency (high throughput),

Reproducibility (repeatable by seed), and

Security (unguessability and indistinguishability).

Choosing a PRNG that meets these criteria is fundamental for any secure protocol or system design.

#### Q4: 单向函数的组合

问题：给定单向函数 F 和非单向函数 G，判断 G(F(x)) 和 F(G(x)) 是否为单向函数

答案：都不是单向函数

- 如果 G 将所有输入映射为全 0，则 F(G(x)) = F(0) = F(G(x′))

- 类似地，G(F(x)) = 0 = G(F(x′))

Q4. (10 points) A one-way function is a function F : {0, 1}^n → {0, 1}^n that is easy to compute but hard to invert. Namely, for any polynomial-time adversary A, given y = F (x) where x is uniformly chosen, the probability of A finding x′ ∈ {0, 1}n such that F (x′) = y is negligible.

Given a one-way function F : {0, 1}^n → {0, 1}^n and an arbitrary function G : {0, 1}^n → {0, 1}^n not one-way, decide whether G(F (X)) is a one-way function and briefly explain. How about F (G(X))?

单向函数是一个函数F: {0,1}^n→{0,1}^n，它很容易计算，但很难反转。也就是说，对于任何多项式时间对手A，给定y = F (x)，其中x是一致选择的，A找到x '∈{0,1}n使得F (x ') = y的概率可以忽略不计。

给定一个单向函数F: {0,1}^n→{0,1}^n      和一个任意函数G: {0,1}^n→{0,1}^n非单向，判断G（F (X)）是否为单向函数并简要说明。那么F（G(X)）呢？

They are not one-way functions.

if G maps any inputs to all 0s

then F(G) or G(F) is not a one-way function

since for any x, x′,

F(G(x)) = F(0) = F(G(x′))

G(F(x)) = 0    = G(F(x′))

它们都不是单向函数。

如果 G 将任何输入映射为全 0

那么 F(G) 或 G(F) 就不是单向函数

因为对任意 x, x′，

F(G(x)) = F(0) = F(G(x′))

G(F(x)) = 0    = G(F(x′))

单向函数（One‐Way Function，OWF）的定义：

1. 易于计算：

存在多项式时间算法，可以在多项式时间内给定输入 x ∈ {0,1}^n 计算出 y = f(x)。

2. 难于反演：

对任何多项式时间算法 A，存在可忽略函数 negl(n)，使得

Pr_{x ← {0,1}^n}[ A(1^n, f(x)) ∈ { x′ : f(x′) = f(x) } ] ≤ negl(n)。

线性格式公式示例：

f: {0,1}^n → {0,1}^m

Pr[A(1^n, f(x)) ∈ f^{-1}(f(x))] ≤ negl(n)

Definition of One‐Way Function (OWF):

1. Easy to compute:

There exists a polynomial‐time algorithm that, given input x ∈ {0,1}^n, computes y = f(x).

2. Hard to invert:

For any probabilistic polynomial‐time algorithm A, there exists a negligible function negl(n) such that

Pr_{x ← {0,1}^n}[ A(1^n, f(x)) ∈ { x′ : f(x′) = f(x) } ] ≤ negl(n).

Linear‐format formula examples:

f: {0,1}^n → {0,1}^m

Pr[ A(1^n, f(x)) ∈ f^–1(f(x)) ] ≤ negl(n)

#### 典型候选与应用

整数乘法：f(p,q)=p⋅q（当 p,q 是大素数时，已知 N=pq难以因式分解）。

离散对数：f(g,x)=g^x mod p（已知 g^x 难以算x）。

RSA 函数：f(x)=x^e(modN)。

这些假设若成立，就可构建签名、密钥交换和加密等核心密码原语。

Typical Candidates and Applications

Multiplication of integers: f(p,q)=p⋅q (difficult to factorise with N=pq known when p,q are large prime numbers).

Discrete logarithms: f(g,x)=g^x mod p (difficult to factorise x when g^x is known).

RSA function: f(x) = x^e(modN).

These assumptions, if valid, allow the construction of core cryptographic primitives such as signatures, key exchange and encryption.

- ------------------

1. 流密码（Stream Cipher）和多次加密问题7.Stream Ciphers and the Multi‐Message Encryption Problem

##### 【w3】第三部分：流密码——第一个实用的计算安全加密方案

有了PRG，我们就可以构建一个实用的加密方案来替代OTP了，这就是流密码 (Stream Cipher)。

- 密钥生成 (KG): 生成一个短的、真随机的密钥 k（作为PRG的种子）。

- 加密 (Enc):

- 将短密钥 k 输入PRG，生成一个长的伪随机密钥流 k' = PRG(k)。k'的长度需要和明文 m 一样长。

- 像OTP一样，将明文与密钥流进行异或：c = m ⊕ k'。

- 解密 (Dec): 接收方使用相同的短密钥 k 和相同的PRG，生成完全相同的密钥流 k'，然后计算 m = c ⊕ k' 来恢复明文。

Part 3: The Stream Cipher - The First Practical, Computationally Secure Scheme

Equipped with a PRG, we can now construct a practical encryption scheme to replace OTP. This is the Stream Cipher.

- Key Generation (KG): Generate a short, truly random key k (to be used as the PRG's seed).

- Encryption (Enc):

- Feed the short key k into the PRG to generate a long, pseudorandom keystream k' = PRG(k). The length of k' must match the length of the plaintext m.

- Just like OTP, XOR the plaintext with the keystream: c = m ⊕ k'.

- Decryption (Dec): The receiver, using the same short key k and the same PRG, generates the exact same keystream k' and computes m = c ⊕ k' to recover the plaintext.

流密码完美地解决了OTP的两个问题：

1. 密钥长度: 我们只需要传输和存储一个短密钥 k。

1. 密钥复用: 只要每次加密使用的（短）密钥 k 不同（或者配合一个称为“随机数”或“IV”的东西，这里未展开），就可以安全地加密多条消息。

The stream cipher elegantly solves both of OTP's problems:

1. Key Length: We only need to transmit and store a short key k.

1. Key Reuse: As long as a different short key k is used for each encryption (or it's combined with a "nonce" or "IV," a concept not detailed here), we can securely encrypt multiple messages.

##### 【w4】**第一部分：流密码的安全性证明**

这部分的核心是回答一个问题：为什么基于安全PRG构建的流密码是安全的？

1 回顾目标和构造:

1. 我们的目标是用一个短的真随机密钥 k 来加密一个长的明文 M。

1. 构造方法是：C = PRG(k) ⊕ M。

1. 这里的核心安全依赖是：PRG(k) 的输出必须“和”一个等长的真随机字符串“一样好”。

##### **Part 1: Security Proof of the Stream Cipher**

The core of this section answers the question: Why is a stream cipher built from a secure PRG also secure?

Recap of Goal and Construction:

1. Our goal is to encrypt a long message M using a short, truly random key k.

1. The construction is: C = PRG(k) ⊕ M.

1. The core security assumption is that the output of PRG(k) must be "as good as" a truly random string of the same length

2 “一样好”的正式定义:

1. 这个“一样好”就是我们之前学到的计算不可区分性 (Computational Indistinguishability)。

1. 对于任何 PPT 区分器 D（一个试图找出差异的算法），它区分 PRG 输出和真随机串的能力必须是可忽略的。

1. 讲义中给出了两个不安全的 PRG 例子，来帮助理解这个概念：

1. 例1: PRG(s) = s || s (把种子复制一遍)。这个构造很糟糕。区分器 D 只需要检查输入的前半部分和后半部分是否相等。如果是 PRG 的输出，这个概率是1；如果是真随机串，这个概率是 1/2^ℓ（ℓ是种子长度）。这个巨大的概率差（1 - 1/2^ℓ）使得区分器可以非常容易地识破它。

1. 例2: PRG(s) = s || f(s) (种子后面跟一个由种子计算出的确定性结果)。同样，区分器 D 只需要检查输入的后半部分是否等于 f(前半部分) 即可。

Formal Definition of "As Good As":

- This "as good as" is precisely Computational Indistinguishability, which we learned before.

- For any PPT distinguisher D (an algorithm trying to find a difference), its ability to distinguish a PRG's output from a truly random string must be negligible.

- The notes provide two examples of insecure PRGs to make this concept concrete:

- Example 1: PRG(s) = s || s (concatenating the seed with itself). This is a terrible construction. A distinguisher D simply needs to check if the first half of its input equals the second half. For a PRG output, this is true with probability 1. For a truly random string, this is true with probability 1/2^ℓ (where ℓ is the seed length). This huge probability gap (1 - 1/2^ℓ) allows the distinguisher to easily break it.

- Example 2: PRG(s) = s || f(s) (the seed followed by a deterministic function of the seed). Similarly, the distinguisher D just needs to check if the second half of the input equals f(first half).

3 流密码的安全模型与证明:

- 安全定义: 一个加密方案是安全的（具体来说是“不可区分性”安全），如果对于任意两个等长的明文 m₀ 和 m₁，它们的密文 c₀ 和 c₁ 是计算上不可区分的。即 Enc(k, m₀) ≈_c Enc(k, m₁).

- 定理: 如果 PRG 是安全的，那么用它构建的流密码也是安全的。

- 证明思路 (归约法/反证法): 这是密码学证明中的经典方法。

- 假设结论不成立: 假设流密码是不安全的。

- 推导: 这意味着存在一个高效的攻击者 D，可以区分 c₀ = PRG(k) ⊕ m₀ 和 c₁ = PRG(k) ⊕ m₁。

- 构造矛盾: 我们可以利用这个攻击者 D 来构造一个新的攻击者 D'，这个 D' 能够区分 PRG(k) 的输出和一个真随机串。

- 得出结论: D' 的存在意味着底层的 PRG 是不安全的，这与我们“PRG是安全的”这一初始前提相矛盾。因此，我们最初的假设（流密码不安全）是错误的。结论：流密码必须是安全的。

Security Model and Proof for Stream Ciphers:

- Security Definition: An encryption scheme is secure (specifically, has "indistinguishability-based security") if for any two plaintexts m₀ and m₁ of the same length, their corresponding ciphertexts c₀ and c₁ are computationally indistinguishable. That is, Enc(k, m₀) ≈_c Enc(k, m₁).

- Theorem: If the PRG is secure, then the stream cipher constructed from it is also secure.

- Proof Idea (By Reduction / Contradiction): This is a classic technique in cryptographic proofs.

- Assume the opposite: Assume the stream cipher is insecure.

- Implication: This means there exists an efficient adversary D that can distinguish c₀ = PRG(k) ⊕ m₀ from c₁ = PRG(k) ⊕ m₁.

- Construct a Contradiction: We can use this adversary D as a building block to create a new adversary D' that can distinguish the output of PRG(k) from a truly random string.

- Conclusion: The existence of D' implies that the underlying PRG is insecure, which contradicts our initial premise that the PRG is secure. Therefore, our original assumption (that the stream cipher is insecure) must be false. Conclusion: the stream cipher must be secure.

##### **第二部分：流密码的致命弱点与现实世界的教训**

1 PRG 在“无限算力”下脆弱性:

1. 一个练习题指出，任何 PRG 在面对拥有无限算力的攻击者时都是不安全的。这是因为 PRG 的种子空间（{0,1}^ℓ）是有限的，而输出空间（{0,1}^n）更大。一个无限算力的攻击者可以遍历所有可能的种子，生成所有可能的 PRG 输出，然后轻易地将一个给定的字符串与这个集合进行比较，从而判断它是否是 PRG 的输出。这再次强调了我们讨论的是计算安全，而非信息论安全。

##### **Part 2: The Fatal Flaw of Stream Ciphers & Real-World Lessons**

Vulnerability of PRGs to Unbounded Attackers:

1. An exercise points out that any PRG is insecure against an adversary with unlimited computing power. This is because the space of possible seeds ({0,1}^ℓ) is finite, while the output space ({0,1}^n) is larger. An unbounded adversary can simply iterate through all possible seeds, generate all possible PRG outputs, and easily check if a given string belongs to this set. This reinforces that we are in the realm of computational security, not information-theoretic security.

2 密钥复用问题依然存在:

1. 流密码的核心操作是异或，这完全继承了 OTP 的特性。如果同一个短密钥 k 被用来加密两个不同的消息 M₁ 和 M₂，那么攻击者拿到两个密文 C₁ 和 C₂ 后，可以计算 C₁ ⊕ C₂ = (PRG(k) ⊕ M₁) ⊕ (PRG(k) ⊕ M₂) = M₁ ⊕ M₂。

1. 这会泄露明文之间的关系，足以导致灾难性的后果。

·  The Key Reuse Problem Persists:

- ·  The core operation of a stream cipher is XOR, which fully inherits the properties of OTP. If the same short key k is used to encrypt two different messages M₁ and M₂, an adversary who obtains the two ciphertexts C₁ and C₂ can compute C₁ ⊕ C₂ = (PRG(k) ⊕ M₁) ⊕ (PRG(k) ⊕ M₂) = M₁ ⊕ M₂.

- This leaks the relationship between the plaintexts and can lead to catastrophic failure.

3 真实世界的攻击案例:

1. WEP (早期 WiFi 安全协议): WEP 使用 RC4 流密码，其密钥由一个24位的 IV (初始化向量) 和一个长期密钥拼接而成。这个 IV 太短了，根据生日悖论，只需要数千个数据包就极有可能出现 IV 碰撞（即重复使用）。一旦 IV 重用，就等于密钥流重用，攻击者可以利用上述 M₁ ⊕ M₂ 的关系破解网络流量。T.J. Maxx 的巨额赔偿案就是这种漏洞造成的恶果之一。

1. KRACK 攻击 (针对 WPA2): 这是一个更高级的攻击，但核心思想类似。攻击者通过巧妙的手段欺骗设备，使其在密钥协商的最后阶段重新安装同一个会话密钥，并重置相关的计数器（Nonce），从而迫使设备在加密不同的数据时使用了完全相同的密钥流，导致了与 WEP 类似的漏洞。

教训: 绝对不要在不同的消息上重用相同的“会话密钥”或密钥流！

Real-World Attack Examples:

1. WEP (early WiFi security protocol): WEP used the RC4 stream cipher. Its key was formed by concatenating a 24-bit IV (Initialization Vector) with a long-term key. This IV is far too short. Due to the birthday paradox, an IV collision (reuse) is highly likely after only a few thousand packets. An IV reuse means a keystream reuse, allowing an attacker to use the M₁ ⊕ M₂ relationship to decrypt network traffic. The massive T.J. Maxx settlement is a direct consequence of such vulnerabilities.

1. KRACK Attack (on WPA2): This is a more advanced attack, but the core idea is similar. The attacker tricks a device into reinstalling the same session key and resetting the associated counter (nonce) during the final phase of a handshake. This forces the device to use the exact same keystream to encrypt different data, leading to a vulnerability similar to WEP's.

The Lesson: Never reuse the same "session key" or keystream on different messages!

##### **第三部分：新工具——伪随机函数 (PRF)**

流密码解决了密钥长度问题，但没有解决密钥复用问题。我们需要一个工具，能够从一个长期主密钥出发，为每一条新消息都生成一个“新鲜的”、“不可预测的”密钥流。这个工具就是 伪随机函数 (Pseudorandom Function, PRF)。

1 PRF 的定义:

1. PRF 是一个函数家族，由一个密钥 K 来索引。它接受一个密钥 K 和一个输入 X，输出一个结果 y = PRF(K, X)。

1. 直观理解: PRG 像一个水龙头，打开后就流出一长串水。而 PRF 更像一个自动售货机。你投入一个“硬币” X（比如消息序号 "1", "2", "3"...），它就会吐出一个“饮料” y。对于同一个 X，它总是吐出同样的 y。但不同的 X 会得到不同的 y，并且这些 y 之间看起来毫无关联，完全是伪随机的。密钥 K 决定了这台售货机内部的构造。

##### **Part 3: The New Tool - The Pseudorandom Function (PRF)**

The stream cipher solved the key length problem but not the key reuse problem. We need a tool that can, from a single long-term master key, generate a "fresh," "unpredictable" keystream for each new message. This tool is the Pseudorandom Function (PRF).

Definition of a PRF:

1. A PRF is a family of functions, indexed by a key K. It takes a key K and an input X and produces an output y = PRF(K, X).

1. Intuition: A PRG is like a firehose; you turn it on and get one long stream of water. A PRF is more like a vending machine. You insert a "coin" X (e.g., message number "1", "2", "3"...) and it dispenses a "drink" y. For the same coin X, you always get the same drink y. But different coins X give you different drinks y, and these drinks appear completely unrelated and pseudorandom. The key K determines the internal wiring of this specific vending machine.

2 PRF 的安全性:

1. PRF 的安全定义比 PRG 更强。它要求 PRF 的行为与一个真正的随机函数 (Random Function) 在计算上是不可区分的。

1. 随机函数是一个理想化的数学对象：对于任何输入 x，它都返回一个全新的、完全随机的输出（除非你之前查询过完全相同的 x）。

1. 安全游戏: 攻击者 D 可以自适应地向一个黑盒（这个黑盒要么是 PRF，要么是真随机函数）查询任意输入 xᵢ 并得到输出 yᵢ。在多次查询后，D 必须判断自己交互的是哪个黑盒。如果 D 的成功率仅比瞎猜高出可忽略的量，那么这个 PRF 就是安全的。

1. 与 PRG 的关键区别:

1. PRG 只生成一个长的伪随机输出。安全性要求这个输出本身没有模式。

1. PRF 可以生成多个伪随机输出（每个输入对应一个）。安全性不仅要求每个输出是伪随机的，还要求不同输入对应的输出之间也没有任何可察觉的关联，就像它们是独立随机生成的一样。

Security of a PRF:

- The security definition for a PRF is stronger than for a PRG. It requires that the behavior of a PRF is computationally indistinguishable from that of a truly Random Function.

- A Random Function is an idealized mathematical object: for any new input x, it returns a brand new, truly random output (unless you've queried that exact x before).

- The Security Game: An adversary D can adaptively query a black box (which is either a PRF or a true Random Function) with any input xᵢ and receive the output yᵢ. After many queries, D must guess which box it's interacting with. If D's success rate is only negligibly better than random guessing, the PRF is secure.

- Key Differences from a PRG:

- A PRG produces only one long pseudorandom output. Security requires that this single output has no discernible patterns.

- A PRF can produce many pseudorandom outputs (one for each input). Security requires not only that each output is pseudorandom, but also that there are no discernible correlations between the outputs for different inputs, as if they were all generated independently and randomly.

3 用 PRF 构建 PRG:

1. PRF 是一个更强的工具，可以用它来构建 PRG。

1. 构造: PRG(k) = PRF(k, "1") || PRF(k, "2") || PRF(k, "3") || ...

1. 安全性: 这个构造是安全的，因为如果攻击者能区分这个 PRG 的输出和真随机串，那么他必然也能区分 PRF 和真随机函数，这就违背了 PRF 的安全性前提。

总结: 讲座的逻辑链条非常清晰。  
OTP → 密钥太长 → PRG/流密码 → 解决长度问题，但不能复用密钥 → PRF → 解决密钥复用问题（为下一讲用PRF构建可复用密钥的加密方案埋下伏笔）。

Constructing a PRG from a PRF:

1. A PRF is a more powerful tool, and you can use it to build a PRG.

1. Construction: PRG(k) = PRF(k, "1") || PRF(k, "2") || PRF(k, "3") || ...

1. Security: This construction is secure because if an adversary could distinguish this PRG's output from a truly random string, they must also be able to distinguish the PRF from a true Random Function, which violates the security premise of the PRF.

Summary: The lecture's logical chain is very clear.  
OTP → Key is too long → PRG/Stream Cipher → Solves length problem, but key cannot be reused → PRF → Solves the key reuse problem (setting the stage for the next lecture, which will likely use a PRF to build an encryption scheme that allows key reuse).

- 原始------------------

基本构造：

密钥生成：k ← {0,1}ⁿ

加密：Enc(k,m) = m ⊕ PRG(k)

解密：Dec(k,c) = c ⊕ PRG(k)

问题：基本流密码无法重用钥匙

如果用统一密钥加密m₁和m2

攻击者可以计算：c₁ ⊕ c2 = m₁ ⊕ m2

Basic construction:

Key generation: k ← {0,1}ⁿ

Encryption: Enc(k, m) = m ⊕ PRG(k)

Decryption: Dec(k, c) = c ⊕ PRG(k)

Problem: A basic stream cipher cannot reuse its key.

If the same key is used to encrypt m₁ and m₂,

an attacker can compute c₁ ⊕ c₂ = m₁ ⊕ m₂.

八、状态化PRG（Stateful PRG）

Blum-Micali构造：

解决焦点重用问题：

初始状态：s₀ = k

输出和更新：(output_i, s_{i+1}) = G(s_i)

特点：

可以生成任意长的α随机流

其他使用后更新内部状态

允许外汇重用

Blum–Micali Construction

Addresses the key‐reuse issue.

Initial state: s₀ = k

For each i: (outputᵢ, sᵢ₊₁) = G(sᵢ)

Features:

Can generate an arbitrarily long pseudorandom stream.

Updates its internal state after each use.

Allows safe reuse of the original key.

#### 九、PRG的应用9.Applications of PRG

1.生成更多随机性

从短的真随机种子生成大量伪随机数

2.高效加密

使用短密钥加密长消息

3.构造其他密码原语

PRF（α随机函数）

块密码的操作模式

实践中的PRG

常见错误：使用随机弱源（如系统时间）

状态管理不当

可预测的种子

Dual_EC_DRBG事件：

笔记中提到的一个实际案例，展示了PRG设计中可能存在的后门问题

1.Generating large amounts of randomness

Expand a short true‐random seed into many pseudorandom bits.

2.Efficient encryption

Encrypt long messages using a short key.

3.Building other cryptographic primitives

PRFs (pseudorandom functions)

Block‐cipher modes of operation

Practical pitfalls:

Using weak randomness sources (e.g., system time)

Poor state management

Predictable seeds

Real‐world example: Dual_EC_DRBG

A noted case illustrating potential backdoors in PRG design.

## 第六章. 随机函数（PRF）和随机置换（PRP）

##### **【****w5****】****第一部分：回顾与深入理解伪随机函数 (PRF)**

1 回顾与动机 (Recap & Motivation):

1. 我们已经知道，PRG/流密码解决了OTP密钥过长的问题，但没有解决密钥不能复用的问题。

1. 为了安全地复用同一个主密钥 k 来加密多条消息，我们需要为每条消息生成一个“新鲜的”、“一次性”的会话密钥或密钥流。

1. 这个能按需生成大量、独立的伪随机值的工具就是伪随机函数 (PRF)。

##### **Part 1: Recap and Deeper Dive into Pseudorandom Functions (PRF)**

Recap & Motivation:

1. We've established that PRGs/Stream Ciphers solve the OTP's key length problem, but not the key reuse problem.

1. To securely reuse a single master key k to encrypt multiple messages, we need a way to generate a "fresh," "one-time" session key or keystream for each message.

1. The tool that generates numerous, independent pseudorandom values on demand is the Pseudorandom Function (PRF).

2 PRF 的“魔力”：用微小模拟宇宙 (The "Magic" of PRF):

1. 讲义中有一个非常精彩的对比，深刻揭示了 PRF 的强大之处。

1. 一个 PRF 函数家族 {F_k} 是由一个 λ 位的密钥 k 决定的。所以，这个函数家族里总共只有 2^λ 个函数。这是一个“微小”的空间。

1. 而一个真正的随机函数，是从所有可能的“输入到输出”的映射中随机抽取一个。如果输入是 l 位，输出是 l' 位，那么总共有 (2^l') ^ (2^l) 个这样的函数。这是一个“宇宙般”巨大的空间。

1. PRF 的安全性要求就是：从那个“微小”空间里随机选出的一个函数 F_k，其行为和一个从“宇宙”空间里随机选出的真随机函数，在计算上是无法区分的。

1. 这正是现代密码学的精髓：用一个很小的、可管理的秘密（密钥 k），去模拟一个巨大到无法处理的随机宇宙，从而实现安全。

The "Magic" of PRF: Simulating a Universe with a Speck of Dust:

- The lecture notes present a brilliant comparison that reveals the power of a PRF.

- A PRF family {F_k} is determined by a λ-bit key k. Therefore, there are only 2^λ functions in this entire family. This is a "tiny" space.

- In contrast, a truly Random Function is drawn from the set of all possible mappings from input to output. If the input is l bits and the output is l' bits, there are (2^l') ^ (2^l) such functions. This is a "universe-sized" space.

- The security of a PRF requires that a function F_k chosen from the "tiny" space is computationally indistinguishable from a true random function chosen from the "universe-sized" space.

- This is the essence of modern cryptography: using a small, manageable secret (the key k) to simulate a universe of randomness so vast it's impossible to deal with, thereby achieving security.

##### **第二部分：伪随机性的鲁棒性与构造**

这部分探讨了如何从简单的随机性模块构造出更强大的随机性。

1 扩展长度的放大 (Stretch Amplification):

1. 问题: 如果我们只有一个能将 n 位扩展到 n+1 位的 PRG (G₁)，如何构造一个能扩展任意（多项式）长度的 PRG (G*)？

1. 构造方法 (迭代法): 讲义中展示了一个扩展2位的例子 G₂。

1. 用种子 x 生成 y = y₁...yₙ₊₁ = G₁(x)。

1. 取 y 的前 n 位作为新种子，生成 z = z₁...zₙ₊₁ = G₁(y₁...yₙ)。

1. 最终输出是 z 和 y 的最后一位 yₙ₊₁ 的拼接。

1. 安全性证明思路: 这个构造的安全性依赖于计算不可区分性的一个关键性质：如果 A ≈ B，那么对于任何高效算法 f，都有 f(A) ≈ f(B)。

1. 因为 y ≈ 真随机串 Uₙ₊₁，所以 G₁(y₁...yₙ) ≈ G₁(U₁...Uₙ) ≈ 真随机串 Uₙ₊₁。

1. 通过这种方式，可以证明每一步迭代都保持了伪随机性，从而可以安全地将1位的扩展放大到任意多项式位的扩展。

##### **Part 2: Robustness and Construction of Pseudorandomness**

This section explores how to build stronger randomness from simpler building blocks.

Stretch Amplification:

1. Problem: If we only have a PRG (G₁) that can stretch n bits to n+1 bits, how do we construct a PRG (G*) that can stretch to any arbitrary (polynomial) length?

1. Construction (Iterative Method): The notes show an example G₂ that stretches by 2 bits.

1. Generate y = y₁...yₙ₊₁ = G₁(x) from seed x.

1. Take the first n bits of y as a new seed to generate z = z₁...zₙ₊₁ = G₁(y₁...yₙ).

1. The final output is the concatenation of z and the last bit of y, yₙ₊₁.

1. Security Proof Idea: The security of this construction relies on a key property of computational indistinguishability: if A ≈ B, then for any efficient algorithm f, we have f(A) ≈ f(B).

1. Since y ≈ a truly random string Uₙ₊₁, it follows that G₁(y₁...yₙ) ≈ G₁(U₁...Uₙ) ≈ a truly random string Uₙ₊₁.

1. This shows that each iteration preserves pseudorandomness, allowing us to safely amplify a 1-bit stretch to any polynomial stretch.

2 从 PRG 构造 PRF (Blum-Micali 与现实):

1. Blum-Micali 构造: 这是一种经典的、从 PRG 构造出类似 PRF 功能的方法。通过迭代 PRG，每次迭代保留一部分输出作为随机值 rᵢ，另一部分作为下一次迭代的种子 sᵢ₊₁。

1. Dual-EC PRG 的警示: 讲义中提到的 Dual-EC PRG 就是一个惨痛的教训。它表面上是一个标准的 PRG，但斯诺登的爆料揭示，其设计中存在一个后门。对于普通人来说，输出是伪随机的；但对于知道后门秘密（某个数学关系）的 NSA 来说，只要看到一个输出 rᵢ，就能预测之后所有的输出。这说明，一个看似安全的构造，可能隐藏着致命的结构性缺陷。

1. PRG 构造的局限性: 这种迭代式的构造 G(s, i) = rᵢ 不能被当作一个真正的 PRF 使用。主要原因是它的输入域（这里的 i）是有限的、预定义的，而一个真正的 PRF 应该能处理一个指数级大的输入域，远超任何实际使用次数。

1. 真正的构造 (GGM): 从 PRG 构造 PRF 的标准理论方法是 Goldreich-Goldwasser-Micali (GGM) 构造，这是一个更复杂的理论结果。

Constructing a PRF from a PRG (Blum-Micali & Reality):

1. Blum-Micali Construction: A classic method for creating PRF-like functionality from a PRG. It iteratively applies the PRG, using part of the output as the random value rᵢ and another part as the seed sᵢ₊₁ for the next iteration.

1. The Cautionary Tale of Dual-EC PRG: The Dual-EC PRG is a painful real-world lesson. On the surface, it was a standard PRG. However, Snowden's revelations showed it contained a backdoor. To everyone else, the output was pseudorandom. But to the NSA, who knew the backdoor secret (a mathematical relationship), seeing just one output rᵢ allowed them to predict all future outputs. This demonstrates that a seemingly secure construction can hide fatal structural flaws.

1. Limitations of PRG-based Constructions: An iterative construction like G(s, i) = rᵢ cannot be used as a true PRF. The main reason is that its input domain (the index i) is limited and predefined, whereas a true PRF should handle an exponentially large input domain, far exceeding any practical number of uses.

1. The Real Construction (GGM): The standard theoretical method for building a PRF from a PRG is the Goldreich-Goldwasser-Micali (GGM) construction, which is a more complex theoretical result.

##### **第三部分：实践中的 PRF 与加密模式**

理论很复杂，但实践中我们有更直接的方法。

分组密码作为 PRF (Block Ciphers as PRFs):

1. 在实践中，我们通常不从零开始构建 PRF，而是直接使用分组密码，如 AES。

1. 一个分组密码 E(k, m) 接受一个密钥 k 和一个固定长度的明文块 m，输出一个等长的密文块 c。它可以被看作是一个固定输入输出长度的 PRF。

##### **Part 3: PRFs in Practice & Modes of Operation**

Theory is complex, but in practice, we have more direct solutions.

Block Ciphers as PRFs:

1. In practice, we don't usually build PRFs from scratch. We use block ciphers, such as AES.

1. A block cipher E(k, m) takes a key k and a fixed-size plaintext block m and outputs a ciphertext block c of the same size. It can be viewed as a PRF with a fixed input and output length.

如何用分组密码加密长消息？——加密模式 (Modes of Operation)

1. AES 只能加密128位的块。要加密更长的数据，就需要一种“模式”来规定如何处理多个块。

1. 错误的模式：ECB (电子密码本模式)

1. 方法: Enc(k, M) = E(k, M₁) || E(k, M₂) || ...

1. 缺陷: 相同的明文块会产生相同的密文块。这会保留明文的统计模式。著名的“ECB企鹅图”就是最好的例子：加密后的企鹅轮廓依然清晰可见。这本质上就是我们一直试图避免的“密钥复用”问题。

1. 安全的模式：CTR (计数器模式)

1. 方法:

1. 为每个块 Mᵢ 生成一个唯一的、一次性的密钥流 kᵢ，方法是 kᵢ = E(k, i)，其中 i 是一个计数器（0, 1, 2...）。

1. 用这个密钥流加密明文块：Cᵢ = kᵢ ⊕ Mᵢ。

1. 优点: 这完美地应用了 PRF 的思想！我们用 AES (作为 PRF) 和一个不断变化的输入（计数器 i），为每个块都生成了一个新鲜的、不可预测的密钥流。这就像一个按需生成的流密码，既解决了密钥长度问题，也解决了密钥复用问题。

How to Encrypt Long Messages with a Block Cipher? — Modes of Operation

- AES only encrypts 128-bit blocks. To encrypt longer data, we need a "mode" to specify how to handle multiple blocks.

- The Wrong Mode: ECB (Electronic Codebook)

- Method: Enc(k, M) = E(k, M₁) || E(k, M₂) || ...

- Flaw: Identical plaintext blocks produce identical ciphertext blocks. This preserves statistical patterns of the plaintext. The famous "ECB penguin picture" is the best illustration: the penguin's silhouette is still visible after encryption. This is essentially the "key reuse" problem we've been trying to avoid.

- A Secure Mode: CTR (Counter Mode)

- Method:

- Generate a unique, one-time keystream kᵢ for each block Mᵢ by computing kᵢ = E(k, i), where i is a counter (0, 1, 2...).

- Encrypt the block with this keystream: Cᵢ = kᵢ ⊕ Mᵢ.

- Advantage: This is a perfect application of the PRF concept! We use AES (as a PRF) with a changing input (the counter i) to generate a fresh, unpredictable keystream for every single block. It's like an on-demand stream cipher that solves both the key length and key reuse problems.

##### **第四部分：黄金安全标准——IND-CPA**

ECB 模式的失败告诉我们，之前的安全定义还不够强。

1 升级威胁模型：从“只看一次”到“主动查询”

1. 之前的安全模型假设攻击者只能被动地看到一个密文。

1. 为了捕捉 ECB 这类漏洞，我们需要一个更强大的攻击者，他可以主动地选择自己想加密的明文，并获得对应的密文。这就是选择明文攻击 (Chosen Plaintext Attack, CPA)。

##### **Part 4: The Golden Standard of Security — IND-CPA**

The failure of ECB mode shows that our previous security definitions were not strong enough.

Upgrading the Threat Model: From Passive Observer to Active Querier

1. Previous security models assumed the adversary could only passively observe one ciphertext.

1. To capture vulnerabilities like ECB's, we need a more powerful adversary who can actively choose plaintexts to be encrypted and receive the corresponding ciphertexts. This is the Chosen Plaintext Attack (CPA).

2 IND-CPA 安全定义 (在选择明文攻击下的不可区分性):

1. 这是现代对称加密的黄金安全标准。

1. 安全游戏:

1. 攻击者 A 可以访问一个“加密预言机” E(k, ·)，他可以向这个预言机发送任何他想加密的明文 m，并得到密文 c。他可以重复这个过程很多次。

1. 之后，A 选择两个等长的挑战明文 m₀ 和 m₁。

1. 挑战者随机选择一个比特 b (0或1)，计算挑战密文 c_b = E(k, m_b) 并发给 A。

1. A 的任务是猜出 b 是什么。

1. 如果对于任何 PPT 攻击者 A，其猜对 b 的概率仅比瞎猜（50%）高出一个可忽略的量，那么这个加密方案就是 IND-CPA 安全的。

·  IND-CPA Security Definition (Indistinguishability under Chosen Plaintext Attack):

- ·  This is the golden standard of security for modern symmetric encryption.

- The Security Game:

- The adversary A has access to an "encryption oracle" E(k, ·). They can send any plaintext m they want to this oracle and get the ciphertext c back. They can do this many times.

- After this learning phase, A chooses two challenge plaintexts of equal length, m₀ and m₁.

- The challenger randomly picks a bit b (0 or 1), computes the challenge ciphertext c_b = E(k, m_b), and sends it to A.

- A's task is to guess the value of b.

- If for any PPT adversary A, the probability of guessing b correctly is only negligibly better than random guessing (50%), the scheme is IND-CPA secure.

3 关键结论与构造:

1. 重要定理: 任何无状态的、确定性的加密方案都不可能是 IND-CPA 安全的。因为攻击者可以自己计算 E(k, m₀)，然后和收到的挑战密文 c_b 比较，如果相等就知道 b=0。

1. 安全的加密必须是随机化的。

1. 一个满足 IND-CPA 的构造:

1. 加密 Enc(k, m) 时，首先生成一个随机数 r₀ (也叫 Nonce 或 IV)。

1. 然后用 PRF 计算密钥流 r = PRF(k, r₀)。

1. 密文是 c = r ⊕ m。

1. 最终输出是 (r₀, c)。

1. 这个构造是安全的，因为每次加密时随机的 r₀ 保证了即使加密相同的明文 m 两次，得到的密文也会完全不同，从而挫败了 CPA 攻击。这正是计数器模式背后的核心思想。

Key Conclusion and Construction:

- Important Theorem: No stateless, deterministic encryption scheme can be IND-CPA secure. An attacker could simply compute E(k, m₀) themselves and compare it to the received challenge c_b. If they match, the attacker knows b=0.

- Secure encryption must be randomized.

- An IND-CPA Secure Construction:

- To encrypt Enc(k, m), first generate a random number r₀ (also called a Nonce or IV).

- Then, compute the keystream r = PRF(k, r₀).

- The ciphertext is c = r ⊕ m.

- The final output is the pair (r₀, c).

- This construction is secure because the random r₀ for each encryption ensures that even if you encrypt the same message m twice, the resulting ciphertexts will be completely different, thus thwarting a CPA attack. This is the core idea behind Counter mode.

【原本知识点】

脉冲重复频率

语法：F: K × X → Y

安全性：与随机函数不可区分

PRP（块密码）

精确一映射

可逆性

AES等实际块密码的基础

### 6.Pseudorandom Functions (PRF) and Pseudorandom Permutations (PRP)

Pulse Repetition Frequency

Syntax: F: K × X → Y

Security: Indistinguishable from a random function

PRP (Block Cipher)

– Exact one-to-one mapping

– Invertibility

– Basis for practical block ciphers such as AES

#### h1- Q5: 伪随机函数的构造问题

问题：Fk(x) = G(k) ⊕ H0(x) 是否为 PRF？ （语法：F: K × X → Y）

答案：不是 PRF

- H0 是公开确定性函数，攻击者可以重构 G(k)

- 一旦知道 G(k)，就能预测所有输出

Q5: Construction problem of a PRF

Problem: Fₖ(x) = G(k) ⊕ H₀(x). Is this a PRF? (Syntax: F: K × X → Y)

Answer: Not a PRF

• H₀ is a public deterministic function, so an attacker can reconstruct G(k)

• Once G(k) is known, all outputs can be predicted

PRF安全性定义： PRF Fk应该满足：对于任何PPT攻击者A，有

|Pr[A^Fk(·) = 1] - Pr[A^R(·) = 1]| ≤ negl(n)    遇到啥都往上抄

其中R是真随机函数。

构造分析：

- 给定构造：Fk(x) = G(k) ⊕ H0(x)

- G(k)：可能是PRG的输出（伪随机）

- H0(x)：公开的确定性函数

攻击策略：

1. 信息泄露：攻击者可以计算 H0(x) 对任意x

1. 密钥恢复：通过查询 Fk(x1) 得到 G(k) ⊕ H0(x1)

1. 预测能力：计算 G(k) = Fk(x1) ⊕ H0(x1)

1. 全局破解：对任意新的x，预测 Fk(x) = G(k) ⊕ H0(x)

PRF security definition: A PRF Fₖ must satisfy, for any PPT attacker A,

|Pr[A^{Fₖ}(·) = 1] – Pr[A^{R}(·) = 1]| ≤ negl(n)

where R is a truly random function.

Construction analysis:

– Given Fₖ(x) = G(k) ⊕ H₀(x)

– G(k): pseudorandom output (e.g., from a PRG)

– H₀(x): public deterministic function

Attack strategy:

Information leakage: attacker computes H₀(x) for any x

Key recovery: query Fₖ(x₁) to obtain G(k) ⊕ H₀(x₁)

Prediction: compute G(k) = Fₖ(x₁) ⊕ H₀(x₁)

Global attack: for any new x, predict Fₖ(x) = G(k) ⊕ H₀(x)

区分器构造：（这个好像是输入到计算机里面的，如果实在编不出来，当成一个素材吧）

#### 区分器 D^O(·)：1. 查询 O(x1) 得到 y12. 计算 k' = y1 ⊕ H0(x1)3. 选择新的 x2，查询 O(x2) 得到 y24. 如果 y2 = k' ⊕ H0(x2)，输出1（判断为PRF）5. 否则输出0（判断为随机函数）  类比：假钞检测器

- 真钞：每张都有独特的序列号（随机）

- 假钞：序列号 = 固定模式 + 日期

- 检测器：

- 记录一张钞票的序列号和日期

- 推算出"固定模式"

- 对新钞票预测序列号

- 如果预测准确 → 假钞，否则 → 真钞

Distinguisher D^O(·):Query O(x₁) to get y₁,Compute k′ = y₁ ⊕ H₀(x₁),Choose new x₂, query O(x₂) to get y₂,If y₂ = k′ ⊕ H₀(x₂), output 1 (PRF); otherwise, output 0 (random function)

Analogy: counterfeit detection

– Real banknote: unique serial number (random)

– Fake banknote: serial number = fixed pattern + date

– Detector:

Record one note’s serial and date

Derive the “fixed pattern”

Predict a new note’s serial

If prediction matches → fake; otherwise → real

#### 类比：密码学测试

- 真随机函数：每次输出都是独立随机的

- 有缺陷的PRF：输出 = 固定密钥 + 输入的简单函数

- 区分器： 记录输入输出对    推算出"固定密钥"     对新输入预测输出     如果预测准确 → PRF，否则 → 随机函数

Analogy: cryptographic testing

– True random function: each output is independently random

– Flawed PRF: output = fixed key + simple function of input

– Distinguisher:

Record I/O pairs

Derive the “fixed key”

Predict output for new input

If prediction succeeds → PRF; otherwise → random function

关键问题：

- 确定性暴露：H0的确定性使得攻击者能够"剥离"这一层

- 密钥泄露：实际上等价于直接泄露了G(k)

- 可预测性：违反了PRF的核心要求

正确的PRF构造原则：

- 避免直接暴露密钥信息

- 确保没有简单的代数关系

- 通常基于更复杂的构造（如Feistel网络）

Key issues:

– Deterministic exposure: H₀’s determinism lets the attacker “strip off” this layer

– Key leakage: effectively reveals G(k)

– Predictability: violates the core requirement of a PRF

Correct PRF design principles:

– Avoid exposing key information directly

– Ensure no simple algebraic relations exist

– Use more complex constructions (e.g., Feistel networks)

Q5. (10 points) G : {0, 1}^n → {0, 1}^m is a PRG (n < m). We define Fk(x) = G(k) ⊕ H0(x), where k ∈ {0, 1}^n, x ∈ {0, 1}^m, and H0(·) is to apply a complex function, such as a hash, and mapping an m-bit to a longer 2m-bit, and then output the first half m bits. Is Fk(·) a PRF? If yes, explain why; if not, give an explicit attack (a PPT adversary that violates the definition)

G: {0,1}n→{0,1}m为PRG （n < m）。我们定义Fk(x) = G(k)⊕H0(x)，其中k∈{0,1}n, x∈{0,1}m, H0（·）是应用复函数，如哈希，将一个m位映射到一个更长的2m位，然后输出前半m位。Fk（·）是PRF吗？如果是，解释原因；如果没有，给出一个明确的攻击（一个违反定义的PPT对手）

since H_0 is a deterministic public function

G(k) can be reconstructed

因为H_0 是一个确定性的公开函数，

G(k) 可以被重构

详解

F_k(x) = G(k) ⊕ H_0(x)

其中

G 是对秘密种子 k 的固定伪随机生成器输出；

H_0 是公开的、确定性的哈希类函数。

重构 G(k):

选择任意 x0，向 PRF oracle 查询：

y0 = F_k(x0) = G(k) ⊕ H_0(x0)

由于 H_0 是公开的，可计算 H_0(x0)，再异或得：

G(k) = y0 ⊕ H_0(x0)

攻击与违背 PRF 定义：

一旦知道 G(k)，对任意 x：

F_k(x) = G(k) ⊕ H_0(x)

攻击者即可预测其输出。

判别器 D 构造：

1) 在 x0 查询 oracle，恢复出 G(k)。

2) 对新输入 x1，计算预测输出 G(k) ⊕ H_0(x1)，并与 oracle 响应比较。

如果一致，则猜 oracle 是 F_k；否则猜是随机函数。

D 可在多项式时间内以非忽略的优势区分 F_k 和真随机函数，因此 F_k 不是安全的 PRF。

F_k(x) = G(k) ⊕ H_0(x),

where

G is the fixed pseudorandom‐generator output on secret seed k;

H_0 is a public, deterministic hash‐like function.

Reconstructing G(k):

Choose arbitrary x0, query the PRF oracle:

y0 = F_k(x0) = G(k) ⊕ H_0(x0).

Since H_0 is public, compute H_0(x0) and XOR:

G(k) = y0 ⊕ H_0(x0).

Attack and violation of PRF definition:

Once G(k) is known, for any x:

F_k(x) = G(k) ⊕ H_0(x),

which the attacker can predict.

Distinguisher D:

1) Query oracle at x0, recover candidate G(k).

2) For new input x1, compute predicted output G(k) ⊕ H_0(x1) and compare to oracle’s response.

If they match, guess the oracle is F_k; otherwise guess it is random.

D runs in polynomial time and succeeds with non‐negligible advantage, so F_k is not a secure PRF.

“哈希类函数”通常指一类 哈希函数（Hash Function），其主要特征和用途如下：

定义

输入可以是任意长度的位串（如消息、文件、任意数据）。

输出是固定长度的“摘要”或“哈希值”（Digest），通常为 m 位

"Hash functions" usually refer to a class of hash functions, whose main features and uses are as follows:

Definition

The input can be a bit string of any length (such as a message, a file, or any data).

The output is a "digest" or "hash value" of fixed length, usually m bits

性质

确定性：相同输入总是产生相同输出。

高效性：对任意长度的输入，都能在多项式（近乎线性）时间内计算哈希值。

压缩性：将可变长输入“压缩”成固定长输出。

雪崩效应：输入的哪怕一位微小改变，输出都会大幅度改变（统计上近似均匀分布）。

Properties

Determinism: The same input always produces the same output.

Efficiency: For inputs of any length, the hash value can be calculated in polynomial (nearly linear) time.

Compressibility: "Compress" variable-length inputs into fixed-length outputs.

Avalanche effect: Even a slight change in one bit of the input will change the output significantly (statistically approximately uniform distribution).

密码学哈希函数的额外安全性要求

抗原像性 (Preimage Resistance):

给定 h，几乎不可能找到任何 x 使得 H(x) = h。

抗第二原像性 (Second-Preimage Resistance):

给定 x，几乎不可能找到 x' ≠ x 使得 H(x') = H(x)。

抗碰撞性 (Collision Resistance):

几乎不可能找到两个不同的输入 x, x' 使得 H(x) = H(x')。

Preimage Resistance:

Given a hash value h, it is computationally infeasible to find any input x such that H(x) = h.

Second-Preimage Resistance:

Given an input x, it is computationally infeasible to find any x' ≠ x such that H(x') = H(x).

Collision Resistance:

It is computationally infeasible to find any two distinct inputs x, x' such that H(x) = H(x').

伪随机函数（PRF，Pseudorandom Function）的定义：

函数族形式

设有一个函数族F: {0,1}^n × {0,1}^m → {0,1}^l

高效可计算性：

给定 k ∈ {0,1}^n 和 x ∈ {0,1}^m，F(k,x) 可在多项式时间内计算。

不可区分性：

对于任意概率多项式时间的判别器 D，

| Pr[ D^{O_PRF}(1^n) = 1 ] – Pr[ D^{O_R}(1^n) = 1 ] | < negl(n)

Definition of Pseudorandom Function (PRF):

Function family form

Suppose there is a function family F: {0,1}^n × {0,1}^m → {0,1}^l

Efficient Computability:

Given k ∈ {0,1}^n and x ∈ {0,1}^m, F(k,x) is computable in polynomial time.

Indistinguishability:

For any probabilistic polynomial‐time distinguisher D,

| Pr[ D^{O_PRF}(1^n) = 1 ] – Pr[ D^{O_R}(1^n) = 1 ] | < negl(n)

In practice, it is often the case that good block ciphers such AES (or some carefully designed hashes such as SHA256) are assumed to be a PRF. However, block cipher, by name, works on a fixed length of blocks, e.g., AES works on 128-bit messages only. The following are two possible ways to adjust the input/output length of a PRF:

#### h1-Q7: PRF 的 XOR 组合

问题：F₂(K,x) := E(K₁,x₁) ⊕ E(K₂,x₂) 是否为 PRF？

答案：不是 PRF

- 存在线性关系：F₂(K,x) = F₂(K,x′) ⊕ F₂(K,x̄) ⊕ F₂(K,x*)

- 攻击者可利用此关系区分该函数与真随机函数

PRF 安全性判定——第 6 章教学重点之一就是：

给定奇怪的组合 F'(K,x)，能否用 区分器 找到模式 → 若能，即判断“不安全”。

XOR 组合陷阱——教材常用 E(K₁,x₁) ⊕ E(K₂,x₂) 作为 典型反例，说明线性关系可被利用。  XOR 并不自动保持伪随机性：线性组合常透露结构。

Q7: XOR combination of PRFs

Problem: F₂(K, x) := E(K₁, x₁) ⊕ E(K₂, x₂). Is this a PRF?

Answer: Not a PRF

• There is a linear relation:

F₂(K, x) = F₂(K, x′) ⊕ F₂(K, x̄) ⊕ F₂(K, x*)

• An attacker can exploit this relation to distinguish it from a true random function

PRF security testing – a key focus of Chapter 6:

Given a strange construction F′(K, x), can a distinguisher find a pattern? If yes → insecure.

XOR-combination trap – the textbook’s classic counterexample:

E(K₁, x₁) ⊕ E(K₂, x₂) illustrates that linear combinations often leak structure. XOR alone does not automatically preserve pseudorandomness.

Q7. (10 points) Given a PRF E: {0,1}^n × {0,1}^n → {0,1}^m, we construct F₂: {0,1}^{2n} × {0,1}^{2n} → {0,1}^m as follows: F₂(K, x) := E(K₁, x₁) ⊕ E(K₂, x₂),where K = K₁ ∥ K₂ and x = x₁ ∥ x₂.  Is F₂(K, ·) still a PRF?  If yes, give a brief proof; if not, give a brief attack showing the violation of the PRF definition.

给定一个伪随机函数 E：{0,1}^n × {0,1}^n → {0,1}^m，我们构造 F₂：{0,1}^{2n} × {0,1}^{2n} → {0,1}^m 如下：F₂(K, x) := E(K₁, x₁) ⊕ E(K₂, x₂),其中 K = K₁ ∥ K₂，x = x₁ ∥ x₂。F₂(K, ·) 仍然是伪随机函数吗？如果是，请给出简要证明；如果不是，请给出一个简要攻击方案，说明其如何违背伪随机函数的定义。

Choose x = x₁‖x₂

x′ = x₁‖x₁

x̄ = x₂‖x₁

x* = x₂‖x₂

F₂(K,x)  = E(K₁,x₁) ⊕ E(K₂,x₂)

F₂(K,x′) = E(K₁,x₁) ⊕ E(K₂,x₁)

F₂(K,x̄) = E(K₁,x₂) ⊕ E(K₂,x₁)

F₂(K,x*) = E(K₁,x₂) ⊕ E(K₂,x₂)

Hence

F₂(K,x) = F₂(K,x′) ⊕ F₂(K,x̄) ⊕ F₂(K,x*)

选取 x = x₁‖x₂

x′ = x₁‖x₁

x̄ = x₂‖x₁

x* = x₂‖x₂

F₂(K,x)  = E(K₁,x₁) ⊕ E(K₂,x₂)

F₂(K,x′) = E(K₁,x₁) ⊕ E(K₂,x₁)

F₂(K,x̄) = E(K₁,x₂) ⊕ E(K₂,x₁)

F₂(K,x*) = E(K₁,x₂) ⊕ E(K₂,x₂)

因此

F₂(K,x) = F₂(K,x′) ⊕ F₂(K,x̄) ⊕ F₂(K,x*)

解释

该关系在真正的随机函数族中以极小概率成立，但在这个构造下总是成立。

攻击者只需查询这四个点，就能验证上述线性等式是否恒真：

如果输出满足 F₂(K, x) = F₂(K, x′) ⊕ F₂(K, x̄) ⊕ F₂(K, x*)，则极可能来自本构造；

否则则更像是真随机函数的输出。

这样就能以非忽略优势区别本函数与真随机函数，说明 F₂ 不是安全的 PRF。

This relation holds with negligible probability for a truly random function family, but always holds for this construction.

An adversary only needs to query these four points to verify whether the linear equation holds:

If the outputs satisfy F₂(K, x) = F₂(K, x′) ⊕ F₂(K, x̄) ⊕ F₂(K, x*), they are almost certainly from this construction;

otherwise they resemble the output of a truly random function.

This lets the adversary distinguish this function from a truly random function with non‐negligible advantage, showing that F₂ is not a secure PRF.

## 第七章. 隐私保护

##### 【W6】**第一部分：回顾与 IND-CPA 安全性证明**

1 回顾 (Recap):

1. 讲义开头的图表非常精炼地总结了我们从“完美保密”走向“计算安全”的整个历程。

1. OTP的两个问题: ① 密钥太长；② 密钥只能用一次。

1. 解决方案:

1. 针对长密钥问题，我们用 PRG 将短的真随机密钥拉伸成长的伪随机密钥流，实现了 C = PRG(k) ⊕ m。

1. 针对一次性问题，我们用 PRF 从一个主密钥 k 和一个随机数 r（Nonce）出发，为每条消息生成一个唯一的密钥流，实现了 C = (r, PRF(k, r) ⊕ m)。

1. 这一切都建立在计算安全的框架下，其核心是攻击者（Adv）的能力有限（PPT），且其成功概率可忽略。

Recap:

- The diagram at the beginning of the notes perfectly summarizes the journey from "perfect secrecy" to "computational security."

- Two Problems with OTP: ① The key is too long; ② The key is one-time use only.

- Solutions:

- For the long key problem, we used a PRG to stretch a short, true random key into a long, pseudorandom keystream, enabling C = PRG(k) ⊕ m.

- For the one-time use problem, we used a PRF with a master key k and a random nonce r to generate a unique keystream for each message, enabling C = (r, PRF(k, r) ⊕ m).

- This entire framework rests on computational security, where the adversary (Adv) has limited power (PPT) and their success probability is negligible.

IND-CPA 安全的形式化定义与证明:

1. 黄金标准: IND-CPA (选择明文攻击下的不可区分性) 是对称加密的黄金安全标准。

1. 安全游戏: 笔记清晰地描述了 IND-CPA 的游戏过程：攻击者 A 可以任意调用加密预言机，然后提交两个挑战明文 m₀, m₁，并收到其中一个的加密结果 C_b。A 的任务是猜出 b。如果 A 的优势 |Pr[b'=b] - 1/2| 是可忽略的，则方案安全。

1. 关键备注:

1. 确定性加密不安全: 再次强调，任何确定性的加密方案都无法达到 IND-CPA 安全，因为攻击者可以自己计算 Enc(k, m₀) 并与收到的密文比较。

1. 安全的构造: C = (r, PRF(k, r) ⊕ m) 是 IND-CPA 安全的。

1. 安全性证明 (归约法):

1. 定理: 如果底层的 PRF 是安全的，那么这个加密构造就是 IND-CPA 安全的。

1. 证明思路: 这是密码学证明的精髓。我们通过反证法来证明：

1. 假设：我们的加密方案不安全，即存在一个攻击者 A 能以 ε_A 的优势攻破它。

1. 目标：利用这个 A，我们来构造一个新的攻击者 B，让 B 去攻击底层的 PRF。

1. 构造 B: B 的任务是区分一个真 PRF 和一个真随机函数。B 会把自己的预言机（它不知道是真是假）包装成一个加密预言机给 A 使用。当 A 发起挑战时，B 也用自己的预言机来生成挑战密文。

1. 关键联系:

1. 如果 B 的预言机是真 PRF，那么 A 面对的就是一个真实的加密场景，A 会以 ε_A 的优势获胜。

1. 如果 B 的预言机是真随机函数，那么 A 得到的密钥流是完全随机的，A 将没有任何优势（优势为0）。

1. 结论: B 可以通过观察 A 是否获胜来判断自己的预言机是真是假。B 的优势 ε_B 被证明是 ε_A / 2。既然 ε_A 不可忽略，那么 ε_B 也不可忽略。这意味着 B 成功攻破了 PRF，这与“PRF是安全的”前提相矛盾。因此，最初的假设不成立，我们的加密方案必须是 IND-CPA 安全的。

Formal Definition and Proof of IND-CPA Security:

1. The Golden Standard: IND-CPA (Indistinguishability under Chosen Plaintext Attack) is the golden standard for symmetric encryption.

1. The Security Game: The notes clearly describe the IND-CPA game: an adversary A can query an encryption oracle, then submits two challenge plaintexts m₀, m₁, and receives the encryption of one of them, C_b. A's goal is to guess b. The scheme is secure if A's advantage, |Pr[b'=b] - 1/2|, is negligible.

1. Key Remarks:

1. Deterministic Encryption is Insecure: It's reiterated that no deterministic scheme can be IND-CPA secure, as the attacker can simply compute Enc(k, m₀) and compare it to the received ciphertext.

1. A Secure Construction: C = (r, PRF(k, r) ⊕ m) is IND-CPA secure.

1. The Security Proof (By Reduction):

1. Theorem: If the underlying PRF is secure, then this encryption construction is IND-CPA secure.

1. Proof Idea: This is the essence of a cryptographic proof, done by contradiction.

1. Assume: Our encryption scheme is not secure, meaning an adversary A exists who can break it with a non-negligible advantage ε_A.

1. Goal: Use this adversary A to build a new adversary B that breaks the underlying PRF.

1. Construct B: B's goal is to distinguish a real PRF from a true random function. B will use its own oracle (which it doesn't know is real or random) to simulate an encryption oracle for A. When A makes a challenge, B uses its oracle to generate the challenge ciphertext.

1. The Crucial Link:

1. If B's oracle is a real PRF, then A is playing against a real encryption scheme and will win with its advantage ε_A.

1. If B's oracle is a true random function, the keystream given to A is perfectly random, and A has no advantage (advantage is 0).

1. Conclusion: B can determine if its oracle is real or random by observing whether A wins. B's advantage ε_B is shown to be ε_A / 2. Since ε_A is non-negligible, ε_B is also non-negligible. This means B has successfully broken the PRF, which contradicts the premise that the PRF is secure. Therefore, the initial assumption was false, and our encryption scheme must be IND-CPA secure.

##### **第二部分：新问题——消息完整性 (Integrity)**

IND-CPA 保护的是机密性 (Confidentiality)，即攻击者无法读懂消息内容。但这还不够。

威胁模型:

- 在 Alice 给银行发送转账指令的例子中，攻击者 Eve 可能不关心指令的具体内容，但她可以篡改 (tamper) 密文，将收款人从 "Bob" 改为 "Eve"。

- 即使加密是 IND-CPA 安全的，这种篡改也是可能的。例如，在 C = (r, PRF(k, r) ⊕ m) 中，如果 Eve 知道 m 中代表收款人姓名的部分在哪个位置，她可以通过翻转 C 中对应位置的比特，来精确地翻转解密后 m 中对应位置的比特。

- 完整性的目标就是：检测并防止任何对消息的未经授权的修改。

失败的尝试:

1. 奇偶校验: 只能检测随机的单个比特错误，攻击者可以轻易地同时翻转两个比特来保持校验位不变。

1. 无密钥的哈希函数 (如 MD5, SHA-1): 哈希函数能将长消息压缩成一个短的、固定长度的“摘要”。它的一个重要特性是抗碰撞性（难以找到两个不同消息有相同哈希值）。

1. 问题: 如果我们发送 m || Hash(m)，这能保证完整性吗？

1. 答案: 不能。因为哈希函数是公开的，攻击者可以创建一个新的恶意消息 m'，然后自己计算 Hash(m')，再发送 m' || Hash(m')。接收方无法分辨这个哈希值是由合法的发送方还是攻击者计算的。

1. 核心教训: 要实现对抗恶意攻击者的完整性，验证过程中必须包含一个只有收发双方知道的秘密——密钥。

Failed Attempts:

- Parity Check: Only detects random single-bit errors. An attacker can easily flip two bits to keep the parity bit unchanged.

- Unkeyed Hash Functions (e.g., MD5, SHA-1): A hash function compresses a long message into a short, fixed-length "digest." A key property is Collision Resistance (it's hard to find two different messages with the same hash).

- Question: Does sending m || Hash(m) provide integrity?

- Answer: No. Because the hash function is public, an attacker can create a new malicious message m', compute Hash(m') themselves, and send m' || Hash(m'). The receiver has no way of knowing if the hash was computed by the legitimate sender or the attacker.

- The Core Lesson: To achieve integrity against a malicious adversary, the verification process must involve a secret known only to the sender and receiver—a key.

IND-CPA安全

选择明文攻击下的不可区分性

现代加密的黄金标准

要求：随机化加密

### 7.Privacy Protection IND-CPA Security

Indistinguishability under Chosen-Plaintext Attack

The gold standard for modern encryption

Requirement: randomized encryption

认证加密（AE）

同时提供机密性和权限

方法：先加密后MAC

Authenticated Encryption (AE)

Provides both confidentiality and integrity

Method: Encrypt-then-MAC

#### Q1: IND-CPA安全性分析

核心概念：选择明文攻击下的不可区分性安全

题目分析了几种对IND-CPA安全加密方案的修改：

a) Enc₁(k,m) = Enc(k,m) || PRF(k,m)

- 结论：不安全

- 原因：PRF是确定性函数，相同消息产生相同的r值，攻击者可通过比较r来判断是否为相同明文

b) Enc₂(k,m) = Enc(k,m) || (Enc(k,m) + 3)

- 结论：安全

- 原因：附加的t = c₀ + 3是c₀的公开函数，不泄露关于明文的新信息

Q1: IND-CPA Security Analysis

Core concept: IND-CPA indistinguishability under chosen-plaintext attacks

The question analyzes modifications to an IND-CPA-secure scheme:

a) Enc₁(k, m) = Enc(k, m) ∥ PRF(k, m)

Conclusion: insecure

Reason: PRF is deterministic; the same message yields the same PRF output, so an attacker can compare values to detect identical plaintexts

b) Enc₂(k, m) = Enc(k, m) ∥ (Enc(k, m) + 3)

Conclusion: secure

Reason: the appended t = c₀ + 3 is a public function of c₀ and leaks no new information about m

Q1IND-CPA 安全性与等价归约（Reduction）

正如课堂上所解释的，**IND-CPA 安全性（选择明文攻击下的不可区分性。攻击者能不能根据密文猜出来明文）**是指对称密钥加密方案在以下条件下，仍能对抗所有有效（即多项式时间）的攻击者：

1 攻击者可以任意选择消息-密文对（即攻击者可以自定义输入消息）；

2 攻击者的目标是区分 Enc(k, 0) 与 Enc(k, 1)，其中密钥 k 是随机选择的（或者判断两个密文是否是对同一条消息加密所得）。

现在，针对下面给出的从原本具备 IND-CPA 安全性的加密函数 Enc 修改而来的几种加密方案，请判断它们是否仍然具备 IND-CPA 安全性，并简要说明理由。

As explained in the class, IND-CPA security for a (symmetric key) encryption is secure against all efficient (polynomial time) adversaries that  
(1) can have arbitrarily message-ciphertext pairs (messages are chosen by the adversary); and  
(2) only wishes to tell apart Enc(k, 0) from Enc(k, 1) for a uniformly chosen key k (or to tell whether two ciphertext encrypts the same message).

For each of the following encryption modified from the IND-CPA secure Enc, whether it is still IND-CPA secure, and briefly explain.Enc₁(k, m)  
a. 其中 Enc₁(k, m) 的定义如下：

1. 首先调用原本 IND-CPA 安全的加密函数 Enc(k, m)，得到密文部分 c₀。

1. 接着计算伪随机函数（PRF）输出：r = PRF(k, m)。

1. 最终密文为 c := c₀ || r，即将 c₀ 和 r 拼接。

1. Enc₁(k, m) is defined as follows: It runs Enc(k, m) and obtains c₀; it computes r = PRF(k; m). The final ciphertext c is defined as c := c₀ || r, concatenating c₀ with r. (4 points)

问题要求我们判断修改后的加密算法 Enc₁(k, m) 是否仍然具有 IND-CPA（Indistinguishability under Chosen Plaintext Attack） 安全性。

- 标准答案：

No. PRF is a deterministic function. Same m has the same r.

##### 否定。因为伪随机函数（PRF）是**确定性的函数**，对于相同的消息 m，它总会输出相同的

##### Why is it **not IND-CPA secure**?

扩展：  
尽管 Enc(k, m) 是 IND-CPA 安全的，加密过程本身可能引入随机性，但我们在密文中附加了 r = PRF(k, m)，而 PRF 是确定性的。这意味着：

对于任意相同的消息 m，即使 Enc(k, m) 的输出 c₀ 是随机的，

但 r 的值始终是固定的（因为 PRF 对相同输入总是输出相同结果）。

因此，攻击者可以观察多个密文，只需检查 r 的部分是否相同即可判断是否是对相同明文 m 的加密。这泄露了消息是否相同的信息，从而违反了 IND-CPA 的安全定义。

英文解释：  
Although Enc(k, m) is IND-CPA secure and may involve randomness in c₀, appending r = PRF(k, m)—a deterministic output—leaks information.  
For any repeated message m, the value r will always be the same. An attacker can thus compare the r values in ciphertexts to detect repeated messages. This breaks the indistinguishability requirement of IND-CPA security, which mandates that ciphertexts of the same message should not be distinguishable from different messages.

像密文泄漏明文相关信息

使用确定性加密

密文包含明文的一部分

| 类型编号 | 中文问题类型 | 英文简述 | 示例总结 |
| --- | --- | --- | --- |
| 1 | 添加 PRF 输出泄露明文 | PRF output reveals plaintext | `Enc(k, m) |
| 2 | 确定性加密泄露结构 | Deterministic encryption | AES_ECB(k, m) |
| 3 | 密文包含明文 | Ciphertext includes plaintext | `m |
| 4 | 使用固定 IV/nonce | Fixed IV / nonce | AES_CBC(k, iv_fixed, m) |
| 5 | 密钥暴露 | Key leakage | `AES(k, m) |
| 6 | 密文长度暴露明文长度 | Ciphertext length leaks msg length | len(cipher(m₀)) ≠ len(cipher(m₁)) |
| 7 | 添加明文的 hash | Appending hash of plaintext | `Enc(k, m) |

1. 定义 Enc₂(k, m) 如下：它运行 Enc(k, m) 并得到 c₀；输出密文为 c := c₀ || t，即在密文后附加额外填充 t = c₀ + 3，每次都这样操作。 （6 分）

b. Enc₂(k, m) is defined as follows: It runs Enc(k, m) and obtains c₀; the output ciphertext c := c₀ || t, i.e., with an extra padding of t = c₀ + 3 at the end all the time. (6 points)

2. 原始参考答案

Yes, ciphertext is c₀ || f(c₀), no more information than that c₀ can provide. Can reduce Enc₂ to Enc’s IND-CPA security via proof with contradiction.

是的，密文是 c₀ || f(c₀)，不会提供比 c₀ 更多的额外信息。可以通过反证法将 Enc₂ 简化为 Enc 的 IND-CPA 安全性。

原参考答案逐句解释：

Yes, ciphertext is c₀ || f(c₀), no more information than that c₀ can provide.

→ 是的，密文是由原始密文 c₀ 与其函数 f(c₀) 拼接而成。

→ f(c₀) 是从 c₀ 推导出的值，并未引入与明文相关的新信息，因此整体密文仍只泄露 c₀ 中已有的内容。

Can reduce Enc₂ to Enc’s IND-CPA security via proof with contradiction.

→ 可以通过归约法证明：若能破坏 Enc₂ 的 IND-CPA 安全性，则也能破坏 Enc 的安全性，从而矛盾。 说明  Enc₂是安全的。

3. 知识点解释与扩展

考点：IND-CPA 安全性与等价归约（Reduction）

IND-CPA (Indistinguishability under Chosen-Plaintext Attack) 安全性是现代对称加密方案的基本安全标准。

它要求：即使攻击者可以选择任意明文进行加密，也不能区分密文是由哪一条明文加密得到的。

定义：一个加密方案 (Enc, Dec) 被称为 IND-CPA 安全的，如果对于任意多项式时间攻击者 A，其在挑战实验中成功区分 Enc(k, m₀) 和 Enc(k, m₁) 的概率不比 1/2 多出一个可忽略量。

📌 本题关键公式与结构：

Enc₂(k, m) = c₀ || t  ，其中 t = c₀ + 3 是对 c₀ 的确定性函数 f(c₀)

因此整个密文是：ciphertext = c₀ || f(c₀)

考察的知识点总结：

• IND-CPA 定义 – 区分加密不同消息的不可行性

• 安全性保持（安全归约）– 如果原始方案 IND-CPA 安全，加入不泄漏信息的附加内容后仍安全

• 信息泄露分析（信息论）– t = c₀ + 3 不引入新的明文信息

• 函数不可逆性无关 – 即使 f 是公开的也不影响 IND-CPA

5. 总结公式与通用模式

通用结构：

Enc′(k, m) = Enc(k, m) || f(Enc(k, m))

只要 f 是公开的确定性函数，且不引入关于 m 的信息，则 Enc′ 仍 IND-CPA 安全。

#### Q5: 加密组合器构造

目标：结合两个加密方案，只要其中一个安全，组合方案就安全

方案：嵌套加密 Π₃ = Enc₂(k₂, Enc₁(k₁, m))

- 如果Enc₁安全，原始消息被保护

- 如果Enc₂安全，即使Enc₁不安全，其输出仍被隐藏

Q5: Encryption Combiner Construction

Goal: combine two encryption schemes so that if either is secure, the combined scheme is secure

Construction: Π₃ = Enc₂(k₂, Enc₁(k₁, m))

If Enc₁ is secure, m is protected

If Enc₂ is secure, then even if Enc₁ is insecure, its output remains hidden

Q5 – 对称加密组合器的构造与安全性

Q5.

开源加密库常存在各种问题。在构建安全系统时，很多时候你不得不使用外部库。与其只调用一个库，不如考虑使用多个来自不同团队的加密库，以增强整体安全性。组合器（Combiner） 是一种方法：给定两个加密构造 (Π₁, Π₂)，组合器将调用二者，组合成一个新构造 Π₃，使得 只要其中一个构造是安全的，Π₃ 就是安全的。具体问题如下：给定两个对称密钥加密构造  
Π₁ = (KeyGen₁, Enc₁, Dec₁),  
Π₂ = (KeyGen₂, Enc₂, Dec₂)

你能否设计一种安全的组合方式，使得 只要 Π₁ 或 Π₂ 中有一个是 IND-CPA 安全的，你构造出的 Π₃ 也必然是 IND-CPA 安全的？  
请给出构造方案并加以证明。（提示：你可以调用每个库，让它们协同工作）

Open-source libraries often have all kinds of issues. But when you are implementing a secure system, most of the time, you have to use certain external libraries. Instead of just invoking one library, you may consider using multiple libraries provided by different parties to enhance security.A combiner is one such method. Given two libraries (Π₁, Π₂) of a cryptographic primitive, a combiner will make calls to each one and compile them into a third construction Π₃, so that Π₃ will be secure as long as one of (Π₁, Π₂) is secure.  
Specifically, consider the following:Given two constructions of symmetric-key encryption Π₁ = (KeyGen₁, Enc₁, Dec₁), Π₂ = (KeyGen₂, Enc₂, Dec₂), could you find a way to securely combine them (using each implementation as a library), so that as long as one implementation (Π₁ or Π₂) is IND-CPA secure, your final construction Π₃ will be IND-CPA secure?  
Please show your construction and prove it. (Hint: you can invoke each library and try to let them work together somehow.)

1. Keygen1 --> k1, Keygen2 --> k2, remember to use independent two keys k1, k2

2. take one enc's ciphertext as input of another enc, i.e., Enc2(k2, Enc1(k1, m)) --> c2

3. Dec1(k1, Dec2(k2, c))

explain a bit why secure

or show that Π3 security can be reduced to IND-CPA of secure Enc1/Enc2

1. Keygen1 --> k1，Keygen2 --> k2，记住使用两个独立的密钥 k1 和 k2

2. 将一个 enc 的密文作为另一个 enc 的输入，即 Enc2(k2, Enc1(k1, m)) --> c2

3. Dec1(k1, Dec2(k2, c))

解释一下为什么它是安全的

或者说明 Π3 安全性可以简化为安全 Enc1/Enc2 的 IND-CPA

构建方案 Π₃

1. Generate two independent keys:生成两个独立的密钥：

k₁ ← KeyGen₁(),  k₂ ← KeyGen₂()

2. Encryption procedure:嵌套加密

c₁ = Enc₁(k₁, m)

c₂ = Enc₂(k₂, c₁)

Final ciphertext c = c₂

3. Decryption procedure:对应的解密过程：

c₁ = Dec₂(k₂, c)

m = Dec₁(k₁, c₁)

##### 1. Keygen1 --> k1, Keygen2 --> k2, remember to use independent two keys k1, k2

英文解释：  
Use the key generation algorithms from Π₁ and Π₂ to independently generate two separate keys k₁ and k₂.

中文翻译与解释：  
使用加密构造 Π₁ 和 Π₂ 中的密钥生成函数，分别生成两个独立的密钥 k₁ 和 k₂。

注意：两个密钥必须独立，以确保不会因密钥重用造成安全性削弱。

##### 2. take one enc's ciphertext as input of another enc, i.e., Enc2(k2, Enc1(k1, m)) --> c2

英文解释：  
Encrypt the message m first using Enc₁ and key k₁, then take the result and encrypt it again using Enc₂ and key k₂.  
So the final ciphertext c₂ = Enc₂(k₂, Enc₁(k₁, m)).

中文翻译与解释：  
先用密钥 k₁ 调用加密算法 Enc₁ 加密明文 m，  
再将加密后的密文作为输入，用密钥 k₂ 通过 Enc₂ 再加密一次。  
最终得到的密文是：

c2=Enc2(k2,Enc1(k1,m))c₂ = Enc₂(k₂, Enc₁(k₁, m))c2​=Enc2​(k2​,Enc1​(k1​,m))

这就是组合加密的输出。

##### 3. Dec1(k1, Dec2(k2, c))

To decrypt the ciphertext c, you first apply Dec₂ with key k₂, then apply Dec₁ with key k₁ to the result.

中文翻译与解释：  
解密时，先用密钥 k₂ 调用 Dec₂ 解密 c，得到中间密文；  
然后用密钥 k₁ 调用 Dec₁ 继续解密，最终恢复出原始明文 m。  
公式为：

m=Dec1(k1,Dec2(k2,c))m = Dec₁(k₁, Dec₂(k₂, c))m=Dec1​(k1​,Dec2​(k2​,c))

##### explain a bit why secure

英文解释：  
Provide a brief explanation of why this double-encryption scheme preserves IND-CPA security.

中文翻译与解释：  
简要说明为什么这个“双重加密方案”仍然是 IND-CPA 安全的。  
（即使一个加密方案不安全，只要另一个是 IND-CPA 安全的，整个组合加密仍然是安全的。）

##### or show that Π₃ security can be reduced to IND-CPA of secure Enc1/Enc2

Alternatively, show a security reduction: that if one of Enc₁ or Enc₂ is IND-CPA secure, then Π₃ must also be IND-CPA secure.

或者，通过归约证明说明：只要 Enc₁ 或 Enc₂ 中的一个是 IND-CPA 安全的，  
那么整个组合加密方案 Π₃ 也一定是 IND-CPA 安全的。

### 3. Security Explanation or Reduction

Π₃ 的 IND-CPA 安全性可以归约到 Π₁ 或 Π₂ 中任意一个的 IND-CPA 安全性。

• If Enc₂ is IND-CPA secure, then even if Enc₁ is not secure, the output of Enc₁ is hidden by Enc₂.

• If Enc₁ is IND-CPA secure, and Enc₂ is insecure, the original message is still protected by Enc₁.

• Hence, as long as one encryption function is IND-CPA secure, the overall scheme remains IND-CPA secure.

• 如果 Enc₂ 是安全的，即便 Enc₁ 不安全，其加密输出仍被 Enc₂ 隐藏。

• 如果 Enc₁ 是安全的，即使 Enc₂ 不安全，Enc₂ 加密的是 Enc₁ 的输出，攻击者无法恢复原始明文。

• 因此，只要 Enc₁ 或 Enc₂ 有一个是安全的，整体组合加密仍是 IND-CPA 安全的。

例题Q. Suppose you have two MAC implementations MAC₁ and MAC₂. Construct a combiner MAC₃ such that as long as one of MAC₁ or MAC₂ is unforgeable, MAC₃ is unforgeable. Briefly explain why your scheme works.

中文翻译：假设你拥有两个消息认证码（MAC）实现：MAC₁ 和 MAC₂。构造一个组合方案 MAC₃，使得只要 MAC₁ 或 MAC₂ 中有一个是不可伪造的，MAC₃ 也是不可伪造的。简要说明你的方案为何有效。

- 先加密后MAC

- 这本身就是一种加密组合器的方式

- 加密组合器的定义和用途：

- 加密组合器采用不同的加密方案或原语组合起来更安全的方法

- 最典型的例子就是将加密和认证组合，实现加密认证

- 常见的加密组合器类型：

- Encrypt-then-MAC (EtM)：先加密后MAC

- MAC-then-Encrypt (MtE)：先MAC后加密

- Encrypt-and-MAC (E&M)：同时进行加密和MAC

- 这些都是认证加密的实现方式

Encrypt-then-MAC is itself an encryption combiner

Definition and Use of Encryption Combiners

Combine different encryption schemes or primitives for stronger security

Classic example: combining encryption with authentication

Common Combiner Types

Encrypt-then-MAC (EtM)

MAC-then-Encrypt (MtE)

Encrypt-and-MAC (E&M)

All of these realize authenticated encryption.

这两个问题虽然共享了“组合器”这一高层哲学思想，但在技术层面是截然不同的。

- MAC 组合器处理的是认证性问题，其构造和证明都相对直接，可以直观地理解为“双重签名”。

- 加密组合器处理的是机密性问题，其安全定义（IND-CPA）更为微妙，导致其构造方案必须更精巧（例如使用XOR技巧），其安全性证明也需要更复杂和形式化的密码学归约论证。

比较这两个问题，可以深刻地揭示出密码学中不同安全目标（完整性 vs. 机密性）是如何导致截然不同的设计和分析方法的。

## 第八章.消息认证码（MAC）8.Message Authentication Codes (MAC)

##### **[W6]****第三部分：解决方案——消息认证码 (MAC)**

定义: MAC 是一个带密钥的哈希函数，专门用于保证消息的完整性和真实性。

1. Tag(k, m) → σ: 使用密钥 k 为消息 m 生成一个标签（或叫 MAC 值）σ。

1. Verify(k, m, σ) → 1/0: 使用同一个密钥 k 验证收到的 m 和 σ 是否匹配。

##### **Part 3: The Solution - Message Authentication Codes (MACs)**

Definition: A MAC is a keyed hash function designed specifically to provide message integrity and authenticity.

1. Tag(k, m) → σ: Use key k to generate a tag (or MAC value) σ for message m.

1. Verify(k, m, σ) → 1/0: Use the same key k to verify if the received m and σ match.

安全目标 (EU-CMA):

- MAC 的安全标准是 EU-CMA (选择消息攻击下的存在性不可伪造性)。

- 存在性不可伪造 (Existential Unforgeability): 攻击者的目标是伪造任何一条他之前没有查询过的新消息的有效标签。哪怕这条消息是胡言乱语，只要他能伪造出标签，就算攻击成功。这是一个非常强的安全要求。

- 选择消息攻击 (Chosen Message Attack): 攻击者可以访问一个“签名预言机”，为任意他选择的消息获取合法的标签。

Security Goal (EU-CMA):

1. The security standard for a MAC is EU-CMA (Existential Unforgeability under a Chosen Message Attack).

1. Existential Unforgeability: The adversary's goal is to forge a valid tag for any new message they have not previously queried. Even if the message is nonsensical, if they can forge a tag for it, the attack is successful. This is a very strong security guarantee.

1. Chosen Message Attack: The adversary has access to a "tagging oracle" and can obtain valid tags for messages of their choice.

构造 MAC:

1. 核心思想: 标签 σ 必须是不可预测的。什么函数是不可预测的？PRF！

1. 基于 PRF 的 MAC: 对于固定长度的消息，最简单的构造就是 Tag(k, m) = PRF(k, m)。因为 PRF 的输出对于不知道密钥 k 的人来说是伪随机的、不可预测的，所以攻击者无法为新消息 m' 伪造出正确的 PRF(k, m')。

1. 处理可变长度消息: 实践中，消息长度是可变的。一个非常高效和安全的方法是结合哈希函数：

1. Tag(k, m) = PRF(k, H(m))

1. 这个构造（即著名的 HMAC 的核心思想）首先用一个公开的、抗碰撞的哈希函数 H 将任意长度的消息 m 压缩成一个固定长度的摘要，然后再将这个摘要输入到 PRF 中。这样既能处理任意长度的消息，又能利用到 PRF 的安全性

Constructing a MAC:

1. Core Idea: The tag σ must be unpredictable. What kind of function is unpredictable? A PRF!

1. PRF-based MAC: For fixed-length messages, the simplest construction is Tag(k, m) = PRF(k, m). Because the output of a PRF is pseudorandom and unpredictable to anyone without the key k, an attacker cannot forge the correct PRF(k, m') for a new message m'.

1. Handling Variable-Length Messages: In practice, messages have variable lengths. A highly efficient and secure method combines a hash function:

1. Tag(k, m) = PRF(k, H(m))

1. This construction (the core idea behind the famous HMAC) first uses a public, collision-resistant hash function H to compress the variable-length message m into a fixed-length digest. This digest is then fed into the PRF. This approach can handle messages of any length while leveraging the security of the PRF.

##### **[w7] ****消息认证码（MAC）的形式化安全定义与证明**

这部分内容是对上一讲 EU-CMA 安全性的进一步深化。

安全游戏 (The Security Game):

1. 笔记通过一个清晰的交互图，形式化了 EU-CMA（选择消息攻击下的存在性不可伪造性） 的安全游戏。

1. 攻击者能力 (Capability): 攻击者 A 可以访问一个“标签预言机”。他可以把任意选择的消息 m₁, m₂, ... 发送给预言机，并获得由秘密密钥 k 生成的合法标签 σ₁, σ₂, ...。

1. 攻击者目标 (Goal): 在进行了足够多的查询后，攻击者需要输出一个新的消息-标签对 (m*, σ*)。

1. 获胜条件 (Winning Condition):

1. m* 必须是新的，即 A 从未向预言机查询过 m*。

1. 伪造的标签 σ* 必须是有效的，即 Verify(k, m*, σ*) 返回1。

1. 安全性定义: 如果对于任何 PPT 攻击者 A，其获胜的概率都是可忽略的，那么这个 MAC 方案就是 EU-CMA 安全的。

EU-CMA 的内涵:

1. 这个强大的安全定义涵盖了两点：

1. 不可伪造性 (Unforgeability): 攻击者无法凭空为一条新消息捏造出合法的标签。

1. 不可延展性 (Non-malleability): 攻击者也无法通过修改一个已有的、合法的 (m, σ) 对，来得到另一个新的、合法的 (m', σ') 对。

机密性与完整性的独立性:

1. 笔记再次强调了一个核心观点：机密性（由加密保证）和完整性（由MAC保证）是两个正交（独立）的安全属性。一个无法推出另一个。一个安全的系统通常需要同时实现两者。

基于 PRF 的 MAC 的安全性证明:

1. 构造: Tag(k, m) = PRF(k, m)。

1. 证明思路 (归约法): 这与 IND-CPA 的证明思路如出一辙。

1. 假设 MAC 不安全，即存在一个攻击者 A_mac 能成功伪造标签。

1. 构造 一个新的攻击者 A_prf，让它去攻击底层的 PRF。A_prf 的任务是区分一个真 PRF 和一个真随机函数。

1. A_prf 会把自己的预言机（它不知道是真是假）包装成一个 MAC 标签预言机，来与 A_mac 交互。

1. 当 A_mac 最终成功伪造了一个 (m*, σ*) 时，A_prf 就拿着这个 m* 去查询自己的预言机。

1. 关键联系:

1. 如果 A_prf 的预言机是真 PRF，那么它查询 m* 得到的返回值就是 PRF(k, m*)。这个值应该等于 A_mac 伪造的 σ*。

1. 如果 A_prf 的预言机是真随机函数，那么它查询 m* 会得到一个完全随机的值，这个值与 σ* 相等的概率极低。

1. 结论: A_prf 可以通过检查 σ* 是否等于其预言机在 m* 上的输出来判断预言机的真伪。A_prf 的攻击优势与 A_mac 的优势直接相关，因此也是不可忽略的。这与“PRF是安全的”前提矛盾。所以，该 MAC 构造必须是安全的。

处理长消息 (HMAC):

1. 对于长消息，直接将其作为 PRF 的输入是低效的。标准做法是使用哈希函数先进行压缩：Tag(k, m) = MAC(k, H(m))。这就是著名的 HMAC (Hash-based MAC) 的核心思想，它将一个抗碰撞的哈希函数和一个安全的 MAC（通常基于PRF）结合起来，既高效又安全。

#### English Explanation

##### **Part 1: Formal Security Definition and Proof for MACs**

This section deepens the understanding of EU-CMA security from the previous lecture.

The Security Game:

- The notes formalize the EU-CMA (Existential Unforgeability under Chosen Message Attack) security game with a clear interaction diagram.

- Adversary's Capability: The adversary A has access to a "tagging oracle." They can send any messages of their choice (m₁, m₂, ...) to the oracle and receive the corresponding valid tags (σ₁, σ₂, ...) generated with a secret key k.

- Adversary's Goal: After making sufficient queries, the adversary must output a new message-tag pair (m*, σ*).

- Winning Condition:

1. m* must be new; A must have never queried the oracle with m*.

1. The forged tag σ* must be valid, meaning Verify(k, m*, σ*) returns 1.

- Security Definition: A MAC scheme is EU-CMA secure if, for any PPT adversary A, the probability of winning this game is negligible.

The Meaning of EU-CMA:

- This strong security definition implies two things:

- Unforgeability: An attacker cannot create a valid tag for a new message from scratch.

- Non-malleability: An attacker also cannot tamper with an existing valid pair (m, σ) to produce another new, valid pair (m', σ').

Independence of Confidentiality and Integrity:

- The notes re-emphasize a core principle: Confidentiality (from encryption) and Integrity (from a MAC) are orthogonal (independent) security properties. One does not imply the other. A secure system typically needs both.

Security Proof of the PRF-based MAC:

- Construction: Tag(k, m) = PRF(k, m).

- Proof Idea (By Reduction): This follows the same logic as the IND-CPA proof.

1. Assume the MAC is insecure, meaning an adversary A_mac exists who can successfully forge a tag.

1. Construct a new adversary A_prf to attack the underlying PRF. A_prf's goal is to distinguish a real PRF from a true random function.

1. A_prf simulates a MAC oracle for A_mac using its own oracle (which it doesn't know is real or random).

1. When A_mac finally succeeds and forges a pair (m*, σ*), A_prf takes this m* and queries its own oracle with it.

1. The Crucial Link:

- If A_prf's oracle is a real PRF, its output for m* will be PRF(k, m*), which should equal the forged tag σ*.

- If A_prf's oracle is a true random function, its output for m* will be a completely random value, which will match σ* with only a negligible probability.

1. Conclusion: A_prf can distinguish its oracle by checking if its output on m* matches σ*. The advantage of A_prf is directly related to the advantage of A_mac and is therefore non-negligible. This contradicts the premise that the PRF is secure. Thus, the MAC construction must be secure.

Handling Long Messages (HMAC):

- For long messages, using them directly as input to a PRF is inefficient. The standard practice is to first compress the message with a hash function: Tag(k, m) = MAC(k, H(m)). This is the core idea behind the famous HMAC (Hash-based MAC), which securely and efficiently combines a collision-resistant hash function with a secure MAC (often PRF-based).

##### **第二部分：新工具——承诺方案 (Commitment Scheme)**

这是一个新的密码学工具，用于解决“先隐藏，后公开”的问题。

- 应用场景: 在线石头剪刀布、在线拍卖。你需要先“出招”或“出价”，但又不能让对方提前看到，等到所有人都出完后，再一起公开。

- 过程:

- 承诺 (Commit): 你想承诺一个消息 m。你计算 commit(m)，得到一个承诺值 c 和一个打开值 op。你将 c 公开，自己保留 op。

- 打开 (Open): 在需要时，你公开 m 和 op。任何人都可以使用 verify(m, c, op) 来验证你当初承诺的确实是 m。

- 安全属性:

- 隐藏性 (Hiding): 承诺值 c 不应泄露任何关于消息 m 的信息。

- 绑定性 (Binding): 一旦你承诺了 c，你就无法在事后“打开”成一个不同的消息 m'。

- 构造: 一个简单的构造是 commit(m) = (H(r || m), (r, m))，其中 r 是一个随机数。

- 隐藏性由随机数 r 保证。

- 绑定性由哈希函数的抗碰撞性保证。

##### **Part 2: A New Tool - Commitment Schemes**

This is a new cryptographic primitive for solving "hide-then-reveal" problems.

- Use Cases: Online rock-paper-scissors, online auctions. You need to commit to your move or bid without revealing it, and then reveal it later after everyone has committed.

- Process:

1. Commit: To commit to a message m, you compute commit(m) to get a commitment c and an opening value op. You publish c and keep op secret.

1. Open: When it's time to reveal, you publish m and op. Anyone can use verify(m, c, op) to check that you indeed committed to m.

- Security Properties:

1. Hiding: The commitment c should reveal no information about the message m.

1. Binding: Once you've published c, you cannot later "open" it to a different message m'.

- Construction: A simple construction is commit(m) = (H(r || m), (r, m)), where r is a random number.

- Hiding is provided by the random number r.

- Binding is provided by the collision resistance of the hash function H.

##### **第三部分：终极目标——认证加密 (Authenticated Encryption, AE)**

这是将机密性和完整性完美结合的最终方案。

动机:

1. 在很多场景下，我们既需要保密，也需要防篡改。

1. 更重要的是，在某些攻击模型下，对完整性的破坏会间接导致机密性的丧失。如果攻击者可以篡改密文，并观察解密后的结果（例如，系统是否报错），他可能能推断出明文的信息。这种攻击被称为选择密文攻击 (Chosen Ciphertext Attack, CCA)。

CCA 攻击模型:

1. 这是比 CPA 更强大的攻击模型。攻击者不仅拥有一个加密预言机，还拥有一个解密预言机。他可以解密任意密文，除了他收到的那个挑战密文。

1. IND-CCA 安全定义: 在 CCA 攻击模型下，攻击者仍然无法区分两个挑战明文的加密结果。

认证加密 (AE):

1. 一个 AE 方案的目标就是同时提供机密性和完整性，从而达到 IND-CCA 安全。

1. 构造方法: 如何将一个 IND-CPA 安全的加密方案 (Enc) 和一个 EU-CMA 安全的 MAC 方案结合起来？

1. Encrypt-and-MAC (并行): C = Enc(k₁, m), σ = MAC(k₂, m)。不安全，因为 MAC 可能泄露明文信息。

1. MAC-then-Encrypt (先算MAC再加密): σ = MAC(k₂, m), C = Enc(k₁, m || σ)。不推荐，存在一些微妙的攻击，接收方需要先解密才能验证，这给了攻击者可乘之机。

1. Encrypt-then-MAC (先加密再算MAC): C = Enc(k₁, m), σ = MAC(k₂, C)。这是黄金标准。它逻辑清晰且最稳健：首先将明文加密成一个不透明的密文“团”C，然后对这个密文团计算 MAC。接收方先验证 MAC，确认密文团未被篡改，然后再进行解密。

##### **Part 3: The Ultimate Goal - Authenticated Encryption (AE)**

This is the final scheme that perfectly combines confidentiality and integrity.

Motivation:

- In many scenarios, we need both secrecy and protection against tampering.

- More importantly, under certain attack models, a break in integrity can lead to a break in confidentiality. If an attacker can tamper with a ciphertext and observe the result of the decryption (e.g., whether the system returns an error), they might be able to deduce information about the plaintext. This is known as a Chosen Ciphertext Attack (CCA).

The CCA Threat Model:

- This is a stronger model than CPA. The adversary has not only an encryption oracle but also a decryption oracle. They can decrypt any ciphertext they want, except for the specific challenge ciphertext they received.

- IND-CCA Security Definition: Under a CCA, the adversary is still unable to distinguish the encryption of two challenge plaintexts.

Authenticated Encryption (AE):

- The goal of an AE scheme is to provide both confidentiality and integrity, thereby achieving IND-CCA security.

- Construction: How to combine an IND-CPA secure encryption scheme (Enc) and a EU-CMA secure MAC scheme?

- Encrypt-and-MAC (in parallel): C = Enc(k₁, m), σ = MAC(k₂, m). Insecure, as the MAC might leak information about the plaintext.

- MAC-then-Encrypt: σ = MAC(k₂, m), C = Enc(k₁, m || σ). Not recommended, as it has subtle attacks. The receiver must decrypt before verifying, giving the attacker an opportunity to exploit flaws in the decryption process.

- Encrypt-then-MAC: C = Enc(k₁, m), σ = MAC(k₂, C). This is the golden standard. Its logic is clean and robust: first, encrypt the plaintext into an opaque ciphertext "blob" C. Then, compute a MAC on this entire blob. The receiver verifies the MAC first to ensure the blob hasn't been tampered with, and only then proceeds to decrypt.

##### **第四部分：课程回顾**

最后的图表是一个精彩的总结，展示了所有概念之间的关系：

- 基础工具:

- 哈希函数 (Hash): 提供抗碰撞性，用于 MAC 和承诺方案。

- 伪随机生成器 (PRG): 从短种子生成长伪随机串，用于流密码。

- 伪随机函数 (PRF): 核心工具，可以按需生成伪随机值。

- 构建应用:

- PRF → 消息认证码 (MAC) (保证完整性)

- PRF → IND-CPA 安全加密 (保证机密性)

- IND-CPA 加密 + MAC 通过 Encrypt-then-MAC 组合 → 认证加密 (AE) (同时保证机密性和完整性，达到 IND-CCA 安全)。

这清晰地描绘了现代对称密码学的知识图谱。

##### **Part 4: Course Recap**

The final diagram is a brilliant summary showing the relationships between all concepts:

- Basic Primitives:

- Hash Function (Hash): Provides collision resistance, used in MACs and commitment schemes.

- Pseudorandom Generator (PRG): Generates long pseudorandom strings from short seeds, used for Stream Ciphers.

- Pseudorandom Function (PRF): The core primitive for generating pseudorandom values on demand.

- Building Applications:

- PRF → Message Authentication Code (MAC) (for integrity).

- PRF → IND-CPA Secure Encryption (for confidentiality).

- IND-CPA Encryption + MAC combined via Encrypt-then-MAC → Authenticated Encryption (AE) (for both confidentiality and integrity, achieving IND-CCA security).

This clearly maps out the knowledge graph of modern symmetric cryptography.

语法

标签：(k,m) → σ

验证：(k,m,σ) → {0,1}

安全性

不可格式化

从PRF构造

Syntax

Tag: (k, m) → σ

Verify: (k, m, σ) → {0, 1}

Security

Unforgeability

Constructed from PRF

#### h2-Q3: MAC安全性分析

问题方案：Tag(k,m) = (r, F(k,r) ⊕ CRC32(m))

- 结论：不安全

- 攻击方法：观察到(r₁,t₁)后，可计算t₂ = t₁ ⊕ CRC32(m₁) ⊕ CRC32(m₂)来伪造m₂的标签

Q3: MAC Security Analysis

Problem scheme: Tag(k, m) = (r, F(k, r) ⊕ CRC32(m))

Conclusion: Insecure

Attack method: After observing (r₁, t₁), compute t₂ = t₁ ⊕ CRC32(m₁) ⊕ CRC32(m₂) to forge a tag for m₂.

Q3.MAC伪造分析和扩展

q3 请分析一个 MAC 系统，其标签 Tag(k, m) 通过随机选择 r 并计算 t = F(k, r) ⊕ CRC32(m) 来生成标签 (r, t)，其中 F 是一个安全的 PRF，而 CRC32 是一个公开的校验函数。请判断这个 MAC 系统是否安全。如果安全，请简要解释；如果不安全，请描述在观察到一个或多个合法的消息-标签对后，如何为一个新消息伪造一个有效的标签。

Consider a MAC system where the tag for a message m is (r, t), generated by choosing a random r and computing t = F(k, r) ⊕ CRC32(m). Here, F is a secure PRF and CRC32 is a public checksum function. Is this MAC system secure? If yes, briefly explain why. If not, describe how an attacker can forge a tag for a new message after observing some valid message-tag pairs.

Answer: No.  
Attack:  
1. Query m₁ and get (r₁, t₁), where t₁ = F(k, r₁) ⊕ CRC32(m₁)  
2. Forge m₂'s tag: reuse r₁, compute t₂ = F(k, r₁) ⊕ CRC32(m₂) = t₁ ⊕ CRC32(m₁) ⊕ CRC32(m₂)

❗ 延伸攻击说明：

“Or other attacks, e.g., for CRC32, it is easy to find different messages with the same code.”

该 MAC 不安全。

攻击者观察合法标签 (r₁, t₁) 后，可以如下伪造 m₂ 的标签：  
1. 已知 t₁ = F(k, r₁) ⊕ CRC32(m₁)，可推出 F(k, r₁) = t₁ ⊕ CRC32(m₁)  
2. 伪造 t₂ = F(k, r₁) ⊕ CRC32(m₂) = t₁ ⊕ CRC32(m₁) ⊕ CRC32(m₂)  
于是 (r₁, t₂) 就是 m₂ 的有效伪造标签。

CRC32 并非加密函数，而是为检测传输错误设计的校验码。它容易发生碰撞（不同消息拥有相同 CRC 值），因此构造伪造消息非常容易。

q3后续问题：What if I replace CRC32 with a well-designed hash function that can be considered ideal? (6 points)

如果我们将 CRC32 替换为一个设计良好的理想哈希函数，会如何？

（例如满足抗碰撞、不可逆等安全属性）

✅ 回答：Same as above.

即使使用理想哈希函数，攻击方式仍然成立：

Even with an ideal hash function h, the construction remains insecure:  
t = F(k, r) ⊕ h(m), attacker can still compute F(k, r) and forge new t′ = F(k, r) ⊕ h(m′) = t ⊕ h(m) ⊕ h(m′)

中文解释：即使用理想哈希函数替代 CRC32，该结构仍然不安全：  
攻击者仍可以从 t 和 h(m) 反推出 F(k, r)，再构造 h(m′)，计算 t′ = F(k, r) ⊕ h(m′) = t ⊕ h(m) ⊕ h(m′)

总结：知识点 考点	内容

PRF 与安全性	PRF 安全性无法阻止 XOR 合成结构的伪造

CRC32 弱点	可预测、无抗碰撞性、非加密

MAC 构造方式错误	Tag 不应该以 XOR(h(m)) 为基础构造

改进建议	应采用标准如 HMAC：`Tag = H(K

## 第九章.公钥密码学(非对称)（Public-Key Cryptography

##### **[w8]****第一部分：对称密钥密码学的“阿喀琉斯之踵”**

讲义以一个精彩的全局回顾图开始，然后直指对称加密体系的两个核心“硬伤”或注意事项（Caveats）。

回顾 (Recap):

1. 我们已经构建了一套强大的对称加密工具链，最终达到了 AE (认证加密)，它能同时提供机密性（防窃听）和完整性（防篡改），从而抵御强大的 CCA（选择密文攻击）。

1. AE 之所以重要，是因为 CCA 攻击在现实世界中是真实存在的威胁。例如，一个设计不当的服务器在收到篡改后的密文时，其不同的反应（如报错、转发给不同的人）可能会被攻击者利用，充当一个“解密预言机”。

核心局限性 (The Caveats):

1. 问题一：密钥分发 (Key Distribution)

1. 对称加密的前提是：发送方和接收方必须提前共享同一个秘密密钥。

1. 但这个前提本身就是一个巨大的挑战：在公开的网络上，Alice 如何才能安全地把这个密钥交给 Bob？如果他们在一个房间里，但周围都是人，又该怎么办？这个问题被称为密钥交换问题 (Key Exchange Problem)。

1. 问题二：密钥管理 (Key Management)

1. 在一个 N 人的网络中，如果每两个人之间都想进行私密通信，就需要为每一对用户都维护一个独立的密钥。

1. 总共需要的密钥数量是 N * (N-1) / 2，也就是 O(N²) 的级别。当网络规模变大时，密钥管理的复杂性会爆炸式增长，变得不切实际。

#### English Explanation

##### **Part 1: The Achilles' Heel of Symmetric Key Cryptography**

The lecture begins with a comprehensive recap, then directly addresses the two fundamental caveats or "hard problems" of the symmetric encryption ecosystem.

Recap:

- We have built a powerful toolchain for symmetric encryption, culminating in AE (Authenticated Encryption), which provides both confidentiality (prevents eavesdropping) and integrity (prevents tampering), thereby defending against powerful CCA (Chosen Ciphertext Attacks).

- AE is crucial because CCA is a real-world threat. For example, an improperly designed server might react differently to a tampered ciphertext (e.g., by returning an error or forwarding to a different user), which an attacker could exploit as a form of "decryption oracle."

The Core Limitations (Caveats):

- Problem 1: Key Distribution

- The prerequisite for symmetric encryption is that the sender and receiver must share the same secret key in advance.

- This prerequisite itself is a massive challenge: How can Alice securely give this key to Bob over a public network? What if they are in the same room but surrounded by other people? This is known as the Key Exchange Problem.

- Problem 2: Key Management

- In a network of N people, if every pair of individuals wants to communicate privately, a unique key must be maintained for each pair.

- The total number of keys required is N * (N-1) / 2, which is on the order of O(N²). As the network grows, the complexity of managing these keys becomes explosive and impractical.

##### **第二部分：第一个尝试——默克尔谜题 (Merkle Puzzles)**

这是历史上第一个解决密钥交换问题的方案，由公钥密码学先驱 Ralph Merkle 提出。它虽然有缺陷，但其核心思想极具启发性。

核心思想：创造计算上的不对称性 (Asymmetry of Difficulty)

1. 既然通信信道是公开的，唯一的希望在于利用双方各自拥有的本地随机性。

1. 我们能否创造一种“谜题”，使得：

1. 对于合法的参与者（Alice, Bob）来说，解决这个谜题很容易。

1. 对于窃听者（Eve）来说，解决这个谜题非常困难。

Merkle Puzzle 协议流程:

1. Alice (准备谜题): Alice 生成大量的（比如 N=200万个）谜题。每个谜题包含一个唯一的 idᵢ 和一个临时的短密钥 kᵢ。她用一个中等难度的加密方式（例如，用一个20位的密钥）将 (idᵢ || kᵢ) 加密，然后将这200万个加密后的谜题全部发送给 Bob。

1. Bob (解决谜题): Bob 随机挑选一个谜题，然后进行暴力破解。因为谜题只是中等难度（比如破解一个需要10秒），Bob 可以很快解开它，从而得到 idᵣ 和 kᵣ。然后，Bob 将 idᵣ 公开地发送给 Alice。

1. 密钥确立: Alice 收到 idᵣ 后，在自己的表格里一查，就知道 Bob 选中的是哪个谜题，从而也知道了对应的密钥 kᵣ。此时，kᵣ 就成了他们共享的秘密密钥。

安全性分析:

1. 对 Bob: 只需要解一个谜题，耗时 O(1)（例如10秒）。

1. 对 Eve: Eve 不知道 Bob 选了哪个谜题。为了找到 kᵣ，她必须破解所有谜题，直到找到那个 id 为 idᵣ 的谜题。平均来说，她需要破解 N/2 个谜题，总耗时是 O(N)（例如，100万 * 10秒 ≈ 115天）。

1. 结论:Merkle Puzzle 成功地在“好人”和“坏人”之间创造了一个线性的计算差距 (O(1) vs O(N))。

局限性与启发:

1. 局限性:

1. 这个计算差距只是多项式级别的，不够大。

1. 对于专门为解谜而设计的硬件（ASIC），这个差距可能会被大大缩小。

1. 安全性不够强，攻击成功的概率不是密码学意义上的“可忽略”。

1. 启发: “中等难度谜题”的思想在其他领域有广泛应用，如比特币的工作量证明 (Proof of Work) 和防止垃圾邮件。其核心都是要求合法用户付出一点点（但非零）的代价，从而让恶意攻击者的成本急剧增加。

##### **Part 2: The First Attempt - Merkle Puzzles**

This is the first historical solution to the key exchange problem, proposed by public-key pioneer Ralph Merkle. While flawed, its core idea is incredibly insightful.

Core Idea: Creating Computational Asymmetry

- Since the communication channel is public, the only hope lies in leveraging the local randomness that each party possesses.

- Can we create a "puzzle" such that:

- It's easy for the legitimate parties (Alice, Bob) to solve.

- It's very difficult for the eavesdropper (Eve) to solve.

The Merkle Puzzle Protocol

1. Alice (Puzzle Preparation): Alice generates a large number (N=2 million, for instance) of puzzles. Each puzzle contains a unique idᵢ and a temporary short key kᵢ. She encrypts each (idᵢ || kᵢ) with a moderately hard cipher (e.g., using a 20-bit key) and sends all 2 million encrypted puzzles to Bob.

1. Bob (Puzzle Solving): Bob randomly picks one puzzle and brute-forces it. Since it's only moderately hard (e.g., takes 10 seconds to crack), he can quickly solve it to get idᵣ and kᵣ. He then sends the idᵣ back to Alice in the clear.

1. Key Establishment: When Alice receives idᵣ, she looks it up in her table to find the corresponding key kᵣ. Now, kᵣ has become their shared secret key.

Security Analysis:

- For Bob: He only needs to solve one puzzle, taking O(1) time (e.g., 10 seconds).

- For Eve: She doesn't know which puzzle Bob chose. To find kᵣ, she must crack puzzles until she finds the one with the matching idᵣ. On average, she needs to crack N/2 puzzles, taking O(N) time (e.g., 1 million * 10 seconds ≈ 115 days).

- Conclusion: Merkle Puzzles successfully create a linear computational gap (O(1) vs. O(N)) between the "good guys" and the "bad guys."

Limitations and Insights:

- Limitations:

1. The computational gap is only polynomial, which is not large enough.

1. Specialized hardware (ASICs) could significantly reduce this gap.

1. The security is not "negligible" in the cryptographic sense.

- Insights: The idea of "moderately hard puzzles" has broad applications, such as in Bitcoin's Proof of Work and spam prevention. The core concept is to require a small but non-zero cost for legitimate users, thereby dramatically increasing the cost for malicious actors.

##### **第三部分：现代解决方案——迪菲-赫尔曼密钥交换 (Diffie-Hellman Key Exchange)**

为了克服 Merkle Puzzle 的局限性，我们需要一个能创造指数级计算差距的方案。Diffie 和 Hellman 基于数论中的难题，提出了革命性的解决方案。

数学基础:

1. 该协议在一个大的素数 p 的模乘法群 ℤₚ* 上进行。

1. 它依赖于离散对数问题 (Discrete Logarithm Problem, DLP) 的困难性：给定 g 和 gᵃ mod p，很难计算出 a。

1. 更具体地，其安全性依赖于 DDH 假设 (Decisional Diffie-Hellman Assumption)：给定 g, gᵃ, gᵇ，很难区分 g^(ab) 和一个随机的群元素 g^c。

Diffie-Hellman (DH) 协议流程:

1. 公开参数: Alice 和 Bob 事先约定好一个大素数 p 和一个生成元 g。这些都是公开的。

1. Alice: 选择一个秘密的随机数 a，计算 A = gᵃ mod p，然后将 A 发送给 Bob。

1. Bob: 选择一个秘密的随机数 b，计算 B = gᵇ mod p，然后将 B 发送给 Alice。

1. 密钥生成:

1. Alice 收到 B 后，计算 Kₐ = Bᵃ mod p = (gᵇ)ᵃ mod p = g^(ab) mod p。

1. Bob 收到 A 后，计算 Kᵦ = Aᵇ mod p = (gᵃ)ᵇ mod p = g^(ab) mod p。

1. 正确性: Kₐ = Kᵦ，双方得到了完全相同的共享秘密。

安全性分析:

1. 窃听者 Eve 能看到 p, g, A=gᵃ, B=gᵇ。

1. 为了计算出共享密钥 g^(ab)，她需要从 gᵃ 中解出 a（离散对数难题），这在计算上是不可行的。

1. DH 协议在“好人”（做两次模幂运算）和“坏人”（解离散对数）之间创造了一个指数级的计算差距

实际应用:

1. DH 协议本身生成的 g^(ab) 是一个群元素，通常不直接用作密钥。标准做法是将其输入一个哈希函数：k = H(g^(ab))，得到一个标准格式的对称密钥 k。

1. 这是 HTTPS (TLS/SSL) 协议中建立安全连接的核心基础。

1. 为了更高的效率和安全性，现代系统更多地使用基于椭圆曲线 (Elliptic Curve Cryptography, ECC) 的 DH 变体。

##### **Part 3: The Modern Solution - Diffie-Hellman Key Exchange**

To overcome the limitations of Merkle Puzzles, a scheme that creates an exponential computational gap was needed. Diffie and Hellman proposed a revolutionary solution based on a hard problem in number theory.

Mathematical Foundation:

- The protocol operates in the multiplicative group of integers modulo a large prime p, denoted ℤₚ*.

- It relies on the difficulty of the Discrete Logarithm Problem (DLP): given g and gᵃ mod p, it is computationally infeasible to find a.

- More specifically, its security rests on the Decisional Diffie-Hellman (DDH) Assumption: given g, gᵃ, gᵇ, it is hard to distinguish g^(ab) from a random group element g^c.

The Diffie-Hellman (DH) Protocol:

1. Public Parameters: Alice and Bob agree on a large prime p and a generator g. These are public.

1. Alice: Chooses a secret random number a, computes A = gᵃ mod p, and sends A to Bob.

1. Bob: Chooses a secret random number b, computes B = gᵇ mod p, and sends B to Alice.

1. Key Generation:

- Alice receives B and computes Kₐ = Bᵃ mod p = (gᵇ)ᵃ mod p = g^(ab) mod p.

- Bob receives A and computes Kᵦ = Aᵇ mod p = (gᵃ)ᵇ mod p = g^(ab) mod p.

- Correctness: Kₐ = Kᵦ, so both parties arrive at the exact same shared secret.

Security Analysis:

- An eavesdropper Eve sees p, g, A=gᵃ, B=gᵇ.

- To compute the shared secret g^(ab), she would need to solve the discrete logarithm problem to find a from gᵃ, which is computationally infeasible.

- The DH protocol creates an exponential computational gap between the "good guys" (who perform two modular exponentiations) and the "bad guys" (who must solve the DLP).

Practical Application:

- The raw output g^(ab) is a group element and is not typically used directly as a key. The standard practice is to feed it into a hash function: k = H(g^(ab)), to derive a standard-format symmetric key k.

- This is the fundamental basis for establishing secure connections in HTTPS (TLS/SSL).

- For better efficiency and security, modern systems often use a variant of DH based on Elliptic Curve Cryptography (ECC).

##### **第四部分：总结——非对称密码学的诞生**

- 讲义的最后回顾点明了本讲的核心：我们为了解决对称加密的密钥交换问题，被迫去寻找一种方法，能在“好人”和“坏人”之间创造出计算能力上的不对称性。

- 这种不对称性的发现，打开了**非对称密钥密码学（或公钥密码学）**的大门。

- 虽然 DH 协议解决了两个陌生人之间的密钥交换问题，但它没有解决 O(N²) 的密钥管理问题。这个问题将由公钥密码学的另一个分支——公钥加密和数字签名来解决。

##### **Part 4: Conclusion - The Birth of Asymmetric Cryptography**

- The final recap highlights the core takeaway of the lecture: to solve the key exchange problem of symmetric cryptography, we were forced to find a method that creates an asymmetry in computational difficulty between legitimate users and adversaries.

- The discovery of this asymmetry opened the door to asymmetric-key cryptography (also known as public-key cryptography).

- While the DH protocol solves the key exchange problem for two strangers, it does not solve the O(N²) key management problem. That issue will be addressed by another branch of public-key cryptography: public-key encryption and digital signatures.

#### [w9]**第一部分：从密钥交换到公钥加密的思维飞跃**

讲义的开头部分，从回顾对称加密的两个根本问题，引出了一个革命性的新思路。

回顾：对称加密的局限性

1. 密钥交换问题：如何在公开信道上让两个陌生人安全地约定一个共享密钥？（我们用 Diffie-Hellman 解决了这个问题）

1. 密钥管理问题：如果一个人有 n 个联系人，他需要维护 O(n) 个不同的密钥。这在现实中非常麻烦。

理想情境与思维飞跃

1. 讲义提出了一个直击痛点的问题：“我们是否可以只为自己存储一把密钥？”

1. 这个设想意味着，Alice 只需要保管好自己的密钥 kₐ。当她想给 Bob 或 Chris 发消息时，她使用的加密方式应该只与 Bob 的密钥 k_b 或 Chris 的密钥 k_c 有关。

1. 这就导向了一个关键要求：必须存在一个单向的过程。Alice 可以利用与 Bob 相关的一些公开信息 f(k_b) 来加密，但任何人都不能从这个公开信息中反推出 Bob 的秘密 k_b。

1. 这彻底颠覆了对称加密的模式，引出了公钥加密的语法。

##### **Part 1: The Leap in Thinking from Key Exchange to Public-Key Encryption**

The lecture begins by revisiting the fundamental problems of symmetric cryptography to motivate a revolutionary new idea.

Recap: Limitations of Symmetric Cryptography

- Key Exchange Problem: How can two strangers securely agree on a shared key over a public channel? (We solved this with Diffie-Hellman).

- Key Management Problem: If a person has n contacts, they need to maintain O(n) different keys, which is cumbersome in reality.

The Ideal Scenario and the Leap in Thought

- The lecture poses a crucial question: "Can we store only one key just for oneself?"

- This vision implies that Alice only needs to safeguard her own key, kₐ. When she wants to send a message to Bob or Chris, the encryption method she uses should be related only to Bob's key k_b or Chris's key k_c.

- This leads to a key requirement: there must be a one-way process. Alice can use some public information related to Bob, f(k_b), to encrypt, but no one can reverse-engineer Bob's secret k_b from this public information.

- This completely subverts the symmetric encryption model and introduces the syntax of Public-Key Encryption.

##### **第二部分：公钥加密（PKE）的定义与安全**

PKE 的语法 (Syntax)

1. 密钥生成 KeyGen(1^λ): 生成一个密钥对 (sk, pk)。

1. pk (Public Key): 公钥，可以发布给全世界，任何人都能看到。

1. sk (Secret Key): 私钥，必须由用户自己严格保密。

1. 加密 Enc(pk, m): 使用接收方的公钥 pk 来加密消息 m，得到密文 c。

1. 解密 Dec(sk, c): 使用自己的私钥 sk 来解密密文 c，得到原始消息 m。

1. 核心不对称性: 加密用的密钥 (pk) 和解密用的密钥 (sk) 是不同的。这是公钥加密与对称加密最根本的区别。

PKE 的 IND-CPA 安全性

1. PKE 的安全标准同样是 IND-CPA（选择明文攻击下的不可区分性），但其攻击模型与对称加密有所不同。

1. 攻击者的能力更强:

1. 攻击者永远可以看到接收方的公钥 pk。

1. 攻击者不再需要加密预言机。因为他拥有公钥，他可以自己加密任何他想加密的消息。

1. 安全游戏: 攻击者拿到公钥 pk 和一个挑战密文 c_b = Enc(pk, m_b)，他需要猜出 b。如果对于任何攻击者，其猜对的优势都是可忽略的，那么该 PKE 方案就是 IND-CPA 安全的。

1. 重要推论:

1. PKE 必须是随机化的: 为了达到 IND-CPA 安全，每次用同一个公钥加密同一个消息，都必须产生不同的密文。否则攻击者可以自己加密 m₀ 和 m₁，然后与挑战密文比较，从而轻松获胜。

1. 教科书式 RSA 不安全: 这也解释了为什么未经填充的、确定性的“教科书式 RSA”是不安全的，而必须使用如 RSA-OAEP 这样的随机化填充方案。

##### **Part 2: Definition and Security of Public-Key Encryption (PKE)**

Syntax of PKE

- Key Generation KeyGen(1^λ): Generates a key pair (sk, pk).

- pk (Public Key): Published to the world for anyone to see.

- sk (Secret Key): Kept strictly secret by the user.

- Encryption Enc(pk, m): Uses the recipient's public key pk to encrypt a message m, resulting in ciphertext c.

- Decryption Dec(sk, c): Uses one's own secret key sk to decrypt the ciphertext c, recovering the original message m.

- The Core Asymmetry: The key used for encryption (pk) and the key used for decryption (sk) are different. This is the most fundamental distinction between public-key and symmetric-key cryptography.

IND-CPA Security for PKE

- The security standard for PKE is also IND-CPA (Indistinguishability under Chosen-Plaintext Attack), but the attack model differs from that of symmetric encryption.

- The Adversary is Stronger:

1. The adversary always has access to the recipient's public key pk.

1. The adversary no longer needs an encryption oracle. With the public key, they can encrypt any message they want by themselves.

- The Security Game: The adversary is given the public key pk and a challenge ciphertext c_b = Enc(pk, m_b), and must guess b. If the advantage of any adversary in guessing correctly is negligible, the PKE scheme is IND-CPA secure.

- Important Corollaries:

- PKE must be randomized: To achieve IND-CPA security, encrypting the same message with the same public key multiple times must produce different ciphertexts. Otherwise, an attacker could simply encrypt m₀ and m₁ themselves and compare the results to the challenge ciphertext to win easily.

- Textbook RSA is insecure: This explains why unpadded, deterministic "textbook RSA" is insecure and why randomized padding schemes like RSA-OAEP are necessary.

##### **第三部分：公钥加密的强大应用**

PKE 的公钥/私钥结构带来了许多对称加密无法比拟的优势。

无需预共享密钥的保密通信: Alice 只要从公共目录（比如 Bob 的网站）获取 Bob 的公钥，就可以立即向他发送加密消息。这直接解决了密钥交换问题。

高效的多人加密文件共享（混合加密）:

1. 这是一个非常经典和实用的应用场景，通常称为混合加密 (Hybrid Encryption)。

1. 目标: 将一个大文件 m 加密后共享给 n 个接收者。

1. 方法:

1. 生成一个临时的、一次性的对称密钥 k。

1. 用这个对称密钥 k 加密大文件 m，得到密文 C = Sym.Enc(k, m)。

1. 用每个接收者的公钥 pkᵢ 分别加密这个对称密钥 k，得到 cᵢ = PKE.Enc(pkᵢ, k)。

1. 最终广播的数据是：(C, c₁, c₂, ..., cₙ)。

1. 优势: 大文件 m 只需要被对称加密一次。相比于为每个接收者都用对称加密发送一遍大文件，这种方式极大地节省了发送方的带宽。

密钥托管 (Key Escrow): 组织可以要求员工将数据的解密密钥用一个“主公钥”加密后备份。当员工离职或发生意外时，持有主私钥的授权方可以恢复数据。

##### **Part 3: The Powerful Applications of PKE**

The public/private key structure of PKE offers many advantages over symmetric encryption.

Confidential Communication without Pre-shared Keys: Alice can simply fetch Bob's public key from a public directory (like his website) and immediately send him an encrypted message. This directly solves the key exchange problem.

Efficient Encrypted File Sharing with Multiple Recipients (Hybrid Encryption):

- This is a classic and highly practical application, often called Hybrid Encryption.

- Goal: Encrypt a large file m and share it with n recipients.

- Method:

1. Generate a temporary, one-time symmetric key k.

1. Use this symmetric key k to encrypt the large file m, yielding ciphertext C = Sym.Enc(k, m).

1. For each recipient, encrypt the symmetric key k with their respective public key pkᵢ, yielding cᵢ = PKE.Enc(pkᵢ, k).

1. The data broadcast to everyone is (C, c₁, c₂, ..., cₙ).

- Advantage: The large file m only needs to be encrypted once. This saves enormous sender bandwidth compared to sending a separately encrypted large file to each recipient.

Key Escrow: An organization can require employees to back up data by encrypting the decryption key with a "master public key." If an employee is unavailable, an authorized party holding the master private key can recover the data.

##### **第四部分：具体构造——ElGamal 加密方案**

ElGamal 加密方案是一个非常优雅的构造，它巧妙地将 Diffie-Hellman 密钥交换的思想“包装”成了一个公钥加密方案。

思想联系:

1. 在 DH 密钥交换中，双方交换 gᵃ 和 gᵇ 来共同计算出一个共享秘密 g^(ab)。

1. 在 ElGamal 中，可以看作是接收方 Bob 先把他的“一半” gᵇ 作为公钥发布出去。

ElGamal 协议流程:

1. 密钥生成 KeyGen:

1. Bob 选择一个秘密的随机数 b 作为私钥 sk。

1. Bob 计算 pk = gᵇ 作为公钥 pk 并发布。

1. 加密 Enc(pk, m):

1. Alice 想要给 Bob 发送消息 m。她获取了 Bob 的公钥 pk = gᵇ。

1. Alice 生成一个临时的、一次性的随机数 a。

1. 她计算出共享秘密 K = (pk)ᵃ = (gᵇ)ᵃ = g^(ab)。

1. 她将消息加密：c₂ = H(K) ⊕ m。

1. 她还需要把计算共享秘密的“另一半” c₁ = gᵃ 发送给 Bob。

1. 最终的密文是 (c₁, c₂)。

1. 解密 Dec((c₁, c₂), sk):

1. Bob 收到密文 (c₁, c₂)。他拥有自己的私钥 sk = b。

1. 他用 c₁ 和自己的私钥计算出共享秘密：K = (c₁)ᵇ = (gᵃ)ᵇ = g^(ab)。

1. 他用这个 K 解密消息：m = H(K) ⊕ c₂。

安全性: ElGamal 的 IND-CPA 安全性直接依赖于底层的 DDH (Decisional Diffie-Hellman) 假设是困难的。

##### **Part 4: A Concrete Construction - The ElGamal Encryption Scheme**

The ElGamal scheme is an elegant construction that cleverly "packages" the Diffie-Hellman key exchange idea into a public-key encryption scheme.

Conceptual Link:

- In a DH key exchange, two parties exchange gᵃ and gᵇ to jointly compute a shared secret g^(ab).

- In ElGamal, you can think of the recipient, Bob, as having already published his "half" of the exchange, gᵇ, as his public key.

The ElGamal Protocol:

- Key Generation KeyGen:

- Bob chooses a secret random number b as his secret key sk.

- Bob computes pk = gᵇ as his public key pk and publishes it.

- Encryption Enc(pk, m):

- Alice wants to send message m to Bob. She obtains his public key pk = gᵇ.

- Alice generates a temporary, one-time random number a.

- She computes the shared secret K = (pk)ᵃ = (gᵇ)ᵃ = g^(ab).

- She encrypts the message: c₂ = H(K) ⊕ m.

- She also needs to send the "other half" for computing the secret, which is c₁ = gᵃ.

- The final ciphertext is the pair (c₁, c₂).

- Decryption Dec((c₁, c₂), sk):

- Bob receives the ciphertext (c₁, c₂). He has his secret key sk = b.

- He uses c₁ and his secret key to compute the shared secret: K = (c₁)ᵇ = (gᵃ)ᵇ = g^(ab).

- He uses this K to decrypt the message: m = H(K) ⊕ c₂.

Security: The IND-CPA security of ElGamal relies directly on the underlying DDH (Decisional Diffie-Hellman) assumption being hard.

##### **第五部分：总结与展望**

- 讲义最后清晰地总结了从对称加密的问题到 PKE 解决方案的演进路径，并强调了 ElGamal 是如何模仿 DH 密钥交换的应用来实现 PKE 的。

- PKE → IBE → ABE → FE → WE → Obfuscation 这条路径展示了密码学从公钥加密出发，正在走向功能更强大、更细粒度的加密形式，如基于身份的加密（IBE）、基于属性的加密（ABE）等。

##### **Part 5: Summary and Outlook**

- The lecture concludes by clearly summarizing the evolutionary path from the problems of symmetric crypto to the solution of PKE, emphasizing how ElGamal mimics the application of DH key exchange to achieve PKE.

- The path PKE → IBE → ABE → FE → WE → Obfuscation shows that cryptography is moving from PKE towards even more powerful and fine-grained forms of encryption, such as Identity-Based Encryption (IBE), Attribute-Based Encryption (ABE), and beyond.

迪菲-赫尔曼交换

基于离散对数难度

易受中间人攻击

Diffie–Hellman Key Exchange

Based on the hardness of discrete logarithms

Vulnerable to man-in-the-middle attacks

#### h2-Q4: Diffie-Hellman安全性

a) 小密钥空间问题：

- 私钥从{1,...,500}选择 → 不安全

- 攻击者可暴力枚举500个可能值

b) 中间人攻击与密钥确认：

- 仅检查密钥是否相同不足以防御MITM

- 攻击者可让双方得到相同但已知的密钥（如k=1）

顶尖加密

语法：(KeyGen, Enc, Dec)

ElGamal加密方案

RSA加密（需要随机化）

Q4: Diffie–Hellman Security

a) Small key-space issue:

Private key chosen from {1,…,500} → insecure

Attacker can brute-force all 500 possible values

b) Man-in-the-middle and key confirmation:

Simply checking that keys match is insufficient to defend against MITM

Attacker can cause both parties to derive the same but known key (e.g., k=1)

Public-Key Encryption

Syntax: (KeyGen, Enc, Dec)

ElGamal encryption scheme

RSA encryption (requires randomization)

Q4 Diffie-Hellman 协议的安全性分析：小密钥空间与中间人攻击

设大素数 p，Alice 和 Bob 分别从 {1,...,500} 中选择随机数 x, y，

然后发送 g^x mod p 与 g^y mod p 继续协议。

工程角度的好处是：避免了大指数模运算，因为 g^x 与 g^y 可能本身就小于 p。

1. 问题：这种 Diffie-Hellman 协议是安全的吗？（只考虑窃听者，不考虑主动攻击）请简要解释。

Large prime number p, Alice and Bob each choose a random number x, y respectively, from {1, ..., 500},

and then continue the protocol by sending out g^x mod p, g^y mod p respectively.

One benefit in the engineer’s mind is that this may avoid heavy modular exponentiation, since g^x, g^y may not be larger than p.

1. Is this a secure version of the Diffie-Hellman protocol? (Only consider eavesdropping attackers, not active attacks.) Please briefly explain.

❌ No. Each to brute force 500 possible x or y, then get to know the exchanged key.

不。每个人都要强行破解 500 个可能的 x 或 y，然后才能知道交换的密钥。

不安全。

由于 x, y ∈ [1, 500] 范围非常小，攻击者可以通过暴力枚举 500 个可能的 x 或 y，推导出共享密钥 g^(xy) mod p。

本质问题：私钥空间太小，不具备足够熵。相关知识点：

Diffie-Hellman 安全性依赖于私钥空间足够大

如果私钥来自小范围，攻击者可穷举所有可能

即使只窃听，也可破坏协议机密性

b.(b) [6 points]请分析一个增强版 Diffie-Hellman 协议的安全性。为抵御经典的中间人攻击（即攻击者分别与 Alice 和 Bob 建立不同密钥），协议增加了一个最终步骤：Alice 和 Bob 通过一个安全信道（如面对面）来确认他们生成的密钥是否完全一致。问题是，这个新增的密钥确认步骤是否足以防御所有可能的中间人攻击？如果能，请简要解释；如果不能，请给出一个具体的攻击场景作为反例。

Consider an enhanced Diffie-Hellman protocol designed to thwart the classic man-in-the-middle (MITM) attack. In this version, after the key exchange is complete, Alice and Bob perform a final verification step over a secure channel (e.g., face-to-face) to confirm that their computed keys are identical. The question is: Is this key confirmation upgrade sufficient to prevent all possible man-in-the-middle attacks in general? If yes, briefly explain why. If not, provide a specific example of an attack that would still succeed.

❌ No. MITM attacker can make k₁ = k₂ but still know the key.

不可以。MITM 攻击者可以使 k₁ = k₂ 但仍然知道密钥。

例子：Alice 发送 g^r1 给 Eve，Eve 发回 g^0 给 Bob

Bob 发送 g^r2 给 Eve，Eve 再发回 g^0 给 Alice

则 Alice 与 Bob 都算出密钥为 g^0 = 1，即 k₁ = k₂ = 1，但 Eve 知道该密钥

不安全。

中间人 Eve 可以让双方都得到相同的密钥，但该密钥已知于攻击者。

即便 Alice 和 Bob 检查“密钥是否相同”，仍不能阻止攻击者掌控该密钥

#### h2-Q2: 大文件加密传输问题

场景：5GB视频文件的安全云存储，接收方离线

推荐方案：

1. 混合加密：用Johnson的公钥加密对称密钥，用对称密钥加密视频

1. 直接公钥加密：效率极低，不推荐

1. 密钥交换协议：如Diffie-Hellman建立共享密钥

Q2: Large-File Encryption Transfer Problem

Scenario: secure cloud storage of a 5 GB video file; receiver is offline

Recommended approaches:

Hybrid encryption: use Johnson’s public key to encrypt a symmetric key, then encrypt the video with the symmetric key

Direct public-key encryption: extremely inefficient, not recommended

Key-exchange protocol: e.g., Diffie–Hellman to establish a shared key

Q2: 离线接收方的大文件加密传输问题

在这个密码学应用场景中，你录制了一段5GB的生日视频并计划上传至云端，且只希望你的朋友Johnson能观看。然而，Johnson正在旅行，未来两周都无法联系，而你本人也即将在下周前往无网络地区，唯一能利用的是他网站上公开的公钥信息。你的任务是利用课程中学到的加密工具，设计至少两种不同的加密机制来处理这个视频文件。对于每种方案，你需要详细说明如何加密大视频、如何利用Johnson的公钥确保其能独立解密，以及最终需要上传哪些内容。此外，你还必须对这两种方案进行比较分析，阐述各自的优缺点，并探讨它们在安全性与效率之间的权衡。

In this cryptographic application scenario, you have recorded a 5GB birthday video that you plan to upload to the cloud for only your friend Johnson to view. However, Johnson is currently traveling and will be unreachable for the next two weeks, while you are about to leave for a location without internet access in one week. The only resource at your disposal is the public key information available on his personal website. Your task is to leverage the cryptographic tools you've studied to design at least two distinct mechanisms for encrypting this video file. For each proposed method, you must detail how to handle the encryption of the large video, how to utilize Johnson's public key to ensure he can decrypt it independently later, and what content needs to be uploaded. Additionally, you are required to provide a comparative analysis of these methods, discussing their respective pros and cons, and examining the tradeoff between security and efficiency.

i混合加密：随机生成一个对称密钥 k，将其用 Johnson 的公钥加密为 Enc(pk, k)，

然后用 k 对视频数据加密为 Enc(k, data)

优点：高效；所需时间和存储空间较小

直接使用 Johnson 的公钥加密整个视频

缺点：非常慢；加密后密文体积非常大

hybrid encryption, random sample a secret key k, send Enc(pk, k), Enc(k, data)  
pros: efficient, same time and space

use Johnson’s pk to encrypt the whole video.  
cons: slow; ciphertext size is large

PKE-enabled key exchange, or Diffie-Hellman related key exchange to get a shared key,  
then derive a symmetric key for data encryption.对称加密 (AES) + 公钥加密 (RSA) + 数字签名

#### ✅ 原始参考答案摘要与扩展

1. 数据量大 (Large Data Volume)

1. 单向通信 (One-way Communication)

1. 密钥分发 (Key Distribution)

1. 安全性需求 (Security Needs)

- ✅ 方案一：Hybrid Encryption（混合加密方案）

方法：随机生成一个对称密钥 k，使用公钥加密 Johnson 的 Enc(pk, k)，再用该密钥加密视频内容：Enc(k, data)

优点：高效，速度快，占用空间小

缺点：需要 Johnson 的公钥，并依赖密钥管理正确

🧠 原理知识点：混合加密广泛用于加密大数据：对称加密处理内容，非对称加密处理密钥（如 TLS、PGP），对称加密适合加密 5GB 视频，非对称加密只加密小的随机密钥

Definition: Hybrid encryption combines asymmetric and symmetric primitives.  
1。 Generate a random symmetric key k;  
2。 Encrypt k with the receiver’s public key Enc(pk, k);  
3。 Encrypt the (large) payload with k: Enc(k, data

Why bother? Public-key crypto safely handles only a few hundred bytes at a time; a 5 GB video demands the throughput of symmetric ciphers.

Pros: Fast, space-efficient; inherits easy key distribution from PKI and speed from symmetric ciphers.

Cons: ① Requires the receiver’s authentic public key (PKI trust); ② Private-key & RNG hygiene are still critical.

Real-world examples: TLS negotiates a shared key via RSA/ECDH, then switches to AES/ChaCha20; PGP stores the session key in an encrypted “Session Key Packet”.

✅ 方案二：Use Johnson’s Public Key to Encrypt Entire Video

方法：用 Johnson 的公钥直接加密整个视频

优点：不需要额外管理密钥，安全性直接依赖公钥

缺点：慢，密文大，非对称加密不适合大文件

🧠 原理知识点：公钥加密（如 RSA）适合小文件，加密大文件性能差

文件过大会导致内存瓶颈及密文体积增长

Method

Encrypt the entire 5 GB video in one go with Johnson’s public key using an asymmetric algorithm (e.g., RSA).

Pros

No extra key management: You don’t need to generate or protect a separate session key; all security relies on Johnson’s verified public key.

Cons

Very slow: Public-key ciphers process only a few hundred bytes per block and run an expensive modular-exponentiation (or EC scalar-mult) each time. Encrypting 5 GB would take hours.

Ciphertext bloat: Each plaintext block (≤ ~245 B with RSA-2048) becomes a 256-byte ciphertext. The overall size grows by at least 8 % and rises with larger key sizes.

Memory / I-O pressure: Without careful streaming, the program must repeatedly split, buffer, or even load the whole file, consuming lots of RAM and causing heavy disk I/O.

Key principle

Public-key encryption is optimized for securing small, random secrets (like session keys), while symmetric ciphers deliver the speed needed for bulk data.

Therefore, encrypting large files directly with a public key is inefficient and leads to ciphertext expansion and resource overhead.

✅ 方案三：PKE-based Key Exchange + Symmetric Encryption

方法：使用 PKE（公钥加密）或 Diffie-Hellman 类方案建立共享密钥，再用该密钥加密视频

优点：安全且灵活，可兼容非同步通信场景

缺点：双方需要预知机制或参数共享方式

🧠 原理知识点：Diffie-Hellman 可用于提前协商密钥

类似 HTTPS/TLS 的密钥协商阶段

✅ 总结知识点（中英对照）

概念	中文解释	英文解释

Hybrid Encryption，混合加密，结合对称和非对称，Combines symmetric and asymmetric encryption

Key Encapsulation	，密钥封装，用公钥加密对称密钥，Encrypting the symmetric key using PKE

Diffie-Hellman，DH 密钥协商，先协商密钥再加密	，Key exchange to derive symmetric key

#### h2-Q9: 校园通信系统设计

混合方案：

- PKE交换对称密钥

- 认证加密保护消息内容

Q9: Campus Communication System Design

Hybrid approach:

PKE to exchange a symmetric key

Authenticated encryption to protect message contents

--Q9.  对称密钥与公钥的结合使用（PKE + AE）

Suppose you are in charge of designing and deploying a campus secure communication system within USYD:

whoever is affiliated with USYD will have a public key and secret key pair.

Briefly describe the steps when student A wants to send an encrypted message to student B gossiping about the lecturer.

We care about both confidentiality and integrity (only the two students know the message).

Suppose the university public key pkU is available to everybody.

假设你负责设计和部署 USYD 校园内部的安全通信系统。

所有 USYD 成员都有一对公钥和私钥。

简要描述一下当学生 A 想向学生 B 发送一条加密消息（内容是讨论老师八卦）时，所需的步骤。

我们关注两个目标：消息的保密性与完整性（即只有 A 和 B 知道消息内容）。

假设大学的公钥 pkU 是公开可查的。

1. use PKE to do the key exchange, use AE to protect confidentiality and integrity of message

A sends B: PKE.Enc(pk_b, k1), AE.Enc(k1, m1)

B sends A: PKE.Enc(pk_a, k2), AE.Enc(k2, m2)

You can also use signature to assist DH key exchange, then derive symmetric key and use AE to protect the confidentiality and integrity of message

1. 使用 PKE 进行密钥交换，使用 AE 保护消息的机密性和完整性。

A 发送 B：PKE.Enc(pk_b, k1), AE.Enc(k1, m1)

B 发送 A：PKE.Enc(pk_a, k2), AE.Enc(k2, m2)

您也可以使用签名辅助 DH 密钥交换，然后派生对称密钥并使用 AE 保护消息的机密性和完整性。

🔍 中英文解释：

🔹 English Explanation:

1. Use PKE (public key encryption) to exchange a symmetric key.

1. Use AE (authenticated encryption) for actual message encryption, ensuring both confidentiality and integrity.

1. A sends: PKE.Enc(pk_b, k1) – encrypt session key k1 with B’s public key

1. B replies similarly. AE.Enc(k1, m1) – use k1 to encrypt the actual message

1. Optionally, you can use digital signatures during the key exchange to authenticate who is sending, and then derive the key for secure AE encryption.

🔸 中文解释：

1. 使用公钥加密（PKE）来进行密钥交换。  
2. 使用认证加密（AE）来保护消息的机密性和完整性。  
3. A 发送给 B：PKE.Enc(pk_b, k1)，AE.Enc(k1, m1)  
4. B 回复 A：PKE.Enc(pk_a, k2)，AE.Enc(k2, m2)  
5. 可选：使用数字签名辅助 DH 密钥交换，再导出对称密钥用于认证加密。

#### h2-Q10: 组密钥交换协议

两轮协议设计：

1. A₁生成密钥k，用各用户公钥加密分发

1. 其他用户解密获得共享密钥

随机数故障影响：

- 如果某用户的随机数固定为7，其密钥可预测

- 攻击者可尝试解密该用户的密文获取组密钥

Q10: Group Key-Exchange Protocol

Two-round protocol design:

A₁ generates key k and encrypts it under each user’s public key for distribution

Other users decrypt to obtain the shared key

Impact of randomness failures:

If a user’s randomness is fixed to 7, their key becomes predictable

An attacker can attempt to decrypt that user’s ciphertext to obtain the group key

问题描述基于全局加密的密钥分发协议，“使用各用户密钥加密”明确表示使用密钥加密，这是客户端密码学中枢管理和分发的典型应用， 虽然涉及多用户，但核心技术仍是核心加密

The problem description is based on a global key-distribution protocol. “Encrypting with each user’s key” clearly indicates key-based encryption, a typical client-side cryptographic key-management and distribution application. Although it involves multiple users, the core technology remains basic encryption.

#### 1. 核心目标的比较--------------------

| 问题 | 核心目标 |
| --- | --- |
| 门限密钥分发 (Threshold Key Distribution) | - 将密钥分为多个份额，确保只有满足门限的代理（如 2-out-of-3）能够重建密钥。<br>- 在保证保密性的同时，实现密钥的安全分布和重建。 |
| 组密钥交换协议 (Group Key Exchange) | - 在多用户组中分发共享密钥 k，用于后续的安全通信。<br>- 通过加密和解密过程，每个用户能够安全获取共享密钥，同时防止攻击者预测或篡改密钥分布。 |

1.Comparison of Core Objectives

Question | Core Objective

Threshold Key Distribution

Split a key into multiple shares so that only a threshold of proxies (e.g. 2-out-of-3) can reconstruct the key.

Securely distribute and reconstruct the key while preserving confidentiality.

Group Key Exchange

Distribute a shared key k among a group of users for subsequent secure communication.

Through encryption and decryption, each user securely obtains k while preventing attackers from predicting or tampering with the distribution.

#### 2. 方法的比较------------------

##### 门限密钥分发

- 机制：

- 将密钥 mk 分成多个份额 S1,S2,S3​，并分发给多个代理。

- 通过 XOR 或更复杂的分片算法，确保：

- 任意 t个代理可以重建密钥。

- 少于 t个代理对密钥没有任何信息。

- 应用场景：

- 分布式密钥管理、冷启动恢复、核按钮等。

##### 组密钥交换协议

- 机制：

- 组内的一个用户（如 A1​）生成共享密钥 k。

- 通过其他用户的公钥加密 k，并将密文分发给每个用户。

- 每个用户解密密文后获得 k，实现安全的密钥分发。

- 应用场景：

- 安全通信、加密聊天、组间数据共享等。

2.Method Comparison

Threshold Key Distribution

Mechanism:

Split mk into shares S₁, S₂, S₃ and distribute to proxies.

Use XOR or more complex share algorithms to ensure:

Any t proxies can reconstruct mk.

Fewer than t proxies learn nothing.

Use cases: Distributed key management, cold-boot recovery, “nuclear button,” etc.

Group Key Exchange

Mechanism:

One member (e.g. A₁) generates the shared key k.

Encrypt k under each other user’s public key and distribute the ciphertexts.

Each user decrypts and obtains k.

Use cases: Secure messaging, encrypted group chat, cross-group data sharing, etc.

#### 3. 关系与联系------------------

##### 共同点

1. 目标一致性：

- 两者都旨在实现密钥的安全分发与共享，确保只有授权用户能够获取密钥。

1. 安全性要求：

- 都需要防止攻击者通过分析密钥分发过程获取密钥。

- 使用加密（如 XOR 或公钥加密）来保护密钥的安全性。

##### 差异点

1. 参与者的角色不同：

- 门限密钥分发：涉及多个代理和一个用户，用户通过代理的份额重建密钥。

- 组密钥交换协议：涉及多个用户，密钥由一个用户生成并分发到组内。

1. 分发方式不同：

- 门限密钥分发：基于数学分片（如 XOR、Shamir Secret Sharing）。

- 组密钥交换协议：基于加密算法（如 RSA、ECC）分发密钥。

1. 安全威胁不同：

- 门限密钥分发：需要防止单个代理泄露密钥份额。

- 组密钥交换协议：需要防止随机数故障导致密钥可预测。

3.Relationship and Links

Commonalities

1.Same goal: secure key distribution/sharing so only authorized parties obtain the key.

2.Security requirements: prevent attackers from learning k via the distribution protocol; use encryption (XOR or public-key) to protect k.

Differences

1.Roles:

Threshold distribution: multiple proxies and one end user reconstruct via shares.

Group exchange: multiple users, key generated and distributed by one user.

2.Distribution method:

Threshold: mathematical sharing (XOR, Shamir).

Group exchange: encryption algorithms (RSA, ECC).

Threat model:

Threshold: prevent a single proxy from leaking a share.

Group exchange: prevent predictable k due to randomness failures.

#### 4. 随机数故障的影响分析------------------

##### 门限密钥分发中的影响

- 如果随机数（如 S1 或 S2固定，攻击者可能通过已知信息推测出 S3​ 或 mkmkmk。

- 解决方案：

- 使用高质量的随机数生成器，确保随机数的不可预测性。

##### 组密钥交换协议中的影响

- 如果某用户的随机数固定为 777，攻击者可能通过已知用户公钥和密文反推出密钥 kkk。

- 攻击方式：

- 攻击者可以对密文进行穷举攻击，尝试解密并获取共享密钥。

- 解决方案：

- 强化随机数生成器，确保随机数的高熵性。

- 使用更安全的加密算法（如基于椭圆曲线的 Diffie-Hellman 协议）。

4.Impact of Randomness Failures

Threshold Key Distribution

If a share (e.g. S₁ or S₂) is fixed, an attacker may infer S₃ or mk.

Mitigation: use high-quality RNGs to ensure unpredictability.

Group Key Exchange

If a user’s randomness is fixed to 7, an attacker may recover k from known public keys and ciphertext.

Attack: brute-force decrypt that user’s ciphertext to get k.

Mitigation:

Strengthen RNG entropy.

Use stronger protocols (e.g. elliptic-curve Diffie–Hellman).

#### 5. 总结------------------

- 关系：

- 两者都旨在安全分发密钥，但在实现方式上有所不同。

- 随机数的不可预测性是两者共同面临的关键问题。

- 关键区别：

- 门限密钥分发：将密钥分解成多个份额，依赖数学分片算法。

- 组密钥交换协议：通过加密算法分发密钥，依赖随机数生成的安全性。

- 建议：

- 在设计 分布式密钥管理 或 组密钥协议 时，应：

1. 采用高质量随机数生成器。

1. 使用现代加密算法（如 ECC）。

1. 定期更新和刷新密钥。

5.Summary

Relationship: both aim for secure key distribution but use different mechanisms.

Shared challenge: randomness unpredictability is critical.

Key distinctions:

Threshold: splits key via math-based shares.

Group exchange: distributes via encryption, relying on RNG security.

Recommendations for design:

1.Use high-quality RNGs

2.Employ modern cryptography (e.g. ECC)

1. Rotate and refresh keys regularly

q10 多方组密钥协商的设计方法  以及随机数失效对安全通信的影响分析Group Key Exchange  组密钥交换（Group Key Exchange）

q10 设想一个场景，有 n 个参与方（A1, A2, ..., An）希望建立一个共享的组密钥用于安全的组内消息传输。他们将参与一个组密钥交换协议来生成该组密钥。只要所有成员按照协议正确执行，每个成员最终将计算出相同的密钥。

假设他们拥有一个公共公告板来发布消息，该公告板对所有人开放，内容是公开的。该协议旨在构建一个能够抵抗被动窃听攻击的组密钥交换机制。

(a) 使用公钥加密方案设计两轮协议（5 分）

请使用一个公钥加密方案（KeyGen，Enc，Dec）设计一个两轮协议。

在该协议中，一位参与方（如 A1）需要在公告板上读取并写入 n 个值，而其余每位参与方只需读取并写入一个值。

（提示：所有成员的公钥都已经张贴在公告板上。）

Consider a scenario where nnn parties (denoted as A1, A2, ..., An) aim to establish a shared group secret key for secure messaging among the group.  
They participate in a group key exchange protocol to generate the key.  
If all members follow the protocol correctly, each member will compute the same key.

Assume they have access to a public bulletin board to post messages, which is visible to all and publicly readable.  
The protocol aims to be secure against passive eavesdroppers.

(a) Design a Two-Round Protocol Using Public-Key Encryption (5 points)

Utilizing a public-key encryption scheme (KeyGen, Enc, Dec), design a two-round protocol.  
During the protocol, one participant (e.g., A1) reads and writes n values on the bulletin board,  
while each of the remaining participants only reads and writes one value.  
(Hint: All public keys are already available on the bulletin board.)

method 1:

round 1. A1 sample k, read other n-1 users pk, run enc(pki, k) for each i=2,...,n

round 2: other users read one message encrypted for himself and decrypt with his own ski

other methods, e.g.

every user contributes a secret; Only the last user aggregates and contributes another secret方法 1：

第一轮：A1 样本 k，读取其他 n-1 个用户 pk，对每个 i=2,...,n 运行 enc(pki, k)

第二轮：其他用户读取一条为自己加密的消息，并使用自己的 ski 解密

其他方法，例如：

每个用户贡献一个秘密；只有最后一个用户聚合并贡献另一个秘密

第 1 轮：A1 生成一个随机密钥 k，从公告板读取其余 n - 1 个用户的公钥，对每一个用户 i = 2,...,n，计算加密结果 Enc(pkᵢ, k) 并将其写入公告板。

## Round 1: 由 A1 生成密钥并发送给所有人（初始化密钥 密钥生成 + 分发）

第 2 轮：其他用户各自从公告板读取加密发给自己的那条消息，使用自己的私钥 skᵢ 解密并获得共享密钥 k。

## Round 2: 其他参与方读取并解密 (密钥接收 + 解密)

✅ 其他可行方案举例：

每位用户各自生成并贡献一个秘密值；

最后一位用户将所有秘密进行汇总，并额外贡献一个秘密，最终生成组密钥。

🔄 Round 1：每人贡献一个秘密（密文形式广播）

🔄 Round 2：A1 收集所有密文并解密

🔄 Round 3：A1 将密钥发送给其他人

Q10(b) - RNG Failure and Group Key Exposure (5 points)随机数生成器故障与组密钥泄露

Now, assume one of the n parties experiences a malfunctioning random number generator, consistently producing the value '7' whenever it attempts to generate a random value. This flaw adversely impacts the entire protocol outlined in question (a), irrespective of the functionality of the other participants’ random number generators. Specifically, demonstrate how this malfunction enables an eavesdropper to learn the group secret key.

假设 n 个参与者中有一人的随机数生成器失效，每次生成的随机值恒为 7。无论其他用户的随机性是否正常，这种缺陷都会破坏 (a) 小题中所设计的协议。请具体说明攻击者如何利用这个缺陷推导出组密钥。

one user's sk is related to 7, for example, sk = 7, pk = g^7  
attacker can try to decrypt each ciphertext with sk=7 to get the communication key k  
then attacker can eavesdrop all chatting messages  
for every one contributing secrets, one user's secret is 7, can leak the whole secret

一个用户的 sk 与 7 相关，例如 sk = 7，pk = g^7

攻击者可以尝试解密每个 sk=7 的密文，以获取通信密钥 k

然后攻击者可以窃听所有聊天消息

对于每个贡献秘密的用户，一个用户的秘密都是 7，可以泄露整个秘密

**Explanation (English)**

If a user's secret key is always 7, their public key is predictable. An attacker can guess the key, decrypt the ciphertext, and obtain the group key. With the key, the attacker can eavesdrop on the entire communication.

**解释（中文）**

如果某用户的私钥固定为 7，则其公钥可预测。攻击者可尝试用 sk=7 解密该用户的密文。一旦成功恢复出密钥 k，攻击者便可监听所有通信内容。

#### h1-Q9: 密钥分发系统

问题：设计高效的密钥分发方法

方案：

1. 单级分发：ki = PRF(mk, idi)

1. 两级分发：ckj = PRF(mk, cidj)，然后 ki = PRF(ckj, idi)

·  核心概念：密钥派生、层级密钥管理

·  涉及技术：PRF密钥派生、PKI基础设施

·  考查重点：大规模密钥管理的设计

- Q9: Key Distribution System

- Problem: Design efficient key distribution methods

- Scheme:

- Single-level distribution: k_i = PRF(mk, id_i)

- Two-level distribution: c_{kj} = PRF(mk, cid_j), then k_i = PRF(c_{kj}, id_i)

- · Core concepts: key derivation, hierarchical key management

- · Involved technologies: PRF-based key derivation, PKI infrastructure

- · Focus: design of large-scale key management

Q9. (15 points) Consider the following situation, a movie/content distribution center needs to generate a secret key for each subscriber (user), so that the distribution center can select any subset of users to send encrypted copies of the movie/content according to user’s subscription plan.  
The movie server as a key distribution center first chooses a uniformly random master key mk ← K, from a key space K. For subscriber i, suppose his user name is idi (assuming it is unique), and the movie server will use some method to generate a secret key ki for him. If user i paid and obtained the subscription key ki, the movie distribution center will use ki as the secret key and encrypt the movie to user i for what he subscribed.  
(1) Design an efficient key distribution method so that (i) the key distribution center only keeps one master secret key mk; (ii) subscriber i cannot decode the content sent to subscriber j. And briefly explain why it is secure. (Hint: use one cryptographic tool that we introduced that suits this purpose.)  
(2) Suppose the content distribution center only deals with 100 CDN servers (as intermediary proxy), which directly face real users and distribute both contents and keys. How could we improve the above design to support this two-level key distribution while still keeps every entity (center and CDN servers)  
to store only one secret key? (Note that the center never share its mk.)

考虑以下情况，一家电影/内容分发中心需要为每个订阅者（用户）生成一个密钥，以便分发中心能够根据用户的订阅计划向任意一组用户发送加密的电影/内容副本。电影服务器作为密钥分发中心首先从密钥空间 K 中随机选择一个主密钥 mk。对于订阅者 i，假设其用户名为 idi（假设是唯一的），电影服务器将使用某种方法为他生成一个密钥 ki。如果用户 i 支付并获得了订阅密钥 ki，电影分发中心将使用 ki 作为密钥为用户 i 加密他所订阅的内容。（1）设计一种高效的密钥分发方法，满足以下条件：（i）密钥分发中心仅保留一个主密钥 mk；（ii）订阅者 i 无法解码发送给订阅者 j 的内容。并简要说明其安全性。（提示：使用我们介绍的一种加密工具来实现此目的。）（2）假设内容分发中心仅与 100 个 CDN 服务器（作为中间代理）打交道，这些服务器直接面向真实用户并分发内容和密钥。我们如何改进上述设计以支持这种两级密钥分发，同时仍使每个实体（中心和 CDN 服务器）仅存储一个密钥？（注意，中心从不共享其主密钥。）

(1) Key distribution method:

1. Key distribution center generates unique user name id_i for user i.

2. Key distribution center generates the secret key using a PRF E such that k_i = E(mk, id_i), and sends the secret key k_i to the user.

3. If user i paid and obtained the secret key k_i, the movie distribution center first calculates k_i = E(mk, id_i), and then encrypts the movie m to user i for what he subscribed using secret‐key encryption method:

c = Enc(k_i, m).

4. User i uses the secret key k_i to decrypt the movie:

m = Dec(k_i, c).

By using the above method, the key distribution center only keeps one master secret key mk. Subscriber i cannot decode the content sent to subscriber j because the subscription key is different for each user, and i doesn’t know the master key.

(2) CDN server j has identity cid_j.

Two‐level key distribution:

ck_j = PRF(mk, cid_j);

k_i = PRF(ck_j, id_i);

(1) 密钥分发方法：

1. 密钥分发中心为用户 i 生成唯一用户名 id_i。

2. 密钥分发中心使用伪随机函数 PRF E 生成订阅密钥 k_i = E(mk, id_i)，并将 k_i 发送给用户。

3. 当用户 i 支付并获得订阅密钥 k_i 后，内容分发中心重新计算 k_i = E(mk, id_i)，并使用对称加密方法将电影 m 加密：

c = Enc(k_i, m)。

4. 用户 i 使用密钥 k_i 解密电影：

m = Dec(k_i, c)。

通过上述方法，分发中心仅需保管一个主密钥 mk。由于每个用户拥有不同的订阅密钥且无法获知 mk，用户 i 无法解密发送给用户 j 的内容。

(2) 假设 CDN 服务器 j 的标识为 cid_j。

两级密钥分发：

ck_j = PRF(mk, cid_j);

k_i = PRF(ck_j, id_i);

密钥分发

单级分发（①）

1. 利用伪随机函数（PRF）从主密钥 mk 和用户标识 id_i 派生出订阅密钥 k_i = PRF(mk, id_i)。

2. 分发中心仅需保管主密钥 mk，用户订阅时即时计算对应的 k_i 并安全传输给用户。

3. 使用对称加密 Enc/Dec(k_i, ·) 加密内容，只有持有相同 k_i 的用户才能解密。

安全性

- 密钥隔离：不同用户的 k_i 相互独立，订阅者无法从自己的 k_i 推导出其他用户的 k_j 或中心的 mk。

- 短期密钥：如需撤销某用户，只需丢弃或轮换对应的 k_i，不影响其他用户。

两级分发（②）

1. 分发中心为每个 CDN 服务器派生中级密钥 ck_j = PRF(mk, cid_j)，并仅将 ck_j 分发给对应 CDN。

2. CDN 使用自己的 ck_j 为最终用户 i 派生 k_i = PRF(ck_j, id_i)，然后将内容和 k_i 一并送达用户。

3. 任何 CDN 或普通用户都无法逆向推导出 mk 或其他实体的密钥，实现了最小密钥存储与层级隔离。

Single‐Level Distribution (①)

1. Derive each subscriber’s key k_i = PRF(mk, id_i) using the master key mk and the user’s unique identifier id_i.

2. The distribution center only stores mk; when a user subscribes, it computes k_i on‐the‐fly and securely delivers it to the user.

3. Content is encrypted with symmetric Enc/Dec(k_i, ·), so only the holder of k_i can decrypt.

Security

- Key Isolation: Each k_i is independent. A subscriber with k_i cannot derive any other k_j or mk.

- Revocation: To revoke a user, simply discard or rotate their k_i without affecting others.

Two‐Level Distribution (②)

1. The center derives an intermediate key for each CDN server: ck_j = PRF(mk, cid_j), and distributes ck_j to that server only.

2. Each CDN uses ck_j to derive user keys: k_i = PRF(ck_j, id_i), then delivers content encrypted under k_i to the user.

3. No CDN or end user can invert to recover mk or other entities’ keys, achieving minimal key storage and hierarchical key separation.

## 第十章 .数字签名

##### **【****w10****】****第一部分：为什么公钥加密还不够？—— 中间人攻击**

它从之前留下的完整性和身份认证问题出发，引出了与公钥加密（PKE）并驾齐驱的核心工具——数字签名（Digital Signature）。讲义不仅定义了数字签名，还将其与 MAC 进行了深刻对比，并最终通过零知识证明引出了一种经典的签名构造方法。

讲义以一个尖锐的问题“我们已经万无一失了吗？”开场，揭示了即使有了 Diffie-Hellman 和 ElGamal，我们仍然面临着严峻的威胁。

主动攻击者 (Active Attacker):

1. 之前的安全模型大多假设攻击者是被动窃听者。但现实中，攻击者可能是主动的，能够完全控制通信信道（例如，通过入侵网络路由器或 ISP）。

1. 中间人攻击 (Man-in-the-Middle, MitM):

1. 在 Diffie-Hellman 密钥交换中，当 Alice 发送 gᵃ 给 Bob 时，中间人 Eve 截获它。

1. Eve 自己生成一个随机数 e，将 gᵉ 发送给 Bob，同时也将 gᵉ 发送给 Alice。

1. 结果是：Alice 与 Eve 建立了共享密钥 g^(ae)，而 Bob 与 Eve 建立了共享密钥 g^(be)。

1. Eve 成为了一个透明的“中转站”，可以解密、读取、甚至篡改双方的所有通信内容，而 Alice 和 Bob 对此毫不知情。

根源问题：缺乏身份认证

1. MitM 攻击之所以能成功，其根本原因是：Alice 无法确认她收到的 gᵇ 真的来自 Bob，而 Bob 也无法确认他收到的 gᵃ 真的来自 Alice。

1. 这本质上是一个消息来源的真实性和完整性问题，而不仅仅是机密性问题。

MAC 的局限性

1. 我们之前用 MAC 来解决完整性问题。但在这里，MAC 失效了。

1. 因为要使用 MAC，Alice 和 Bob 必须预先共享一个密钥。但他们进行密钥交换的目的，恰恰就是为了建立这样一个共享密钥。这就陷入了一个“先有鸡还是先有蛋”的循环困境。

#### English Explanation

##### **Part 1: Why Isn't Public-Key Encryption Enough? - The Man-in-the-Middle Attack**

The lecture begins with a sharp question, "Are we all done?", revealing that even with Diffie-Hellman and ElGamal, we still face a severe threat.

The Active Attacker:

1. Previous security models often assumed a passive eavesdropper. But in reality, an attacker can be active, fully controlling the communication channel (e.g., by hacking a network router or ISP).

1. Man-in-the-Middle (MitM) Attack:

1. In a Diffie-Hellman exchange, when Alice sends gᵃ to Bob, the middle-woman Eve intercepts it.

1. Eve generates her own random number e, sends gᵉ to Bob, and also sends gᵉ to Alice.

1. The result: Alice establishes a shared key g^(ae) with Eve, and Bob establishes a shared key g^(be) with Eve.

1. Eve becomes a transparent "relay," able to decrypt, read, and even modify all communications between them, while Alice and Bob remain completely unaware.

The Root Problem: Lack of Authentication

1. The MitM attack succeeds for one fundamental reason: Alice cannot verify that the gᵇ she received truly came from Bob, and Bob cannot verify that the gᵃ he received truly came from Alice.

1. This is fundamentally a problem of message authenticity and integrity, not just confidentiality.

The Limitation of MACs

1. We previously used MACs to solve integrity problems. But here, a MAC is useless.

1. To use a MAC, Alice and Bob must pre-share a key. But the entire purpose of their key exchange is to establish such a key in the first place. This creates a "chicken-and-egg" circular problem.

##### **第二部分：新工具——数字签名 (Digital Signature)**

为了打破这个循环，我们需要一个全新的、不依赖于预共享密钥的工具来提供完整性和身份认证。

数字签名的语法 (Syntax)

1. 密钥生成 KeyGen: 生成一个密钥对 (sk, pk)。

1. 签名 Sign(sk, m): 使用自己的私钥 sk 对消息 m 进行签名，生成一个数字签名 σ。

1. 验证 Verify(pk, m, σ): 使用签名者的公钥 pk 来验证消息 m 和签名 σ 是否匹配。

与 MAC 的关键区别

1. 验证方式:

1. MAC 的验证是私有的，验证者必须拥有共享密钥。

1. 数字签名的验证是公开的 (Public Verifiability)，任何人只要有签名者的公钥，就可以验证签名。

1. 密钥所有权:

1. MAC 的密钥是通信双方共享的。

1. 签名的私钥是签名者独有的。这意味着，一个有效的签名只能由私钥持有者本人生成。这提供了不可否认性 (Non-repudiation)。

数字签名的强大应用

1. 软件更新验证: 苹果或微软发布系统更新时，会用自己的私钥对更新包进行签名。用户的设备内置了苹果/微软的公钥，可以自动验证签名的合法性，确保更新包未被篡改。

1. 防御密钥交换中的 MitM 攻击:

1. Alice 计算 gᵃ 后，用自己的私钥 sk_A 对 gᵃ 签名：σ_A = Sign(sk_A, gᵃ)。她将 (gᵃ, σ_A) 一起发送给 Bob。

1. Bob 收到后，先用 Alice 的公钥 pk_A 验证签名。如果验证通过，他才相信 gᵃ 确实来自 Alice。

1. Bob 也做同样的操作。这样，双方就能确信他们交换的信息没有被中间人篡改。

##### **Part 2: The New Tool - Digital Signatures**

To break this cycle, we need a new tool that provides integrity and authentication without relying on a pre-shared key.

Syntax of a Digital Signature

1. Key Generation KeyGen: Generates a key pair (sk, pk).

1. Signing Sign(sk, m): Uses one's own secret key sk to sign a message m, producing a digital signature σ.

1. Verification Verify(pk, m, σ): Uses the signer's public key pk to verify if the message m and signature σ match.

Key Differences from MACs

1. Verification Method:

1. MAC verification is private; the verifier must have the shared key.

1. Digital signature verification is public (Public Verifiability); anyone with the signer's public key can verify the signature.

1. Key Ownership:

1. A MAC key is shared between parties.

1. A signing private key is exclusive to the signer. This means a valid signature can only be produced by the private key holder, which provides non-repudiation.

Powerful Applications of Digital Signatures

1. Software Update Verification: Apple or Microsoft signs their system updates with their private key. Users' devices have the company's public key built-in to automatically verify the signature, ensuring the update package has not been tampered with.

1. Preventing MitM in Key Exchange:

1. After Alice computes gᵃ, she signs it with her private key sk_A: σ_A = Sign(sk_A, gᵃ). She sends (gᵃ, σ_A) to Bob.

1. Upon receipt, Bob first uses Alice's public key pk_A to verify the signature. Only if it verifies does he trust that gᵃ truly came from Alice.

1. Bob does the same. This way, both parties can be sure the information they are exchanging has not been altered by a middleman.

##### **第三部分：数字签名的安全性与构造**

安全定义 (EUF-CMA)

1. 数字签名的安全标准与 MAC 相同，都是 EUF-CMA (选择消息攻击下的存在性不可伪造性)。

1. 攻击者的目标是，在可以请求对任意消息进行签名（即拥有一个“签名预言机”）并看到签名者公钥的情况下，伪造出一条新消息的有效签名。

重要讨论 (PKE vs. Signature)

1. PKE 不是签名: 虽然都使用公私钥对，但它们是目标和功能完全不同的两种工具。PKE 用于保密，签名用于认证。

1. 解密不是签名: 讲义特别强调，永远不要混淆解密和签名。即使在某些算法（如教科书式 RSA）中，它们在数学形式上看起来很像，但在密码学实践中，它们是完全不同的、需要严格分开的实现。

构造数字签名 (从零知识证明到 Schnorr 签名)

1. 讲义通过一个非常精彩的“绕道”，从一个更基本的问题出发：如何向别人证明“我知道一个秘密”，而不泄露这个秘密本身？ 这就是零知识证明 (Zero-Knowledge Proof, ZKP)。

1. Σ-协议 (Sigma Protocol): 讲义展示了一个简单的交互式 ZKP 协议，用于证明“我知道 pk = gᵃ 对应的私钥 a”。

1. 承诺: 证明者生成一个随机数 r，发送 g^r。

1. 挑战: 验证者发送一个随机挑战 c。

1. 回应: 证明者计算 z = r + c·a 并发送。

1. 验证: 验证者检查 g^z 是否等于 g^r · (pk)^c。

1. 从交互式到非交互式 (Fiat-Shamir 变换): 我们可以用一个哈希函数来模拟验证者的“挑战”步骤，从而将交互式协议变为非交互式。挑战 c 不再由验证者提供，而是通过哈希一个公共值（如承诺和消息）来生成：c = H(g^r || m)。

1. Schnorr 签名: 将这个非交互式的 ZKP 应用于消息 m，就得到了一个安全的签名方案——Schnorr 签名。

1. Sign(sk, m): 生成随机 r，计算 a = g^r，c = H(a || m)，z = r + c·x。签名为 (a, c, z) 或其变体。

1. Verify(pk, m, σ): 检查等式 g^z = a · pk^c 是否成立。

##### **Part 3: Security and Construction of Digital Signatures**

Security Definition (EUF-CMA)

1. The security standard for digital signatures is the same as for MACs: EUF-CMA (Existential Unforgeability under a Chosen Message Attack).

1. The adversary's goal is to forge a valid signature for a new message, given the ability to request signatures for any message of their choice (a "signing oracle") and access to the signer's public key.

Important Discussions (PKE vs. Signature)

1. PKE is NOT a Signature: Although both use public/private key pairs, they are two different tools with completely different goals and functionalities. PKE is for confidentiality, while signatures are for authentication.

1. Decryption is NOT Signing: The lecture strongly emphasizes to never mix decryption with signing. Even if they look mathematically similar in some algorithms (like textbook RSA), in cryptographic practice, they are functionally distinct and must be implemented separately.

Constructing a Digital Signature (From Zero-Knowledge Proofs to Schnorr Signatures)

1. The lecture takes a brilliant "detour" by starting from a more fundamental question: How can I prove I know a secret without revealing the secret itself? This is the concept of a Zero-Knowledge Proof (ZKP).

1. Sigma (Σ) Protocol: The notes show a simple interactive ZKP for proving "I know the secret key a corresponding to the public key pk = gᵃ".

1. Commit: The prover generates a random r and sends g^r.

1. Challenge: The verifier sends a random challenge c.

1. Respond: The prover computes and sends z = r + c·a.

1. Verify: The verifier checks if g^z equals g^r · (pk)^c.

1. From Interactive to Non-Interactive (Fiat-Shamir Heuristic): We can make this protocol non-interactive by using a hash function to simulate the verifier's challenge. The challenge c is no longer provided by the verifier but is generated by hashing public values: c = H(g^r || m).

1. Schnorr Signature: Applying this non-interactive ZKP to a message m yields a secure signature scheme—the Schnorr Signature.

1. Sign(sk, m): Generate random r, compute a = g^r, c = H(a || m), and z = r + c·x. The signature is a variant of (a, c, z).

1. Verify(pk, m, σ): Check if the equation g^z = a · pk^c holds.

语法

符号： (sk,m) → σ

验证： (pk,m,σ) → {0,1}

构造方法

瞬时签名（Lamport）

全域哈希（FDH）

施诺尔签名

应用

不可否认性

### 10.Digital Signatures

- Syntax

- Signature: (sk, m) → σ

- Verification: (pk, m, σ) → {0, 1}

- Constructions

- • Lamport one-time signatures

- • Full-domain hash (FDH)

- • Schnorr signatures

- Applications

- • Non-repudiation

#### h2-Q7: 数字签名的法律效力

仅加密：无法证明发送者身份  
加密+签名：可证明发送者，但无法确定具体内容，因为内容被加密

代码签名

合同签名

- Q7: Legal Effect of Digital Signatures

- • Encryption only: cannot prove the sender’s identity

- • Encryption + signature: proves the sender, but cannot reveal the plaintext (because it is encrypted)

- Code signing

- Contract signing

Q7.数字签名与加密在协议承诺中的法律效力分析Cryptographic Commitment via Encryption and Digital Signature

Suppose Alice and Bob reach an agreement on some contract and want to make it official.

Thus, Alice writes down the agreement as a file m and encrypts m using Bob’s public key pk to get c.

Alice sends c to Bob, trying to convince Bob that c is the commitment of Alice about the agreement.

Would this method work? (Can Bob be convinced that it was written by Alice?) Explain why. (4 points)

How about Alice uses PKE and digital signatures?

i.e., Alice sends c₁ = Enc(pkb, m), c₂ = Sign(ska, c₁) to Bob,

where pka, pkb are Alice’s and Bob’s public keys respectively, and they just send them to each other.

Can Bob now be convinced that Alice already committed to the agreement, i.e., c₁, c₂ is a legitimate contract that, if violated, Bob can show to the judge and sue Alice in court? Explain why. (6 points)

假设 Alice 和 Bob 就某份合同达成协议，并希望将其正式化。

于是，Alice 将协议写为文件 m，用 Bob 的公钥加密 m 得到密文 c，再把 c 发给 Bob，

试图让 Bob 相信 c 就代表了 Alice 对这份协议的承诺。

这个方法有效吗？（Bob 能相信这是 Alice 写的吗？）请解释。（4 分）

接下来，如果 Alice 使用 公钥加密和数字签名 呢？

即 Alice 发送 c₁ = Enc(pkb, m)，c₂ = Sign(ska, c₁) 给 Bob，

其中 pka 和 pkb 分别是 Alice 和 Bob 的公钥。

Bob 能否因此相信 Alice 已正式承诺此协议？即：(c₁, c₂) 是否构成 Bob 能拿去法庭起诉 Alice 的正式合同？请解释。（6 分）

✅ 原始答案讲解（按两部分）

Part 1: Only encryption with Bob’s public key

1. No, anyone can send it to Bob

- （1）不，任何人都可以将其发送给Bob

English Explanation:

If Alice only encrypts m using Bob’s public key and sends c = Enc(pkb, m),

then anyone who knows pkb (which is public) can do the same.

So Bob has no way of knowing whether the ciphertext came from Alice or someone else.

中文翻译：

若 Alice 只用 Bob 的公钥加密协议 m 并发送 c，那其实任何人都可以这样做。

因为 Bob 的公钥是公开的，任何人都可以用它加密任意内容发送给 Bob。

所以 Bob 无法确定这个密文是否真的来自 Alice，无法确认其承诺的真实性。

Part 2: Encryption + Alice's signature

(2) Alice’s signature c₂ can authenticate the ciphertext c₁: signature’s non-repudiation; no authenticity of m

c₁ is not bound to a claimed m given pkb

i.e., conception point of view, encryption is not a commitment

(2) Alice 的签名 c₂ 可以验证密文 c₁ 的真实性：签名的不可否认性；m 的真实性

c₁ 不受给定 pkb 的声明 m 的约束

也就是说，从概念的角度来看，加密不是一种承诺

English Explanation:

Now Alice adds a digital signature c₂ = Sign(ska, c₁).

This proves that Alice indeed sent c₁, since digital signatures are non-repudiable.

However, Bob still cannot know what message m was signed, because c₁ = Enc(pkb, m) is encrypted with his key and is not visible to anyone else.

Therefore, Alice’s signature binds her to some ciphertext, but not provably to a specific message m.

So legally, this does not count as a valid commitment from Alice, because the encrypted content could be anything.

中文翻译：

现在 Alice 增加了一个数字签名：c₂ = Sign(ska, c₁)。

这确实能证明 Alice 发送了 c₁，因为签名具有不可否认性。

但问题在于：Bob 并不能从中确定 c₁ 所加密的是哪个具体的 m，

因为 c₁ 是用 Bob 的公钥加密的，只有 Bob 自己能解密，别人看不到内容。

#### h2-Q6: 门禁身份认证系统

基本方案：挑战-响应签名协议  需要数字签名来证明身份

扩展需求：

- 身份识别：每人独立密钥对

密钥吊销：维护有效公钥列表 需要PKI基础设施管理，但核心还是签名验证

身份认证的本质：

- 门禁系统需要验证用户身份

- 挑战-响应协议通过签名证明用户拥有对应的私钥

- 这就是数字签名的典型应用场景

Schnorr协议的相关性：

- 笔记中提到“Schnorr身份认证协议”

- 这是一个经典的零知识身份认证协议

- 常用于门禁、智能卡等身份认证场景

协议流程：

1. 承诺：证明者选择随机数r，计算并发送 t = g^r mod p

1. 挑战：验证者发送随机挑战c

1. 响应：证明者计算并发送 s = r + cx mod (p-1)

1. 验证：验证者检查 g^s ≟ t · y^c mod p

特性：

- 缺陷：诚实证明者总能通过验证

- 缺失：没有私钥的攻击者无法通过验证

- 零知识性：不泄露私钥x的任何信息

- Q6: Access-Control Authentication System

- Basic scheme: challenge–response signature protocol (requires digital signatures to prove identity)

- Extended requirements:

- • Identity binding: each user has a unique key pair

- • Key revocation: maintain a list of valid public keys (requires PKI infrastructure, but the core remains signature verification)

- Essence of authentication:

- • An access system must verify user identity

- • The challenge–response protocol uses signatures to prove possession of the private key

- • This is a classic application of digital signatures

- Relevance of Schnorr protocol:

- • Notes mention the “Schnorr authentication protocol”

- • A classic zero-knowledge authentication scheme

- • Widely used in access control, smart cards, and similar scenarios

- Protocol flow:

- Commitment: prover picks random r, computes and sends t = g^r mod p

- Challenge: verifier sends random challenge c

- Response: prover computes and sends s = r + c·x mod (p–1)

- Verification: verifier checks that g^s ≟ t · y^c mod p

- Properties:

- • Completeness: honest prover always passes verification

- • Soundness: attacker without x cannot pass

- • Zero-knowledge: reveals no information about x

Q6 基于数字签名的门禁身份认证与密钥吊销协议设计

In the university, most of the buildings have an access control system that allows only authorized people to join, e.g., you will need to swipe your card. Assume that there are 100 people having access to building J12. When those 100 people first register with the university, the university generates a key pair sk, pk,where sk is the secret key, and hard-wires this sk into the 100 cards of those 100 people (but all other unauthorized people do not have this card or secret).

(a) When they swipe the card, the card reader in the building simply sends a random challenge r, and the card will simply compute t = Sign(sk, r) for a secure digital signature.And then the building verifies.Is this protocol serving the purpose of access control? Briefly explain. (3 points）

(b) Also, the building manager would like to know who exactly enters the building each day by recording the transcript between the cards and the card reader.

Could you design a new protocol for this purpose? (3 points)

(c) Even more, the building manager may worry that some of the cards may be lost.

When a lost card is reported, the lost card will be revoked (the old card cannot be used anymore), without influencing other users.

Could you further upgrade your protocol to support this revocation feature? (4 points)

Q6.大学中大多数建筑物都设有门禁系统，允许只有授权人员进入，例如你需要刷卡进入。

假设有 100 人有权限进入 J12 教学楼。

当这 100 人首次注册时，学校会为每人生成一个密钥对 (sk, pk)，其中 sk 是私钥，

并将对应的 sk 烧录到他们的卡中（其他未授权人员则没有该卡或该密钥）。

(a) 当刷卡时，读卡器发送一个随机挑战 r，卡片使用 sk 计算签名 t = Sign(sk, r)，再发送回去由系统验证。

这个协议是否达到了访问控制的目的？ 简要说明。（3 分）

(b) 楼宇管理员希望每天记录是谁进入了大楼。

你能否设计一个新的协议以满足这个目的？（3 分）

(c) 楼宇管理员还担心卡可能丢失。

当报告某卡丢失时，系统应吊销该卡（原卡不能再用），且不能影响其他用户。

你能否进一步升级协议以支持吊销机制？（4 分）

✅ 原始答案 + 中英文解释

(1)Yes, signature’s unforgeability ensures that only knowing sk can generate a valid signature t.

是的，签名的不可伪造性保证了只有知道sk才能生成有效的签名t。

Yes. Because digital signatures are unforgeable, only someone who possesses the correct private key sk can compute a valid Sign(sk, r).

This ensures that only authorized card holders can respond to the challenge and access the building.

是的，因为数字签名具备不可伪造性，只有拥有合法私钥 sk 的人才能计算出有效签名 Sign(sk, r)，

因此只有授权用户才能响应挑战并进入大楼，达到了访问控制的目的。

- （2）University can generate 100 key pairs and send each to each person, and keep a list for these pks.（2）大学可以生成100个密钥对，分别发送给每个人，并保存这些密钥的列表。

English Explanation:

To record who enters, the university can assign each person a unique key pair (skᵢ, pkᵢ), and maintain a database of all public keys.

When someone signs a challenge, the system can identify them by matching the signature to their public key.

中文翻译：

学校可以为每个人生成一个独立的密钥对 (skᵢ, pkᵢ)，并维护一张包含所有公钥的名单。

这样，当某人签名挑战值时，系统可以根据签名和 pk 来识别该用户，实现身份记录。

1. University keeps a valid pk list, and removes those revoked pks from the pk list, or other revocation methods

- 大学保留有效的pk列表，并将那些被撤销的pk从pk列表中移除，或者其他撤销方法

English Explanation:

To support revocation, the university can maintain a list of valid public keys.

When a card is reported lost, the corresponding public key is removed from the list.

Only signatures from keys in this list are accepted. Other revocation methods (e.g., CRLs) may also be used.

中文翻译：

为支持吊销机制，学校可以维护一个“有效公钥列表”。

当某张卡片丢失时，删除对应公钥。系统仅接受在该列表中的签名。

也可以采用其他吊销机制，如证书吊销列表（CRL）等

#### h2-Q8: 区块链交易认证

MAC方案问题：

- 不支持公开验证

- 矿工无法验证交易有效性

数字签名优势：

- 公开可验证

- 不可否认性  区块链需要任何人进行验证交易，符合数字签名的公开验证特性

- Q8: Blockchain Transaction Authentication

- MAC-based schemes suffer:

- • No public verifiability

- • Miners cannot verify transaction validity

- Advantages of digital signatures:

- • Publicly verifiable

- • Non-repudiation

- (Blockchain requires anyone to verify transactions, aligning with the public-verification property of signatures.)

Q8 为什么公链交易中必须使用数字签名而不能使用 MAC Why MAC Fails and Digital Signatures are Required for Public Blockchain Transactions Signature）

Suppose user A wants to transfer one Bitcoin to user B.Can the following method work? A and B run a key exchange to have a secret key k.  
A generates a transaction as:m = "A sends one Bitcoin to B" and also attaches a tag σ that is the MAC on the message m using key k.Then A submits the message and tag to the Bitcoin network and it is recorded in some block.

B confirms receiving A’s transfer when seeing the transaction with the message and tag on the block,  
which is supposed to prove that this message is indeed from A.Can we design the Bitcoin transaction this way? If yes, briefly explain; if not, what should you use, and why?

假设用户 A 想给用户 B 转账 1 个比特币。是否可以使用以下方法？A 和 B 首先通过密钥交换生成一个共享密钥 k。 然后 A 构造交易信息：m = "A 将 1 个比特币发送给 B"，并附加一个标签 σ，这个标签是对消息 m 用密钥 k 生成的 MAC。

之后，A 将消息和标签一起广播到比特币网络，并被写入某个区块。B 在区块中看到这笔交易和标签，确认转账来自 A。

问题：我们能用这种方式构造比特币交易吗？如果不能，应该用什么？为什么？

🔹第一部分：为什么不能用 MAC

No. MAC is not public verifiable. Others cannot verify the transaction is valid.

Moreover, it is not guaranteed only B can spend the coin

不可以。MAC 不可公开验证。其他人无法验证交易是否有效。

此外，不能保证只有 B 才能使用该代币。

✅ Explanation (English):

A MAC (Message Authentication Code) is only verifiable by someone who knows the secret key.

Since Bitcoin is a public blockchain, anyone must be able to verify a transaction’s validity.

Miners and nodes cannot verify a MAC without knowing the secret key k,

so the transaction cannot be validated or accepted into the blockchain.

Also, the MAC does not bind the coin to B—anyone with k could potentially spend it.

✅ 中文翻译解释：

MAC（消息认证码）只能由知道密钥的一方验证。

但比特币是公开的区块链系统，所有人都需要能验证交易是否有效。

矿工或网络节点无法验证基于密钥 k 的 MAC，因此该交易无法入链。

此外，MAC 并不能确保只有 B 能使用这笔币，任何知道 k 的人都可以伪造转账。

🔹第二部分：应该使用数字签名

Digital signature: non-repudiation: undeniable, only the user who has private key signs it

public verifiability: any one can verify using the public key

数字签名：不可否认性：不可否认，只有拥有私钥的用户才能签名

公开可验证性：任何人都可以使用公钥进行验证

✅ Explanation (English):

A digital signature solves the problem:

Non-repudiation: Only A, who has the private key, can generate the valid signature. She cannot deny it later.

Public verifiability: Everyone (including Bitcoin miners) can use A’s public key to verify the signature and validate the transaction.

✅ 中文翻译解释：

数字签名是正确做法：

不可否认性：只有持有私钥的 A 能生成有效签名，A 无法事后否认交易。

公开可验证性：任何人（包括矿工）都可以用 A 的公钥验证签名并确认交易有效。

#### h1-Q8: 身份认证协议

场景：警车需要识别真假警车

方案：使用 PRF 的挑战-响应协议

- 生成随机挑战 r1, r2

- 真警车计算 PRF(k, ri) 响应

- 假警车无法正确响应

- 核心概念：挑战-响应协议

相关技术：PRF应用、Schnorr身份认证

考查重点：密码学原语的实际应用

- Q8: Authentication Protocol

- Scenario: police cars must distinguish real from fake

- Scheme: PRF-based challenge–response protocol

- • Generate random challenges r₁, r₂

- • Real car computes PRF(k, rᵢ) as response

- • Fake car cannot respond correctly

- Core concept: challenge–response protocols

- Related techniques: PRF usage, Schnorr authentication

- Focus: practical application of cryptographic primitives

Q8. (10 points) Friend-or-Foe. Suppose one Sydney police auto-drive car is racing with a criminal that drives a car looks the same (the criminal car was painted so as camouflage), the policy department is sending other auto-drive police cars to block the criminal, and they see two police cars rushing towards them, they need to shoot at the tires of the criminal car to stop him. Assume all the real police cars of Sydney pre-installed a same master key k, the criminal’s car only looks similar but does not have this key. Design a simple identification protocol, e.g., challenge-response using some tool you have studied so far (one of PRG, PRF, SE, OTP) to help the police cars to identify real police, and briefly explain.

敌我。假设一辆悉尼警察的自动驾驶汽车与一名驾驶一辆看起来一样的汽车的罪犯（犯罪汽车被涂成迷彩）比赛，政策部门派出其他自动驾驶警车阻止罪犯，他们看到两辆警车向他们冲来，他们需要射击犯罪汽车的轮胎来阻止他。假设悉尼所有真正的警车都预装了一把相同的万能钥匙k，那么罪犯的车只是看起来很相似，却没有这把钥匙。设计一个简单的识别协议，例如使用你已经学习过的一些工具（PRG， PRF， SE， OTP中的一个）来帮助警车识别真正的警察，并简要解释。

use PRF, generate different random challenges for both cars

let these two cars compute PRF(k, r1) and PRF(k, r2)

only the real police car can respond correctly

使用伪随机函数（PRF），为两辆车分别生成不同的随机挑战值

让这两辆车分别计算 PRF(k, r1) 和 PRF(k, r2)

只有真实的警车才知道主密钥 k，能够正确响应

解释：

挑战-响应流程

1. 总部（或追击车）随机选取两个数 r1 和 r2。

2. 向来车 A 发送挑战 r1，向来车 B 发送挑战 r2。

3. 每辆车计算并返回 ti = PRF(k, ri)。

安全性

- 合法警车预先与总部共享密钥 k，所以能正确计算 ti。

- 犯罪车辆不持有 k，其返回值无法预测，肯定与 PRF(k, ri) 不符。

防重放

- 每次使用新的随机挑战 ri，旧的响应无法重复利用。

结果判定

- 总部验证收到的 t1, t2 是否等于 PRF(k, r1) 与 PRF(k, r2)。

- 只有全部通过，才能确认目标是真警车；否则是伪装车辆。

该方案简单高效，基于 PRF 的计算与验证均为多项式时间，且在不知道密钥的情况下无法伪造正确响应，满足鉴别真实警车的需求。

Explanation:

Challenge-Response Procedure

1. The headquarters (or pursuing car) randomly selects two nonces r1 and r2.

2. It sends challenge r1 to car A and r2 to car B.

3. Each car computes and returns ti = PRF(k, ri).

Security

- The legitimate police car shares the key k with headquarters in advance, so it can compute ti correctly.

- The criminal car, lacking k, cannot predict the correct response; its reply will not match PRF(k, ri).

Replay Protection

- Fresh random challenges ri are used each time, so old responses cannot be reused.

Decision

- Headquarters verifies whether the received t1 and t2 equal PRF(k, r1) and PRF(k, r2), respectively.

- Only if both checks pass is the target confirmed as a real police car; otherwise it is identified as a disguised vehicle.

This scheme is simple and efficient: PRF computation and verification run in polynomial time, and without the key, an adversary cannot forge valid responses, satisfying the requirement for authenticating real police cars.

## 第十一章 公钥基础设施（Public Key Infrastructure, PKI） 和 数字证书(我们如何信任一个公钥)

##### **【****w11****】****第一部分：深入理解数字签名的不可伪造性**

讲义首先通过一个反例，深化了对 EUF-CMA（存在性不可伪造性） 的理解

签名的绑定作用:

1. 数字签名的核心价值在于，它将一条消息 m 与一个公钥 pk 牢牢地绑定在一起。如果 Verify(pk, m, σ) 验证通过，就意味着这个签名 σ 只能是由 pk 对应的那个唯一的私钥持有者生成的。

一个不安全的签名方案 (反例):

1. 问题: 假设我们有一个安全的签名方案 Sign，它只能对长度为 ℓ 的消息进行签名。现在我们想扩展它，用来签长度为 2ℓ 的消息，于是定义了 Sign'(sk, m₁||m₂) = (Sign(sk, m₁), Sign(sk, m₂))。

1. 攻击: 这个 Sign' 是不安全的。攻击者只需要向签名预言机查询一次，获得 (m₁||m₂) 的签名 (σ₁, σ₂)。他就可以立即伪造出一条新消息 (m₂||m₁) 的有效签名 (σ₂, σ₁)。他甚至可以伪造 (m₁||m₁) 的签名 (σ₁, σ₁)。

1. 教训: 一个安全的签名方案必须能抵抗这种“剪切-粘贴”式的攻击。签名结果必须是“整体的”，破坏掉原始消息的任何内部结构。

正确的扩展方法：Hash-and-Sign

1. 处理可变长度消息的正确且标准的方法是 Hash-and-Sign。

1. Sign(sk, m) := Sign(sk, H(m))

1. 先用一个抗碰撞的哈希函数 H 将任意长度的消息 m 压缩成一个固定长度的摘要，然后再对这个摘要进行签名。由于很难找到两个不同的消息有相同的哈希值，攻击者就无法将一个消息的签名挪用到另一个消息上。

#### English Explanation

##### **Part 1: A Deeper Look at the Unforgeability of Digital Signatures**

The lecture first deepens the understanding of EUF-CMA (Existential Unforgeability) by using a counter-example.

The Binding Role of a Signature:

- The core value of a digital signature is that it securely binds a message m to a public key pk. If Verify(pk, m, σ) passes, it implies that the signature σ could only have been generated by the unique holder of the private key corresponding to pk.

An Insecure Signature Scheme (Counter-example):

- Problem: Suppose we have a secure signature scheme Sign that only works on messages of length ℓ. We want to extend it to sign messages of length 2ℓ, so we define Sign'(sk, m₁||m₂) = (Sign(sk, m₁), Sign(sk, m₂)).

- Attack: This Sign' scheme is insecure. An attacker can query the signing oracle just once to get the signature (σ₁, σ₂) for (m₁||m₂). They can then immediately forge a valid signature (σ₂, σ₁) for a new message (m₂||m₁). They could even forge a signature (σ₁, σ₁) for (m₁||m₁).

- Lesson: A secure signature scheme must resist this kind of "cut-and-paste" attack. The final signature must be "holistic" and destroy any internal structure of the original message.

The Correct Extension Method: Hash-and-Sign

- The correct and standard way to handle variable-length messages is Hash-and-Sign.

- Sign(sk, m) := Sign(sk, H(m))

- First, use a collision-resistant hash function H to compress the arbitrary-length message m into a fixed-length digest. Then, sign this digest. Since it's computationally infeasible to find two different messages that hash to the same value, an attacker cannot repurpose a signature from one message for another.

##### **第二部分：终极挑战——公钥与真实身份的绑定**

我们已经有了 PKE 来保密，有了数字签名来认证消息来源，但一个新的、更根本的问题浮出水面。

场景：用户登录网站

1. Alice 想把密码 pwd 安全地发给服务器。她需要用服务器的公钥 pk_s 来加密。

1. 问题: Alice 如何确定她拿到的这个 pk_s 真的属于她正在访问的那个网站服务器，而不是一个中间人攻击者伪造的？

新的挑战：从“绑定消息”到“绑定身份”

1. 数字签名能将一条消息绑定到一个公钥。

1. 现在我们需要一个机制，能将一个公钥绑定到一个真实的身份（比如 "google.com" 这个域名，或者“张三”这个人）。

##### **Part 2: The Ultimate Challenge - Binding a Public Key to a Real-World Identity**

We now have PKE for confidentiality and digital signatures for authenticating message origins, but a new, more fundamental problem emerges

Scenario: User Logging into a Website

- Alice wants to securely send her password pwd to a server. She needs to encrypt it with the server's public key, pk_s.

- The Problem: How can Alice be sure that the pk_s she obtained truly belongs to the website she is visiting and not to a man-in-the-middle attacker?

The New Challenge: From "Binding a Message" to "Binding an Identity"

- A digital signature can bind a message to a public key.

- Now, we need a mechanism to bind a public key to a real-world identity (e.g., the domain name "google.com" or the person "John Doe").

##### **第三部分：解决方案——公钥基础设施 (PKI)**

为了解决公钥与身份的绑定问题，我们借鉴了现实世界的身份认证体系。

现实世界的类比:

1. 你怎么证明你是你？——出示由权威机构（如政府）颁发的身份证或护照。

1. 这张证件将你的身份信息（姓名、照片等）与一个物理实体（你本人）绑定在一起，并由权威机构的“信誉”来背书。

数字证书 (Digital Certificate):

1. 在数字世界，我们创造了数字证书来扮演身份证的角色。

1. 一个数字证书包含：

1. 一个公钥 pk。

1. 这个公钥所属的身份信息（如域名 "google.com"，公司名 "Google Inc." 等）。

1. 其他信息（有效期、序列号等）。

1. 最关键的是，整个证书由一个受信任的权威机构 (Certification Authority, CA) 用其自己的私钥进行数字签名

信任链 (Chain of Trust):

1. 信任的起点: 你的操作系统或浏览器会预装一些顶级的、全球公认的 根 CA (Root CA) 的公钥。这是整个信任体系的锚点。

1. 验证过程:

1. 当你的浏览器访问 Google 时，Google 的服务器会发来它的证书 cert_G。

1. 这个证书可能是由一个中级 CA（比如 CA_Intermediate）签发的。

1. 你的浏览器会检查 cert_G 上的签名。为了验证这个签名，它需要 CA_Intermediate 的公钥。

1. CA_Intermediate 的公钥本身也包含在一个证书里，这个证书则是由更高级别的 CA（最终追溯到根 CA）签发的。

1. 浏览器会沿着这条证书链一路向上验证，直到它找到一个自己已经信任的根 CA 公钥。如果整条链上的所有签名都有效，浏览器就在地址栏显示一把“安全锁”，表示它相信这个网站的身份是真实的。

##### **Part 3: The Solution - Public Key Infrastructure (PKI)**

To solve the problem of binding public keys to identities, we borrow a model from our real-world identity systems

Real-World Analogy:

- How do you prove you are you? — You present an ID card or passport issued by an authority (like a government).

- This document binds your identity information (name, photo, etc.) to a physical entity (you) and is backed by the credibility of the issuing authority.

Digital Certificates:

- In the digital world, we created digital certificates to play the role of ID cards.

- A digital certificate contains:

- A public key pk.

- The identity information to which the key belongs (e.g., domain "google.com," company "Google Inc.").

- Other metadata (validity period, serial number, etc.).

- Most importantly, the entire certificate is digitally signed by a trusted Certification Authority (CA) using its own private key.

The Chain of Trust:

- The Anchor of Trust: Your operating system or browser comes pre-installed with the public keys of a few top-level, globally recognized Root CAs. This is the starting point of the entire trust system.

- The Verification Process:

1. When your browser connects to Google, the server presents its certificate, cert_G.

1. This certificate might be signed by an intermediate CA, say CA_Intermediate.

1. Your browser checks the signature on cert_G. To do this, it needs the public key of CA_Intermediate.

1. The public key of CA_Intermediate is itself contained in a certificate, which is signed by a higher-level CA (eventually tracing back to a Root CA).

1. The browser follows this certificate chain upwards, verifying each signature along the way, until it reaches a Root CA public key that it already trusts. If all signatures in the chain are valid, the browser displays a "secure lock" icon, indicating that it trusts the identity of the website.

##### **第四部分：PKI 的挑战与发展**

PKI 虽然是目前互联网信任的基石，但它也并非完美，面临着诸多挑战。

- 中心化问题: 依赖少数几个 CA，如果 CA 本身被攻破或行为不端（例如，签发了假的证书），会造成巨大的安全风险。这被称为单点故障 (Single Point of Failure)。

- 证书透明度 (Certificate Transparency, CT): 为了应对 CA 的作恶风险，现在要求所有公开信任的证书都必须发布到一个公开的、可审计的日志中。任何人都可以监控这些日志，及时发现可疑的证书。

- 证书钉扎 (Certificate Pinning): 应用程序可以“记住”某个特定网站应该使用哪个证书或哪个 CA，如果下次连接时发现证书变了，就发出警告。

- 去中心化 PKI (DPKI): 一些新兴的技术（如基于区块链的方案）正在探索去中心化的身份和信任管理模式，试图摆脱对中心化 CA 的依赖。

##### **Part 4: Challenges and Evolution of PKI**

While PKI is the bedrock of internet trust today, it is not perfect and faces several challenges.

- Centralization Issues: Reliance on a few CAs means that if a CA is compromised or acts maliciously (e.g., issues fake certificates), it can cause a massive security failure. This is a Single Point of Failure.

- Certificate Transparency (CT): To mitigate the risk of rogue CAs, there is now a requirement for all publicly trusted certificates to be published in public, auditable logs. Anyone can monitor these logs to detect suspicious certificates.

- Certificate Pinning: An application can "remember" which certificate or CA a specific website should use. If the certificate changes unexpectedly on a subsequent connection, it raises an alarm.

- Decentralized PKI (DPKI): Emerging technologies (like blockchain-based solutions) are exploring decentralized models for identity and trust management, attempting to move away from the reliance on centralized CAs.

零知识证明

证明知识而不是泄露知识本身

Schnorr身份认证协议

同态加密

对密文进行计算

云计算应用

### 11.Advanced Topics

- Zero-Knowledge Proofs

- Prove knowledge without revealing the knowledge itself

- Schnorr Authentication Protocol

- Homomorphic Encryption

- Perform computations on ciphertexts

- Cloud computing applications

- PKI（全局基础设施）PKI (Public Key Infrastructure)

**PKI（公钥基础设施）**是管理公钥加密系统的完整框架。

PKI is the complete framework for managing public-key cryptosystems.

#### 核心组件

##### 1. 证书颁发机构（CA - Certificate Authority）

- 作用：签发和管理数字证书

- 职责：

- 验证用户身份

- 颁发数字证书

- 维护状态证书

- 处理吊证书销

##### 2. 数字证书

- 内容：

- 用户客户端

- 用户身份信息

- CA的数字签名

- 近等元数据

- 格式：通常使用X.509标准

##### 3.证书吊销列表（CRL - 证书吊销列表）

- 目的： 上市已被吊销的证书

- 更新：定期发布

- 替代方案：OCSP（在线证书状态协议）

- Core components:

- 1.Certificate Authority (CA)

- • Role: issue and manage digital certificates

- • Responsibilities:

- o Verify user identities

- o Issue digital certificates

- o Maintain certificate status

- o Handle certificate revocation

- 2.Digital Certificate

- • Contents:

- o Subject’s public key

- o Subject identity information

- o CA’s digital signature

- o Associated metadata

- • Format: typically the X.509 standard

- 3.Certificate Revocation List (CRL)

- • Purpose: list certificates that have been revoked

- • Updates: published periodically

- • Alternative: OCSP (Online Certificate Status Protocol)

PKI的工作流程：

1. 证书申请：用户向CA提交一份和身份证明

1. 身份验证：CA验证用户身份

1. 签发证书：CA用自己的私钥签署证书

1. 证书分发：用户获得其全局的证书

1. 证书验证：其他人使用CA的全局验证证书

1. 证书管理：处理更新、吊销等

信任链：

根CA证书（自签名）    ↓中间CA证书    ↓用户证书

- PKI Workflow:

- Certificate request: user submits identity proof to CA

- Identity validation: CA verifies user identity

- Certificate issuance: CA signs certificate with its private key

- Certificate distribution: user obtains their issued certificate

- Certificate validation: others use the CA’s public key to validate the certificate

- Certificate management: handle renewal, revocation, etc.

- Trust Chain:

- Root CA Certificate (self-signed)

- ↓

- Intermediate CA Certificate

- ↓

- End-entity (User) Certificate

#### 实际应用：

- HTTPS：网站身份验证

- 邮件签名：S/MIME

- 代码签名：软件权限

- 身份认证：智能卡、门禁系统

- VPN：安全通信

- Real-world Applications:

- • HTTPS: website authentication

- • Email signing: S/MIME

- • Code signing: software integrity

- • Identity authentication: smart cards, access control

- • VPN: secure communications

#### PKI的挑战：

- 根CA让步：影响整个信任链

- 吊销证书：实时性问题

- 关键管理：复杂的生命周期管理

- 跨域信任：不同PKI系统间的互操作

- PKI Challenges:

- • Root CA compromise: affects the entire trust chain

- • Certificate revocation: real-time status issues

- • Key management: complex lifecycle management

- • Cross-domain trust: interoperability between different PKI systems

## 课程逻辑：

第1-6章建立了基础密码学原语（OTP、PRG、PRF、流密码等）·  第1-3章：完美安全的理论基础  第4章：向计算安全的过渡  第5章及以后：具体的计算安全方案

第 7 章开始讨论如何使用这些原语组合

第8章专门讲MAC，与第7章的认证加密互呼应
