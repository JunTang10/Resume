# CSEC5614 — Data Privacy

## CSEC5614 Data Privacy: Theory and Practice - Lecture 1 整理

### 课程内容框架

#### 讲座路线图

- 为什么学习这门课程？

- 数据隐私定义  隐私的法律层面

- 数据治理  识别敏感和个人数据

- 匿名化技术

- ·  Why study this course?

- ·  ·  Definition of data privacy

- ·  ·  Legal aspects of privacy

- ·  ·  Data governance

- ·  ·  Identification of sensitive and personal data

- ·  ·  Anonymization techniques

- ·

- 数据隐私的重要性Importance of Data Privacy

#### 隐私是基本人权

- 确保个人控制其个人信息

- 在互联互通的世界中，数据不断被收集、分析和使用

- 保护个人免受数据泄露、身份盗用、监控等风险

- Privacy is a fundamental human right.

- Ensures individuals maintain control over their personal information.

- In a connected world, data is constantly being collected, analyzed, and used.

- Protects individuals from risks such as data breaches, identity theft, and surveillance.

#### 当前挑战

- 数据收集和画像: 公司收集大量用户数据构建详细档案

- 数据泄露和网络安全: 大规模数据泄露频发

- 第三方数据共享: 数据所有权和控制权问题

- 缺乏透明度: 用户不完全了解数据使用方式

- 隐私法规合规: 必须遵守GDPR、CCPA等各种隐私法规

- Current Challenges

- Data collection and profiling: Companies collect vast amounts of user data to build detailed profiles.

- Data breaches and cybersecurity: Large-scale breaches occur frequently.

- Third-party data sharing: Issues around ownership and control of data.

- Lack of transparency: Users are not fully aware of how their data is used.

- Privacy regulation compliance: Organizations must comply with GDPR, CCPA, and other regulations.

#### 近期重大隐私事件

- Twitter数据泄露（2022年7月）: 540万用户受影响

- Optus数据泄露（2022年9月）: 1000万客户受影响

- Facebook数据泄露（2023年4月）: 5.33亿用户受影响

- Google Cloud数据泄露（2023年5月）: 多个企业客户受影响

- Microsoft数据泄露（2023年1月）: 240万用户受影响

- ChatGPT数据泄露（2023年3月）: 不到100万用户受影响

- Recent Major Privacy Incidents

- Twitter (July 2022): 5.4 million users affected.

- Optus (September 2022): 10 million customers affected.

- Facebook (April 2023): 533 million users affected.

- Google Cloud (May 2023): Multiple enterprise customers affected.

- Microsoft (January 2023): 2.4 million users affected.

- ChatGPT (March 2023): Fewer than 1 million users affected.

### 数据隐私定义

#### 简单定义

- 数据隐私通过访问、使用、处理和存储控制来保护数据和个人，从而为数据提供更多隐私保护。

#### 复合概念

- 数据隐私是一个复杂概念，涉及多个领域：

- 法律层面: 法规、判例法和政策

- 技术层面: 实现和保护机制

- 社会文化层面: 集体理解和社会边界

- 个人层面: 个人控制和偏好

#### 新兴定义

- 隐私不是对数据的控制，也不是数据的属性。它是对社会情境边界的集体理解，以及如何在这些边界内运作的知识。

- Definition of Data Privacy

- Simple Definition  
Data privacy protects data and individuals by controlling access, usage, processing, and storage.

- Composite Concept  
Data privacy is a complex concept across multiple dimensions

- Legal: Laws, case law, and policies.

- Technical: Implementation and protection mechanisms.

- Socio-cultural: Collective understanding and social boundaries.

- Individual: Personal control and preferences.

- Emerging Definition  
Privacy is not control of data or a property of data itself. It is a collective understanding of social boundaries and knowledge of how to operate within them.

### 法律层面：主要隐私法规

#### 1. 澳大利亚隐私法案1988

- 澳大利亚隐私原则（APP）: 指导个人信息处理的13项原则

- 2024年隐私修正案:

- 人肉搜索刑事犯罪

- 自动化决策透明度

- 儿童在线隐私法规

- 严重侵犯隐私的法定侵权行为

- Legal Dimension: Major Privacy Regulation

- Australia’s Privacy Act 1988

- Australian Privacy Principles (APP): 13 principles guiding personal information handling.

- 2024 Privacy Amendment:

- Doxxing criminalized.

- Transparency in automated decision-making.

- Regulations for children’s online privacy.

- Statutory tort for serious invasions of privacy.

#### 2. 欧盟通用数据保护条例（GDPR）

- 生效时间: 2018年5月25日

- 适用范围: 全球范围内处理EU/EEA公民数据的组织

- 核心要求:

- 明确同意数据处理

- 告知数据使用情况

- 实施安全措施

- 个人数据权利（访问、纠正、删除）

- 罚款: 最高年度全球收入的4%或2000万欧元

- EU General Data Protection Regulation (GDPR)

- Effective: May 25, 2018.

- Scope: Any organization worldwide processing EU/EEA citizens’ data.

- Core requirements:

- Explicit consent for data processing.

- Notification of data usage.

- Implementation of security measures.

- Rights of individuals (access, rectification, deletion).

- Penalties: Up to 4% of annual global turnover or €20 million.

#### 3. 加州消费者隐私法案（CCPA）

- 生效时间: 2020年1月1日

- 适用范围: 加州居民

- 核心权利:

- 了解收集的个人信息

- 请求删除数据

- 选择退出数据销售

- 透明度要求: 披露数据收集实践

- California Consumer Privacy Act (CCPA)

- Effective: January 1, 2020.

- Scope: California residents.

- Core rights:

- Know what personal information is collected.

- Request deletion of data.

- Opt out of data sales.

- Transparency requirement: Disclosure of data practices.

#### 4. 英国数据保护法案（DPA）

- 实施时间: 2018年

- 与GDPR对齐: 替代1998年版本

- 覆盖范围: 英国个人数据处理

- 权利: 与GDPR类似的个人权利

- UK Data Protection Act (DPA) 2018

- Implemented: 2018 (replaced 1998 Act).

- Aligns with GDPR.

- Coverage: Processing of UK residents’ personal data.

- Rights: Similar to GDPR individual rights.

#### 法规复杂性比较

- GDPR最复杂的原因:

- 全球影响范围

- 严格要求

- 广泛的数据主体权利

- 数据保护官要求

- 跨境数据传输限制

- Why GDPR is the most complex

- Global scope.

- Strict requirements.

- Extensive individual rights.

- Data Protection Officer (DPO) requirement.

- Cross-border data transfer restrictions.

### 数据治理

#### 定义与目标

- 数据治理涉及在数据整个生命周期中管理数据的政策、程序和指导原则的创建和执行。

- Data Governance

- Definition & Goals  
Data governance involves creating and enforcing policies, procedures, and guidelines to manage data throughout its lifecycle.

#### 核心功能

- 确保数据保护和安全

- 控制数据访问

- 防止未经授权使用或披露个人数据

- 实现隐私法规合规

- Core Functions

- Ensure data protection and security.

- Control access to data

- Prevent unauthorized use or disclosure.

- Ensure compliance with privacy regulations.

#### 权利转移概念

- 当个人将数据提供给组织时，会转移某些权利。例如，使用网站或应用程序时，您同意数据处理者的隐私政策、条款和条件。

- Concept of Rights Transfer  
When individuals provide data to organizations, certain rights are transferred. For example, by using a website or app, individuals agree to the data processor’s privacy policy, terms, and conditions.

#### 数据科学家需要考虑的关键问题

- 收集谁的数据？

- 如何收集和增强数据？

- 收集后如何处理数据？

- 数据存储在哪里？

- 谁可以访问数据？

- 数据如何被使用？

- 如何保护数据安全？

- 如何确保合规性？

- Key Questions for Data Scientists

- Whose data is being collected?

- How is data collected and enriched?

- How is data processed after collection?

- Where is the data stored?

- Who has access to it?

- How is it used?

- How is it secured?

- How is compliance ensured?

### 敏感数据识别

#### 敏感数据类别

##### 1. 个人身份信息（PII）

- 能够识别个人的数据：

- 全名、电子邮件地址、性别

- 邮寄地址、IP地址、社交媒体档案

- 电话号码、社会保障号码

- 信用卡号码、生日

- 健康记录、生物识别数据

##### 2. 个人相关数据

- 与个人相关但不属于PII的数据：

- 兴趣、信仰、位置

- 线上线下行为和活动

##### 3. 专有和机密数据

- 出于合同或商业目的被视为敏感的数据：

- 商业秘密

- 产品专有信息

- 保密协议下的信息

- Sensitive Data Identification

- Categories of Sensitive Data

- Personally Identifiable Information (PII):

- Full name, email address, gender.

- Mailing address, IP address, social media profiles.

- Phone number, Social Security Number.

- Credit card number, date of birth.

- Health records, biometric data.

- Personal-related Data (Non-PII):

- Interests, beliefs, location.

- Online and offline behaviors and activities.

- Proprietary and Confidential Data:

- Trade secrets.

- Proprietary product information.

- Information under confidentiality agreements.

#### 隐私偏好的复杂性

- 不同个人对以下信息的敏感性认知不同：

- 位置信息（工作地点 vs 家庭住址）

- 政治倾向和投票历史

- 宗教信仰和实践

- 个人关系和社交连接

- 日常生活习惯

- 消费偏好

- Complexity of Privacy Preferences  
Individuals perceive sensitivity differently for:

- Location (workplace vs. home address).

- Political affiliation and voting history.

- Religious beliefs and practices.

- Personal relationships and social networks.

- Daily habits.

- Consumer preferences.

#### 数据组合的风险

- 位置追踪可以揭示工作地点、居住地、个人活动

- Facebook点赞可以推断性别、性取向、政治信仰

- 任何个人生成的数据都可能具有可识别性

- Risks of Data Combination

- Location tracking can reveal workplace, home, and activities.

- Facebook “likes” can infer gender, sexual orientation, political views.

- Any user-generated data can become identifiable.

#### PII识别步骤示例

- 以在线购物平台客户数据为例：

- 数据字段:

- 名字、姓氏

- 电子邮件地址（直接PII）

- 电话号码

- 出生日期

- 配送地址

- 支付信息（信用卡号）

- 订单历史

- 识别过程:

- 审查数据字段

- 识别明确PII

- 识别隐含PII

- 评估敏感信息

- 考虑上下文

- 检查当地法规

- 考虑匿名化技术

- 数据访问控制

- 数据保留策略

- ·  Data fields: Name, email (direct PII), phone, date of birth, address, payment info, order history.

- ·  ·  Steps: Review fields → Identify explicit PII → Identify implicit PII → Assess sensitivity → Consider context → Check regulations → Apply anonymization.

- ·

### 数据匿名化技术

#### 传统方法的局限性

- 早期方法（统计披露控制）包括：

- 抑制特定列或属性

- 聚合行属性

- 混淆或变换方法

- 这些方法无法保证隐私，因为新的隐私攻击方法不断发展。

- Modern Anonymization Methods

- Data Masking – Hide values using techniques like shuffling, encryption, replacement.

- Pseudonymization – Replace identifiers with fake ones (e.g., “John Smith” → “Mark Spencer”).

- Generalization – Reduce specificity (e.g., remove house number but keep street).

- Data Swapping – Shuffle attribute values across records.

- Perturbation – Add random noise or round values.

- Synthetic Data – Generate artificial data based on statistical models.

- Differential Privacy – Add mathematical noise to query results to protect individuals while preserving statistical accuracy.

#### 现代匿名化技术

##### 1. 数据掩码

- 用修改值隐藏数据

- 创建数据库镜像版本并应用修改技术

- 字符打乱、加密、替换

- 使逆向工程或检测变得不可能

##### 2. 伪名化

- 用假标识符替换私人标识符

- 例如：将"John Smith"替换为"Mark Spencer"

- 保持统计准确性和数据完整性

##### 3. 泛化

- 故意删除部分数据使其不易识别

- 将数据修改为范围或广泛区域

- 例如：删除地址中的门牌号但保留街道名

##### 4. 数据交换

- 重新排列数据集属性值

- 使其不对应原始记录

- 对包含标识符的属性影响更大

##### 5. 数据扰动

- 通过四舍五入和添加随机噪声略微修改原始数据集

- 需要合适的比例基础

- 平衡匿名化强度和数据实用性

##### 6. 合成数据

- 算法制造的与真实事件无关的信息

- 基于原始数据集模式创建统计模型

- 使用标准差、中位数、线性回归等技术

##### 7. 差分隐私

- 最佳技术: 在一般情境下被认为是最好的技术

- 数学框架，在查询响应中添加噪声

- 保护个人隐私的同时提供统计准确结果

- 在数据实用性和隐私保护之间取得平衡

- 具有坚实的数学基础

- Modern Anonymization Methods

- Data Masking – Hide values using techniques like shuffling, encryption, replacement.

- Pseudonymization – Replace identifiers with fake ones (e.g., “John Smith” → “Mark Spencer”).

- Generalization – Reduce specificity (e.g., remove house number but keep street).

- Data Swapping – Shuffle attribute values across records.

- Perturbation – Add random noise or round values.

- Synthetic Data – Generate artificial data based on statistical models.

- Differential Privacy – Add mathematical noise to query results to protect individuals while preserving statistical accuracy.

#### 主要公司的应用实例

- Apple: 在Siri和应用使用分析中实施差分隐私

- Google: 在Chrome浏览器中使用差分隐私收集使用数据

- Facebook: 使用多种技术组合进行广告定位和内容个性化

- Microsoft: 跨服务使用技术组合，专注于数据分析和隐私保护

- LinkedIn: 更注重数据掩码和令牌化保护敏感用户信息

- Industry Applications

- Apple: Differential privacy in Siri and app analytics.

- Google: Chrome usage data collection.

- Facebook: Combined techniques for ads and personalization.

- Microsoft: Hybrid methods across services.

- LinkedIn: Data masking and tokenization for sensitive information.

### 数据匿名化应用场景

#### 1. 医学研究

- 研究疾病在特定人群中的流行率

- 保护患者隐私并遵守HIPAA标准

#### 2. 营销增强

- 在线零售商改进客户接触方式

- 数字广告、社交媒体、电子邮件、网站优化

- 在保持合规的同时利用数据进行营销

#### 3. 软件和产品开发

- 使用真实数据开发工具

- 处理现实挑战、执行测试、改进软件效果

- 开发环境安全性较低，需要匿名化保护

#### 4. 业务绩效

- 收集员工相关信息提高生产力

- 优化绩效、增强员工安全

- 通过匿名化和聚合获得有价值信息而不让员工感到被监控

- Applications of Data Anonymization

- Medical Research: Disease prevalence studies while protecting patient privacy (HIPAA compliance).

- Marketing: Retailers optimizing customer engagement while maintaining compliance.

- Software & Product Development: Testing with real-like data in less secure environments.

- Business Performance: Using aggregated, anonymized employee data to improve productivity and safety.

### 核心概念总结

#### 数据治理与隐私的关系

- 数据治理和数据隐私密切相关且相互依存

- 数据治理通过政策、程序和指导原则确保数据保护

- 帮助组织实现隐私法规合规

- 管理数据收集、增强和使用的整个过程

#### 敏感数据的广义定义

- "敏感数据"不仅指PII，还包括更广泛的个人相关数据，这些数据可能与其他信息结合使用来识别个人或小群体。

#### 匿名化的现实意义

- 虽然无法保证攻击者学不到任何信息，但可以量化可能泄露的信息量，并在数据实用性和隐私保护之间找到平衡。

- Core Concept Summary

- Relationship between Data Governance and Privacy

- Data governance and privacy are interdependent.

- Governance ensures protection through policies and compliance.

- It manages collection, enrichment, and usage across the lifecycle.

- Broad Definition of Sensitive Data

- Sensitive data includes not only PII but also personal-related data that, when combined, can identify individuals or groups.

- Reality of Anonymization

- Absolute privacy cannot be guaranteed, but information leakage can be quantified, balancing utility and protection.

### 学习要点

- 理解隐私的多维性: 法律、技术、社会、文化和个人层面

- 掌握敏感数据识别: 不仅是直接PII，还要考虑组合数据的风险

- 熟悉主要隐私法规: GDPR、CCPA、澳大利亚隐私法案等

- 了解匿名化技术: 从传统方法到现代差分隐私

- 认识实际应用: 医学研究、营销、软件开发、业务分析等场景

- 培养隐私意识: 在数据科学工作中始终考虑隐私影响

- Learning Outcomes

- Understand the multidimensional nature of privacy (legal, technical, socio-cultural, personal).

- Master identification of sensitive data (PII and beyond).

- Be familiar with major regulations (GDPR, CCPA, Australia’s Privacy Act, etc.).

- Learn anonymization techniques (from traditional to differential privacy).

- Recognize real-world applications (research, marketing, software, business)

- Develop privacy awareness in all data science work.

## CSEC5614 Data Privacy: Theory and Practice - Lecture 2 熵与差分隐私

### 第一部分：信息量度与熵的理论基础

#### 1.1 信息的本质理解Understanding the Nature of Information

- 经典案例分析：

- "狗咬人"：概率高 → 信息量小 → 不构成新闻

- "人咬狗"：概率极低 → 信息量大 → 头版新闻

- Classic Case Analysis:

- "Dog bites man": High probability → Low information content → Not newsworthy

- "Man bites dog": Extremely low probability → High information content → Front-page news

- 核心原理：信息量与事件发生概率成反比关系

- 数学表达：I(x) = -log P(x)

- 概率越小，不确定性越大，信息量越大

- Core Principle: Information content is inversely related to the probability of occurrence

- Mathematical expression: I(x) = -log P(x)

- Lower probability → Higher uncertainty → Greater information content

#### 1.2 熵的深入理解In-depth Understanding of Entropy

- 定义与特性：

- 熵是数据科学和信息论中的基本概念

- 用于量化数据集中的不确定性或随机性程度

- 广泛应用于机器学习决策树算法（ID3, C4.5）

- Definition and Characteristics:

- Entropy is a fundamental concept in data science and information theory

- Used to quantify the degree of uncertainty or randomness in datasets

- Widely applied in machine learning decision tree algorithms (ID3, C4.5)

- 数学公式：

- H(D) = -Σ P(y) log₂ P(y)

- 其中：

- H(D)：数据集D的熵值

- P(y)：类别y在数据集中出现的概率

- 求和覆盖所有可能的类别

- Mathematical Formula:

- H(D) = -Σ P(y) log₂ P(y)

- Where:

- H(D): Entropy value of dataset D

- P(y): Probability of class y appearing in the dataset

- Summation covers all possible classes

- 直观理解：

- 高熵：数据分布接近均匀，预测困难，不确定性大

- 低熵：数据分布偏向某类，预测相对容易，确定性高

- Intuitive Understanding:

- High entropy: Data distribution approaches uniformity, prediction is difficult, high uncertainty

- Low entropy: Data distribution favors certain classes, prediction is relatively easy, high certainty

#### 1.3 熵的计算实例Entropy Calculation Examples

- 实例1：水果分类

- 数据集：[苹果, 苹果, 橙子, 苹果, 橙子, 苹果, 橙子, 橙子, 苹果, 苹果]

- 总计：6个苹果，4个橙子

- 概率计算：

- - P(苹果) = 6/10 = 0.6

- - P(橙子) = 4/10 = 0.4

- 熵值计算：H(D) = -(0.6 × log₂(0.6) + 0.4 × log₂(0.4))     = -(0.6 × (-0.737) + 0.4 × (-1.322))

- = -(-0.442 + -0.529)     = 0.971

- Example 1: Fruit Classification

- Dataset: [Apple, Apple, Orange, Apple, Orange, Apple, Orange, Orange, Apple, Apple]

- Total: 6 Apples, 4 Oranges

- Probability Calculation:- P(Apple) = 6/10 = 0.6- P(Orange) = 4/10 = 0.4

- Entropy Calculation:H(D) = -(0.6 × log₂(0.6) + 0.4 × log₂(0.4))     = -(0.6 × (-0.737) + 0.4 × (-1.322))     = -(-0.442 + -0.529)     = 0.971

- 实例2：极端分布对比

- 如果数据变为：9个苹果，1个橙子

- - P(苹果) = 0.9, P(橙子) = 0.1

- - H(D) = -(0.9 × log₂(0.9) + 0.1 × log₂(0.1)) = 0.47

- 解释：熵值从0.971降到0.47，表明不确定性显著降低

- Example 2: Extreme Distribution Comparison

- If data changes to: 9 Apples, 1 Orange

- - P(Apple) = 0.9, P(Orange) = 0.1

- - H(D) = -(0.9 × log₂(0.9) + 0.1 × log₂(0.1)) = 0.47

- Explanation: Entropy drops from 0.971 to 0.47, indicating significantly reduced uncertainty

#### 1.4 熵在决策中的应用1.4 Application of Entropy in Decision Making

- 硬币投掷分析：

- 公平硬币：[正面, 反面, 正面, 反面] → 高熵 → 难以预测下次结果

- 偏重硬币：[反面, 反面, 反面, 反面] → 低熵 → 可预测下次为反面

- Coin Toss Analysis:

- Fair coin: [Heads, Tails, Heads, Tails] → High entropy → Difficult to predict next result

- Biased coin: [Tails, Tails, Tails, Tails] → Low entropy → Predictable next result as Tails

### 第二部分：熵在数据隐私中的核心作用

#### 2.1 数据隐私的基本挑战

- 平衡点问题：

- 数据效用：数据对分析研究的有用程度

- 数据隐私：保护个人身份和敏感信息

- 目标：最大化效用同时最小化隐私泄露风险

- Balance Point Problem:

- Data Utility: The usefulness of data for analysis and research

- Data Privacy: Protection of personal identity and sensitive information

- Goal: Maximize utility while minimizing privacy leakage risk

#### 2.2 熵在隐私评估中的三大功能

- 功能1：量化信息内容

- 高熵数据集 → 信息量大 → 更难识别特定个人低熵数据集 → 信息量小 → 更容易重新识别

- Function 1: Quantifying Information Content

- High entropy dataset → Large information content → Harder to identify specific individualsLow entropy dataset → Small information content → Easier to re-identify

- 功能2：评估可识别性风险

- 低熵 = 数据可预测性高 = 重识别风险大

- 高熵 = 数据随机性强 = 匿名程度高

- Function 2: Assessing Identifiability Risk

- Low entropy = High data predictability = High re-identification risk

- High entropy = Strong data randomness = High anonymity level

- 功能3：指导匿名化策略

- 针对高熵属性：可能需要更复杂的保护措施

- 针对低熵属性：相对简单的处理即可

- Function 3: Guiding Anonymization Strategies

- For high entropy attributes: May require more complex protection measures

- For low entropy attributes: Relatively simple processing suffices

#### 2.3 医院数据隐私案例详细分析

- 原始数据集示例：

- 患者ID | 年龄 | 性别 | 疾病

- 1001   | 45   | 男   | 糖尿病

- 1002   | 67   | 女   | 高血压

- 1003   | 23   | 男   | 哮喘...

- Patient ID | Age | Gender | Disease

- 1001       | 45  | Male   | Diabetes

- 1002       | 67  | Female | Hypertension

- 1003       | 23  | Male   | Asthma

- 匿名化处理：

- 年龄 | 性别 | 疾病

- 45   | 男   | 糖尿病

- 67   | 女   | 高血压

- 23   | 男   | 哮喘...

- Age | Gender | Disease

- 45  | Male   | Diabetes

- 67  | Female | Hypertension

- 23  | Male   | Asthma

- 熵值分析：

- 年龄属性熵分析：

- 取值范围：0-120岁

- 分布：相对分散

- 熵值：较高

- 风险评估：包含大量信息，隐私风险高

- ·  Age Attribute Entropy Analysis:

- Value range: 0-120 years

- Distribution: Relatively dispersed

- Entropy value: High

- Risk assessment: Contains large amount of information, high privacy risk

- 疾病属性熵分析：

- 取值：有限类别（糖尿病、哮喘、高血压）

- 分布：相对集中

- 熵值：较低

- 风险评估：信息相对有限，隐私风险中等

- ·  Disease Attribute Entropy Analysis:

- Values: Limited categories (Diabetes, Asthma, Hypertension)

- Distribution: Relatively concentrated

- Entropy value: Low

- Risk assessment: Relatively limited information, medium privacy risk

- 隐私保护策略：

- 年龄：应用年龄段泛化（如20-30岁，30-40岁）或添加噪声

- 疾病：可能只需要简单的类别合并

- Privacy Protection Strategy:

- Age: Apply age range generalization (e.g., 20-30 years, 30-40 years) or add noise

- Disease: May only need simple category merging

#### 2.4 数据共享的隐私保护技术

- 技术1：匿名化与泛化

- 移除直接标识符（姓名、地址、ID）

- 将具体数值替换为范围（年龄→年龄段）

- Technology 1: Anonymization and Generalization

- Remove direct identifiers (names, addresses, IDs)

- Replace specific values with ranges (age → age groups)

- 技术2：数据扰动

- 添加随机噪声

- 保持统计特性不变

- Technology 2: Data Perturbation

- Add random noise

- Maintain statistical properties unchanged

- 技术3：数据子集共享

- 只共享代表性样本

- 减少完整信息暴露

- Technology 3: Data Subset Sharing

- Share only representative samples

- Reduce complete information exposure

- 技术4：加密共享

- 传输和存储加密

- 授权解密访问

- Technology 4: Encrypted Sharing

- Encrypted transmission and storage

- Authorized decryption access

### 第三部分：差分隐私理论与机制Differential Privacy Theory and Mechanisms

#### 3.1 差分隐私的核心思想Core Concepts of Differential Privacy

- 传统方法的局限性：

- 匿名化：可能被反匿名化攻击破解

- 聚合：仍可能泄露个人信息

- 结果导向：只关注输出，忽视过程安全

- Limitations of Traditional Methods:

- Anonymization: Can be compromised by de-anonymization attacks

- Aggregation: May still leak personal information

- Result-oriented: Focus only on output, neglecting process security

- 差分隐私的创新：

- 过程导向：关注数据处理过程的隐私保护

- 数学严谨：提供可证明的隐私保障

- 动态适应：可构建动态系统，长期跟踪隐私损失

- Innovations of Differential Privacy:

- Process-oriented: Focus on privacy protection in data processing procedures

- Mathematically rigorous: Provides provable privacy guarantees

- Dynamic adaptation: Can build dynamic systems and track privacy loss over time

#### 3.2 差分隐私的严格定义Formal Definition of Differential Privacy

- 数学定义： 对于相邻数据集D和D'（仅相差一个记录），如果算法M满足：

- Pr[M(D) ∈ S] ≤ e^ε × Pr[M(D') ∈ S]

- 则称M满足ε-差分隐私。

- Mathematical Definition: For neighboring datasets D and D' (differing by only one record), if algorithm M satisfies:

- Pr[M(D) ∈ S] ≤ e^ε × Pr[M(D') ∈ S]

- Then M satisfies ε-differential privacy.

- 直观理解：

- 任何个人数据的存在与否不会显著改变查询结果

- 攻击者无法确定特定个人是否在数据集中

- Intuitive Understanding:

- The presence or absence of any individual's data does not significantly change query results

- Attackers cannot determine whether a specific individual is in the dataset

#### 3.3 差分隐私的核心组件详解Detailed Explanation of Core Components of Differential Privacy

- 组件1：查询敏感度（Sensitivity）

- 定义：Δf = max |f(D) - f(D')|

- 其中D和D'是相邻数据集

- Component 1: Query Sensitivity

- Definition: Δf = max |f(D) - f(D')|

- Where D and D' are neighboring datasets

- 实例计算：

- 计数查询：敏感度 = 1（添加/删除一个人最多改变计数1）

- 求和查询：敏感度 = 数值范围最大差

- 平均查询：敏感度 = (最大值-最小值)/n

- Example Calculations:

- Count queries: Sensitivity = 1 (adding/removing one person changes count by at most 1)

- Sum queries: Sensitivity = maximum difference in value range

- Average queries: Sensitivity = (max value - min value)/n

- 组件2：隐私预算（Epsilon, ε）

- ε值含义：- ε = 0: 完美隐私，但无任何效用- ε → ∞: 无隐私保护，但保持完整效用- 实际应用：通常在0.1-10之间选择

- Component 2: Privacy Budget (Epsilon, ε)

- ε value meanings:- ε = 0: Perfect privacy, but no utility- ε → ∞: No privacy protection, but maintains full utility- Practical applications: Usually chosen between 0.1-10

- ε值选择指南：

- ε < 1：强隐私保护，适用于高度敏感数据

- 1 ≤ ε ≤ 10：平衡保护，适用于中等敏感数据

- ε > 10：弱保护，适用于低敏感或聚合数据

- ε Value Selection Guide:

- ε < 1: Strong privacy protection, suitable for highly sensitive data

- 1 ≤ ε ≤ 10: Balanced protection, suitable for moderately sensitive data

- ε > 10: Weak protection, suitable for low-sensitive or aggregated data

- 组件3：拉普拉斯机制

- 噪声生成：Lap(b) ~ 拉普拉斯分布，其中 b = Δf/ε拉普拉斯分布PDF：f(x|μ,b) = (1/2b) × exp(-|x-μ|/b)其中μ=0为分布中心

- Noise Generation: Lap(b) ~ Laplace distribution, where b = Δf/ε Laplace Distribution PDF: f(x|μ,b) = (1/2b) × exp(-|x-μ|/b) Where μ=0 is the distribution center

#### 3.4 完整实施流程

- 步骤1：查询目标定义

- 示例：计算员工平均工资原始数据：[40000, 35000, 60000, 45000, 32000, 75000]真实平均：48,250

- Step 1: Query Objective Definition

- Example: Calculate average employee salaryOriginal data: [40000, 35000, 60000, 45000, 32000, 75000]True average: 48,250

- 步骤2：敏感度计算

- 工资范围：32000 - 75000敏感度Δf = (75000 - 32000)/6 ≈ 7167（假设数据集大小固定为6）

- Step 2: Sensitivity Calculation

- Salary range: 32000 - 75000Sensitivity Δf = (75000 - 32000)/6 ≈ 7167(Assuming fixed dataset size of 6)

- 步骤3：隐私预算选择

- 设定ε = 1.0（中等隐私保护）

- Step 3: Privacy Budget Selection

- Set ε = 1.0 (moderate privacy protection)

- 步骤4：噪声参数计算

- 拉普拉斯参数：b = Δf/ε = 7167/1 = 7167

- Step 4: Noise Parameter Calculation

- Laplace parameter: b = Δf/ε = 7167/1 = 7167

- 步骤5：噪声生成与添加

- 生成拉普拉斯噪声：假设 noise = +3500差分隐私结果：48250 + 3500 = 51750

- Step 5: Noise Generation and Addition

- Generate Laplace noise: Assume noise = +3500Differential privacy result: 48250 + 3500 = 51750

### 第四部分：工业级应用案例深度分析

#### 4.1 美国2020人口普查

- 背景与挑战：

- 宪法要求的十年一次人口统计

- 涉及3.3亿居民的详细信息

- 用于国会席位分配和联邦资金分配

- 隐私担忧在数字时代日益严重

- Background and Challenges:

- Constitutionally mandated decennial population count

- Involves detailed information of 330 million residents

- Used for congressional seat allocation and federal funding distribution

- Privacy concerns increasingly serious in the digital age

- 实施策略：

- 原始数据收集 → 差分隐私处理 → 统计发布具体流程：

- 收集人口统计数据（年龄、性别、种族、家庭规模等）

- 使用拉普拉斯或高斯机制添加噪声

- 聚合噪声化数据生成地区统计

- 发布经隐私保护的人口统计结果

- Implementation Strategy:

- Raw data collection → Differential privacy processing → Statistical publicationSpecific Process:1. Collect demographic data (age, gender, race, household size, etc.)2. Use Laplace or Gaussian mechanisms to add noise3. Aggregate noisy data to generate regional statistics4. Publish privacy-protected demographic statistics

- 技术细节：

- 示例：某邮政编码区域平均年龄统计真实数据：34.0岁添加噪声：±1.5岁随机噪声发布结果：33.5岁或34.8岁（随机确定）

- Technical Details:

- Example: Average age statistics for a zip code areaReal data: 34.0 yearsAdd noise: ±1.5 years random noisePublished result: 33.5 years or 34.8 years (randomly determined)

- 效果评估：

- 个人隐私：无法确定具体个人信息

- 统计准确性：大规模聚合保持高精度

- 政策制定：仍可支持资源分配决策

- Effect Evaluation:

- Personal Privacy: Specific personal information cannot be determined.

- Statistical Accuracy: High accuracy is maintained in large-scale aggregation.

- Policy Making: Still supports decision-making for resource allocation.

#### 4.2 Google Maps交通分析Google Maps Traffic Analysis

- 数据收集过程：

- 用户导航 → 位置数据收集 → 差分隐私处理 → 交通分析

- 详细实施步骤：

- Data Collection Process:

- User navigation → Location data collection → Differential privacy processing → Traffic analysis

- 步骤1：数据收集

- 当用户使用Google Maps导航时：- GPS坐标：精确到米级- 时间戳：精确到秒- 移动速度：实时计算- 路线信息：起点到终点

- Detailed Implementation Steps:

- Step 1: Data Collection

- When users navigate with Google Maps:- GPS coordinates: Accurate to meter level- Timestamps: Accurate to seconds- Movement speed: Real-time calculation- Route information: Origin to destination

- 步骤2：本地预处理

- 数据聚合：- 将精确位置聚合到道路段- 将实时速度转换为交通状态- 去除直接个人标识

- Step 2: Local Preprocessing

- Data aggregation:- Aggregate precise locations to road segments- Convert real-time speed to traffic conditions- Remove direct personal identifiers

- 步骤3：差分隐私应用

- 噪声添加示例：原始：A点到B点30分钟，速度40km/h噪声化：A点到B点28-32分钟，速度38-42km/h、

- tep 3: Differential Privacy Application

- Noise addition example:Original: Point A to B 30 minutes, speed 40km/hNoisy: Point A to B 28-32 minutes, speed 38-42km/h

- 步骤4：聚合分析

- 交通模式识别：- 早高峰：7-9点，平均速度下降30%- 晚高峰：17-19点，平均速度下降25%- 周末：全天相对畅通

- Step 4: Aggregated Analysis

- Traffic Pattern Identification:

- Morning Peak: 7–9 AM, average speed decreases by 30%.

- Evening Peak: 5–7 PM, average speed decreases by 25%.

- Weekends: Generally smooth traffic throughout the day.

- 隐私保护效果：

- 个人路线：无法追踪特定用户的完整行程

- 位置隐私：精确位置被噪声模糊

- 行为模式：个人习惯无法被识别

- Privacy Protection Effect:

- Personal Routes: Complete travel itineraries of specific users cannot be tracked.

- Location Privacy: Exact locations are blurred with added noise.

- Behavior Patterns: Individual habits cannot be identified.

#### 4.3 Apple Siri本地差分隐私Apple Siri Local Differential Privacy

- 核心创新：设备端隐私保护Core Innovation: Device-side Privacy Protection

- 详细技术流程：

- 阶段1：用户交互

- 用户："Hey Siri, 今天天气如何？"设备处理：- 语音识别（本地）- 意图理解（本地）- 回答生成（本地+云端）

- Detailed Technical Process:

- Phase 1: User Interaction

- User: "Hey Siri, what's the weather today?"Device processing:- Speech recognition (local)- Intent understanding (local)- Response generation (local + cloud)

- 阶段2：数据提取

- 分析目标数据：- 查询类型：天气查询- 查询时间：上午8:00- 查询频率：每日首次- 地理位置：大致区域（非精确位置）

- Phase 2: Data Extraction

- Analysis target data:- Query type: Weather query- Query time: 8:00 AM- Query frequency: First daily query- Geographic location: Approximate area (not precise location)

- 阶段3：本地差分隐私

- 噪声化过程：原始数据：{type: "weather", time: "08:00", location: "Sydney"}随机化选择：- 50%概率保持真实数据- 30%概率随机改变查询类型- 20%概率随机调整时间可能结果：- {type: "calendar", time: "08:05", location: "Sydney"}- {type: "weather", time: "08:00", location: "Sydney"}

- 阶段4：聚合分析

- 服务器端分析（百万级数据）：收到的噪声数据经统计还原：- 70%的早晨查询实际为天气相关- 峰值时间确实在8:00左右- 地理分布符合人口密度

- Phase 3: Local Differential Privacy

- Noise process:Original data: {type: "weather", time: "08:00", location: "Sydney"}Randomization choices:- 50% probability to maintain real data- 30% probability to randomly change query type- 20% probability to randomly adjust timePossible results:- {type: "calendar", time: "08:05", location: "Sydney"}- {type: "weather", time: "08:00", location: "Sydney"}

- 具体隐私预算配置：

- 不同功能的ε值设置：- QuickType输入建议：ε = 8，每日2次- Emoji建议：ε = 4，每日1次- Lookup搜索提示：ε = 4，每日2次- 健康类型统计：ε = 2，每日1次- Safari域名分析：ε = 4，每日2次

- Specific Privacy Budget Configuration:

- ε value settings for different features:- QuickType input suggestions: ε = 8, 2 times daily- Emoji suggestions: ε = 4, 1 time daily- Lookup search hints: ε = 4, 2 times daily- Health type statistics: ε = 2, 1 time daily- Safari domain analysis: ε = 4, 2 times daily

- 数据保留政策：

- 最长保留期：3个月

- 无个人标识符

- 不存储IP地址

- 定期数据清理

- Data Retention Policy:

- Maximum retention period: 3 months

- No personal identifiers

- IP addresses not stored

- Regular data cleaning

#### 4.4 其他工业应用

- Microsoft Bing搜索：

- 应用场景：搜索查询优化处理流程：1. 用户搜索查询收集2. 查询意图分析3. 差分隐私噪声添加4. 搜索结果排序优化隐私保护：- 个人搜索历史无法重构- 搜索偏好模式被模糊- 聚合趋势分析保持有效

- Microsoft Bing Search:

- Application scenario: Search query optimizationProcessing flow:1. User search query collection2. Query intent analysis3. Differential privacy noise addition4. Search result ranking optimizationPrivacy protection:- Personal search history cannot be reconstructed- Search preference patterns are blurred- Aggregate trend analysis remains effective

- Facebook用户行为分析：

- 应用场景：内容推荐算法改进处理流程：1. 用户互动数据收集（点赞、分享、评论）2. 行为模式特征提取3. 差分隐私保护处理4. 推荐算法训练优化效果：- 个人社交图谱保护- 内容偏好隐私保护- 群体行为趋势可分析

- Facebook User Behavior Analysis:

- Application scenario: Content recommendation algorithm improvementProcessing flow:1. User interaction data collection (likes, shares, comments)2. Behavioral pattern feature extraction3. Differential privacy protection processing4. Recommendation algorithm training optimizationEffects:- Personal social graph protection- Content preference privacy protection- Group behavioral trends analyzable

### 第五部分：熵与差分隐私的深层关联

#### 5.1 理论关联分析

- 高熵数据集场景：

- 示例：年龄数据[1, 15, 30, 45, 60, 75, 90, 105]特点：- 分布广泛，熵值高- 个人信息在群体中相对"稀释"- 需要的噪声量相对较少差分隐私策略：- 较小的噪声即可有效保护- ε值可以适当放宽- 数据效用损失较小

- High Entropy Dataset Scenario:

- Example: Age data [1, 15, 30, 45, 60, 75, 90, 105]Characteristics:- Wide distribution, high entropy value- Personal information relatively "diluted" in the group- Relatively less noise neededDifferential privacy strategy:- Smaller noise can provide effective protection- ε value can be appropriately relaxed- Smaller data utility loss

- 低熵数据集场景：

- 示例：年龄数据[40, 41, 42, 40, 41, 42, 40, 41]

- 特点：- 分布集中，熵值低- 个人信息容易突出- 需要更多噪声保护

- 差分隐私策略：- 需要更大的噪声掩盖- ε值需要更保守- 可能需要额外的保护措施

- Low-Entropy Dataset Scenario:

- Example: Age data [40, 41, 42, 40, 41, 42, 40, 41]  
Characteristics:

- Concentrated distribution, low entropy.

- Personal information stands out more easily.

- Requires stronger noise protection.

- Differential Privacy Strategy:

- Apply larger noise to mask individual values.

- Use a more conservative ε value.

- Consider additional protective measures.

#### 5.2 实际应用中的权衡5.2 Trade-offs in Practical Applications

- 噪声量计算公式：

- 所需噪声量 = f(敏感度, ε值, 数据熵)其中：- 高熵 → 可用较小噪声- 低熵 → 需用较大噪声- 敏感度固定时，熵是重要参考因子

- 动态调整策略：

- If 数据集熵值 > 阈值_高:    ε值可适当增大（降低噪声）ElseIf 数据集熵值 < 阈值_低:    ε值需要减小（增加噪声）    或应用额外保护措施Else:    使用标准ε值配置

- Noise Amount Calculation Formula:  
Required noise amount = f(sensitivity, ε value, data entropy)

- High entropy → smaller noise can be used.

- Low entropy → larger noise is required.

- When sensitivity is fixed, entropy becomes a key reference factor.

- Dynamic Adjustment Strategy:

- If dataset_entropy > threshold_high:

- ε value can be slightly increased (reduce noise)

- ElseIf dataset_entropy < threshold_low:

- ε value should be decreased (increase noise)

- or apply additional protective measures

- Else:

- Use standard ε configuration

### 第六部分：实践指导与最佳实践

#### 6.1 ε值选择的实践指南

- 敏感度级别分类：

- 极高敏感（ε ≤ 0.1）：

- 应用场景：基因信息、精神健康记录、详细财务信息

- 特点：几乎完美的隐私保护

- 代价：显著的效用损失

- 适用情况：法律严格要求或涉及生命安全

- 高敏感（0.1 < ε ≤ 1）：

- 应用场景：医疗诊断、个人收入、精确位置信息

- 特点：强隐私保护，适度效用损失

- 代价：统计精度有所降低

- 适用情况：个人隐私优先的应用

- 中等敏感（1 < ε ≤ 5）：

- 应用场景：教育背景、就业信息、一般消费行为

- 特点：平衡的隐私-效用权衡

- 代价：可接受的精度损失

- 适用情况：大多数商业应用的推荐选择

- 低敏感（5 < ε ≤ 10）：

- 应用场景：公开统计、匿名化人口数据、聚合市场趋势

- 特点：基本隐私保护，高数据效用

- 代价：隐私保护相对较弱

- 适用情况：公共政策研究、市场分析

- 极低敏感（ε > 10）：

- 应用场景：已公开或高度聚合的数据

- 特点：最小隐私保护，最大数据效用

- 代价：隐私保护名义化

- 适用情况：合规性要求或公开研究

- Section 6: Practical Guidance & Best Practices

- 6.1 Practical Guide for Choosing ε Values

- Sensitivity Level Classification:

- Extremely High Sensitivity (ε ≤ 0.1)

- Applications: Genetic information, mental health records, detailed financial data.

- Features: Near-perfect privacy protection.

- Cost: Significant utility loss.

- When to use: Strict legal requirements or life safety concerns.

- High Sensitivity (0.1 < ε ≤ 1)

- Applications: Medical diagnoses, personal income, precise location data

- Features: Strong privacy protection, moderate utility loss.

- Cost: Some reduction in statistical accuracy.

- When to use: Privacy-first applications.

- Medium Sensitivity (1 < ε ≤ 5)

- Applications: Education background, employment information, general consumer behavior

- Features: Balanced privacy-utility trade-off.

- Cost: Acceptable precision loss.

- When to use: Recommended for most commercial applications.

- Low Sensitivity (5 < ε ≤ 10)

- Applications: Public statistics, anonymized population data, aggregated market trends.

- Features: Basic privacy protection, high data utility.

- Cost: Relatively weaker privacy protection.

- When to use: Public policy research, market analysis.

- Very Low Sensitivity (ε > 10)

- Applications: Publicly available or highly aggregated data.

- Features: Minimal privacy protection, maximum utility.

- Cost: Nominal privacy guarantees.

- When to use: Compliance or open research.

#### 6.2 实施建议与注意事项6.2 Implementation Recommendations & Considerations

- 技术实施建议：

- 逐步实施策略：

- 阶段1：从低敏感数据开始试点阶段2：逐步扩展到中等敏感数据阶段3：最后处理高敏感数据阶段4：建立长期监控和优化机制Technical Implementation Recommendations:

- Step-by-step implementation:

- Start with low-sensitivity data (pilot stage).

- Gradually expand to medium-sensitivity data.

- Finally handle high-sensitivity data.

- Establish long-term monitoring and optimization mechanisms.

- 多层防护体系：

- Level 1：数据最小化收集Level 2：传统匿名化处理Level 3：差分隐私噪声添加Level 4：访问控制和审计Level 5：数据保留期限管理Multi-layer protection system:

- Level 1: Data minimization in collection.

- Level 2: Traditional anonymization.

- Level 3: Differential privacy noise addition.

- Level 4: Access control and auditing.

- Level 5: Data retention period management.

- 效果评估指标：

- 隐私指标：- ε值遵循情况- 重识别攻击抵御能力- 隐私预算消耗跟踪

- 效用指标：- 统计准确性保持率- 下游任务性能影响- 用户满意度评估Effectiveness Evaluation Metrics:

- Privacy Metrics:

- Compliance with ε value policy.

- Resistance to re-identification attacks.

- Tracking of privacy budget consumption.

- Utility Metrics:

- Statistical accuracy retention rate.

- Impact on downstream task performance.

- User satisfaction assessment.

- 法律合规考虑：

- GDPR合规性评估

- 数据跨境传输规定

- 行业特定隐私要求

- 用户知情同意机制

- Legal Compliance Considerations:

- GDPR compliance assessment.

- Cross-border data transfer regulations.

- Industry-specific privacy requirements.

- Informed consent mechanisms for users.

#### 6.3 未来发展趋势

- 技术发展方向：

- 联邦学习集成：差分隐私+联邦学习的组合应用

- 自适应隐私：根据数据特性动态调整隐私参数

- 隐私会计：更精确的隐私损失追踪和管理

- 硬件加速：专用芯片加速差分隐私计算

- 6.3 Future Trends

- Technology Directions:

- Federated Learning Integration: Combine differential privacy with federated learning.

- Adaptive Privacy: Dynamically adjust privacy parameters based on data characteristics.

- Privacy Accounting: More precise tracking and management of privacy loss.

- Hardware Acceleration: Dedicated chips for faster differential privacy computations

- 应用领域扩展：

- 物联网设备数据保护

- 区块链隐私增强

- 人工智能模型训练

- 智慧城市数据治理

- Application Expansion:

- IoT data protection.

- Blockchain privacy enhancement.

- AI model training.

- Smart city data governance.

- 总结要点

- 差分隐私通过数学严谨的方法，在保护个人隐私和维持数据效用之间找到了科学的平衡点。熵作为信息论的基本概念，为理解和优化差分隐私提供了重要的理论支撑。随着数字化社会的深入发展，这些技术将在保护个人隐私的同时，继续推动数据驱动的创新和社会进步。

- Summary:  
Differential privacy offers a mathematically rigorous way to balance personal privacy protection and data utility. Entropy, as a core concept in information theory, provides critical theoretical support for understanding and optimizing differential privacy. As digital society advances, these technologies will continue to protect individual privacy while enabling data-driven innovation and societal progress.

## CSEC5614 Data Privacy: Theory and Practice - Lecture 2 数据隐私：理论与实践 - 第2讲：熵与差分隐私

### 第一部分：差分隐私的工业应用案例

#### Apple的差分隐私实践

- Apple使用本地差分隐私来保护用户在特定时间段内的活动隐私，同时仍能获得改进功能智能性和可用性的洞察。应用领域包括：QuickType建议、表情符号建议、查找提示、Safari能耗域名、Safari自动播放意图检测、Safari崩溃域名、健康类型使用和Siri。

- Apple uses local differential privacy to help protect the privacy of user activity in a given time period, while still gaining insight that improves the intelligence and usability of features including: QuickType suggestions, Emoji suggestions, Lookup Hints, Safari Energy Draining Domains, Safari Autoplay Intent Detection, Safari Crashing Domains, Health Type Usage, and Siri.

#### 隐私预算的具体设置

- 对于每个功能，Apple力求使隐私预算保持较小，同时仍能收集足够的数据来改进功能。Apple最多保留收集的数据三个月。捐赠数据不包含任何标识符，且不存储IP地址。具体的epsilon值设置：查找提示为4，表情符号为4，QuickType为8，健康类型为2，Safari域名识别为4，Safari自动播放检测为8。

- For each feature, Apple seeks to make the privacy budget small while still collecting enough data to enable Apple to improve features. Apple retains the collected data for a maximum of three months. The donations do not include any identifier, and IP addresses are not stored. Specific epsilon values: Lookup Hints uses epsilon of 4, emoji uses epsilon of 4, QuickType uses epsilon of 8, Health types uses epsilon of 2, Safari domains uses epsilon of 4, and Safari Auto-play detection uses epsilon of 8.

#### 其他科技公司的差分隐私应用

- 微软、Facebook、谷歌和LinkedIn等主要科技公司也都在采用差分隐私技术。微软在Windows、Office和Bing中应用差分隐私；Facebook在用户行为研究中使用该技术；谷歌在搜索、地图、YouTube等服务中广泛应用；LinkedIn利用差分隐私保护职业网络数据。

- Microsoft, Facebook, Google, and LinkedIn are also adopting differential privacy. Microsoft applies it in Windows, Office, and Bing services; Facebook uses it for user behavior research; Google extensively implements it across Search, Maps, and YouTube; LinkedIn utilizes it to protect professional networking data.

### 第二部分：熵与差分隐私的关系

#### 核心概念

- 熵在理解和量化差分隐私提供的隐私保证中发挥着重要作用。熵是信息论中的概念，用于衡量数据集中的随机性或不确定性。在差分隐私的背景下，熵帮助评估需要向查询结果添加多少"噪声"才能达到特定的隐私级别。

- Entropy plays a significant role in understanding and quantifying the privacy guarantees provided by Differential Privacy. Entropy is a concept from information theory that measures the randomness or uncertainty in a dataset. In the context of Differential Privacy, entropy helps assess how much "noise" needs to be added to query results to achieve a certain level of privacy.

#### 实际示例

- 高熵数据集：假设数据集包含从1到100变化很大的年龄，熵很高因为数据中有很多随机性。添加少量噪声可能就足以保护个人隐私，同时仍能计算准确的平均值。低熵数据集：如果数据集只包含几个非常接近的年龄（如40、41、42），熵很低因为随机性较少。这种情况下，可能需要添加更多噪声才能达到同样的隐私保护水平。

- High Entropy Dataset: Suppose the dataset contains ages that vary widely from 1 to 100. The entropy is high because there's a lot of randomness. Adding a small amount of noise might sufficiently protect privacy while allowing accurate average calculation. Low Entropy Dataset: If the dataset contains only a few ages very close to each other (e.g., 40, 41, 42), entropy is low due to less randomness. In this case, a larger amount of noise might be needed to achieve the same privacy level.

### 第三部分：隐私攻击类型

#### 身份识别攻击

- 链接攻击：攻击者试图通过将看似匿名的数据与外部信息源连接来重新识别个人。例如，攻击者可能使用公共选民登记数据集来链接所谓的匿名医疗记录。推理攻击：攻击者通过分析看似无关的数据和背景知识来推断个人的敏感信息。

- Linkage Attack: Adversaries attempt to re-identify individuals by connecting seemingly anonymized data with external information sources. Example: An attacker might use a public voter registration dataset to link supposedly anonymous healthcare records. Inference Attack: Attackers infer sensitive information about individuals by analyzing seemingly unrelated data along with background knowledge.

#### 位置隐私攻击

- 追踪攻击：攻击者通过分析位置数据来追踪个人随时间的移动，从而侵犯其隐私。去匿名化攻击：对手使用位置数据通过将其假名位置轨迹与真实世界身份连接来重新识别用户。

- Tracing Attack: Attackers track individuals' movements over time by analyzing location data, compromising their privacy. De-anonymization Attack: Adversaries use location data to re-identify users by connecting their pseudonymous location traces with their real-world identities.

#### 通信隐私攻击

- 窃听：攻击者未经授权拦截私人通信，如电话或消息。流量分析：对手从通信模式中推断信息，如发送者-接收者关系，而无需直接拦截内容。

- Eavesdropping: Attackers intercept private communications, such as phone calls or messages, without authorization. Traffic Analysis: Adversaries infer information from communication patterns, such as sender-receiver relationships, without directly intercepting the content.

#### 数据隐私攻击：成员推理攻击

- 成员推理攻击是一种隐私攻击，攻击者旨在确定特定数据记录是否属于用于构建机器学习模型的训练数据集。攻击利用了许多机器学习模型（特别是深度学习模型）对训练集中的数据点与非训练集数据点表现不同的事实。

- Membership Inference Attack is a type of privacy attack where an adversary aims to determine whether a specific data record was part of the training dataset used to build a machine learning model. The attack exploits the fact that many machine learning models, especially deep learning models, behave differently on data points that were part of the training set compared to those that were not.

### 第四部分：经典攻击案例分析

#### Netflix Prize攻击

- 2007年Netflix举办了Netflix Prize竞赛，分享了48万用户的"匿名"观看历史和评分数据。德克萨斯大学奥斯汀分校的研究人员Arvind Narayanan和Vitaly Shmatikov通过将Netflix数据集中最活跃的用户与从IMDB抓取的数据进行比较，成功地将Netflix数据集中的个人与IMDB档案关联起来。

- In 2007 Netflix ran the Netflix Prize competition, sharing "anonymized" viewing history and ratings from 480,189 users. Researchers Arvind Narayanan and Vitaly Shmatikov from UT Austin successfully linked individuals in the Netflix dataset with IMDB profiles by comparing the most active users with data scraped from IMDB.

#### Strava热力图攻击

- 2018年1月，研究人员发现Strava的全球热力图无意中暴露了军事基地的位置和布局，特别是在阿富汗、叙利亚和伊拉克等冲突地区。由于军事人员经常使用健身追踪器，他们的活动被记录并包含在Strava热力图中。在许多情况下，这些军事地点位于偏远地区，几乎没有其他民用活动，使得军事移动和位置在地图上高度可见。

- In January 2018, researchers discovered that Strava's global heat map was unintentionally revealing the locations and layouts of military bases and patrol routes, especially in conflict zones like Afghanistan, Syria, and Iraq. Since military personnel often use fitness trackers, their activities were logged and included in the Strava heat map, making military movements and locations highly visible in remote areas with little civilian activity.

### 第五部分：隐私保护的思考

#### 主动防御策略

- 像安全分析师一样思考同时也像攻击者一样思考。主动的隐私和安全创建了一个循环方法，你花时间设想潜在的威胁和攻击，然后实验如何防范它们。

- Think like a security analyst and an attacker. Proactive privacy and security creates a cyclical approach, where you spend time envisioning potential threats and attacks and then experiment with how you can protect against them.

#### 用户隐私责任

- 作为数据持有者的责任类似于建设公共基础设施者的责任。保护措施是为每个人而存在的，不仅仅是最谨慎的人。当你获得个人数据的所有权时，治理义务就是做出负责任的决定。保护所有用户，即使是那些积极参与公共空间的用户，也是工作的一部分。

- Your responsibility as those who hold the data is similar to the responsibility of those who build public infrastructure. Protections exist for everyone, not just the most cautious. The governance obligation when you take ownership of data from individuals is to make responsible decisions. Protecting all users, even those who actively participate in public spaces, is part of the job.

### 第六部分：澳大利亚和全球的数据泄露现状

#### 澳大利亚数据泄露趋势

- 澳大利亚的数据泄露事件呈上升趋势，特别是在金融和医疗保健行业。澳大利亚政府正在修订其网络安全框架和政策，以加强对民族国家威胁行为者的抵御能力。但澳大利亚企业不能仅仅依赖政府的网络安全举措。

- Data breaches in Australia are on the rise, particularly in the financial and healthcare industries. The Australian government is revising its cybersecurity frameworks and policies to strengthen resilience against nation-state threat actors. But Australian businesses cannot solely rely on the government's cybersecurity initiatives.

#### Canva数据泄露案例

- 2019年5月，澳大利亚独角兽公司Canva遭受了影响1.37亿用户的重大数据泄露。被称为Ghosticplayers的网络犯罪分子突破了Canva的防御，访问了用户名、真实姓名、电子邮件地址、国家数据、加密密码和部分支付数据。

- In May 2019, Australian unicorn Canva suffered a monumental data breach impacting 137 million users. A cybercriminal identified as Ghosticplayers breached Canva's defences and accessed usernames, real names, email addresses, country data, encrypted passwords, and partial payment data.

- 这份讲义系统地介绍了差分隐私的工业应用、熵与隐私的关系、各类隐私攻击类型及经典案例，为理解数据隐私保护提供了全面的视角。

## CSEC5614 Data Privacy: Theory and Practice - Lecture 3隐私法律框架整理GDPR Navigating the Legal Side of Privacy

### 导航隐私的法律层面

#### 法规概述

- 社会/道德因素并非实施隐私保护的唯一原因，也不是推动隐私优先数据科学的驱动力。在许多大型组织中，隐私首先被理解为合规问题，然后在技术中实施。隐私立法包括：欧盟的《通用数据保护条例》(GDPR)、加利福尼亚州的《消费者隐私法》(CCPA)、澳大利亚隐私法、英国隐私法。我们需要理解如何将法规转化为技术决策，以及如何审查和审计这些决策以确保合规性。

#### Regulations Overview

- Social/moral factors are not the only reason to apply privacy—nor as the driver of privacy-first data science. In many large organizations, privacy is first understood as a compliance problem and then later implemented in technology. Privacy legislation includes: the European Union's General Data Protection Regulation (GDPR) and California's Consumer Privacy Act (CCPA), Australian Privacy Act, British Privacy Act. Try to understand how to translate regulations into technological decisions and how to review and audit those decisions for compliance.

### GDPR概述

#### GDPR的发展历程

- GDPR是欧洲隐私法规，于2016年定稿时为隐私和数据权利树立了大胆的全球榜样，并于2018年实施。该立法本身在四年前就已得到相当好的理解，因为欧盟工作小组团队制定的建议成为了法律的基础。GDPR还激发了其他立法，如巴西的LGPD和美国几个州的立法提案。

#### GDPR: An Overview

- GDPR is the European privacy regulation that set a bold global example of privacy and data rights in 2016, when it was finalized, implemented in 2018. The legislation itself was fairly well understood four years earlier, as teams of EU working parties formulated recommendations that became the basis of the law. GDPR has also inspired other pieces of legislation, such as the LGPD in Brazil and several US state legislative proposals.

### GDPR核心框架

#### GDPR结构组成

- GDPR包含四个核心组成部分：

- 七项原则

- 六种数据隐私合法性基础

- 八项基本数据权利

- 同意的五个条件

#### GDPR: Core Framework

- GDPR consists of four core components:

- Seven Principles

- Six Lawfulness of Data Privacy

- Eight Fundamental Data Rights

- Five Conditions for the Consent

### GDPR七项原则

#### 原则概述

- 《通用数据保护条例》(GDPR)是欧盟制定的综合性数据隐私和保护法规，旨在加强对个人个人数据的保护，并规范组织如何处理和处理此类数据。GDPR概述了组织在收集、处理和存储个人数据时必须遵守的七项关键原则。

#### Seven Principles Overview

- The General Data Protection Regulation (GDPR) is a comprehensive data privacy and protection regulation established by the European Union (EU) to enhance the protection of individuals' personal data and regulate how organizations handle and process such data. There are seven key principles outlined in the GDPR that organizations must adhere to when collecting, processing, and storing personal data.

#### 原则1：合法性、公平性和透明度

- 在处理个人数据时，应该有正当的理由。GDPR将此原则称为合法性。处理数据的理由可以包括：

- 用户已同意您这样做

- 您必须这样做才能履行合同

- 履行法律义务是必要的

- 为保护自然人的重要利益

- 这是为了公共利益而执行的公共任务

- 您可以证明您有合法利益，且该利益不被数据主体的权利和利益所覆盖

#### Principle 1: Lawfulness, Fairness, and Transparency

- Whenever you're processing personal data, you should have a good reason for doing so. GDPR terms this principle lawfulness. Reasons for processing data can include:

- The user has given you consent to do so

- You must do it to make good on a contract

- It's necessary to fulfill a legal obligation

- For protection of vital interests of a natural person

- It's a public task done in public interest

- You can prove you have legitimate interest, and it's not overridden by data subject's rights and interests

#### 公平性和透明度的含义

- GDPR中规定的公平性概念与合法性密切相关。这意味着您不应故意隐瞒有关收集数据的内容或原因的信息。换句话说，如果用户知道您如何使用他们的数据，他们不会感到惊讶。公平性意味着您不会不当处理或滥用您收集的数据。透明度与公平性内在相关：对数据主体清楚、开放和诚实地说明您是谁，以及您为何以及如何处理其个人数据是透明度的定义。

#### Fairness and Transparency Meaning

- The concept of fairness laid out in the GDPR goes hand-in-hand with lawfulness. It means you shouldn't purposely withhold information about what or why you're collecting data. In other words, users wouldn't be surprised if they knew how you were using their data. Fairness means you won't mishandle or misuse the data you collect. Transparency is inherently linked to fairness: Being clear, open, and honest with data subjects about who you are, and why and how you're processing their personal data is the definition of transparency.

#### 原则2：目的限制

- GDPR的第二个原则在仅针对特定活动使用数据方面设定了界限。这种目的限制意味着数据"仅为特定、明确和合法目的而收集"。您的数据处理目的必须明确确立，也必须通过隐私通知清楚地传达给个人，最后，您必须严格遵循这些目的，将数据处理限制在您所声明的目的范围内。

#### Principle 2: Purpose Limitation

- The GDPR's second principle sets boundaries around using data only for specific activities. This purpose limitation means data is "collected for specified, explicit, and legitimate purposes" only. Your purposes for processing data must be clearly established. And they must also be clearly communicated to individuals through a privacy notice. Finally, you must follow them closely, limiting the processing of data to only the purposes you've stated.

#### 原则3：数据最小化

- 组织应该只收集实现特定目的所需的最少量个人数据。只收集完成目的所需的最少量数据，这是GDPR的数据最小化原则。例如，如果您想为电子邮件通讯收集订阅者，您应该只询问发送通讯所必需的信息。

#### Principle 3: Data Minimization

- Organizations should only collect the minimum amount of personal data necessary to achieve the specified purpose. Only collect the smallest amount of data you'll need to complete your purposes. This is the GDPR principle of data minimization. For example, if you want to gather subscribers for your email newsletter, you should only ask for information necessary to send out the newsletters.

#### 原则4：准确性

- 个人数据必须准确，如有必要，应保持最新。组织应采取合理步骤纠正或删除不准确的数据。

#### Principle 4: Accuracy

- Personal data must be accurate and, if necessary, kept up to date. Organizations should take reasonable steps to rectify or erase inaccurate data.

#### 原则5：存储限制

- 数据应以允许识别个人的形式保存，保存时间不应超过预期目的所需的时间。

#### Principle 5: Storage Limitation

- Data should be kept in a form that permits identification of individuals for no longer than is necessary for the intended purpose.

#### 原则6：完整性和机密性（安全性）

- 组织必须实施适当的安全措施，保护个人数据免受未经授权或非法处理以及意外丢失、破坏或损害。

#### Principle 6: Integrity and Confidentiality (Security)

- Organizations must implement appropriate security measures to protect personal data against unauthorized or unlawful processing and accidental loss, destruction, or damage.

#### 原则7：问责制

- 组织有责任遵守GDPR，并且必须能够证明他们遵守其原则。

#### Principle 7: Accountability

- Organizations are responsible for complying with the GDPR and must be able to demonstrate that they are adhering to its principles.

### GDPR八项基本数据权利

#### 权利概述

- GDPR保障EU居民及其数据的八项基本权利。这些权利适用于EU居民，即使他们不在EU境内，尽管在EU境内执行更容易、更直接。每家公司都有法律团队或顾问负责解释GDPR并定义内部政策、流程和指导方针，以在业务运营模式内合规。

#### Eight Fundamental Rights Overview

- GDPR guarantees eight fundamental rights for EU residents and their data. These rights apply to EU residents, even when they are not in the EU, although enforcement is easier and more straightforward within the EU. Each company has a legal team or advisor responsible for interpreting GDPR and defining internal policies, processes, and guidelines, to comply within the operating model of the business.

#### 权利详细说明

##### 1. 信息权（透明度）

- 个人有权了解其个人数据将如何被收集、使用和处理。

##### 2. 访问权

- 个人可以要求访问组织持有的关于他们的个人数据。

##### 3. 纠正权

- 个人可以要求纠正不准确或不完整的个人数据。

##### 4. 删除权（被遗忘权）

- 当个人数据不再必要或个人撤回同意时，个人可以要求删除其个人数据。

##### 5. 限制处理权

- 在某些情况下，个人可以要求暂时暂停其个人数据的处理。

##### 6. 数据可携带权

- 个人可以要求以结构化、常用、机器可读的格式提供其个人数据，以便将其转移到另一个组织。

##### 7. 反对权

- 个人可以反对为某些目的处理其个人数据，如直接营销。

##### 8. 与自动化决策制定相关的权利

- 个人有权了解其数据是否用于自动化决策过程，并质疑仅由自动化手段做出的决定。

#### Rights Detailed Explanation

##### 1. Right to Information (Transparency)

- Individuals have the right to be informed about how their personal data will be collected, used, and processed.

##### 2. Right of Access

- Individuals can request access to the personal data that an organization holds about them.

##### 3. Right to Rectification

- Individuals can request corrections to inaccurate or incomplete personal data.

##### 4. Right to Erasure (Right to be Forgotten)

- Individuals can request the deletion of their personal data when it's no longer necessary or when they withdraw their consent.

##### 5. Right to Restriction of Processing

- Individuals can request the temporary suspension of the processing of their personal data under certain circumstances.

##### 6. Right to Data Portability

- Individuals can request their personal data to be provided in a structured, commonly used, machine-readable format so they can transfer it to another organization.

##### 7. Right to Object

- Individuals can object to the processing of their personal data for certain purposes, such as direct marketing.

##### 8. Rights Related to Automated Decision-Making

- Individuals have the right to know if their data is being used for automated decision-making processes and to challenge decisions made solely by automated means.

### 数据处理的六种合法性基础

#### 合法性基础概述

- 在《通用数据保护条例》(GDPR)下，处理个人数据有六种合法基础。这些基础为组织收集和处理个人数据提供了合法理由。

#### Six Lawful Bases Overview

- Under the General Data Protection Regulation (GDPR), there are six lawful bases for processing personal data. These bases provide organizations with legitimate reasons to collect and process personal data.

#### 六种基础详解

##### 1. 同意

- 这是处理个人数据最常见的合法基础之一。同意要求个人为特定目的处理其数据提供明确、知情和自愿的同意。

##### 2. 合同必要性

- 为履行与个人的合同或在签订合同前应其要求采取步骤，处理是必要的。

##### 3. 法律义务

- 为遵守数据控制者所承担的法律义务，处理是必要的。

##### 4. 重要利益

- 为保护某人的生命，处理是必要的。

##### 5. 公共任务

- 为履行为公共利益或行使官方权力而执行的任务，处理是必要的。

##### 6. 合法利益

- 为数据控制者或第三方所追求的合法利益，处理是必要的，除非被数据主体的利益、权利和自由所覆盖。

#### Six Bases Detailed

##### 1. Consent

- This is one of the most common lawful bases for processing personal data. Consent requires individuals to provide clear, informed, and voluntary agreement for their data to be processed for a specific purpose.

##### 2. Contractual Necessity

- Processing is necessary for the performance of a contract with the individual or to take steps at their request before entering into a contract.

##### 3. Legal Obligation

- Processing is necessary for compliance with a legal obligation to which the data controller is subject.

##### 4. Vital Interests

- Processing is necessary to protect someone's life.

##### 5. Public Task

- Processing is necessary to perform a task carried out in the public interest or in the exercise of official authority.

##### 6. Legitimate Interests

- Processing is necessary for the legitimate interests pursued by the data controller or a third party, except where overridden by the interests, rights, and freedoms of the data subject.

### 同意的五个条件

#### 同意条件概述

- 在《通用数据保护条例》(GDPR)下，同意是处理个人数据的合法基础。为了被认为是有效的，同意必须满足特定条件。

#### Five Conditions Overview

- Under the General Data Protection Regulation (GDPR), consent is a lawful basis for processing personal data. For consent to be considered valid, it must meet specific conditions.

#### 五个条件详解

##### 1. 自由给予

- 同意必须是自由给予的，意味着个人有真正的选择，如果拒绝同意，不会受到不当压力或负面后果。

##### 2. 具体和知情

- 同意必须是具体和知情的，明确说明将处理什么数据以及用于什么目的。

##### 3. 明确无误和清楚

- 同意必须是明确无误的，通过明确的肯定行动提供，如勾选框、点击选择加入按钮或在网站上选择设置。

##### 4. 撤回同意

- 个人有权随时撤回其同意，撤回同意的过程应该与给予同意一样容易。

##### 5. 细化和分离

- 同意应该是细化的，意味着不同的处理活动需要单独的同意。个人不能被迫同意捆绑在一起的不相关处理活动。

#### Five Conditions Detailed

##### 1. Freely Given

- Consent must be freely given, meaning that individuals have a real choice and are not subjected to undue pressure or negative consequences if they refuse consent.

##### 2. Specific and Informed

- Consent must be specific and informed, indicating clear details about what data will be processed and for what purposes.

##### 3. Unambiguous and Clear

- Consent must be unambiguous and provided through a clear affirmative action, such as checking a box, clicking an opt-in button, or choosing settings on a website.

##### 4. Withdrawal of Consent

- Individuals have the right to withdraw their consent at any time and the process for withdrawing consent should be as easy as giving it.

##### 5. Granular and Separate

- Consent should be granular, meaning that different processing activities require separate consent. Individuals can't be forced to consent to unrelated processing activities bundled together.

### GDPR合规的11步检查清单

#### 合规步骤概述

- 现在我们了解了基础知识，让我们进入您的组织为满足GDPR合规性可以采取的步骤。GDPR合规性可能因您的组织而略有不同，但有特定步骤任何组织现在都可以采取来创建GDPR合规的隐私程序。

#### 11-Step Compliance Checklist Overview

- Now that we understand the basics, let's jump into the steps your organization can take to meet GDPR compliance. GDPR compliance can look a bit different depending on your organization, but there are specific steps any organization can take now to create a GDPR compliant privacy program.

#### 11个步骤详解

- 使用GDPR的7项原则制定可行计划

- 为第30条生成处理登记册

- 实施数据保护影响评估(DPIA)和隐私设计(PbD)

- 建立同意管理框架

- 满足EU隐私Cookie合规要求

- 构建数据主体权利请求门户

- 审查和修正处理者风险

- 准备事件报告和违规管理工作流程

- 审查跨境数据传输机制

- 实施GDPR合规培训

- 任命数据保护官(DPO)

#### 11 Steps Detailed

- Create an Actionable Plan Using the 7 Principles of the GDPR

- Generate a Processing Register for Article 30

- Operationalize Data Protection Impact Assessment (DPIA) and Privacy by Design (PbD)

- Build a Framework for Consent Management

- Meet EU Privacy Cookie Compliance Requirements

- Build a Data Subject Rights Request Portal

- Review and Remediate Processor Risks

- Prepare an Incident Reporting & Breach Management Workflow

- Review Cross Border Data Transfer Mechanisms

- Implement GDPR Compliance Training

- Appoint a Data Protection Officer (DPO)

### 加利福尼亚消费者隐私法(CCPA)

#### CCPA概述

- 2018年，加利福尼亚州通过了CCPA，旨在保护消费者免受不必要的数据使用。该州法律概述了几项数据权利，包括知情权、删除权、选择退出个人数据销售权，以及非歧视权。与GDPR一样，该法律的意图是这些权利是自动化或半自动化的，允许轻松选择退出和删除请求。

#### CCPA Overview

- In 2018, California passed the CCPA, which aims to protect consumers from unwanted data usage. This state law outlines several data rights, including the right to be informed about what data is being collected and how it is used, the right to delete personal information collected, the right to opt out of sale of personal data, and the right to nondiscrimination. Like GDPR, the intention of the law is that these rights are automated or semi-automated, allowing things such as easy opt-out and deletion requests.

#### CCPA执法情况

- CCPA有一些案例法，但不多——因为原告只能在由于保护不足而发生数据泄露时对公司提起诉讼，并且没有专门的州执法机构。

#### CCPA Enforcement

- CCPA has some case law, but not much—as plaintiffs can bring lawsuits against companies only if there is a data breach due to insufficient protections and there is no dedicated state enforcement body.

### 总结

#### 学习成果

- 在本讲座中，您学习了如何阅读法规、评估隐私影响、查看服务条款和隐私政策，以及解释这些文本如何影响您作为数据科学家的工作。您还获得了对法律专业人士的同理心和一些促进协作对话的工具。这将通过查看现实问题和问题，帮助您将学习从学术理解转变为实际应用。

#### Summary

- In this lecture, you learned how to read regulations, evaluate the impact of privacy, look at terms of service and privacy policies, and interpret how those texts might affect your work as a data scientist. You also gained empathy for legal professionals and some tools for enabling collaborative conversations. This will help transition your learning from academic understanding to a practical one by looking at real-world problems and questions.

## CSEC5614 Data Privacy: Theory and Practice - Lecture 4隐私保护机器学习Privacy-Aware Machine Learning and Data Science

### 1. 课程介绍

#### Introduction

- 本课程旨在探讨如何在机器学习工作流程中添加匿名化技术，深入研究隐私保护机器学习和数据科学的前沿方法。由于该领域发展迅速且正在积极研究中，学生需要理解核心概念并比较当今领先的方法。

- This course aims to explore how to add anonymization to machine learning workflows and dive into research on privacy-preserving machine learning and data science. As this field is fast-moving and actively being researched, students need to understand the core concepts and compare today's leading methods.

- 机器学习具有提高生产力的巨大潜力。然而，用于训练机器学习模型的数据质量应该优秀才能提供良好的结果。任何机器学习算法只有在有大量完美数据进行训练时才能提供出色的性能。为了获得这样的质量数据，许多组织需要合作。当我们从不同组织获取数据时，维护数据的机密性和隐私性非常重要。

- Machine learning (ML) has a lot of potential for increasing productivity. However, the quality of the data for training ML models should be excellent to provide good results. Any ML algorithm provides excellent performance only when there is huge and perfect data fed for training. To get such quality data many organizations work cooperatively. When we are taking data from different organizations, it is very important to maintain the confidentiality and the privacy of data.

- 需要理解为什么PPML（隐私保护机器学习）在公司转向云环境或合作工作时变得非常重要。

- Need to understand that why PPML (Privacy-preserving machine learning) has become very important when companies shift to cloud environments or work cooperatively.

### 2. 什么是PPML？

#### What is PPML?

- 隐私保护机器学习是一种逐步方法，用于防止机器学习算法中的数据泄露。PPML允许多种隐私增强策略，使多个输入源能够合作训练机器学习模型，而不会以原始形式暴露其私有数据。

- Privacy-Preserving Machine Learning is a step-by-step approach to preventing data leakage in machine learning algorithms. PPML allows many privacy-enhancing strategies to allow multiple input sources to train ML models cooperatively without exposing their private data in its original form.

- 隐私保护的机器学习是指应用各种技术和方法来确保机器学习过程中使用的敏感数据隐私的实践。它涉及实施保护个人个人信息的措施，并减轻隐私泄露的风险，同时仍允许有效的数据分析和模型训练。

- Machine learning with privacy preservation refers to the practice of applying various techniques and methodologies to ensure the privacy of sensitive data used in machine learning processes. It involves implementing measures that protect individuals' personal information and mitigate the risk of privacy breaches while still allowing for effective data analysis and model training.

- 隐私保护机器学习的目标是在利用数据获得洞察和确保与该数据相关的个人的机密性和隐私之间取得平衡。这在数据包含个人可识别信息（PII）的领域特别重要，如医疗保健、金融或客户行为分析。

- The goal of machine learning with privacy preservation is to strike a balance between leveraging data for insights and ensuring the confidentiality and privacy of the individuals associated with that data. This is particularly important in domains where data contains personally identifiable information (PII), such as healthcare, finance, or customer behavior analysis.

#### 隐私保护技术分类

#### Privacy Preservation Techniques Categories

- 机器学习中的隐私保护技术可以大致分为两种主要方法：

- Privacy preservation techniques in machine learning can be broadly categorized into two main approaches:

- 1. 数据级隐私保护（Data-Level Privacy Preservation）：

- 匿名化：删除或修改数据集中的可识别属性，以防止个人被重新识别

- 噪声添加：向数据中注入随机噪声以模糊个别记录，同时维持整体统计特性

- 聚合：在聚合级别组合数据以防止识别特定个人

- 1. Data-Level Privacy Preservation:

- Anonymization: Removing or modifying identifiable attributes in the dataset to prevent individuals from being re-identified

- Noise Addition: Injecting random noise into data to obfuscate individual records while maintaining overall statistical properties

- Aggregation: Combining data at an aggregate level to prevent the identification of specific individuals

- 2. 模型级隐私保护（Model-Level Privacy Preservation）：

- 安全计算：使用密码学技术，如同态加密或安全多方计算，在加密数据上执行计算而不透露敏感信息

- 差分隐私：向计算或查询的输出引入受控噪声或扰动，确保个体贡献无法区分

- 2. Model-Level Privacy Preservation:

- Secure Computation: Using cryptographic techniques, such as homomorphic encryption or secure multi-party computation, to perform computations on encrypted data without revealing sensitive information

- Differential Privacy: Introducing controlled noise or perturbations to the output of computations or queries to ensure that individual contributions are indistinguishable

### 3. 为什么机器学习需要考虑隐私保护技术？

#### Why Should Machine Learning Consider Privacy Preservation Techniques?

#### 法律和道德义务

#### Legal and Ethical Obligations

- 许多司法管辖区对处理敏感数据（如医疗记录或个人可识别信息（PII））有严格的规定。不遵守这些规定可能导致法律后果和对组织声誉的损害。

- Many jurisdictions have strict regulations regarding the handling of sensitive data, such as medical records or personally identifiable information (PII). Failure to comply with these regulations can lead to legal consequences and damage to an organization's reputation.

- 例子： 欧盟的《通用数据保护条例》（GDPR）要求组织保护欧盟公民的隐私和个人数据。不合规可能导致重大罚款和处罚。

- Example: The European Union's General Data Protection Regulation (GDPR) requires organizations to protect the privacy and personal data of EU citizens. Non-compliance can result in significant fines and penalties.

#### 保护个人隐私

#### Preserving Individual Privacy

- 尊重个人的隐私权对于维护信任和确保道德数据处理实践至关重要。在敏感数据上训练的机器学习模型有可能透露个人信息或做出危及隐私的推断。

- Respecting individuals' privacy rights is crucial for maintaining trust and ensuring ethical data handling practices. Machine learning models trained on sensitive data have the potential to reveal personal information or make inferences that compromise privacy.

- 例子： 包含医疗条件和治疗详细信息的医疗保健数据可能高度敏感。保护患者隐私对于维护机密性和防止未经授权访问个人健康信息至关重要。

- Example: Healthcare data containing details about medical conditions and treatments can be highly sensitive. Protecting patient privacy is essential to maintain confidentiality and prevent unauthorized access to personal health information.

#### 减少数据泄露风险

#### Mitigating Data Breach Risks

- 机器学习模型通常依赖于大型数据集，使它们成为恶意行为者的有吸引力的目标。通过实施隐私保护技术，可以最小化数据泄露和未经授权访问敏感信息的风险。

- Machine learning models often rely on large datasets, making them attractive targets for malicious actors. By implementing privacy preservation techniques, the risk of data breaches and unauthorized access to sensitive information can be minimized.

- 例子： 2017年，主要信用报告机构Equifax遭遇数据泄露，暴露了大约1.47亿消费者的个人信息。隐私保护技术可以帮助减轻此类风险。

- Example: In 2017, Equifax, a major credit reporting agency, experienced a data breach that exposed the personal information of approximately 147 million consumers. Privacy preservation techniques can help mitigate such risks.

#### 避免偏见和歧视

#### Avoiding Bias and Discrimination

- 在有偏见或歧视性数据上训练的机器学习模型可能延续不公平的结果并放大现有的社会不平等。通过结合隐私保护技术，组织可以解决偏见和歧视问题，同时保护敏感属性。

- Machine learning models trained on biased or discriminatory data can perpetuate unfair outcomes and amplify existing social inequalities. By incorporating privacy preservation techniques, organizations can address bias and discrimination concerns while protecting sensitive attributes.

- 例子： 在使用机器学习进行招聘决策时，通过匿名化个人信息来保护隐私可以帮助防止基于性别、种族或其他受保护属性的偏见。

- Example: When using machine learning for hiring decisions, preserving privacy by anonymizing personal information can help prevent bias based on gender, ethnicity, or other protected attributes.

#### 鼓励数据共享和协作

#### Encouraging Data Sharing and Collaboration

- 隐私保护技术可以促进不同组织、研究人员或机构之间的数据共享和协作，实现集体学习而不损害个人隐私。

- Privacy preservation techniques can facilitate data sharing and collaboration among different organizations, researchers, or institutions, enabling collective learning without compromising individual privacy.

- 例子： 像联邦学习这样的隐私保护技术允许多个医院或研究机构在不共享敏感患者信息的情况下协作分析医疗数据，促进医疗保健研究的进步。

- Example: Privacy-preserving techniques like federated learning allow multiple hospitals or research institutions to collaborate on analyzing medical data without sharing sensitive patient information, promoting advancements in healthcare research.

#### 维护竞争力和信任

#### Maintaining Competitiveness and Trust

- 在对数据隐私关注日益增长的时代，展示对隐私保护承诺的组织可以与客户、用户和利益相关者建立信任。注重隐私的实践可以成为竞争优势。

- In an era of growing concerns about data privacy, organizations that demonstrate a commitment to privacy preservation can build trust with customers, users, and stakeholders. Privacy-conscious practices can become a competitive advantage.

- 例子： 优先考虑端到端加密和隐私保护的消息应用程序在重视对话机密性的用户中获得了普及。

- Example: Messaging apps that prioritize end-to-end encryption and privacy preservation have gained popularity among users who value the confidentiality of their conversations.

### 4. 机器学习阶段

#### ML Phases

- 机器学习系统的四个阶段通常如下：

- The four phases of a machine learning system are typically as follows:

- 数据准备或预处理

- 模型训练和评估

- 模型部署

- 模型推理

- Data preparation or preprocessing

- Model training and evaluation

- Model deployment

- Model inference

- 更广泛地说，机器学习管道可以分为训练和服务阶段。在这种情况下，模型训练包括数据收集和预处理、模型训练和模型评估等过程；而模型服务主要关注如何使用训练好的模型，如如何部署模型以及在给定特定数据样本的情况下推断结果。

- More broadly, the ML pipeline can be divided into training and serving phases. In this scenario, model training encompasses processes such as data collection and preprocessing, model training, and model evaluation; while model serving mostly focuses on how to use a trained model, such as how to deploy the model and infer the result given a certain data sample.

### 5. PPML目标

#### PPML Objectives

- 大多数隐私保护模型生成解决方案强调，采用的隐私保护方法应防止训练数据中的私有信息从数据源的可信范围中泄露。

- Most privacy-preserving model generation solutions emphasize that the adopted privacy-preserving approaches should prevent the leakage of private information in the training data from leaking the trusted scope of the data sources.

- 特别是，模型生成期间要考虑的关键隐私泄露问题与数据和计算相关；现有研究通过以下两个关键研究问题来解决这些问题：

- In particular, the key privacy leakage issues to consider during model generation relate to data and computation; existing research address these through follow two key research questions:

- 如何提取/过滤训练数据以最小化或完全消除任何隐私敏感信息

- 如何以隐私保护的方式计算处理训练数据

- How to distill/filter the training data so as to minimize or completely remove any privacy sensitive information

- How to computationally process the training data in a privacy preserving manner

### 6. PPML管道

#### PPML Pipeline

- 现有的PPML管道包括：

- The existing PPML pipeline involves:

- 隐私保护数据准备

- 隐私保护模型训练和评估

- 隐私保护模型部署

- 隐私保护推理

- Privacy-preserving data preparation

- Privacy-preserving model training and evaluation

- Privacy-preserving model deployment

- Privacy-preserving inference

#### 隐私保护数据准备

#### Privacy-Preserving Data Preparation

- 这一步涉及在保护隐私的同时准备数据。它包括清理和匿名化数据以保护敏感信息的技术。

- This step involves preparing the data while preserving privacy. It includes techniques to sanitize and anonymize the data to protect sensitive information.

- 例子： 考虑包含患者医疗记录的数据集。为了保护隐私，可以使用k-匿名化或差分隐私等技术。k-匿名化确保每个患者的数据与至少k-1个其他患者无法区分，使个人更难被识别。差分隐私可用于向查询响应添加噪声，例如在计算聚合统计信息时，以保护个人数据。例如，在计算医院患者的平均年龄时，您向结果添加随机噪声以模糊个人年龄。

- Example: Consider a dataset containing patient medical records. To preserve privacy, you can use techniques like k-anonymity or differential privacy. K-anonymity ensures that each patient's data is indistinguishable from at least k-1 other patients, making it harder to identify individuals. Differential privacy can be used to add noise to query responses, such as when calculating aggregate statistics, to protect individual data. For instance, when computing the average age of patients in a hospital, you add random noise to the result to obscure individual ages.

#### 隐私保护模型训练和评估

#### Privacy-Preserving Model Training and Evaluation

- 在模型开发期间，使用隐私保护技术来训练和评估机器学习模型，而不暴露敏感数据。联邦学习、安全多方计算（SMC）和同态加密是实现这一点的方法。

- During model development, privacy-preserving techniques are used to train and evaluate machine learning models without exposing sensitive data. Federated learning, secure multi-party computation (SMC), and homomorphic encryption are approaches for this.

- 例子： 考虑几个医院之间的协作努力，在不直接共享患者数据的情况下构建疾病爆发的预测模型。可以应用联邦学习，其中每个医院在其数据上训练本地模型，只有模型更新（而不是原始数据）被共享和聚合以构建全局模型。

- Example: Consider a collaborative effort among several hospitals to build a predictive model for disease outbreaks without sharing patient data directly. Federated learning can be applied, where each hospital trains a local model on its data, and only model updates (not raw data) are shared and aggregated to build the global model.

#### 隐私保护模型部署

#### Privacy-Preserving Model Deployment

- 一旦模型被训练，以隐私保护的方式部署它是至关重要的。这一步涉及安全飞地、评分中的差分隐私和加密模型部署等技术。

- Once a model is trained, deploying it in a privacy-preserving manner is crucial. This step involves techniques like secure enclaves, differential privacy in scoring, and encrypted model deployment.

- 例子： 在预测患者结果的医疗保健应用程序中，模型可以部署在安全飞地内，确保敏感的患者数据永远不会暴露给外部，只有加密的预测与授权用户共享。

- Example: In a healthcare application where a machine learning model predicts patient outcomes, the model can be deployed within a secure enclave, ensuring that sensitive patient data is never exposed to the outside, and only encrypted predictions are shared with authorized users.

#### 隐私保护推理

#### Privacy-Preserving Inference

- 这一步涉及在新数据上进行预测，同时保护隐私。可以采用安全多方计算、同态加密和隐私保护API等方法。

- This step deals with making predictions on new data while preserving privacy. Methods such as secure multi-party computation, homomorphic encryption, and privacy-preserving APIs can be employed.

- 例子： 假设一家金融机构想要基于客户交易数据提供个性化的财务建议，而不查看实际交易。客户可以加密他们的交易数据并将其发送到机构的服务器。使用同态加密，服务器可以在加密数据上执行计算以提供个性化建议，而无需解密数据。

- Example: Suppose a financial institution wants to offer personalized financial advice based on customer transaction data without seeing the actual transactions. Customers can encrypt their transaction data and send it to the institution's server. Using homomorphic encryption, the server can perform computations on the encrypted data to provide personalized advice without decrypting the data.

### 7. K-匿名化

#### K-anonymity

- K-匿名化是数据匿名化中使用的隐私保护概念和方法，用于在发布或共享数据集时保护个人身份。它确保数据以一种方式聚合或修改，使得在数据集中识别特定个人变得困难，同时仍为分析提供有用信息。

- K-anonymity is a privacy-preserving concept and method used in data anonymization to protect individuals' identities when releasing or sharing datasets. It ensures that data is aggregated or modified in a way that makes it challenging to identify specific individuals within the dataset while still providing useful information for analysis.

#### K-匿名化工作原理

#### How k-anonymity works

- 分组个人： 第一步是根据共同特征或属性（如年龄、性别、邮政编码）将数据集中的个人分组到"桶"或"组"中。

- 泛化： 在每个组内，属性以减少细节和特异性水平的方式被泛化或修改。例如，特定的邮政编码可能被更广泛的地区或区域替换。

- 抑制： 在某些情况下，可能用于识别个人的属性可能需要从数据集中完全抑制或删除。例如，如果存在属性的唯一组合可能导致重新识别的风险，则可能抑制这些属性中的一个或多个。

- 实现K-匿名化： 目标是确保每个组包含至少"k"个共享相同泛化属性集的个人。这意味着组中的任何个人都无法与该组中的其他"k-1"个个人唯一区分。

- Grouping Individuals: The first step is to group individuals in the dataset into "buckets" or "groups" based on common characteristics or attributes (e.g., age, gender, ZIP code).

- Generalization: Within each group, attributes are generalized or modified in a way that reduces the level of detail and specificity. For example, a specific ZIP code might be replaced with a broader region or area.

- Suppression: In some cases, attributes that could be used to identify individuals may need to be suppressed or removed entirely from the dataset. For example, if there is a risk that a unique combination of attributes could lead to re-identification, one or more of those attributes may be suppressed.

- Achieving K-Anonymity: The goal is to ensure that each group contains at least "k" individuals who share the same set of generalized attributes. This means that any individual in a group cannot be uniquely distinguished from the other "k-1" individuals in that group.

- k-匿名化中的参数"k"表示最小组大小，它根据所需的隐私保护水平选择。更高的"k"值提供更强的隐私保证，但可能导致数据的更粗糙泛化。

- The parameter "k" in k-anonymity represents the minimum group size, and it is chosen based on the desired level of privacy protection. A higher "k" value provides stronger privacy guarantees but may result in coarser generalization of data.

#### K-匿名化示例

#### K-anonymity Example

- 假设您有一个包含年龄、性别和邮政编码等属性的健康记录数据集。您想为研究目的共享此数据集，同时保护个人隐私。为了实现k-匿名化：

- 分组： 您根据年龄、性别和邮政编码的前两位数字对个人进行分组。

- 泛化： 在每个组内，您通过将年龄四舍五入到最近的5年间隔（例如，25-30岁）来泛化年龄属性，并将邮政编码泛化为前两位数字。

- 实现K-匿名化： 您设置k = 3，意味着每个组应包含至少3个共享相同年龄和邮政编码前两位数字的个人。

- Suppose you have a dataset of health records with attributes such as age, gender, and ZIP code. You want to share this dataset for research purposes while preserving individual privacy. To achieve k-anonymity:

- Grouping: You group individuals based on their age, gender, and the first two digits of their ZIP code.

- Generalization: Within each group, you generalize the age attribute by rounding it to the nearest 5-year interval (e.g., 25-30 years), and you generalize the ZIP code to the first two digits.

- Achieving K-Anonymity: You set k = 3, meaning that each group should contain at least 3 individuals who share the same age and the same first two digits of the ZIP code.

- 这样，即使对手可以访问匿名化数据集，重新识别特定个人也变得更加困难，因为他们是共享共同属性的较大组的一部分。然而，数据仍为分析提供有用见解，例如研究某些年龄组和地区的健康趋势。

- In this way, even if an adversary has access to the anonymized dataset, it becomes much more challenging to re-identify specific individuals because they are part of a larger group sharing common attributes. However, the data still provides useful insights for analysis, such as studying health trends among certain age groups and regions.

### 8. 机器学习隐私保护技术

#### Machine Learning Privacy-Preserving Techniques

- 机器学习隐私保护技术旨在保护敏感数据，同时允许有效和准确的分析和模型训练。以下是用于在机器学习中保护隐私的一些常见技术：

- Machine learning privacy-preserving techniques aim to protect sensitive data while allowing for effective and accurate analysis and model training. Here are some common techniques used for preserving privacy in machine learning:

#### 差分隐私

#### Differential Privacy

- 差分隐私通过注入受控噪声或扰动，确保数据集中的个别数据点无法被区分。这种技术通过模糊敏感信息同时保持数据集的整体统计特性，提供强大的隐私保证。

- Differential privacy ensures that individual data points cannot be distinguished within a dataset by injecting controlled noise or perturbations. This technique provides strong privacy guarantees by obscuring sensitive information while preserving the overall statistical properties of the dataset.

- 示例：

- 添加噪声： 随机响应机制，如拉普拉斯或高斯噪声，被添加到查询响应中以确保合理的可否认性并保护个人隐私。

- Google的RAPPOR： Google的RAPPOR（随机可聚合隐私保护序数响应）使用差分隐私收集用户行为的聚合统计信息，而不透露个人偏好。

- Apple的iOS： Apple的iOS使用差分隐私收集使用统计信息而不损害个人用户隐私。收集的数据被聚合和匿名化以保护用户身份。

- Examples:

- Adding Noise: Randomized response mechanisms, such as Laplace or Gaussian noise, are added to query responses to ensure plausible deniability and protect individual privacy.

- Google's RAPPOR: Google's RAPPOR (Randomized Aggregatable Privacy-Preserving Ordinal Response) uses differential privacy to collect aggregated statistics on user behavior without revealing individual preferences.

- Apple's iOS: Apple's iOS uses differential privacy to collect usage statistics without compromising individual user privacy. The collected data is aggregated and anonymized to protect user identities.

#### 联邦学习

#### Federated Learning

- 联邦学习是一种机器学习方法，允许在多个分散设备或服务器上进行模型训练，同时保持数据本地化和私有化。它旨在通过允许数据保留在生成它的设备上，而不是将其集中在一个位置来解决隐私问题。

- Federated learning is a machine learning approach that allows for model training across multiple decentralized devices or servers while keeping the data localized and private. It's designed to address privacy concerns by allowing data to remain on the devices where it's generated, rather than centralizing it in one location.

#### 联邦学习工作原理

#### How Federated Learning Works

- 步骤1：设置和初始化

- 服务器初始化： 中央服务器启动联邦学习过程。它创建一个初始全局模型，通常随机初始化，作为训练过程的起点。

- 客户端选择： 服务器选择一组分散的客户端或设备（如智能手机、边缘设备或本地服务器）参与联邦学习过程。

- Step 1: Setup and Initialization

- Server Initialization: A central server initiates the federated learning process. It creates an initial global model, often randomly initialized, that will serve as a starting point for the training process.

- Client Selection: The server selects a subset of decentralized clients or devices (e.g., smartphones, edge devices, or local servers) to participate in the federated learning process.

- 步骤2：本地模型训练

- 模型分发： 中央服务器将初始全局模型发送给选定的客户端，但不共享任何原始数据。

- 本地模型训练： 每个客户端使用其本地数据更新全局模型。客户端在其数据上本地执行模型训练迭代。

- 模型更新： 在每轮本地训练后，客户端只将模型更新（梯度）发送给中央服务器，而不是原始数据。

- Step 2: Local Model Training

- Model Distribution: The central server sends the initial global model to the selected clients, but it does not share any raw data.

- Local Model Training: Each client uses its local data to update the global model. The clients perform model training iterations locally on their data.

- Model Update: After each round of local training, the clients send only the model updates (gradients) to the central server, not their raw data.

- 步骤3：模型聚合和改进

- 模型聚合： 服务器聚合来自所有参与客户端的模型更新以更新全局模型。可以使用各种聚合方法，如联邦平均、安全聚合或其他隐私保护技术。

- 模型改进： 更新的全局模型现在包含来自所有参与客户端的知识。本地训练、模型更新和聚合的过程重复多轮，直到全局模型收敛或达到满意的性能水平。

- Step 3: Model Aggregation and Improvement

- Model Aggregation: The server aggregates the model updates from all participating clients to update the global model. Various aggregation methods can be used, such as federated averaging, secure aggregation, or other privacy-preserving techniques.

- Model Improvement: The updated global model now contains knowledge from all participating clients. The process of local training, model update, and aggregation repeats for several rounds until the global model converges or reaches a satisfactory level of performance.

- 步骤4：模型部署和评估

- 全局模型部署： 一旦联邦学习过程完成，训练好的全局模型可以以集中方式部署用于推理，同时保持个别客户端数据私有。

- Step 4: Model Deployment and Evaluation

- Global Model Deployment: Once the federated learning process is complete, the trained global model can be deployed for inference in a centralized manner while keeping the individual client data private.

#### 移动键盘应用的联邦学习方案 / Federated Learning Approach for Mobile Keyboard App移动键盘应用程序的示例

隐私问题： 应用希望改进其自动纠正和文本预测功能，但不希望通过将所有用户文本输入发送到中央服务器进行模型训练来损害用户隐私。

Privacy Concern: The app wants to improve its autocorrect and text prediction functionality, but it doesn't want to compromise user privacy by sending all user text input to a central server for model training.

联邦学习方法：

- 初始化： 中央服务器为自动纠正初始化一个全局语言模型，但不知道每个用户的具体文本输入

- 客户端选择： 应用选择用户子集（客户端）参与联邦学习，例如选择加入参与的用户

Federated Learning Approach:

- Initialization: The central server initializes a global language model for autocorrect but doesn't know the specific text input of each user

- Client Selection: The app selects a subset of users (clients) to participate in federated learning, such as users who opt in for participation

#### 本地模型训练和聚合过程 / Local Model Training and Aggregation Process

本地模型训练： 每个用户的设备使用其本地打字数据来改进全局语言模型。模型根据用户的打字习惯、常见错误和语言使用进行更新，同时保持实际文本输入的私密性。

模型聚合： 服务器从参与用户那里收集模型更新并聚合它们以改进全局语言模型。此过程多次迭代。

部署： 改进的全局语言模型部署到所有用户设备，提供更好的自动纠正和文本预测，而无需将个人文本输入暴露给中央服务器。

Local Model Training: Each user's device uses their local typing data to improve the global language model. The model is updated based on the user's typing habits, common mistakes, and language usage, all while keeping the actual text input private.

Model Aggregation: The server collects the model updates from participating users and aggregates them to improve the global language model. This process iterates multiple times.

Deployment: The improved global language model is deployed to all users' devices, providing better autocorrect and text prediction without exposing individual text input to the central server.

### 苹果的联邦学习应用 / Apple's Use of Federated Learning

#### Siri语音识别 / Siri Voice Recognition

当你在Apple设备上使用Siri时，执行语音识别和自然语言处理任务。联邦学习允许Siri根据用户交互改进其语言模型，同时将语音录音和转录保留在设备上。Siri可以从多个用户的语音命令中学习，而不会损害个人隐私。

When you use Siri on your Apple device, voice recognition and natural language processing tasks are performed. Federated learning allows Siri to improve its language models based on user interactions while keeping voice recordings and transcripts on the device. Siri can learn from multiple users' voice commands without compromising individual privacy.

#### QuickType预测文本 / QuickType (Predictive Text)

Apple的QuickType键盘在你打字时提供预测文本建议。联邦学习用于改进这些建议。你的设备可以从你的打字习惯中本地学习，偶尔分享聚合的匿名数据以增强全局QuickType模型，而不是将你的按键发送到Apple的服务器。

Apple's QuickType keyboard offers predictive text suggestions as you type. Federated learning is used to improve these suggestions. Instead of sending your keystrokes to Apple's servers, your device can learn from your typing habits locally and occasionally share aggregated, anonymized data to enhance the global QuickType model.

#### 设备上机器学习 / On-Device Machine Learning

Apple在各种功能中采用设备上机器学习，如照片应用中的图像识别。联邦学习允许模型随着用户与照片和视频的交互而改进，而无需将个人媒体内容上传到Apple的服务器。

Apple employs on-device machine learning for various features, like image recognition in the Photos app. Federated learning allows the models to improve over time as users interact with their photos and videos, without the need to upload personal media content to Apple's servers.

### 10.苹果联邦学习和差分隐私的并行应用 / Combining Federated Learning and Differential Privacy

#### 联邦学习用于模型改进 / Federated Learning for Model Improvement

好处： 联邦学习允许Apple在用户设备上协作训练机器学习模型，而不集中敏感数据。这在尊重用户隐私的同时提高了设备上功能的准确性和个性化。

Benefit: Federated learning allows Apple to collaboratively train machine learning models across user devices without centralizing sensitive data. This improves the accuracy and personalization of on-device features while respecting user privacy.

#### 差分隐私用于数据收集和聚合 / Differential Privacy for Data Collection and Aggregation

好处： 差分隐私确保从用户收集的任何数据都是固有受保护的。它向个别数据点添加噪声或随机性，使得识别个人极其困难，同时仍能从聚合数据中提取有意义的见解。

Benefit: Differential privacy ensures that any data collected from users is inherently protected. It adds noise or randomness to individual data points, making it extremely difficult to identify individuals while still extracting meaningful insights from aggregated data.

#### QuickType的并行实施示例 / Parallel Implementation Example for QuickType

设备上模型改进的联邦学习：

- 过程： 联邦学习通过在用户设备上协作训练来改进QuickType的语言模型

- 好处： QuickType变得更加准确并个性化到个别用户的打字风格

数据收集和聚合的差分隐私：

- 过程： Apple收集用户打字交互数据时，采用差分隐私技术，添加受控噪声防止个别用户输入的识别

- 好处： 即使在数据收集阶段，也维护用户隐私

Federated Learning for On-Device Model Improvement:

- Process: Federated learning is used to improve QuickType's language model by collaboratively training it across user devices

- Benefit: QuickType becomes more accurate and personalized to individual users' typing styles

Differential Privacy for Data Collection and Aggregation:

- Process: When Apple collects data from users' typing interactions to refine its language model, it incorporates differential privacy techniques

- Benefit: Even during the data collection phase, user privacy is upheld

### 11. 谷歌的联邦学习应用 / Google's Use of Federated Learning

#### Gboard键盘应用 / Gboard (Google Keyboard)

Gboard提供下一词建议和自动纠正等功能。联邦学习允许Gboard根据用户的打字习惯改进这些功能，而不将个别按键发送到Google的服务器。学习在用户设备上进行，只有聚合的见解被分享以完善全局模型。

Gboard offers features like next-word suggestions and autocorrections. Federated learning allows Gboard to improve these features based on users' typing habits without sending individual keystrokes to Google's servers. The learning occurs on the user's device, and only aggregated insights are shared to refine the global model.

#### 群组联邦学习（FLoC） / Federated Learning of Cohorts (FLoC)

FLoC是Google Chrome中用于基于兴趣广告的隐私保护方法。它根据用户的浏览行为将用户分组为群组，而不暴露个别浏览历史。联邦学习帮助协作生成这些群组，同时保持用户数据私密。

FLoC is a privacy-preserving approach in Google Chrome for interest-based advertising. It groups users into cohorts based on their browsing behavior, without exposing individual browsing histories. Federated learning helps in generating these cohorts collaboratively while keeping user data private.

#### 隐私保护医疗研究 / Privacy-Preserving Healthcare Research

Google Health使用联邦学习与医疗机构合作进行医学研究。医院和诊所可以在其本地患者数据上训练机器学习模型，Google聚合见解而不集中或暴露个别患者记录。这有助于医疗条件和治疗结果的研究，同时保护患者隐私。

Google Health uses federated learning to collaborate with healthcare institutions for medical research. Hospitals and clinics can train machine learning models on their local patient data, and Google aggregates the insights without centralizing or exposing individual patient records. This aids in research on medical conditions and treatment outcomes while protecting patient privacy.

#### Edge TPU和设备上机器学习 / Edge TPU and On-Device Machine Learning

Google的Edge张量处理单元（TPU）为图像识别和语音处理等应用启用设备上机器学习。联邦学习允许这些设备根据用户交互持续改进其模型，而不将敏感数据传输到云端。

Google's Edge Tensor Processing Unit (TPU) enables on-device machine learning for applications like image recognition and voice processing. Federated learning allows these devices to continually improve their models based on user interactions without transmitting sensitive data to the cloud.

#### Android隐私沙盒 / Android Privacy Sandbox

Google的Android隐私沙盒倡议旨在改进移动广告中的用户隐私。联邦学习在这些隐私保护技术中发挥作用，允许广告商理解聚合用户行为而不访问个别级别的数据。

Google's Android Privacy Sandbox initiative aims to improve user privacy in mobile advertising. Federated learning plays a role in these privacy-preserving techniques, allowing advertisers to understand aggregate user behavior without accessing individual-level data.

### **联邦学习的核心概念总结 / Core Concepts Summary of Federated Learning**

联邦学习允许在分散的数据源上训练模型，而不直接访问原始数据。相反，模型被发送到数据源，数据源根据其本地数据计算模型更新。隐私得到保护，因为原始数据保留在本地设备或服务器上，减少数据暴露的风险。

在联邦学习中，数据保留在本地设备或服务器上，只有模型更新而不是原始数据被分享。这种方法通过确保中央服务器不能直接访问个别数据点来保护隐私。

Federated learning allows training models on decentralized data sources without directly accessing the raw data. Instead, models are sent to the data sources, which compute model updates based on their local data. Privacy is preserved as the raw data remains on local devices or servers, reducing the risk of data exposure.

In federated learning, data remains on local devices or servers, and only model updates are shared instead of raw data. This approach preserves privacy by ensuring that the central server does not have direct access to individual data points.

#### 分散训练示例 / Decentralized Training Examples

- 分散训练： 多个设备或服务器协作训练全局模型，同时在本地保留数据。模型更新被分享和聚合，而不暴露原始数据

- Apple的Siri使用联邦学习改进语音识别，而不将用户语音数据传输到云端

- Google的Gboard使用联邦学习改进文本预测能力。用户数据保留在设备上，只有聚合更新被发送到Google的服务器

Decentralized Training: Multiple devices or servers collaborate to train a global model while keeping data locally. Model updates are shared and aggregated without exposing raw data

- Apple's Siri uses federated learning to improve speech recognition without transferring user voice data to the cloud

- Google's Gboard, a virtual keyboard application, uses federated learning to improve text prediction capabilities. User data remains on devices, and only aggregated updates are sent to Google's servers

### 同态加密 / Homomorphic Encryption

#### 基本概念 / Basic Concept

同态加密能够直接在加密数据上执行计算而无需解密。这种技术允许进行隐私保护的数据分析和模型训练，因为敏感信息在整个过程中保持加密状态。

Homomorphic encryption enables computations to be performed directly on encrypted data without decrypting it. This technique allows for privacy-preserving data analysis and model training as sensitive information remains encrypted throughout the process.

#### 实际应用示例 / Examples of Practical Applications

加密计算： 数据被加密，计算在加密数据上执行而不解密，保护隐私。

Microsoft SEAL（简单加密算术库）为机器学习任务中的安全数据处理启用同态加密。

Microsoft的Cryptonets项目利用同态加密在医学研究中保护患者数据，同时允许对加密数据进行分析而不暴露个别医疗记录。

Encrypted Computations: Data is encrypted, and computations are performed on the encrypted data without decrypting it, preserving privacy.

Microsoft SEAL (Simple Encryption Arithmetic Library) enables homomorphic encryption for secure data processing in machine learning tasks.

Microsoft's Cryptonets project utilizes homomorphic encryption to protect patient data in medical research while allowing analysis on encrypted data without exposing individual medical records.

### 安全多方计算（SMPC） / Secure Multi-Party Computation (SMPC)

#### 核心原理 / Core Principle

SMPC使多个参与方能够在不分享其私有输入的情况下协作计算结果。它通过在多个实体间分布计算来确保隐私，允许它们在不暴露各自个别数据的情况下合作。

SMPC enables multiple parties to collaboratively compute a result without sharing their private inputs. It ensures privacy by distributing the computation across multiple entities, allowing them to work together without revealing their individual data.

#### 应用实例 / Application Examples

协作计算： 多个参与方在其私有输入上联合执行计算，而不暴露敏感信息。

IBM的Sharemind框架允许参与方在私有数据上计算统计信息，如计算平均值或方差，而不披露个别值。

医疗研究中的协作机器学习： 多个医院分享数据并协作模型训练，而不直接分享患者特定信息。

Collaborative Computations: Multiple parties jointly perform computations on their private inputs without revealing sensitive information.

IBM's Sharemind framework allows parties to compute statistics on private data, such as calculating average or variance, without disclosing individual values.

Collaborative machine learning in healthcare research: Multiple hospitals share data and collaborate on model training without directly sharing patient-specific information.

### 隐私保护数据聚合 / Privacy-Preserving Data Aggregation

#### 技术概述 / Technical Overview

这种技术涉及从多个来源聚合敏感数据，同时保护个人隐私。使用各种聚合方法，如安全求和或安全平均，计算统计度量而不暴露原始数据。

This technique involves aggregating sensitive data from multiple sources while preserving individual privacy. Various aggregation methods, such as secure sum or secure average, are used to calculate statistical measures without exposing the original data.

#### 实际应用 / Practical Applications

聚合敏感数据： 来自多个来源的敏感信息被聚合，同时保护个人隐私。

隐私保护数据聚合可应用于医疗研究，将来自不同医院的医疗数据结合进行分析，而不暴露患者详细信息。

电信公司聚合通话数据记录以分析网络流量模式，而不损害个别呼叫者的隐私。

Aggregating Sensitive Data: Sensitive information from multiple sources is aggregated while protecting individual privacy.

Privacy-preserving data aggregation can be applied in healthcare research, where medical data from different hospitals is combined for analysis without exposing patient details.

Telecom companies aggregating call data records to analyze network traffic patterns without compromising the privacy of individual callers.

### 匿名化和掩码技术 / Anonymization and Masking

#### 技术方法 / Technical Methods

匿名化技术，如k-匿名性和l-多样性，修改或删除数据集中的标识信息，使得将个别数据点链接到特定个人变得更加困难。数据掩码涉及用虚拟或一般表示替换敏感值以保护个人隐私。

Anonymization techniques, such as k-anonymity and l-diversity, modify or remove identifying information from datasets, making it harder to link individual data points to specific individuals. Data masking involves replacing sensitive values with dummy or general representations to protect individual privacy.

#### 应用示例 / Application Example

删除标识信息： 个人可识别信息（PII）从数据集中修改或删除以保护个人隐私。

示例： k-匿名性技术通过确保每个个人的记录在数据集中不能与至少k-1个其他个人区分开来进行数据匿名化。

Removing Identifying Information: Personally identifiable information (PII) is modified or removed from datasets to protect individual privacy.

Example: The k-anonymity technique anonymizes data by ensuring that each individual's record cannot be distinguished among at least k-1 other individuals in the dataset.

### 隐私保护合成数据生成 / Privacy-Preserving Synthetic Data Generation

#### 技术概念 / Technical Concept

合成数据生成技术创建人工数据集，保持原始数据的统计属性同时确保隐私。隐私保护的合成数据可以被分享并用于模型训练，而不暴露敏感信息。

Synthetic data generation techniques create artificial datasets that retain the statistical properties of the original data while ensuring privacy. Privacy-preserving synthetic data can be shared and used for model training without revealing sensitive information.

#### 实际应用 / Practical Application

生成人工数据： 创建与原始数据统计属性相似的合成数据集，保护隐私。

示例： 生成对抗网络（GANs）可用于生成合成医疗图像或金融交易数据用于研究，同时保护个人隐私。

Generating Artificial Data: Synthetic datasets with statistical properties similar to the original data are created, preserving privacy.

Example: Generative Adversarial Networks (GANs) can be used to generate synthetic medical images or financial transaction data for research while protecting individual privacy.

### 特征工程中的隐私考虑 / Privacy Considerations in Feature Engineering

#### 隐私机制选择 / Privacy Mechanism Selection

当进入特征工程过程时，这是实验更强大隐私机制的好时机，特别是如果特征要进入集中式特征存储或可能被相关团队或项目使用。

对于较弱的隐私机制，如伪匿名化或简单舍入，考虑记录数据到期期限。

根据GDPR要求，用户有被遗忘的权利，所以如果你在没有适当匿名化机制的情况下使用用户数据，你需要找出删除该数据的方法，包括在其他位置保存的该数据的副本或工件。

As you move into the feature engineering part of the process, it's a good time to experiment with a more robust privacy mechanism, particularly if the features are going into a centralized feature store or might be used by related teams or projects.

For weaker privacy mechanisms, such as pseudonymization or simple rounding, think about documenting a data expiry period.

Under the GDPR requirements, users have the right to be forgotten, so if you are using user data without proper anonymization mechanisms, you will need to figure out ways to delete that data, including copies or artifacts of that data held in other locations.

#### GDPR合规性说明 / GDPR Compliance Note

根据GDPR，用户应该能够删除他们产生的所有数据。这通常被法律部门解释为他们直接输入的数据，而不是他们在使用应用程序和平台时可能创建的数据。

Under the GDPR, a user should be able to remove all data they have produced. This has often been interpreted by legal departments as data they have directly entered rather than data they might have created when using an application and platform.

### PPML开源库 / Open Source Libraries for PPML

#### 推荐库：Opacus / Recommended Library: Opacus

在审查可用库后，强烈推荐来自PyTorch团队的Opacus，它使向训练优化器添加差分隐私机制变得相当容易。

与向单个有向无环图（如数据管道）添加差分隐私机制不同，在隐私保护机器学习中，你必须考虑机器学习训练过程的重复和并行操作。

如果你已经在使用PyTorch，团队有内置方法将这种隐私损失跟踪直接集成到优化器步骤中。

最后，优化器被设置为使用Opacus，使用DP-SGD进行差分隐私训练，并设置隐私预算来跟踪训练期间的隐私损失。

After reviewing the available libraries, I strongly recommend Opacus, from the PyTorch team, which makes it fairly easy to add differential privacy mechanisms to your training optimizer.

Unlike adding a differential privacy mechanism to a single directed acyclic graph—like a data pipeline—in privacy-preserving machine learning you must consider the repetitive and parallel actions of a machine learning training process.

If you are already using PyTorch, the team has built-in methods for tracking this privacy loss over time directly into the optimizer step.

Finally, the optimizer is set up to use Opacus, making the training differentially private using DP-SGD and setting up a privacy budget to track privacy loss during training.

### 训练监控 / Monitoring Your Training

#### 监控工具和优化策略 / Monitoring Tools and Optimization Strategies

在训练期间使用TensorBoard等界面将帮助你确定噪声添加如何总体影响训练。

你还可以通过使用在公开可用数据上训练的基础模型，然后使用私有数据微调这些模型来优化机器学习中差分隐私的使用。

这是标准做法，特别是对于计算机视觉或语言模型，它允许你使用公开可用的模型作为起点，并使用你的训练数据通过隐私保护训练为特定用例改进它们。

2023年隐私和安全专家的研究表明，这些水平是危险的，可能导致完全不准确的隐私假设。

Using an interface like TensorBoard during your training will help you determine how your noise addition is affecting the training overall.

You can also optimize your machine learning usage of differential privacy by using base models that have been trained on publicly available data and then fine-tune these models using the private data.

This is standard practice, especially for computer vision or language models, and it allows you to use publicly available models as a starting point and improve them for your particular use case using your training data, with privacy-preserving training.

Research from privacy and security experts in 2023 demonstrated that these levels are dangerous and can lead to privacy assumptions that are simply inaccurate.

### 工程差分隐私特征 / Engineering Differentially Private Features

#### 实施考虑 / Implementation Considerations

在训练期间添加差分隐私是最优的；考虑基于最新研究编写自己的实现。

这只有在由愿意记录、保持更新并投资让专家审计的大型团队维护时才能规模化。

这意味着如果每个人可以向特征贡献一个张量，你正在看本地差分隐私——这让你处在可能完全不起作用的空间，因为你的噪声将随着数据集的大小而扩展。

Adding differential privacy during training is optimal; consider writing your own implementation based on the latest research.

This will scale only if it's maintained by a larger team that is willing to document it, keep it up-to-date, and invest in having it audited by experts.

This means you are looking at local differential privacy if each person can contribute one tensor to the feature—which puts you squarely in the space that it might not work at all because your noise will scale with the size of your dataset.

#### 警告和最佳实践 / Warnings and Best Practices

确定每个特征的敏感性以及如何实施限制。

找出用户可以对特定模型做出多少贡献，并使用这个来帮助确定你如何跟踪ε随时间的变化。

构建或使用库来产生差分隐私张量。

尝试用你的差分隐私特征训练几种不同类型的模型，看看你的结果在非匿名化测试数据集上如何工作。

确保你不是独自构建它。

Determine what sensitivity you have for each feature and how you want to implement clamping.

Figure out how many contributions a user can make to a particular model and use this to help determine how you want to track epsilon over time.

Build or use a library to produce a differentially private tensor.

Try training a few different types of models with your differentially private features and see how your results work on a nonanonymized test dataset.

Make sure you are not building it alone.

### 应用简单方法 / Applying Simpler Methods

#### 替代隐私技术 / Alternative Privacy Techniques

如果结合差分隐私对特定模型或特征不起作用，那么你需要寻找其他方法，如编辑、伪匿名化、格式保留加密，或可能工程更隐私感知的新特征。

假设你正在构建一个个性化引擎，希望基于个人详细信息或用户活动组合推荐产品。

如果没有隐私感知的方式来达到目标，你应该质疑目标本身。

例如，美国邮政编码通常是阶级、种族、社会经济状况和种族的相关变量。

If incorporating differential privacy doesn't work for the particular model or feature, then you will need to look at other methods, such as redaction, pseudonymization, format-preserving encryption, or potentially engineering new features that are more privacy-aware.

Suppose you are building a personalization engine, where you want to recommend products based on personal details or combinations of user activity.

If there is no privacy-aware way to reach the goals, you should question the goals themselves.

For example, US postal codes are often a correlated variable for class, race, socioeconomic status, and ethnicity.

#### 特征重新工程策略 / Feature Re-engineering Strategy

如果邮政编码包含大量你试图学习的信息，可能你正在构建一个基于收入、社会经济状况、种族和/或族裔做出决定的模型。

如果你的推荐器通过邮政编码做出好的决定，并且你发现这些决定是基于社会经济线做出的，你可以通过创建使用地理收入数据将邮政编码映射到收入组的分类变量来更好地保护人们的隐私并更明确地了解你的模型在做什么。

你可以创建一个新变量"社区收入括号"，将邮政编码映射到这些范围，或者将它们进一步概括为类别，如低收入、中等收入和高收入。

If postal codes hold a lot of information about what you are trying to learn, it's possible that you are building a model that is making a decision based on income, socioeconomic status, race, and/or ethnicity.

If your recommender does well deciding via postal codes and you find that these decisions are made on socioeconomic lines, you can better protect people's privacy and be more explicit about what your model is doing by creating a categorical variable that uses geographical income data to map postal codes to income groups.

You can then create a new variable "Neighborhood income bracket" and map postal codes to these ranges or generalize them even further into categories, such as lower income, middle income, and higher income.

### 机器学习文档化 / Documenting Your Machine Learning

#### 文档化要求 / Documentation Requirements

数据治理要求你记录你的努力，这些文档对他人可读和可编辑。

对于机器学习，这可能意味着开发自文档化的机器学习管道，将模型作为管道的一部分进行文档化。

近年来的研究和关注集中在开发可被多种用户理解的模型文档。

Data governance requires that you document your efforts and that this documentation is readable and editable by others.

For machine learning, this could mean developing self-documenting machine learning pipelines, which document models produced by them as part of the pipeline.

Research and attention in recent years has focused on developing model documentation that can be understood by a multitude of users.

#### 关键文档要素 / Key Documentation Elements

数据血缘： 这些数据来自哪里，在什么条件下收集或转换？这些数据的同意信息和隐私政策是什么？

数据保留和保护政策： 适用于这些数据的内部或外部政策是什么？是否应在特定时间点删除此模型？

隐私风险： 准备和训练前数据中存在什么风险？是否分析异常值对模型中边缘化人群的影响？

应用的隐私技术： 列举应用于数据准备和训练的技术。

Data lineage: Where did this data come from and under what conditions was it collected or transformed? What were the consent information and privacy policies for this data?

Data retention and protection policies: What are the internal or external policies that apply to this data? Should this model be deleted at a particular point in time?

Privacy risks: What risks were in the data before preparation and training? Were outliers analyzed for impact on marginalized populations in the model?

Privacy techniques applied: Enumerate the techniques applied to the data preparation and training.

### 批准使用和隐私标签 / Approved Usage and Privacy Labels

#### 隐私可视化历史 / History of Privacy Visualization

向用户和从业者可视化显示隐私有着悠久历史。实际上，CMU CyLab可用隐私和安全实验室在2010年发布了一个带有精美视觉的隐私标签设计，向用户展示他们的数据将如何被使用。

我提出的模型隐私卡旨在向软件工程师和机器学习科学家传达模型中的隐私关注。

DPIA等文档向内部法律和技术利益相关者以及外部监管机构和审计员传达隐私风险和缓解措施。

隐私标签清楚直观地向用户解释他们的数据将如何被使用。

模型还需要创建日期、到期或重新训练，和/或评估日期和使用文档。

Showing privacy to users and practitioners visually has a long history. In fact, the CMU CyLab Usable Privacy and Security Laboratory released a design with privacy label with pretty neat visuals in 2010 to show users how their data was going to be used.

My proposal for model privacy cards aims to communicate privacy concerns in models to software engineers and machine learning scientists.

A document like a DPIA communicates privacy risks and mitigations to internal legal and technical stakeholders as well as external regulators and auditors.

A privacy label clearly and visually explains to users how their data will be used.

Models will also need creation dates, expiration or retraining, and/or evaluation dates and usage documentation.

### 警告和注意事项 / Warnings and Considerations

#### 系统性问题 / Systemic Issues

有些问题不适合公平性转换，因为它们本质上是不公平的。

只有具有社会变革观点的多学科团队才能以全面的方式充分解决这些问题。

机器学习模型接受加密张量作为输入并输出用户可以解密的加密预测。

它不为训练数据本身提供隐私，尽管有方法可以结合方法——同时使用差分隐私机制和加密计算。

解决机器学习问题的隐私部分意味着更全面地审视你具体想要解决的问题。

Some problems don't lend themselves to fairness transformations because they are inherently unfair.

Only a multidisciplinary team with an opinion on societal change can adequately approach these problems in a comprehensive manner.

The machine learning model took encrypted tensors as input and output an encrypted prediction that the user could then decrypt.

It does not provide privacy for the training data itself, although there are ways to combine approaches—using differentially private mechanisms and encrypted computation together.

Solving the privacy part of the machine learning problem means looking more holistically at what problem you are specifically wanting to solve.

### 数据和机器学习项目中的隐私架构 / Architecting Privacy in Data and Machine Learning Projects

#### 系统集成考虑 / System Integration Considerations

训练显然不是机器学习过程的唯一部分。

随着更大的数据科学、分析和机器学习系统的构建，它们需要广泛的软件和数据以及架构、DevOps、平台和基础设施支持来交付和集成软件和机器学习工作流。

Training is clearly not the only part of the machine learning process.

As larger data science, analytics, and machine learning systems are built, they require a broad expanse of software and data as well as architecture, DevOps, platform, and infrastructure support to deliver and integrate software and machine learning workflows.

### 理解数据隐私需求 / Understanding Your Data Privacy Needs

#### 治理和自动化 / Governance and Automation

拥有全面的数据治理倡议并将其实施到你的平台和工作流中很重要。

因为你有适当的血缘、同意和来源详细信息，你可以使用这些信息来调查哪些数据可用且对你的用例有用。

治理详细信息，如收集过程、同意详细信息以及匿名化和/或删除要求，将帮助你找到适合你的用例和部署要求的数据。

在项目开始时，评估用于在工作流中构建隐私的批准库和工具通常很有用。

你将持续需要考虑隐私与信息连续体并为你的用例做出决定。

It is important to have comprehensive data governance initiatives and implement them into your platforms and workflows.

Because you have proper lineage, consent, and provenance details, you can use this information to investigate what data is available and useful for your use case.

Governance details, such as the collection process, consent details, and anonymization and/or deletion requirements, would help you find data that fits your use case and deployment requirements.

At the beginning of a project, it's often useful to evaluate approved libraries and tools for building privacy into workflows.

You will continually need to consider the privacy versus information continuum and make decisions for your use case.

#### 实施策略 / Implementation Strategy

如果差分隐私不适用于你的问题空间，你需要做一些艰难的选择并记录它们，这样其他人就可以理解你的模型或分析。

要在工作流中自动化隐私，将同意和治理构建到数据管理平台中，确保必要的同意、血缘和收集详细信息与数据保持接近。

如果你的组织有数据管理团队或数据平台团队，他们可以构建这个；数据科学团队可以自动化查询和重新训练模型，而不用担心数据被错误分类或误用。

If differential privacy doesn't work for your problem space, you need to make some hard choices and document them so others can make sense of your model or analysis.

To automate privacy in your workflows, build consent and governance into your data management platforms, ensuring the necessary consent, lineage, and collection details remain close to the data.

If your organization has a data management team or data platform team, they can build this in; the data science team can automate querying and retraining models without concerns that data is miscategorized or misused.

### 隐私监控 / Monitoring Privacy

#### 基础设施集成 / Infrastructure Integration

当你将隐私构建到数据科学和机器学习基础设施中时，可以将隐私监控添加到正常的基础设施系统中。

这也可能意味着将隐私构建到当前的监控系统中——特别是如果过去在记录敏感信息或确保基础设施遵守数据隐私和安全策略方面存在问题。

但其他异常值更难识别，比如作为早期采用者为新应用做出贡献的用户，或在人群中过度代表的超级用户。

As you build privacy into your data science and machine learning infrastructure, it is possible to add privacy monitoring to your normal infrastructure systems.

This might also mean building privacy into your current monitoring systems—particularly if there have problems in the past with logging sensitive information or ensuring that the infrastructure is respecting the data privacy and security policies.

But other outliers are more difficult to identify, like a user who contributes to a new application as an early adopter or a superuser who is overrepresented in the population.

#### 监控最佳实践 / Monitoring Best Practices

你可能想知道如果你使用的数据极其敏感，如何适当地监控和采样。

还有一些有趣的方法来提供差分隐私采样。

当监控隐私时，你想确认你启用的隐私自动化工作正常。

如果你发现你的隐私工程，特别是差分隐私机制，由于数据本身的重大变化而导致数据质量低，你需要重新开始EDA过程并确定什么是可接受的。

机器学习解释和预测可能泄露敏感信息，特别是关于异常值的信息，应该被作为敏感数据本身处理。

You may wonder about how to monitor and sample appropriately if the data you are using is extremely sensitive.

There are also some interesting ways to provide differentially private sampling.

When monitoring privacy, you want to confirm the privacy automation you are enabling is working appropriately.

If you find that your privacy engineering, especially differential privacy mechanisms, is contributing to low data quality due to significant shifts in the data itself, you'll need to begin again at the EDA part of the process and determine what is acceptable.

Machine learning explanations and predictions can leak sensitive information, particularly about outliers, and should be handled as sensitive data themselves.

### 总结 / Summary

本章学习了如何将你学到的核心隐私原则和技术应用于数据科学和机器学习工作流。

通过在探索性分析、特征工程和机器学习的背景下评估这些技术，你可以识别需要解决的领域，以将理论应用到实际情况。

下一章将通过探索联邦学习和分布式计算场景如何增强隐私保证并为数据共享提供有趣机会来建立在此基础上。

In this chapter, you've learned how to apply core privacy principles and techniques you learned to the data science and machine learning workflow.

By evaluating these technologies in the context of exploratory analysis, feature engineering, and machine learning, you can identify areas you need to address to apply theory to practical situations.

In the next chapter, you'll build on that by exploring how federated learning and distributed computation scenarios can enhance privacy guarantees and provide interesting opportunities for data sharing.

## CSEC5614 Data Privacy: Theory and Practice - Lecture5数据隐私保护与加密计算：理论、技术与应用Data Privacy Protection and Encrypted Computing: Theories, Technologies, and Applications

### 1. 数据保留和保护政策Data Retention and Protection Policies

- 适用于数据的内部或外部政策是什么？

- 模型是否应该在特定时间点被删除？

- 基于模型中数据的敏感性，提供政策视角和专业意见

- What are the internal or external policies that apply to this data?

- Should this model be deleted at a particular point in time?

- Provide a policy perspective and your professional opinion, based on the sensitivity of the data in the model

### 2. 隐私风险Privacy Risks

- 数据准备和训练之前存在哪些风险？

- 是否分析了异常值对模型中边缘化群体的影响？

- 如果组织有风险评估框架，可以将其整合到分析中

- What risks were in the data before preparation and training?

- Were outliers analyzed for impact on marginalized populations in the model?

- If your organization has a risk evaluation framework, you could integrate it for this analysis

### 3. 应用的隐私技术Privacy Techniques Applied

- 列举应用于数据准备和训练的技术

- 如果在选择特定技术之前尝试了多种选项，对先前方法的简短总结可为他人提供背景和见解

- Enumerate the techniques applied to the data preparation and training

- If you experimented with several options before choosing a particular technique or technology, a short summary of prior methods provides background and insight to others

### 4. 批准使用

Approved Usage

中文内容：

向用户和从业者可视化显示隐私有着悠久的历史

事实上，CMU CyLab可用隐私和安全实验室在2010年发布了一个带有隐私标签的设计，具有很好的视觉效果，向用户显示他们的数据将如何被使用

我的模型隐私卡建议旨在向软件工程师和机器学习科学家传达模型中的隐私关注

像DPIA这样的文件将隐私风险和缓解措施传达给内部法律和技术利益相关者以及外部监管机构和审计师

隐私标签清晰直观地向用户解释他们的数据将如何被使用

模型还需要创建日期、到期或重训练和/或评估日期以及使用文档

English Content:

Showing privacy to users and practitioners visually has a long history

In fact, the CMU CyLab Usable Privacy and Security Laboratory released a design with privacy label with pretty neat visuals in 2010 to show users how their data was going to be used

My proposal for model privacy cards aims to communicate privacy concerns in models to software engineers and machine learning scientists

A document like a DPIA communicates privacy risks and mitigations to internal legal and technical stakeholders as well as external regulators and auditors

A privacy label clearly and visually explains to users how their data will be used

Models will also need creation dates, expiration or retraining, and/or evaluation dates and usage documentation

### 5. 警告

WARNING

中文内容：

有些问题不适合公平性转换，因为它们本质上是不公平的

只有具有社会变革观点的多学科团队才能以全面的方式充分解决这些问题

机器学习模型接受加密张量作为输入，并输出用户随后可以解密的加密预测

它不为训练数据本身提供隐私，尽管有方法结合方法——使用差分隐私机制和加密计算

解决机器学习问题的隐私部分意味着更全面地看待您具体想要解决的问题

English Content:

Some problems don't lend themselves to fairness transformations because they are inherently unfair

Only a multidisciplinary team with an opinion on societal change can adequately approach these problems in a comprehensive manner

The machine learning model took encrypted tensors as input and output an encrypted prediction that the user could then decrypt

It does not provide privacy for the training data itself, although there are ways to combine approaches—using differentially private mechanisms and encrypted computation together

Solving the privacy part of the machine learning problem means looking more holistically at what problem you are specifically wanting to solve

### 6. 在数据和机器学习项目中架构隐私

Architecting Privacy in Data and Machine Learning Projects

中文内容：

训练显然不是机器学习过程的唯一部分

随着更大的数据科学、分析和机器学习系统的构建，它们需要广泛的软件和数据以及架构、DevOps、平台和基础设施支持来交付和集成软件和机器学习工作流程

English Content:

Training is clearly not the only part of the machine learning process

As larger data science, analytics, and machine learning systems are built, they require a broad expanse of software and data as well as architecture, DevOps, platform, and infrastructure support to deliver and integrate software and machine learning workflows

### 7. 了解您的数据隐私需求

Understanding Your Data Privacy Needs

中文内容：

如第1章和第3章所述，拥有全面的数据治理计划并将其实施到您的平台和工作流程中是很重要的

因为您有适当的血统、同意和来源详细信息，您可以使用这些信息来调查哪些数据可用且对您的用例有用

治理详细信息，例如收集过程、同意详细信息以及匿名化和/或删除要求，将帮助您找到适合您的用例和部署要求的数据

在项目开始时，评估批准的库和工具以在工作流程中构建隐私通常是有用的

您将持续需要考虑隐私与信息连续体，并为您的用例做出决定

English Content:

As Chapters 1 and 3 note, it is important to have comprehensive data governance initiatives and implement them into your platforms and workflows

Because you have proper lineage, consent, and provenance details, you can use this information to investigate what data is available and useful for your use case

Governance details, such as the collection process, consent details, and anonymization and/or deletion requirements, would help you find data that fits your use case and deployment requirements

At the beginning of a project, it's often useful to evaluate approved libraries and tools for building privacy into workflows

You will continually need to consider the privacy versus information continuum and make decisions for your use case

### 8. 了解您的数据隐私需求（续）

Understanding Your Data Privacy Needs (Continued)

中文内容：

如果差分隐私不适用于您的问题空间，您需要做出一些艰难的选择并记录它们，以便其他人可以理解您的模型或分析

要在工作流程中自动化隐私，请将同意和治理构建到您的数据管理平台中，确保必要的同意、血统和收集详细信息保持接近数据

如果您的组织有数据管理团队或数据平台团队，他们可以构建这个；数据科学团队可以自动化查询和重训练模型，而不用担心数据被错误分类或滥用

English Content:

If differential privacy doesn't work for your problem space, you need to make some hard choices and document them so others can make sense of your model or analysis

To automate privacy in your workflows, build consent and governance into your data management platforms, ensuring the necessary consent, lineage, and collection details remain close to the data

If your organization has a data management team or data platform team, they can build this in; the data science team can automate querying and retraining models without concerns that data is miscategorized or misused

### 9. 监控隐私

Monitoring Privacy

中文内容：

当您在数据科学和机器学习基础设施中构建隐私时，可以将隐私监控添加到您的正常基础设施系统中

这也可能意味着将隐私构建到您当前的监控系统中——特别是如果过去在记录敏感信息或确保基础设施遵守数据隐私和安全政策方面存在问题

但其他异常值更难识别，比如作为早期采用者为新应用程序做出贡献的用户或在人群中过度代表的超级用户

English Content:

As you build privacy into your data science and machine learning infrastructure, it is possible to add privacy monitoring to your normal infrastructure systems

This might also mean building privacy into your current monitoring systems—particularly if there have problems in the past with logging sensitive information or ensuring that the infrastructure is respecting the data privacy and security policies

But other outliers are more difficult to identify, like a user who contributes to a new application as an early adopter or a superuser who is overrepresented in the population

### 10. 提示TIP

您可能想知道如果您使用的数据极其敏感，如何适当地监控和采样

还有一些有趣的方法来提供差分隐私采样

在监控隐私时，您希望确认您启用的隐私自动化工作正常

如果您发现您的隐私工程，特别是差分隐私机制，由于数据本身的显著变化而导致数据质量低，您需要重新开始EDA过程的一部分并确定什么是可接受的

正如您在第4章中学到的，机器学习解释和预测可能泄露敏感信息，特别是关于异常值的信息，应该作为敏感数据本身处理

English Content:

You may wonder about how to monitor and sample appropriately if the data you are using is extremely sensitive

There are also some interesting ways to provide differentially private sampling

When monitoring privacy, you want to confirm the privacy automation you are enabling is working appropriately

If you find that your privacy engineering, especially differential privacy mechanisms, is contributing to low data quality due to significant shifts in the data itself, you'll need to begin again at the EDA part of the process and determine what is acceptable

As you learned in Chapter 4, machine learning explanations and predictions can leak sensitive information, particularly about outliers, and should be handled as sensitive data themselves

11. 总结

Summary

中文内容：

在本章中，您学习了如何将您学到的核心隐私原则和技术应用于数据科学和机器学习工作流程

通过在探索性分析、特征工程和机器学习的背景下评估这些技术，您可以识别需要解决的领域，以将理论应用于实际情况

在下一章中，您将通过探索联邦学习和分布式计算场景如何增强隐私保证并为数据共享提供有趣机会来建立在此基础上

English Content:

In this chapter, you've learned how to apply core privacy principles and techniques you learned to the data science and machine learning workflow

By evaluating these technologies in the context of exploratory analysis, feature engineering, and machine learning, you can identify areas you need to address to apply theory to practical situations

In the next chapter, you'll build on that by exploring how federated learning and distributed computation scenarios can enhance privacy guarantees and provide interesting opportunities for data sharing

### 12. 自我检查

Check Yourself

中文内容：

什么是隐私攻击？

隐私攻击：例子

English Content:

What are the Privacy Attacks?

Privacy Attacks: Examples

### 加密计算Encrypted Computation

### 介绍Introduction

加密计算，也称为安全计算或隐私保护计算，是指在不向参与计算的各方透露底层数据的情况下对加密数据执行计算的过程

它是一种用于保护数据隐私同时允许协作数据分析、机器学习和其他计算的基本技术

计算以确保加密输入保持机密的方式进行，只有加密输出被透露。这确保敏感信息在整个计算过程中得到保护

English Content:

Encrypted computation, also known as secure computation or privacy-preserving computation, refers to the process of performing computations on encrypted data without revealing the underlying data to the parties involved in the computation

It is a fundamental technique used to protect data privacy while allowing for collaborative data analysis, machine learning, and other computations

The computations are carried out in such a way that the encrypted inputs remain confidential, and only the encrypted output is revealed. This ensures that the sensitive information remains protected throughout the entire computation process

### 15. 加密计算技术Encrypted Computation Techniques

同态加密(HE)

部分同态加密(PHE)

完全同态加密(FHE)

安全多方计算(SMPC)

Homomorphic Encryption (HE)

Partially Homomorphic Encryption (PHE)

Fully Homomorphic Encryption (FHE)

Secure Multi-Party Computation (SMPC)

### 16. 同态加密

Homomorphic Encryption

同态加密方案使得可以直接对加密数据执行计算

这意味着加密输入可以被算法操作，计算结果将是加密输出

加密输出然后可以被解密以获得最终结果

同态加密方案的例子包括部分同态加密（例如ElGamal）和完全同态加密（例如CKKS、BFV）

English Content:

Homomorphic encryption schemes enable computations to be performed directly on encrypted data

This means that encrypted inputs can be operated on by an algorithm, and the result of the computation will be an encrypted output

The encrypted output can then be decrypted to obtain the final result

Examples of homomorphic encryption schemes include Partially Homomorphic Encryption (e.g., ElGamal) and Fully Homomorphic Encryption (e.g., CKKS, BFV)

### 17. 部分同态加密(PHE)

Partially Homomorphic Encryption (PHE)

中文内容： PHE允许对加密数据执行加法或乘法运算，但不能同时执行。这意味着特定方案只支持一种类型的操作而无需解密。

部分同态加密的例子：

ElGamal： 此方案支持乘法同态。如果您有两个加密值，您可以将它们相乘，结果解密后将是原始明文的乘积。

RSA（Rivest–Shamir–Adleman）： 标准RSA加密方案也支持乘法同态。您可以将两个密文相乘，结果解密后将是原始消息的乘积。

Paillier： 此方案支持加法同态，允许对加密数字执行加法运算。

English Content: PHE allows either additive or multiplicative operations to be performed on encrypted data, but not both. This means a specific scheme will only support one type of operation without decryption.

Examples of Partially Homomorphic Encryption:

ElGamal: This scheme supports multiplicative homomorphism. If you have two encrypted values, you can multiply them together and the result, when decrypted, will be the product of the original plaintexts.

RSA (Rivest–Shamir–Adleman): The standard RSA encryption scheme also supports multiplicative homomorphism. You can multiply two ciphertexts and the result, when decrypted, will be the product of the original messages.

Paillier: This scheme supports additive homomorphism, which allows for addition operations to be performed on encrypted numbers.

### 18. 例子

Examples

中文内容：

例子（加法PHE - Paillier）：

假设我们加密两个数字，5和3。

如果我们同态地加它们的加密形式，然后解密结果，将得到5+3=8。

例子（乘法PHE - ElGamal）：

如果您加密两个数字，比如7和6。

您可以同态地乘以加密值，解密后得到7×6=42。

English Content:

Example (Additive PHE - Paillier):

Let's say we encrypt two numbers, 5 and 3.

If we add their encrypted forms homomorphically, and decrypt the result, it will give 5+3=8.

Example (Multiplicative PHE - ElGamal):

If you encrypt two numbers, say 7 and 6.

You can multiply the encrypted values homomorphically, and when decrypted, you get 7×6=42.

19. 完全同态加密(FHE)

Fully Homomorphic Encryption (FHE)

中文内容： FHE方案允许对加密数据执行加法和乘法（以及它们的组合）。这意味着可以执行任何任意计算（例如，加法、乘法、多项式函数等）而无需先解密数据。

完全同态加密的例子：

CKKS（Cheon-Kim-Kim-Song）： 一个分层完全同态加密方案，支持实数和复数的近似算术。广泛用于加密数据上的机器学习任务。

BFV（Brakerski-Fan-Vercauteren）： 支持整数的精确算术，经常在金融或其他需要精确操作的领域使用。

English Content: FHE schemes allow both addition and multiplication (as well as combinations of them) to be performed on encrypted data. This means any arbitrary computation (e.g., addition, multiplication, polynomial functions, etc.) can be performed without needing to decrypt the data first.

Examples of Fully Homomorphic Encryption:

CKKS (Cheon-Kim-Kim-Song): A leveled fully homomorphic encryption scheme that supports approximate arithmetic on real and complex numbers. It's widely used in machine learning tasks on encrypted data.

BFV (Brakerski-Fan-Vercauteren): Supports exact arithmetic on integers, and is often used in financial or other domains where precise operations are needed.

### 20. 例子（续）

Examples (Continued)

中文内容：

例子（FHE - BFV）：

假设我们加密两个数字，7和5。

您可以同态地加它们（得到7+5=12）并乘它们（7×5=35）而无需解密它们。

结果可以在最后解密以给出两种操作的正确值。

例子（FHE - CKKS）：

加密两个实数，比如3.14和2.72。

您可以对加密数字执行同态加法或乘法。CKKS特别适用于机器学习模型中的矩阵乘法等操作。

FHE的优势：

您可以对加密数据执行任何操作序列（加法和乘法），这对于许多应用程序至关重要，如加密机器学习、安全数据分析等。

English Content:

Example (FHE - BFV):

Suppose we encrypt two numbers, 7 and 5.

You can add them homomorphically (giving 7+5=12) and multiply them (7×5=35) without decrypting them.

The result can be decrypted at the end to give the correct values for both operations.

Example (FHE - CKKS):

Encrypt two real numbers, say 3.14 and 2.72.

You can perform homomorphic addition or multiplication on the encrypted numbers. CKKS is particularly useful for operations like matrix multiplication in machine learning models.

Advantages of FHE:

You can perform any sequence of operations (both addition and multiplication) on encrypted data, which is crucial for many applications like encrypted machine learning, secure data analysis, and more.

### 21. 差异Differences

[显示PHE和FHE的对比表格]

| 特征 | 部分同态加密(PHE) | 完全同态加密(FHE) |
| --- | --- | --- |
| 支持的操作 | 加法或乘法 | 加法和乘法 |
| 例子 | ElGamal（乘法），Paillier（加法） | CKKS，BFV |
| 计算复杂性 | 简单，有限操作 | 任意，复杂计算 |
| 性能 | 比FHE更高效 | 计算开销大 |
| 用例 | 简单计算，如安全投票或基本数据聚合 | 加密机器学习，安全数据分析 |

[Shows comparison table between PHE and FHE]

| Feature | Partially Homomorphic Encryption (PHE) | Fully Homomorphic Encryption (FHE) |
| --- | --- | --- |
| Supported Operations | Either addition or multiplication | Both addition and multiplication |
| Examples | ElGamal (multiplicative), Paillier (additive) | CKKS, BFV |
| Complexity of Computation | Simple, limited operations | Arbitrary, complex computations |
| Performance | More efficient than FHE | Computationally expensive |
| Use Cases | Simple calculations like secure voting or basic data aggregation | Encrypted machine learning, secure data analysis |

### 22. 同态加密：例子Homomorphic Encryption: Example

医疗研究合作： 在这种情况下，多个医疗机构希望在保持患者数据隐私的同时进行研究合作。同态加密使他们能够对加密的患者记录执行计算。

每个机构使用同态加密方案加密其患者数据。

然后他们可以与其他合作者安全地共享加密数据。

通过对加密数据应用同态运算，如加法或乘法，他们可以在不透露任何敏感信息的情况下共同分析数据。

例如，他们可以计算平均年龄或对加密医疗数据进行统计分析，促进研究合作同时保护患者隐私。

English Content: Medical Research Collaboration: In this scenario, multiple medical institutions want to collaborate on research while maintaining the privacy of patient data. Homomorphic encryption enables them to perform computations on encrypted patient records.

Each institution encrypts their patient data using a homomorphic encryption scheme.

They can then securely share the encrypted data with other collaborators.

By applying homomorphic operations, such as addition or multiplication, on the encrypted data, they can jointly analyze the data without revealing any sensitive information.

For example, they can calculate the average age or perform statistical analysis on encrypted medical data, facilitating research collaboration while preserving patient privacy.

### 23. 同态加密：应用

Homomorphic Encryption: Application

中文内容： 安全云计算： 在云计算场景中，同态加密可以在利用云资源的同时保护数据隐私。数据所有者在将数据上传到云之前使用同态加密方案加密其数据。

云提供商对加密数据执行计算，例如运行分析或机器学习算法，而无需访问底层明文数据。

加密输出被发送回数据所有者，他们可以在本地解密。这确保云提供商永远不会看到敏感信息，在云计算环境中提供数据隐私。

English Content: Secure Cloud Computing: In cloud computing scenarios, homomorphic encryption can protect data privacy while leveraging cloud resources. A data owner encrypts their data using a homomorphic encryption scheme before uploading it to the cloud.

The cloud provider performs computations on the encrypted data, such as running analytics or machine learning algorithms, without gaining access to the underlying plaintext data.

The encrypted outputs are sent back to the data owner, who can decrypt them locally. This ensures that the cloud provider never sees the sensitive information, providing data privacy in cloud computing environments.

### 24. 同态加密：应用（续）

Homomorphic Encryption: Application (Continued)

隐私保护数据分析： 组织经常需要在保持隐私的同时对敏感数据集执行数据分析。同态加密允许在加密数据上执行计算，在整个分析过程中保持隐私。

例如，金融机构可以加密客户金融记录并对加密数据执行聚合计算，如计算总交易金额或检测异常，而不暴露个人记录。这使得数据分析成为可能，同时保护客户金融信息的隐私。

English Content: Privacy-Preserving Data Analysis: Organizations often need to perform data analysis on sensitive datasets while preserving privacy. Homomorphic encryption allows computations to be performed on encrypted data, maintaining privacy throughout the analysis process.

For instance, financial institutions can encrypt customer financial records and perform aggregate computations on the encrypted data, such as calculating the total transaction amount or detecting anomalies, without exposing the individual records. This enables data analysis while protecting the privacy of customers' financial information.

### 25. 同态加密：应用（私有机器学习服务）

Homomorphic Encryption: Application (Private Machine Learning as a Service)

中文内容： 私有机器学习即服务：

同态加密可以实现隐私保护的机器学习即服务。

在这种情况下，数据所有者可以使用同态加密加密其训练数据，并将模型训练过程外包给第三方服务提供商。

服务提供商可以对加密数据执行计算来训练机器学习模型，而无需访问原始数据。

一旦模型训练完成，加密的模型参数将返回给数据所有者，他们可以解密它们并使用模型进行预测，而不暴露训练数据。这允许协作机器学习，同时维护数据隐私。

English Content: Private Machine Learning as a Service:

Homomorphic encryption can enable privacy-preserving machine learning as a service.

In this scenario, data owners can encrypt their training data using homomorphic encryption and outsource the model training process to a third-party service provider.

The service provider can perform computations on the encrypted data to train machine learning models without accessing the raw data.

Once the model is trained, the encrypted model parameters are returned to the data owners, who can decrypt them and use the model for predictions without exposing the training data. This allows for collaborative machine learning while maintaining data privacy.

### 26. 同态加密：应用（安全数据共享）Homomorphic Encryption: Application (Secure Data Sharing)

中文内容： 安全数据共享和外包计算：

同态加密促进安全数据共享和外包计算。组织可以在与外部合作伙伴或服务提供商共享敏感数据之前使用同态加密对其进行加密。

合作伙伴或服务提供商可以在不知道原始内容的情况下对加密数据执行计算。这使得安全协作和外包计算成为可能，同时确保共享数据的机密性。

例如，金融机构可以与审计师共享加密交易数据以执行合规检查，或与数据分析公司共享加密客户数据进行分析，而不会损害隐私。

English Content: Secure Data Sharing and Outsourced Computation:

Homomorphic encryption facilitates secure data sharing and outsourced computation. Organizations can encrypt sensitive data using homomorphic encryption before sharing it with external partners or service providers.

The partners or service providers can perform computations on the encrypted data without knowledge of the original content. This enables secure collaborations and outsourced computation while ensuring the confidentiality of the shared data.

For example, financial institutions can share encrypted transaction data with auditors to perform compliance checks or share encrypted customer data with data analytics companies for analysis without compromising privacy.

### 27. 同态加密算法Homomorphic Encryption Algorithms

部分同态加密(PHE) - Paillier加密： Paillier加密方案是支持同态加法的部分同态加密的例子。

工作原理： Paillier加密涉及生成公钥和私钥。要加密明文消息，将随机值提升到消息的幂并乘以公钥相关项。生成的密文可以用私钥解密。

例子： 假设两个参与者Alice和Bob想要计算其加密值的和。他们都有Paillier加密的值。通过对其密文执行同态加法，他们可以获得表示其原始明文值之和的新密文。解密生成的密文可以显示明文值的和。

English Content: Partially Homomorphic Encryption (PHE) - Paillier Encryption: The Paill

Homomorphic Encryption Algorithms (Continued)

English Content: Partially Homomorphic Encryption (PHE) - Paillier Encryption: The Paillier encryption scheme is an example of partially homomorphic encryption that supports homomorphic addition.

How it works: Paillier encryption involves generating public and private keys. To encrypt a plaintext message, a random value is raised to the power of the message and multiplied by a public key-dependent term. The resulting ciphertext can be decrypted with the private key.

Example: Suppose two participants, Alice and Bob, want to compute the sum of their encrypted values. They both have Paillier-encrypted values. By performing homomorphic addition on their ciphertexts, they can obtain a new ciphertext that represents the sum of their original plaintext values. Decryption of the resulting ciphertext reveals the sum of the plaintext values.

28. 代码解释Code Explanation

中文内容： [展示Paillier加密的Python代码实现]

python

# 步骤1：安装Paillier同态加密库!pip install phe# 步骤2：导入必要的库from phe import paillier# ================= 客户端 =================# 步骤3：密钥生成（公钥和私钥）# 客户端生成密钥public_key, private_key = paillier.generate_paillier_keypair()# 客户端想要相加的示例数字number1 = 15  # 您可以更改这些数字number2 = 25  # 您可以更改这些数字# 步骤4：客户端使用公钥加密数字encrypted_number1 = public_key.encrypt(number1)encrypted_number2 = public_key.encrypt(number2)print(f"加密的number1：{encrypted_number1.ciphertext()}")print(f"加密的number2：{encrypted_number2.ciphertext()}")

English Content: [Shows Python code implementation for Paillier encryption]

python

# Step 1: Install the Paillier Homomorphic Encryption Library!pip install phe# Step 2: Import the necessary libraryfrom phe import paillier# ================= Client Side =================# Step 3: Key generation (public and private keys)# The client generates the keys.public_key, private_key = paillier.generate_paillier_keypair()# Example numbers that the client wants to addnumber1 = 15  # You can change these numbersnumber2 = 25  # You can change these numbers# Step 4: Client encrypts the numbers using the public keyencrypted_number1 = public_key.encrypt(number1)encrypted_number2 = public_key.encrypt(number2)print(f"Encrypted number1: {encrypted_number1.ciphertext()}")print(f"Encrypted number2: {encrypted_number2.ciphertext()}")

### 29. 代码解释（续）Code Explanation (Continued)

python

# ================= 服务器端 =================# 服务器对加密数据执行加法# 步骤5：服务器执行同态加法（对加密数据）# 服务器将encrypted_number1和encrypted_number2相加encrypted_sum = encrypted_number1 + encrypted_number2print(f"加密的和（加法后）：{encrypted_sum.ciphertext()}")# ================= 客户端 =================# 客户端接收加密的和并解密它# 步骤6：客户端使用私钥解密结果decrypted_sum = private_key.decrypt(encrypted_sum)# 步骤7：输出解密结果（和）print(f"{number1}和{number2}的解密和是：{decrypted_sum}")

English Content:

python

# ================= Server Side =================# The server performs the addition on the encrypted data.# Step 5: Server performs homomorphic addition (on the encrypted data)# The server adds encrypted_number1 and encrypted_number2encrypted_sum = encrypted_number1 + encrypted_number2print(f"Encrypted sum (after addition): {encrypted_sum.ciphertext()}")# ================= Client Side =================# The client receives the encrypted sum and decrypts it.# Step 6: Client decrypts the result using the private keydecrypted_sum = private_key.decrypt(encrypted_sum)# Step 7: Output the decrypted result (the sum)print(f"The decrypted sum of {number1} and {number2} is: {decrypted_sum}")

### 30. 同态加密算法 - ElGamal加密Homomorphic Encryption Algorithms - ElGamal Encryption

中文内容： 部分同态加密(PHE) - ElGamal加密： ElGamal加密是另一种部分同态加密方案，支持同态乘法但不支持加法。

工作原理： ElGamal加密涉及生成公钥和私钥。要加密明文消息，消息乘以随机值的幂模公钥相关值。生成的密文由两个组件组成。解密需要私钥来恢复原始明文。

例子： 考虑Alice想要将她的加密值乘以常数因子的情况。通过对密文执行同态乘法，她可以获得表示原始明文值乘以常数因子的新密文。解密生成的密文可以显示明文与常数的乘积。

English Content: Partially Homomorphic Encryption (PHE) - ElGamal Encryption: ElGamal encryption is another partially homomorphic encryption scheme that supports homomorphic multiplication but not addition.

How it works: ElGamal encryption involves generating public and private keys. To encrypt a plaintext message, the message is multiplied by a random value raised to a power modulo a public key-dependent value. The resulting ciphertext consists of two components. Decryption requires the private key to recover the original plaintext.

Example: Consider a scenario where Alice wants to multiply her encrypted value by a constant factor. By performing homomorphic multiplication on the ciphertext, she can obtain a new ciphertext representing the multiplication of the original plaintext value by the constant factor. Decryption of the resulting ciphertext reveals the product of the plaintext and the constant.

### 31. 同态加密算法 - Goldwasser-Micali加密Homomorphic Encryption Algorithms - Goldwasser-Micali Encryption

部分同态加密(PHE) - Goldwasser-Micali加密： Goldwasser-Micali加密方案是支持同态XOR（按位异或）操作的部分同态加密方案。

工作原理： Goldwasser-Micali加密涉及生成公钥和私钥。加密涉及将明文消息乘以公钥相关值的按位XOR。解密需要私钥来恢复原始明文。

例子： 在隐私保护投票系统中，选民可以使用Goldwasser-Micali加密将其选票加密为二进制值（0或1）。通过对密文执行同态XOR操作，选举官员可以获得表示所有加密选票XOR组合的最终加密结果。使用私钥解密可以显示选举的最终结果。

English Content: Partially Homomorphic Encryption (PHE) - Goldwasser-Micali Encryption: The Goldwasser-Micali encryption scheme is a partially homomorphic encryption scheme that supports homomorphic XOR (bitwise exclusive OR) operations.

How it works: The Goldwasser-Micali encryption involves generating public and private keys. Encryption involves multiplying the plaintext message by the bitwise XOR of public key-dependent values. Decryption requires the private key to recover the original plaintext.

Example: In a privacy-preserving voting system, voters can use Goldwasser-Micali encryption to encrypt their votes as binary values (0 or 1). By performing homomorphic XOR operations on the ciphertexts, election officials can obtain the final encrypted result representing the XOR combination of all the encrypted votes. Decryption with the private key reveals the final outcome of the election.

### 32. 同态加密算法 - BFV加密Homomorphic Encryption Algorithms - BFV Encryption

完全同态加密(FHE) - BFV加密： 描述： BFV（Brakerski-Gentry-Vaikuntanathan）加密方案是支持同态加法和乘法的完全同态加密的例子。

工作原理： BFV方案利用基于格的密码学。它涉及生成公钥和秘钥，将明文消息编码为多项式，并加密多项式。对密文执行同态操作，使用秘钥解密产生结果。

例子： 想象一个场景，敏感的金融数据存储在云中。使用BFV加密，可以对加密的金融数据执行计算，如计算和、积或运行复杂的金融算法。通过同态操作获得的最终结果可以由授权实体使用秘钥解密，确保金融信息的隐私。

English Content: Fully Homomorphic Encryption (FHE) - BFV Encryption: Description: The BFV (Brakerski-Gentry-Vaikuntanathan) encryption scheme is an example of fully homomorphic encryption that supports both homomorphic addition and multiplication.

How it works: The BFV scheme utilizes lattice-based cryptography. It involves generating public and secret keys, encoding the plaintext message into a polynomial, and encrypting the polynomial. Homomorphic operations are performed on the ciphertext, and decryption using the secret key yields the result.

Example: Imagine a scenario where sensitive financial data is stored in the cloud. Using BFV encryption, computations can be performed on the encrypted financial data, such as calculating sums, products, or running complex financial algorithms. The final result, obtained through homomorphic operations, can be decrypted by authorized entities using the secret key, ensuring the privacy of the financial information.

### 33. 实现Implementations

IBM： IBM积极参与同态加密研究，开发了IBM完全同态加密工具包。他们正在致力于加密计算的各种应用，包括安全机器学习和数据分析。

Microsoft： Microsoft对同态加密表现出兴趣，开发了Microsoft简单加密算术库(SEAL)。他们正在探索安全云计算和数据分析中的应用。

IBM: IBM has been actively involved in homomorphic encryption research and has developed the IBM Fully Homomorphic Encryption Toolkit. They are working on various applications of encrypted computation, including secure machine learning and data analytics.

Microsoft: Microsoft has shown interest in homomorphic encryption and has developed the Microsoft Simple Encrypted Arithmetic Library (SEAL). They are exploring applications in secure cloud computing and data analysis.

### 34. 实现（续）Implementations (Continued)

Google： Google探索了联邦学习的使用，这是一种涉及加密计算的隐私保护机器学习技术，在Gboard（Google键盘）和医疗研究等应用中。

Intel： Intel投资了安全飞地和基于硬件的加密计算解决方案。他们开发了Intel软件保护扩展(SGX)等技术来保护计算期间的数据。

English Content: Google: Google has explored the use of federated learning, a privacy-preserving machine learning technique that involves encrypted computation, in applications like Gboard (Google Keyboard) and healthcare research.

Intel: Intel has invested in secure enclaves and hardware-based solutions for encrypted computation. They have developed technologies like Intel Software Guard Extensions (SGX) to protect data during computation.

### 35. 安全多方计算(SMPC)

Secure Multi-Party Computation (SMPC)

中文内容： SMPC允许多方在保持各自输入私有的同时联合计算函数。

每一方都持有自己的私有输入，并与其他方协作计算所需函数，而不透露任何敏感信息。

SMPC协议确保最终输出是正确的，即使中间值是加密的。SMPC协议的例子包括Yao的混淆电路、秘密共享和安全函数评估。

English Content: SMPC allows multiple parties to jointly compute a function while keeping their inputs private.

Each party holds their private input and collaborates with others to compute the desired function without revealing any sensitive information.

SMPC protocols ensure that the final output is correct, even though the intermediate values are encrypted. Examples of SMPC protocols include Yao's Garbled Circuits, Secret Sharing, and Secure Function Evaluation.

### 36. 安全多方计算(SMPC)详细过程Secure Multi-Party Computation (SMPC) Detailed Process

中文内容： 步骤1：密钥生成 在计算之前，Alice和Bob生成密码学密钥：

他们同意安全加密方案，如Paillier加密。

步骤2：输入共享

Alice和Bob各自选择一个私有数字并保密。

Alice的数字：'x = 5'

Bob的数字：'y = 3'

步骤3：安全计算 在这一步中，我们将使用SMPC协议计算'x'和'y'的和，而不向彼此透露这些数字。

Alice和Bob参与SMPC协议，该协议包含多轮通信和计算。在每一轮中，他们执行安全操作来联合计算所需函数。

English Content: Step 1: Key Generation Before the computation, Alice and Bob generate cryptographic keys:

They agree on a secure encryption scheme, such as the Paillier encryption.

Step 2: Input Sharing

Alice and Bob each choose a private number and keep it secret.

Alice's number: 'x = 5'

Bob's number: 'y = 3'

Step 3: Secure Computation In this step, we will use an SMPC protocol to compute the sum of 'x' and 'y' without revealing these numbers to each other.

Alice and Bob engage in an SMPC protocol, which consists of multiple rounds of communication and computation. In each round, they perform secure operations to jointly compute the desired function.

### 37. 安全多方计算详细过程（续）Secure Multi-Party Computation Detailed Process (Continued)

中文内容： 第1轮：秘密共享

Alice和Bob各自随机生成其数字的秘密共享。假设他们选择使用加法秘密共享：

Alice的秘密共享：'a1 = 2'和'a2 = 3'使得'a1 + a2 = x = 5'

Bob的秘密共享：'b1 = 1'和'b2 = 2'使得'b1 + b2 = y = 3'

他们交换其共享（'a1'和'b1'）而不透露'a2'或'b2'。

第2轮：安全加法

Alice和Bob对其共享值执行加法：

Alice计算'a1 + b1'而不知道'b2'。

Bob计算'a2 + b2'而不知道'a1'。

现在，双方都有和的共享，但都不知道对方的秘密共享。

Alice有'a1 + b1'，即'2 + 1 = 3'。

Bob有'a2 + b2'，即'3 + 2 = 5'。

English Content: Round 1: Secret Sharing

Alice and Bob each randomly generate a secret sharing of their numbers. Let's say they choose to use additive secret sharing:

Alice's secret sharing: 'a1 = 2' and 'a2 = 3' such that 'a1 + a2 = x = 5'

Bob's secret sharing: 'b1 = 1' and 'b2 = 2' such that 'b1 + b2 = y = 3'

They exchange their shares ('a1' and 'b1') without revealing 'a2' or 'b2'.

Round 2: Secure Addition

Alice and Bob perform addition on their shared values:

Alice computes 'a1 + b1' without knowing 'b2'.

Bob computes 'a2 + b2' without knowing 'a1'.

Now, both parties have shares of the sum, but neither knows the other party's secret share.

Alice has 'a1 + b1', which is '2 + 1 = 3'.

Bob has 'a2 + b2', which is '3 + 2 = 5'.

### 38. 安全多方计算详细过程（最终）Secure Multi-Party Computation Detailed Process (Final)

中文内容： 步骤4：结果重构

Alice和Bob使用其共享联合重构计算的最终结果。他们将前一步的结果相加以获得其私有数字的和。

Alice重构和：'3'。

Bob重构和：'5'。

现在，Alice和Bob都知道计算的结果，即'3 + 5 = 8'（其私有数字的和），但他们从未了解彼此的私有输入（'x'和'y'）。

English Content: Step 4: Result Reconstruction

Alice and Bob jointly reconstruct the final result of the computation using their shares. They sum the results from the previous step to obtain the sum of their private numbers.

Alice reconstructs the sum: '3'.

Bob reconstructs the sum: '5'.

Now, both Alice and Bob know the result of the computation, which is '3 + 5 = 8' (the sum of their private numbers), but they never learned each other's private inputs ('x' and 'y').

### 39. MP-SPDZ (CSIRO 2018)MP-SPDZ (CSIRO 2018)

https://mp-spdz.readthedocs.io/en/latest/

用于基准测试和实现多方计算(MPC)协议的开源框架。

支持超过40种不同的MPC协议变体。

https://mp-spdz.readthedocs.io/en/latest/

open-source framework for benchmarking and implementing Multi-Party Computation (MPC) protocols.

Supports for over 40 different MPC protocol variants.

### 攻击？

### 成员推理攻击Membership Inference Attacks

成员推理攻击是一种针对机器学习模型的隐私攻击，特别是那些用于分类等任务的模型。

在成员推理攻击中，对手试图确定特定数据点是否是用于训练模型的训练数据集的一部分。

这种攻击可能对隐私产生严重影响，特别是在涉及敏感或个人数据的场景中。

English Content:

Membership inference attacks are a type of privacy attack that targets machine learning models, particularly those used for tasks like classification.

In a membership inference attack, an adversary tries to determine whether a specific data point was part of the training dataset used to train the model.

This attack can have serious implications for privacy, especially in scenarios where sensitive or personal data is involved.

### 成员推理攻击 - 医疗诊断场景Membership Inference Attacks - Medical Diagnosis Scenario

场景：医疗诊断

假设一家医院使用患者数据开发了用于诊断特定医疗状况（如糖尿病）的机器学习模型。医院收集了大量患者信息数据集，包括病史、年龄、性别和检测结果，并使用这些数据训练模型。

English Content: Scenario: Medical Diagnosis

Let's say a hospital has developed a machine learning model for diagnosing a particular medical condition, like diabetes, using patient data. The hospital collects a large dataset of patient information, including medical history, age, gender, and test results, and uses this data to train the model.

### 43. 成员推理攻击场景Membership Inference Attack Scenario

攻击场景：

数据收集： 对手Alice知道她的医疗数据被医院用于训练其糖尿病诊断模型。她想找出她的数据是否在医院的训练数据集中。

训练和测试数据集： 医院将其数据集分为两部分：用于训练机器学习模型的训练数据集和用于评估其性能的测试数据集。训练数据集包含大量患者数据。

Data Collection: An adversary, Alice, knows that her medical data was used by the hospital to train their diabetes diagnosis model. She wants to find out if her data is in the hospital's training dataset.

Training and Testing Datasets: The hospital splits its dataset into two parts: a training dataset used to train the machine learning model and a testing dataset used to evaluate its performance. The training dataset contains a large amount of patient data.

### 成员推理攻击策略Membership Inference Attack Strategy

3. 攻击策略： a. 制作影子模型： Alice首先创建一组影子模型来模仿目标模型的行为。她使用公开可用的数据并生成自己的数据集，该数据集在性质上类似于医院的数据但不包含她的特定信息。Alice然后在此数据集上训练她的影子模型，试图尽可能接近地复制目标模型的预测。

3. Attack Strategy: a. Crafting Shadow Models: Alice starts by creating a set of shadow models that mimic the target model's behavior. She uses publicly available data and generates her own dataset, which is similar in nature to the hospital's data but does not contain her specific information. Alice then trains her shadow models on this dataset, trying to replicate the target model's predictions as closely as possible.

### 45. 成员推理攻击推理过程Membership Inference Attack Inference Process

b. 推理： Alice使用她的影子模型来推断她自己的数据是否在医院模型的训练数据集中。她将自己的医疗信息输入影子模型并观察其预测。

English Content: b. Inference: Alice uses her shadow models to make inferences about whether her own data was in the training dataset of the hospital's model. She feeds her own medical information into the shadow models and observes their predictions.

### 46. 成员推理攻击成员推理Membership Inference Attack Membership Inference

中文内容： c. 成员推理： 通过比较她的影子模型在给定她自己的数据与给定不在训练数据集中的随机数据时的预测，Alice可以检测到细微的差异。如果她的数据在训练数据集中，影子模型可能会对她的情况做出比随机数据更准确的预测。

结果： 如果Alice的影子模型一致地对她的数据做出比随机数据更准确的预测，她可以推断她的数据可能是医院训练数据集的一部分。这构成了成功的成员推理攻击。

English Content: c. Membership Inference: By comparing the predictions of her shadow models when given her own data versus when given random data not in the training dataset, Alice can detect subtle differences. If her data was in the training dataset, the shadow models might make more accurate predictions for her case compared to random data.

Result: If Alice's shadow models consistently make more accurate predictions for her data compared to random data, she can infer that her data was likely part of the hospital's training dataset. This constitutes a successful membership inference attack.

### 47. 成员推理攻击缓解策略Membership Inference Attack Mitigation Strategies

### 缓解策略：

差分隐私： 在模型训练期间采用差分隐私技术向数据添加噪声，使识别个人记录更加困难。

数据聚合： 在训练模型之前聚合和匿名化数据，减少数据泄漏的风险。

限制数据访问： 限制对敏感数据集的访问，确保只有必要的人员才能访问。

使用合成数据： 考虑使用合成数据或生成模型来训练模型，同时完全隐藏敏感信息。

English Content: Mitigation Strategies:

Differential Privacy: Employ differential privacy techniques during model training to add noise to the data, making it harder to identify individual records.

Data Aggregation: Aggregate and anonymize data before training models, reducing the risk of data leakage.

Limit Data Access: Restrict access to sensitive datasets and ensure that only necessary personnel have access.

Use Synthetic Data: Consider using synthetic data or generative models to train models while keeping sensitive information completely hidden.

### 48. 成员推理攻击结论Membership Inference Attack Conclusion

成员推理攻击突出了保护其数据用于训练机器学习模型的个人隐私的重要性，特别是在涉及医疗保健、金融或个人偏好等敏感信息的应用中。

Membership inference attacks highlight the importance of protecting the privacy of individuals whose data is used to train machine learning models, especially in applications involving sensitive information like healthcare, finance, or personal preferences.

这份完整的讲义涵盖了加密计算的所有核心内容，从数据保留政策到隐私风险评估，从同态加密的理论到实际应用，再到安全多方计算和隐私攻击防护，为隐私保护机器学习提供了全面的技术指导。

## CSEC5614 Data Privacy: Theory and Practice -Lecture 6: Passive Information Leakage 被动信息泄露

### 介绍

被动泄露是指在数据隐私背景下，敏感信息的无意披露或暴露。它发生时没有任何恶意意图，但可能对个人、组织及其利益相关者造成重大后果。

被动泄露通常由于人为错误、不充分的安全措施、软件漏洞或无意的数据共享实践而发生。它可能导致个人身份信息（PII）、商业机密、机密业务数据或其他敏感数据的泄露，进而导致隐私泄露、声誉受损、经济损失和监管不合规。

数据泄露发生在敏感数据在传输中、静止状态或使用中无意暴露给公众时。常见的例子包括：

- 传输中暴露的数据：通过电子邮件、API调用、聊天室和其他通信方式传输的数据

- 静止状态暴露的数据：可能由于云存储配置不当、数据库不安全或无人看管或丢失的设备而发生

- 使用中暴露的数据：如打印机上的数据、屏幕截图、剪贴板和USB驱动器上的数据

### Introduction

Passive leakage refers to the unintentional disclosure or exposure of sensitive information in the context of data privacy. It occurs without any malicious intent but can have significant consequences for individuals, organizations, and their stakeholders.

Passive leakage often happens due to human error, inadequate security measures, software vulnerabilities, or unintended data sharing practices. It can result in the exposure of personally identifiable information (PII), trade secrets, confidential business data, or other sensitive data, leading to privacy breaches, reputational damage, financial losses, and regulatory non-compliance.

Data leakage occurs when sensitive data gets unintentionally exposed to the public in transit, at rest, or in use. Here are common examples:

- Data exposed in transit: Data transmitted via emails, API calls, chat rooms, and other communications.

- Data exposed at rest: Can occur due to misconfigured cloud storage, insecure databases, or unattended or lost devices.

- Data exposed in use: Such as data on printers, screenshots, clipboards, and USB drives.

### 数据泄露

数据泄露可能导致数据破坏，但不一定需要利用未知漏洞。人为错误通常是数据泄露背后的罪魁祸首。

例如，配置不当的亚马逊网络服务（AWS）S3存储桶可能导致泄露。S3存储桶为上传文件和数据提供云存储空间。可以将S3存储桶配置为公开访问或仅限授权用户访问。但是，管理员经常配置不当，将数据披露给第三方。

### Data Leak

A data leak can result in a data breach but does not require exploiting unknown vulnerabilities. A human error is usually the culprit behind a data leak.

For example, a misconfigured Amazon Web Services (AWS) S3 bucket can cause a leak. S3 buckets provide cloud storage space for uploading files and data. You can configure S3 buckets for public access or restrict access to only authorized users. However, administrators often misconfigure access, disclosing data to third parties.

### 被动信息泄露的后果

被动泄露的后果可能非常严重。暴露的信息可能被用于身份盗窃、欺诈或未经授权访问系统和资源。个人可能遭受隐私侵犯、声誉伤害和经济损失。组织可能面临法律和监管处罚、客户信任侵蚀和品牌形象损害。此外，被动泄露事件可能产生级联效应，因为暴露的数据可能被用于后续网络攻击或社会工程尝试。

因此，个人和组织必须主动应对被动泄露并实施适当的隐私控制，这是至关重要的。

### Consequences of Passive Information Leakage

The consequences of passive leakage can be severe. The exposed information can be exploited for identity theft, fraud, or unauthorized access to systems and resources. Individuals may suffer privacy violations, reputational harm, and financial losses. Organizations may face legal and regulatory penalties, erosion of customer trust, and damage to their brand image. Additionally, passive leakage incidents can have cascading effects, as exposed data can be used in subsequent cyberattacks or social engineering attempts.

Therefore, it is crucial for individuals and organizations to be proactive in addressing passive leakage and implementing appropriate privacy controls.

### 使用案例

搜索引擎中的自动建议

搜索引擎中的自动建议功能可能会无意中暴露个人搜索查询，向无关的第三方泄露私人信息或敏感兴趣。

表单中的自动填充

Web表单中的自动填充功能如果管理不当，可能会错误地将敏感信息（如社会安全号码、信用卡详情或密码）填充到错误的字段中，导致被动泄露。

配置不当的数据库

数据库设置或云存储平台中的配置不当可能会无意中暴露机密客户数据、财务记录或知识产权给未经授权的访问。

电子邮件转发错误

由于转发错误或收件人不正确导致的错误转发电子邮件可能导致敏感信息被披露给无关的个人。

剪贴板数据暴露

当复制的内容（如密码或个人身份号码（PIN））无意中粘贴到不安全的位置或共享应用程序时，剪贴板数据可能会无意中泄露敏感信息。

无意的屏幕截图

对敏感信息（如私人消息或机密文档）进行屏幕截图，并意外与无关的收件人共享，可能导致被动泄露。

语音助手窃听

如果语音助手被无意触发或配置不当，可能会被动地监听和记录私人对话，可能将敏感信息暴露给未经授权的实体。

文件中的元数据

嵌入在数字文件中的元数据（如位置数据或时间戳）可能无意中泄露有关作者、其活动或使用的设备的信息。

公共WiFi监控

有权访问不安全公共WiFi网络的攻击者可以被动监控网络流量，拦截未加密的数据，包括登录凭证、电子邮件或个人信息。

第三方数据共享

与第三方供应商或合作伙伴共享敏感数据而没有适当的数据保护协议或监督，如果第三方处理不当或滥用数据，可能导致被动泄露。

无人看管的打印件和文件

包含敏感信息（如财务记录或客户数据）的打印文件留在公共场所无人看管，可能被未经授权的个人无意中访问和阅读。

社交媒体过度分享

用户在没有适当隐私设置的情况下在社交媒体平台上分享个人信息、位置详情或敏感内容可能会无意中将自己暴露于个人信息的被动泄露。

电子邮件签名隐私

在电子邮件签名中包含敏感或个人信息（如电话号码、地址或社交媒体账号），如果电子邮件被转发或共享，可能导致无意的披露。

联系人同步

将联系人从移动设备同步到基于云的服务可能会无意中向无关的收件人暴露敏感的个人信息，如家庭地址或私人电话号码。

复制粘贴敏感信息

从密码管理器或文本编辑器复制粘贴敏感信息（如登录凭证或信用卡详情）而不验证目标应用程序，如果数据被无意中粘贴到不安全的位置，可能导致被动泄露。

日历邀请详情

在日历邀请中包含敏感信息（如私人会议笔记或机密项目详情）而没有适当的访问控制，如果未授权的与会者获得事件详情的访问权限，可能导致被动泄露。

数据保留政策

不能正确定义存储敏感信息的持续时间的不充分数据保留政策可能导致数据的无意暴露或保留超过其必要生命周期。

通话录音失误

无意中录制客户通话而没有适当通知或获得同意的组织可能会向无关的个人或方面暴露敏感信息。

通过API的数据泄露

不充分的安全或配置不当的应用程序编程接口（API）可能暴露敏感数据，允许未经授权的访问或用户信息的被动泄露。

系统日志泄露

未能正确保护和管理系统日志可能导致被动泄露，如果包含敏感信息（如用户名、密码或系统配置）的日志文件被未经授权的个人访问。

### Use Cases

Auto-Suggest in Search Engines

Auto-suggest features in search engines can inadvertently expose personal search queries, revealing private information or sensitive interests to unintended parties.

Autofill in Forms

Autofill functionality in web forms, if not managed carefully, can mistakenly populate sensitive information such as social security numbers, credit card details, or passwords into the wrong fields, leading to passive leakage.

Misconfigured Databases

Misconfigurations in database settings or cloud storage platforms can inadvertently expose confidential customer data, financial records, or intellectual property to unauthorized access.

Email Forwarding Mistakes

Misdirected emails due to forwarding errors or incorrect recipients can result in sensitive information being disclosed to unintended individuals.

Clipboard Data Exposure

Clipboard data can inadvertently leak sensitive information when copied content, such as passwords or personal identification numbers (PINs), is unintentionally pasted into an insecure location or shared app.

Unintended Screenshots

Taking screenshots of sensitive information, such as personal messages or confidential documents, and accidentally sharing them with unintended recipients can lead to passive leakage.

Voice Assistant Eavesdropping

Voice assistants, if triggered unintentionally or not properly configured, can passively listen to and record private conversations, potentially exposing sensitive information to unauthorized entities.

Metadata in Files

Metadata embedded in digital files, such as location data or timestamps, can inadvertently reveal information about the author, their activities, or the device used.

Public Wi-Fi Monitoring

Attackers with access to unsecured public Wi-Fi networks can passively monitor network traffic, intercepting unencrypted data, including login credentials, emails, or personal information.

Third-Party Data Sharing

Sharing sensitive data with third-party vendors or partners without appropriate data protection agreements or oversight can lead to passive leakage if the third party mishandles or misuses the data.

Printouts and Documents Left Unattended

Printed documents containing sensitive information, such as financial records or customer data, left unattended in public spaces can be inadvertently accessed and read by unauthorized individuals.

Over-sharing on Social Media

Users sharing personal information, location details, or sensitive content on social media platforms without proper privacy settings may unknowingly expose themselves to passive leakage of their personal information.

Email Signature Privacy

Inclusion of sensitive or personal information, such as phone numbers, addresses, or social media handles, in email signatures can lead to unintended disclosure if the email is forwarded or shared.

Contact Syncing

Syncing contacts from mobile devices to cloud-based services can inadvertently expose sensitive personal information, such as home addresses or private phone numbers, to unintended recipients.

Copy-Pasting Sensitive Information

Copying and pasting sensitive information, such as login credentials or credit card details, from password managers or text editors without verifying the target application can result in passive leakage if the data is inadvertently pasted in an insecure location.

Calendar Invitation Details

Including sensitive information, such as private meeting notes or confidential project details, in calendar invitations without proper access controls can lead to passive leakage if unauthorized attendees gain access to the event details.

Data Retention Policies

Inadequate data retention policies that do not properly define the duration of storing sensitive information can lead to the unintended exposure or retention of data beyond its necessary lifespan.

Call Recording Mishaps

Organizations that inadvertently record customer calls without properly notifying or obtaining consent may expose sensitive information to unintended individuals or parties.

Data Leakage through APIs

Insufficiently secured or improperly implemented application programming interfaces (APIs) can expose sensitive data, allowing unauthorized access or passive leakage of user information.

System Log Leakage

Failure to secure and manage system logs properly can result in passive leakage if log files containing sensitive information, such as usernames, passwords, or system configurations, are accessed by unauthorized individuals.

### 数据泄露中可能暴露的信息类型

网络罪犯寻找提供价值的信息。这通常是可以在暗网上交易的机密和敏感信息。以下是数据泄露中经常发现的数据类型：

个人身份信息（PII）

使能够识别或定位个人的信息或记录。常见的PII包括姓名、电话号码、物理地址、社会安全号码和电子邮件地址。网络罪犯利用PII进行身份盗窃、诈骗和欺诈。PII经常出现在数据泄露中。

财务数据

与个人财务或银行相关的任何数据，如信用卡号、税务信息、银行对账单和记录、发票和收据。

账户凭证

用户账户登录信息，包括用户名、密码和电子邮件。被泄露的凭证是高度sought-after商品，因为它们使网络罪犯能够执行社交账户接管（ATO）和数据泄露。

医疗信息

可以披露患者身体或心理状况的任何私人数据。医疗信息通常由医疗提供者创建和存储。

公司、联邦或商业信息

由公司或联邦实体创建和存储的内部、非公开信息。它通常包括关键的商业信息，如内部通信、分类记录、性能指标、会议笔记、人力资源记录和公司路线图。

商业机密和知识产权（IP）

可能使公司生计处于危险中的高度机密和受保护的信息，如分类研究、专利、计划、测试材料、已停产或未完成产品的文档、即将推出的项目设计、专有软件和技术的源代码，以及战略公司信息。

### What Types of Information Can Be Exposed in a Data Leak?

Cybercriminals look for information that offers value. It is typically confidential and sensitive information that can be traded on the dark web. Here are the data types often found in data leaks:

Personally Identifiable Information (PII)

Information or records that enable identifying or locating a person. Common PII include names, phone numbers, physical addresses, social security numbers, and email addresses. Cybercriminals exploit PIIs for identity theft, scams, and fraud. PII often appears in data leaks.

Financial Data

Any data related to a person's finances or banking, such as credit card numbers, tax information, bank statements and records, invoices, and receipts.

Account Credentials

User account login information, including usernames, passwords, and emails. Compromised credentials are highly sought-after commodities because they enable cybercriminals to perform social account takeovers (ATOs) and data breaches.

Medical Information

Any private data that can disclose a patient's physical or mental condition. Medical information is typically created and stored by healthcare providers.

Company, Federal, or Business Information

Internal, non-public facing information created and stored by a corporation or federal entity. It typically includes critical business information such as internal communications, classified records, performance metrics, meeting notes, HR records, and company roadmaps.

Trade Secrets and Intellectual Property (IP)

Highly confidential and guarded information that can put a company's livelihood at stakes, such as classified research, patents, plans, testing material, documentation for scrapped or unfinished products, designs for upcoming projects, source code for proprietary software and technology, and strategic company information.

### 数据泄露示例：大众美国集团

发生了什么？

2021年6月，大众美国集团披露了一起数据泄露事件，暴露了超过330万个人的个人信息。该泄露影响了现有和潜在客户，特别是那些询问过或购买过奥迪车辆的人。

是如何发生的？

数据供应商泄露：泄露是由于处理大众客户数据的第三方供应商配置不当而发生的。该供应商以不安全的方式存储敏感客户信息，允许未经授权的个人访问数据。

暴露持续时间：数据在2019年8月至2021年5月之间可被访问，然后大众才发现该问题。

暴露的数据类型

基本信息：超过310万人的姓名、电子邮件地址、电话号码和邮寄地址被暴露。

敏感信息：对于大约90,000名个人，敏感数据被泄露。这包括驾驶执照号码、车辆识别号（VIN）、社会安全号码、信用和贷款信息。

影响

受影响的客户：2014年至2019年间购买或询问过奥迪车辆的客户是泄露的主要受害者。

法律诉讼：这起泄露可能会使大众面临潜在诉讼、罚款和声誉损害，因为暴露了敏感的客户信息。

大众采取的步骤

通知：大众通知了所有受影响的个人有关泄露，并为那些敏感数据被暴露的人提供了免费信用监控服务。

安全改进：公司确保第三方供应商解决了导致泄露的安全缺陷，并改进了自己的安全实践。

关键教训

大众泄露强调了保护第三方供应商和确保外部合作伙伴存储的所有数据都被正确加密和保护的重要性。

### Data Leakage Examples: Volkswagen Group of America

What Happened?

In June 2021, Volkswagen Group of America disclosed a data breach that exposed the personal information of over 3.3 million individuals. The breach affected current and potential customers, particularly those who had inquired about or purchased Audi vehicles.

How Did It Happen?

Data Vendor Compromise: The breach occurred due to a misconfiguration at a third-party vendor that handled customer data for Volkswagen. This vendor stored sensitive customer information in an unsecured manner, allowing unauthorized individuals to access the data.

Duration of Exposure: The data had been accessible between August 2019 and May 2021 before Volkswagen detected the issue.

Types of Data Exposed

Basic Information: Names, email addresses, phone numbers, and mailing addresses of over 3.1 million people were exposed.

Sensitive Information: For approximately 90,000 individuals, sensitive data was compromised. This included driver's license numbers, vehicle identification numbers (VINs), social security numbers, and credit and loan information.

Impact

Affected Customers: Customers who had purchased or inquired about Audi vehicles between 2014 and 2019 were the primary victims of the breach.

Legal Action: This breach could have exposed Volkswagen to potential lawsuits, fines, and reputational damage due to the exposure of sensitive customer information.

Steps Taken by Volkswagen

Notification: Volkswagen notified all affected individuals about the breach and offered free credit monitoring services for those whose sensitive data was exposed.

Security Improvements: The company worked to ensure that the third-party vendor had addressed the security flaws that led to the breach and improved its own security practices.

Key Lessons

The Volkswagen breach highlights the importance of securing third-party vendors and ensuring that all data stored by external partners is properly encrypted and protected.

### 大众在泄露后采取的应对措施

在2021年影响大众美国集团的数据泄露之后，公司采取了多项措施来解决这个问题并减轻对其客户的潜在伤害。

1. 向受影响个人的通知

客户通知：大众通知了330万受影响的个人，特别是那些敏感信息（如驾驶执照号码或社会安全号码）被暴露的人。

免费信用监控：对于大约90,000名敏感信息（如社会安全号码、驾驶执照信息和贷款号码）被泄露的个人，大众提供了免费信用监控服务和身份盗窃保护。这项服务旨在减少泄露引起的潜在欺诈或身份盗窃的影响。

2. 内部安全审查

第三方供应商审查：由于泄露是由第三方供应商处的漏洞引起的，大众进行了对供应商安全实践的全面审查。这涉及识别泄露如何发生、纠正漏洞，并确保此类事件不会再次发生。

供应商管理改进：泄露突出了对外部供应商需要更强监督的需要。大众采取措施加强了对供应商数据管理和安全的政策和标准，确保供应商遵守更严格的安全措施。

3. 公开声明和透明度

公开披露：大众美国集团在2021年6月公开披露了泄露。透明度是其应对的关键组成部分，使受影响的个人和公众能够了解泄露的范围和正在采取的纠正措施。

控制损害和声誉管理：意识到泄露对其声誉的潜在伤害，大众积极进行公关工作以管理后果，以重新保证客户并维持品牌信任。

集体诉讼

客户集体诉讼：诉讼性质为个人数据被暴露的客户可能对大众美国集团提起集体诉讼。这些诉讼通常声称公司未能充分保护其数据或及时通知他们。

损害赔偿索赔：泄露中涉及的个人经常因身份盗窃或欺诈活动的风险而声称财务和情感损害，如未经授权使用其社会安全号码、驾驶执照详情或其他财务信息。

法律先例：在许多情况下，数据泄露的受害者根据公司有责任保护个人数据的前提而提起诉讼。诉讼可能会引用疏忽、合同违约或违反消费者保护法。

监管罚款和调查

联邦贸易委员会（FTC）调查：FTC经常在重大数据泄露后调查公司，特别是如果泄露影响大量个人或涉及敏感数据。FTC调查公司是否通过未能正确保护数据或及时通知个人而违反了消费者保护法。

潜在处罚：如果FTC发现大众不符合数据安全的监管标准，公司可能面临巨额罚款。FTC过去因大规模数据泄露对Facebook和Equifax等公司征收罚款。

违反数据隐私法

加州消费者隐私法（CCPA）：由于加州是许多大众客户的所在地，CCPA可能适用于此案。根据CCPA，公司需要采取严格的防措来保护个人数据。如果公司被发现未能做到这一点，可能面临处罚。

罚款：CCPA允许对数据泄露每起违反消费者数据的罚款高达7,500美元。考虑到大众泄露的规模（影响330万个人），这可能导致重大的财务后果。

通用数据保护条例（GDPR）（如果欧洲客户受到影响）：如果欧洲公民受到泄露的影响，大众可能面临GDPR下的罚款，该条例管理欧盟中的数据保护。GDPR对公司施加了保护个人数据的严格义务，违规可能导致最高达公司全球收入4%的罚款。

大众集团的欧洲客户：鉴于大众是在欧洲拥有重要业务的全球品牌，如果任何欧洲客户数据被泄露，GDPR可能适用。

成本分析

行业平均每条记录成本：根据IBM的2021年数据泄露成本报告，数据泄露中每条被泄露记录的平均成本约为161美元。该数字包括通知成本、信用监控、法律费用和监管罚款。

对于大众泄露中受影响的330万个人，总估计成本可能为：161美元 × 330万 = 5.313亿美元（估计总成本）。

这是行业范围内的平均值，实际数字可能会因适用于大众的具体罚款、诉讼和监管行动而异。

### Volkswagen's Response to the Breach

After the data breach affecting Volkswagen Group of America in 2021, the company took several steps to address the issue and mitigate potential harm to its customers.

1. Notification to Affected Individuals

Customer Notifications: Volkswagen notified the 3.3 million affected individuals, particularly those whose sensitive information, such as driver's license numbers or social security numbers, was exposed.

Free Credit Monitoring: For the approximately 90,000 individuals whose sensitive information (such as social security numbers, driver's license information, and loan numbers) was compromised, Volkswagen offered free credit monitoring services and identity theft protection. This service was aimed at reducing the impact of potential fraud or identity theft caused by the breach.

2. Internal Security Review

Third-Party Vendor Review: Since the breach was caused by a vulnerability at a third-party vendor, Volkswagen conducted a thorough review of the vendor's security practices. This involved identifying how the breach occurred, rectifying the vulnerabilities, and ensuring such incidents would not happen again.

Vendor Management Improvements: The breach highlighted the need for stronger oversight of external vendors. Volkswagen took steps to enhance its policies and standards for vendor data management and security, ensuring that vendors adhere to more stringent security measures.

3. Public Statements and Transparency

Public Disclosure: Volkswagen Group of America publicly disclosed the breach in June 2021. Transparency was a critical component of their response, allowing affected individuals and the general public to understand the scope of the breach and the steps being taken to rectify it.

Damage Control and Reputation Management: Recognizing the potential damage to its reputation, Volkswagen actively worked to manage the fallout by engaging in public relations efforts to reassure customers and maintain brand trust.

Class-Action Lawsuits

Customer Class-Action Lawsuits: Customers whose personal and sensitive data were exposed may have filed class-action lawsuits against Volkswagen Group of America. These lawsuits typically claim that the company failed to adequately protect their data or notify them in a timely manner.

Claims of Damages: Individuals involved in the breach often claim financial and emotional damages due to the risk of identity theft or fraudulent activities, such as unauthorized use of their social security numbers, driver's license details, or other financial information.

Legal Precedents: In many cases, victims of data breaches sue under the premise that companies have a responsibility to protect personal data. Lawsuits might cite negligence, breach of contract, or violation of consumer protection laws.

Regulatory Fines and Investigations

Federal Trade Commission (FTC) Investigation: The FTC often investigates companies after significant data breaches, especially if the breach affects a large number of individuals or involves sensitive data. The FTC looks into whether the company violated consumer protection laws by failing to properly secure data or notify individuals promptly.

Potential Penalties: If the FTC finds that Volkswagen did not meet regulatory standards for data security, the company could face substantial fines. The FTC has levied fines against companies like Facebook and Equifax in the past for large-scale data breaches.

Violations of Data Privacy Laws

California Consumer Privacy Act (CCPA): Since California is home to many Volkswagen customers, the CCPA might be applicable in this case. Under the CCPA, companies are required to take strict precautions to protect personal data. If a company is found to have failed in this regard, it could face penalties.

Fines: The CCPA allows for fines of up to $7,500 per violation for breaches of consumer data. Given the scale of the Volkswagen breach (affecting 3.3 million individuals), this could lead to significant financial consequences.

General Data Protection Regulation (GDPR) (if European customers were affected): If European citizens were impacted by the breach, Volkswagen could face fines under the GDPR, which governs data protection in the European Union. GDPR imposes strict obligations on companies to protect personal data, and violations can lead to fines of up to 4% of a company's global revenue.

Volkswagen Group's European Customers: Given that Volkswagen is a global brand with significant operations in Europe, the GDPR could apply if any European customers' data were compromised.

Cost Analysis

Industry Average Cost per Record: According to IBM's Cost of a Data Breach Report 2021, the average cost per compromised record in a data breach is approximately $161. This figure includes notification costs, credit monitoring, legal fees, and regulatory fines.

For the 3.3 million individuals affected in the Volkswagen breach, the total estimated cost could be: 161×3.3million=531.3 million (estimated total cost).

This is an industry-wide average, and the actual figure could vary depending on the specific fines, lawsuits, and regulatory actions that apply to Volkswagen.

### 其他数据泄露案例

英菲尼迪保险公司

英菲尼迪保险公司在2021年3月披露了一起数据泄露，攻击者在2020年12月期间临时获得了对公司服务器上文件的未经授权访问，持续了两天。员工信息：暴露的服务器存储了现有和前任英菲尼迪保险员工的PII，包括姓名、驾驶执照号码、社会安全号码、赔偿索赔和医疗休假信息。客户信息：包含常规客户数据的服务器可被访问，暴露了数百万人的驾驶执照和社会安全号码给公众。

Jefit

Jefit是一款跟踪锻炼的应用程序，在2021年3月发现了一个错误。安全漏洞影响了2020年9月之前创建的客户账户。网络罪犯利用该问题获得了对超过900万用户数据的未经授权访问，获得了账户用户名、加密密码、电子邮件地址和IP地址。但是，Jefit不存储客户付款信息，因此被泄露的服务器上没有敏感的财务数据。

ParkMobile

ParkMobile在2021年3月发现了一起网络安全事件，它利用了第三方软件中的弱点。安全团队立即进行调查，但网络罪犯已经访问并可能下载了基本用户信息，如车牌号、电话号码、电子邮件地址和邮寄地址。安全问题可能允许网络罪犯窃取加密密码，但由于公司的密钥管理实践，入侵者无法获得密钥。

苹果数据泄露

2022年1月14日，来自Fingerprint.js的研究人员公开披露了关于WebKit浏览器引擎中一个错误的信息，该错误允许苹果数据泄露，如浏览历史和Google ID。该错误在IndexedDB实现（JavaScript数据存储API）中被发现。这个漏洞允许恶意网站利用该漏洞查看用户最近访问的URL和他们的Google用户ID，这可能允许网络罪犯查找个人用户信息。苹果后来在Safari 15.3 for iOS和macOS中修补了这个漏洞，随后被认定为CVE-2022-22594。

### Other Data Leakage Examples

Infinity Insurance Company

Infinity Insurance disclosed a data leak in March 2021. Attackers temporarily achieved unauthorized access to files on the company's servers for two days during December 2020. Employee Information: The exposed servers housed PII of existing and former Infinity Insurance employees, including names, driver's license numbers, social security numbers, compensation claims, and medical leave information. Customers' Information: Servers containing conventional customer data were accessible, exposing millions of driver's license and social security numbers to the public.

Jefit

Jefit, an app that tracks workouts, discovered a bug in March 2021. The security vulnerability impacted the customer accounts created before September 2020. Cybercriminals exploited the issue to gain unauthorized access to the data of over 9 million users, obtaining account usernames, encrypted passwords, email addresses, and IP addresses. However, Jefit doesn't store customer payment information, so there was no sensitive financial data on the breached servers.

ParkMobile

ParkMobile uncovered a cybersecurity incident in March 2021. It had exploited a weakness in third-party software. The security team investigated immediately, but the cybercriminal had already accessed and possibly downloaded basic user information, such as license plate numbers, phone numbers, email addresses, and mailing addresses. The security issue could allow cybercriminals to steal encrypted passwords, but the intruders could not get the keys thanks to the company's key management practices.

Apple Data Leak

On January 14, 2022, researchers from Fingerprint.js publicly disclosed information about a bug in the WebKit browser engine that allowed Apple data leaks, such as browsing history and Google IDs. The bug was discovered in an IndexedDB implementation, a Javascript API for data storage. This vulnerability allowed malicious websites to use the exploit to see URLs that a user recently visited and their Google User ID, which can allow cybercriminals to find personal user info. Apple patched this vulnerability, later recognized as CVE-2022-22594, in Safari 15.3 for iOS and macOS.

### 数据丢失防护工具作为解决方案

可以使用数据丢失防护（DLP）工具来防止数据泄露，这些工具持续监控和分析数据以识别可能违反安全政策的行为。除了识别政策违规外，DLP工具还可以阻止它们。

存在各种DLP工具，有些专注于组织的一个部分，如笔记本电脑或电子邮件服务，其他专门从事数据备份、归档和恢复。

什么是数据泄露防护政策？

数据丢失防护（DLP）工具帮助分类和保护数据。DLP政策概述了组织应该如何实施其DLP工具。

DLP工具对组织的关键和机密数据进行分类，以帮助确定数据泄露防护策略的优先级。它们根据组织指定的规则或使用预定义的政策包来隔离政策违规。

### Data Loss Prevention Tools as Solution

You can prevent data leakage using data loss prevention (DLP) tools, which continuously monitor and analyze your data to identify potential violations of security policies. In addition to identifying policy violations, a DLP tool also works to stop them.

There are various DLP tools, some focused on one part of the organization, like laptops or email services, and others specialized in data backup, archiving, and restoration.

What Is a Data Leakage Prevention Policy?

Data loss prevention (DLP) tools help categorize and protect data. A DLP policy outlines how an organization should implement its DLP tools.

DLP tools classify an organization's critical and confidential data to help prioritize the data leakage prevention strategy. They isolate policy violations based on the rules specified by the organization or using predefined policy packages.

### Symantec数据丢失防护（Symantec DLP）

工作原理

数据发现：Symantec DLP识别和监控所有端点、网络和存储设备上的敏感数据（如个人身份信息（PII）、知识产权）。

数据监控：它监控所有传输中的数据、静止状态的数据和使用中的数据。它防止通过电子邮件、USB、云存储或任何其他渠道的机密数据的未经授权共享。

数据保护：通过定义政策，Symantec DLP执行安全规则。例如，如果用户尝试将敏感财务信息上传到公共云，DLP系统会阻止上传并向管理员发送警报。

示例用例：一个组织可以使用Symantec DLP来防止员工无意中将包含信用卡号或社会安全号码的文件电子邮件发送给未授权的收件人。系统将根据预定义的政策标记此类电子邮件，并要么阻止传输，要么在发送前加密数据。

### Symantec Data Loss Prevention (Symantec DLP)

How it Works

Data Discovery: Symantec DLP identifies and monitors sensitive data (e.g., personally identifiable information (PII), intellectual property) across all endpoints, networks, and storage devices.

Data Monitoring: It monitors all data-in-motion, data-at-rest, and data-in-use. It prevents unauthorized sharing of confidential data via email, USB, cloud storage, or any other channels.

Data Protection: By defining policies, Symantec DLP enforces security rules. For example, if a user tries to upload sensitive financial information to a public cloud, the DLP system blocks the upload and sends an alert to the administrator.

Example Use Case: An organization can use Symantec DLP to prevent employees from accidentally emailing a file that contains credit card numbers or social security numbers to an unauthorized recipient. The system will flag such an email based on pre-defined policies and either block the transmission or encrypt the data before sending.

### McAfee数据丢失防护总保护（McAfee DLP）

工作原理

基于政策的控制：McAfee DLP允许组织定义严格的数据安全政策。这些政策控制在组织内部和外部如何访问、使用和共享数据。

数据加密：它通过在数据离开网络或转移到可移动介质之前加密来保护敏感数据。它还跟踪数据流，以确保它遵守公司政策。

防止数据盗窃：McAfee DLP监控用户活动并防止未经授权访问机密文件。例如，它可以阻止用户将敏感数据转移到USB设备或在没有批准的情况下将其复制到外部云存储。

示例用例：公司可以部署McAfee DLP来防止内部威胁。如果员工尝试将客户名称和地址列表下载到USB设备，McAfee DLP系统将阻止下载或警告安全团队进行进一步操作。

### McAfee Total Protection for Data Loss Prevention (McAfee DLP)

How it Works

Policy-Based Control: McAfee DLP allows organizations to define strict data security policies. These policies control how data is accessed, used, and shared both inside and outside the organization.

Data Encryption: It protects sensitive data by encrypting it before it leaves the network or is transferred to removable media. It also tracks the flow of data to ensure it adheres to company policies.

Prevention of Data Theft: McAfee DLP monitors user activity and prevents unauthorized access to confidential files. For example, it can stop a user from transferring sensitive data to a USB device or copying it to external cloud storage without approval.

Example Use Case: A company can deploy McAfee DLP to prevent insider threats. If an employee attempts to download a list of customer names and addresses to a USB device, the McAfee DLP system will either block the download or alert the security team for further action.

### DLP工具的常见功能

1. 数据分类：识别和分类敏感数据。

1. 政策执行：应用安全规则来控制数据共享和访问。

1. 实时警报：通知管理员可能的安全泄露。

1. 用户监控：跟踪用户行为以防止未经授权的行为。

1. 加密：在安全网络外共享、存储或传输数据时保护数据。

### Common Features of DLP Tools

1. Data Classification: Identify and classify sensitive data.

1. Policy Enforcement: Apply security rules to control data sharing and access.

1. Real-Time Alerts: Notify administrators of potential security breaches.

1. User Monitoring: Track user behavior to prevent unauthorized actions.

1. Encryption: Protect data when shared, stored, or transmitted outside secure networks.

### 其他解决方案

用户教育和培训

向员工和用户提供全面的隐私培训，强调被动泄露的风险、敏感信息的正确处理和隐私最佳实践。

强大的数据保护措施

实施强加密、访问控制和安全传输协议，以保护静止状态和传输中的敏感信息。

隐私设计

在开发软件、系统或功能时从一开始就融入隐私考虑，以最大限度地减少被动泄露的可能性。

定期审计和评估

进行定期隐私评估、安全审计和漏洞测试，以识别和解决可能导致被动泄露的弱点或潜在来源。

数据最小化

通过仅收集必要信息并实施政策来安全地处理或匿名化不再需要的数据来实践数据最小化。

隐私影响评估

进行隐私影响评估（PIA）以识别潜在风险、评估隐私控制，并确保符合相关法规和隐私标准。

安全开发实践

实施安全编码实践、遵守安全开发框架，并进行定期代码审查以最大限度地减少可能导致被动泄露的软件漏洞。

事件响应计划

制定事件响应计划以迅速有效地应对任何被动泄露事件，包括泄露通知和缓解的明确程序。

定期员工培训和意识

持续对员工进行隐私原则培训和教育，包括处理敏感信息、避免常见陷阱和及时报告事件。

隐私政策和透明度

维护清晰和全面的隐私政策，向用户通知数据收集、处理实践及其权利，增强透明度并建立信任。

供应商和第三方管理

在选择和聘请第三方供应商时进行尽职调查，确保他们遵守严格的隐私和安全实践，以防止被动泄露。

定期隐私影响评估

定期进行隐私影响评估，以识别潜在风险、评估隐私控制，并确保符合相关法规和隐私标准。

### Other Solutions

User Education and Training

Provide comprehensive privacy training to employees and users, emphasizing the risks of passive leakage, proper handling of sensitive information, and privacy best practices.

Robust Data Protection Measures

Implement strong encryption, access controls, and secure transmission protocols to safeguard sensitive information at rest and in transit.

Privacy by Design

Incorporate privacy considerations from the outset when developing software, systems, or features to minimize the potential for passive leakage.

Regular Audits and Assessments

Conduct periodic privacy assessments, security audits, and vulnerability testing to identify and address weaknesses or potential sources of passive leakage.

Data Minimization

Practice data minimization by collecting only the necessary information and implementing policies to securely dispose of or anonymize data that is no longer needed.

Privacy Impact Assessments

Perform privacy impact assessments (PIAs) to identify potential risks, evaluate privacy controls, and ensure compliance with relevant regulations and privacy standards.

Secure Development Practices

Implement secure coding practices, adhere to secure development frameworks, and conduct regular code reviews to minimize software vulnerabilities that could lead to passive leakage.

Incident Response Planning

Develop an incident response plan to promptly and effectively respond to any passive leakage incidents, including clear procedures for breach notification and mitigation.

Regular Staff Training and Awareness

Continuously educate and train staff on privacy principles, including handling sensitive information, avoiding common pitfalls, and reporting incidents promptly.

Privacy Policies and Transparency

Maintain clear and comprehensive privacy policies that inform users about data collection, processing practices, and their rights, enhancing transparency and building trust.

Vendor and Third-Party Management

Conduct due diligence when selecting and engaging third-party vendors, ensuring they adhere to stringent privacy and security practices to prevent passive leakage.

Regular Privacy Impact Assessments

Perform regular privacy impact assessments to identify potential risks, evaluate privacy controls, and ensure compliance with relevant regulations and privacy standards.

## Lecture 8: De-Identification 去识别化

### 你将学到什么 / What will you learn?

中文：

本讲座将帮助你深入理解去识别化在法律和实践中的含义。通过本讲座，你将能够：使用数据科学家、研究人员和统计学家应用的术语；批判性地评估涉及数据共享和分析的项目中的隐私风险；选择适当的去识别化技术来保护个人数据。

English:

This lecture will help you develop a deep understanding of what de-identification means in law and practice. By the end of this lecture, you will be able to: Use the terminology applied by data scientists, researchers, and statisticians; Critically assess privacy risks in projects involving data sharing and analytics; Select appropriate de-identification techniques to safeguard personal data.

### 为什么这很重要 / Why This Matters

中文：

去识别化是保护数据和确保符合隐私法的重要工具。许多隐私专业人士对去识别化的统计和数学方面感到不确定。本讲座的目的是建立信心，使你能够在实践中有效地应用这些方法。

English:

De-identification is a vital tool for protecting data and ensuring compliance with privacy laws. Many privacy professionals feel uncertain about the statistical and mathematical aspects of de-identification. This lecture builds confidence in applying these methods effectively in practice.

### 去识别化概述 / De-Identification Overview

中文：

任何用于匹配或分析的数据都面临风险，因此需要进行去识别化处理。常见的错误认识包括：已获得客户同意、使用公开数据、已进行去识别化处理所以数据现在应该是私密的。组织需要理解在何处应用去识别化以及如何控制这个过程。

English:

Any data for matching or analysing is open to risks so de-identification is required. Common mistakes include: We got customer consent, using public data, we already de-identified so data should be privatized now. Organizations need to understand where to apply de-identification and how to control this process.

### 谁来控制？/ Who Controls it?

中文：

澳大利亚信息专员办公室（OAIC）是联邦机构，监督《1988年隐私法》等多项法律。OAIC职责包括：规制政府机构和许多私营组织对个人信息的处理；管理澳大利亚隐私原则（APPs）；调查投诉、数据泄露，并拥有执法权力。

English:

The Office of the Australian Information Commissioner (OAIC) is a federal agency that oversees the Privacy Act 1988 (Cth) among other laws. The OAIC's responsibilities include: Regulating the handling of personal information by government agencies and many private organisations; Managing Australian Privacy Principles (APPs); Investigating complaints, data breaches, and has enforcement powers.

### 个人信息的法律定义 / Personal Information - Legal Definition

中文：

根据《1988年隐私法》及相关立法，"个人信息"有正式的法律定义，其关键要素包括：信息或意见；关于已识别个人或可合理识别的个人的信息；无论信息或意见是否真实；无论信息或意见是否以有形方式记录。

English:

Under the Privacy Act 1988 (Cth) and related legislation, "Personal information" means: Information or an opinion about an identified individual, or who is identified or reasonably identifiable, whether the information or opinion is true or not, and whether the information or opinion is recorded in a material form or not.

### 个人信息的关键概念 / Personal Information - Key Concepts

中文：

"已识别个人"是指这个人已经为人所知。识别不一定意味着姓名或法律身份。根据OAIC自2017年以来发布的指导，"在法律中识别是指数据集中的独特性，其中个人在一群人中是可识别的"。此外，OAIC在2024年11月发布了新的《跟踪像素和隐私义务》指导，澄清了跟踪像素的使用及其隐私影响。

English:

"Identified individual" means the person is already known. Identifying not always means name or legal identity. According to OAIC guidance published since 2017, "identify in law refers to uniqueness in a dataset, where individual is identifiable in a group of persons". Additionally, OAIC released new guidance on "Tracking Pixels and Privacy Obligations" in November 2024, clarifying the use of tracking pixels and their privacy implications.

### 什么是跟踪像素？/ What Are Tracking Pixels?

中文：

跟踪像素是来自第三方提供商的一小段代码，嵌入在网站中，当用户访问页面时激活，将有关用户活动的数据发送到第三方的服务器。跟踪像素的目的包括：分析网站流量（访问的页面、花费的时间、人口统计数据）、衡量广告活动效果、在社交媒体平台上定向投放广告等。

English:

A tracking pixel is a small piece of code from a third-party provider, embedded on a website, which activates when a user visits the page, sending data about the user's activity to the third party's server. Purposes include: analysing website traffic (pages visited, time spent, demographics), measuring ad campaign effectiveness, targeting ads on social media platforms etc.

### 跟踪像素与个人信息 / Tracking Pixels and Personal Information

中文：

根据OAIC指导，使用跟踪像素在《隐私法》下不被禁止，但组织必须符合《1988年隐私法》和澳大利亚隐私原则（APPs）下的许多义务。该指导澄清，通过跟踪像素收集的许多类型数据可能是法律下的"个人信息"，即使个人未被命名或直接识别。重要的是个人是否合理可识别（例如通过将像素数据与其他信息匹配）。

English:

According to OAIC guidance, using tracking pixels is not prohibited under the Privacy Act, but there are a number of obligations under the Privacy Act 1988 (Cth) and the Australian Privacy Principles (APPs) that organisations must meet. The guidance clarifies that many types of data collected via tracking pixels may be "personal information" under the Act, even if the individual is not named or directly identified. What matters is whether the individual is reasonably identifiable (for example via matching the pixel data with other information).

### 跟踪像素收集的个人信息示例 / Examples of Data as Personal Information

中文：

通过跟踪像素收集的可能被视为个人信息的数据包括：IP地址、URL信息、会话数据、地理位置、浏览的内容、购物车中的商品等。如果表单输入（姓名、电子邮件等）被捕获，或其他可推断或技术数据可以追溯到某个人，这些也被视为个人信息。

English:

Examples of data that may count as personal information when collected via pixels include: IP addresses, URL info, session data, geolocation, content viewed, items placed in carts, etc. Form inputs (names, email, etc.) if captured, or other inferred or technical data that can be tied back to a person.

### 为什么这很重要？组织应该怎样做？/ Why this Matters / What Organisations Should Do?

中文：

部署跟踪像素的组织必须确保符合APPs和《隐私法》，未能做到会面临投诉、调查和OAIC执法的风险。OAIC的《2023年社区隐私态度调查》表明，69%的成年人认为将其个人信息用于在线跟踪、用户画像和定向广告是不公平和不合理的；当针对儿童时，这个比例上升到89%。

组织被敦促：记录他们的使用情况、与第三方的合同、持续监控像素的运作方式（收集/披露了什么数据）、确保透明度和用户控制（选择退出等）。

English:

Organisations deploying tracking pixels must ensure compliance with APPs and the Privacy Act; failing to do so poses risk of complaints, investigations, enforcement by OAIC. In OAIC's Community Attitudes to Privacy Survey 2023, 69% of adults said it was not fair and reasonable for their personal information to be used for online tracking, profiling & targeted advertising; that figure rises to 89% when children are targeted.

Organisations are urged to: document their use, contracts with third parties, continuously monitor how pixels operate (what data is being collected/disclosed), and ensure transparency and user control (opt-outs etc).

### 理解去识别化 / Understanding De-Identification

中文：

在行业中，人们可能会以错误的方式使用或理解去识别化。如果信息仍然可以被匹配，或与第三方匹配，它仍将被视为个人信息，隐私义务仍然适用。这是一个关键的误解：去识别化并不一定意味着数据是完全匿名的或不再受隐私法约束。

English:

In industry, people might use or understand de-identification in the wrong way. If still information can be matched or matched with third party, it will still be considered as personal information and privacy obligations will still apply. This is a critical misunderstanding: de-identification does not necessarily mean the data is completely anonymous or no longer subject to privacy laws.

### 合理可识别 / Reasonably Identifiable

中文：

什么是"合理可识别"？一个人是合理可识别的，如果从信息中（单独或与其他数据结合）有可能识别他们是谁，而无需付出特殊努力。该测试是实际的而非理论的：一个有动力的人，使用可获得的资源和知识，是否能**识别**该个人？重要的是，如果数据不包含姓名，但仍然可以单独识别或追踪一个人，它仍然是合理可识别的。

English:

What "Reasonably Identifiable" Means: A person is reasonably identifiable if it is possible to work out who they are from the information (alone or in combination with other data), without requiring extraordinary effort. The test is practical, not theoretical: Would a motivated person, using available resources and knowledge, be able to identify the individual? It doesn't matter if the data does not contain a name; if it can still single out or trace a person, it is reasonably identifiable.

### 什么不是个人信息？/ What exactly is not personal information?

中文：

"去识别化"一词可能有歧义：它是指已删除标识符的数据，还是指根本无法识别的数据？根据隐私法，如果符合以下条件，信息将不再被视为"个人信息"：识别风险非常低，即个人从数据中不合理可识别。

English:

The term "de-identified" can be ambiguous: Does it mean data where identifiers have simply been removed? Or does it mean data that cannot be identified at all? According to privacy law, information will no longer be considered "personal information" if: There is a very low risk of identification, meaning the individual is not reasonably identifiable from the data.

### 去识别化的定义 / De-Identification Definition

中文：

去识别化是一套正式的流程和方法论，而不是最终状态的描述。应用去识别化并不总是意味着数据不可识别。身份披露（追踪）仍然可能发生。因此，使用去识别化技术需要在整个数据生命周期中进行持续的监督和评估。

English:

De-identification is a set of formalised processes and methodologies, not the description of an end state. Applying de-identification doesn't always mean that the data is not identifiable. Identity disclosure (tracking) can still occur. Therefore, using de-identification techniques requires ongoing monitoring and evaluation throughout the data lifecycle.

### 红旗警告 / Red Flags

中文：

如果有人声称已应用去识别化，总是要提出问题：数据的状态如何、数据的背景、如何存储、访问控制、数据所有者或人员了解哪些其他信息、数据将如何使用、数据集中这些个人的属性识别。

不要认为即使应用了去识别化，隐私法也不适用。已报告许多事件，尽管应用了去识别化。

English:

If someone claims that de-identification applied, always ask questions: State of data in, context of data, how it is stored, access control, what other information to person or people, how data will be used, attribute identification for those individuals who are in the dataset.

Don't think that privacy laws are not applicable even if you applied the de-identification. Numerous incidents reported, though de-identification applied.

### 澳大利亚重新识别事件 / Australian Incidents of Re-identification

中文：

医疗保险和药物福利计划（MBS/PBS）数据集 – 2016年：澳大利亚政府发布了一个去识别化的MBS和PBS记录数据集。墨尔本大学的研究人员通过链接提供者ID、日期和其他准标识符重新识别了患者。在重新识别被披露后，该数据集被撤回。参考文献：Rubinstein, B.I.P.等人，《公共卫生记录中患者重新识别的简单过程》（墨尔本大学，2016年）。

English:

Medicare & Pharmaceutical Benefits Scheme (MBS/PBS) Dataset – 2016: The Australian Government published a de-identified dataset of MBS and PBS records. Researchers at the University of Melbourne re-identified patients by linking provider IDs, dates, and other quasi-identifiers. The dataset was withdrawn after the re-identification was revealed. Reference: Rubinstein, B.I.P., et al. "Simple process of re-identifying patients in public health records" (University of Melbourne, 2016).

### 昆士兰政府去识别化数据集审计 / Queensland Government Audit

中文：

昆士兰信息专员办公室对多个政府机构及其公开去识别化数据集进行了审计。审计发现，在多个案例中，关于重新识别风险的评估或管理方式的文档不足。审计还发现，对于某些数据集，重新识别风险"中等或以上"。关键观察是：即使未演示重新识别，审计也显示了由于治理不力和监督不足而带来的真实风险。

English:

The Office of the Information Commissioner (Queensland) audited a number of government agencies and their public de-identified datasets. The audit found that in several cases, there was insufficient documentation of how re-identification risk was assessed or managed. It also found that for some datasets, the risk was "medium or above" for re-identification. Key observation: even though re-identification was not demonstrated, the audit showed real risk due to weak governance and low oversight.

### 2017年昆士兰政府公开数据集审计 / Queensland Government Audit of Public Datasets – 2017

中文：

昆士兰信息专员办公室审查了政府机构发布的去识别化数据集。发现某些数据集因控制不足和缺乏风险管理文档而存在中等或高度的重新识别风险。没有公开演示重新识别，但风险得到确认。参考文献：OIC昆士兰（2017年），《隐私和公共数据：管理重新识别风险》。

English:

Queensland Office of the Information Commissioner reviewed de-identified datasets published by agencies. Found that some datasets carried a medium or high risk of re-identification due to inadequate controls and poor documentation of risk management. No public re-identification demonstrated, but risk confirmed. Reference: OIC Queensland (2017), Privacy and Public Data: Managing Re-identification Risk.

### 澳大利亚统计局保密指导 / ABS Confidentiality Guidance

中文：

澳大利亚统计局（ABS）已发布多次警告（最新更新在2020年代），即使去识别化或汇总数据集也存在重新识别风险。他们强调了如何通过与其他数据源交叉匹配来撤销去识别化的示例。参考文献：ABS，《理解重新识别》– ABS指南。

English:

The ABS has issued repeated warnings (latest updates in 2020s) that even de-identified or aggregate datasets carry re-identification risk. They highlight examples of how cross-matching with other data sources can undo de-identification. Reference: ABS, Understanding Re-identification – ABS Guide.

### 可识别性连续体 / Identifiability Continuum

中文：

可识别性不是一个二分的问题（要么完全可识别，要么完全匿名），而是一个连续体。组织需要评估他们处理的数据在这个连续体上的位置，并采取相应的保护措施。这取决于数据的背景、使用方式、可用的其他信息等因素。

English:

Identifiability is not a binary issue (either completely identifiable or completely anonymous), but a continuum. Organizations need to assess where the data they handle falls on this continuum and take appropriate protective measures. This depends on factors such as the context of the data, how it is used, and what other information is available.

### 去识别化何时有用 / When de-identification (deID) is useful

中文：

允许组织在不触发所有"个人信息"处理法律义务的情况下使用或共享数据

示例：医院发布患者结果统计，不包括姓名或医疗保险号码，因此不违反《隐私法》。

最小化数据安全风险

去识别化数据可以减少数据集被意外泄露或被黑客攻击的伤害。示例：大学与外部研究人员共享去识别化的调查结果。即使泄露，个人也无法轻易被识别。

作为"隐私设计"特性

在系统或项目设计期间合并去识别化技术，以从一开始就嵌入隐私。示例：健身应用仅存储匿名活动模式用于研究，从不将其链接回用户。

启用二次使用的处理

允许组织重新使用数据进行研究、分析或创新，而不损害个人隐私。示例：银行分析去识别化的交易数据以研究消费者支出趋势。

代替删除

去识别化使长期保留有用信息而不保存可识别的个人记录成为可能。示例：政府机构去识别化旧人口普查记录以保存历史用途，而不是销毁。

English:

To allow organisations to use or share data without triggering all legal obligations of handling "personal information."

Example: A hospital publishes statistics on patient outcomes without including names or Medicare numbers, so it does not breach the Privacy Act.

To minimise data security risks

De-identified data reduces harm if datasets are accidentally leaked or hacked. Example: A university shares de-identified survey results with external researchers. Even if leaked, individuals cannot easily be identified.

As a 'Privacy by Design' feature

Incorporating de-identification techniques during system or project design to embed privacy from the start. Example: A fitness app stores only anonymised activity patterns for research, never linking them back to users.

To enable processing for secondary purposes

Allows organisations to reuse data for research, analytics, or innovation without compromising personal privacy. Example: A bank analyses de-identified transaction data to study consumer spending trends.

Instead of deletion

De-identification enables long-term retention of useful information without holding identifiable personal records. Example: A government agency de-identifies old census records to preserve them for historical instead of destroying them.

### 《联邦隐私法》（1988年《隐私法》）是什么？ / What is the Federal Privacy Act (Privacy Act 1988)?

中文：

《1988年隐私法》是澳大利亚在联邦（英联邦）层面保护个人隐私的主要法律。主要目的包括：规制澳大利亚政府机构和许多私营部门组织如何收集、使用、存储和披露个人信息；保护个人隐私，确保对个人数据的合法、公平、透明的处理。

该法适用于：联邦政府机构；年营业额超过澳元300万的私营部门组织，以及某些其他机构（如卫生服务提供者、征信机构），即使营业额低于这个阈值。该法包括13项澳大利亚隐私原则（APPs），规定了对个人数据处理方式的义务（收集、质量、使用、披露、存储、访问、更正等）。澳大利亚信息专员办公室（OAIC）执行该法，调查投诉，管理数据泄露，提供指导等。

English:

The Privacy Act 1988 (Cth) is Australia's main law for protecting individual privacy at the federal (Commonwealth) level. Key purposes include: Regulate how personal information is collected, used, stored, and disclosed by Australian Government agencies and many private sector organisations; Protect individuals' privacy, ensure lawful, fair, transparent handling of personal data.

Who it applies to: Federal government agencies; Private sector organisations with annual turnover > AUD $3 million, plus some others (e.g. health service providers, credit reporting bodies) even if below that threshold. The Act includes 13 Australian Privacy Principles (APPs) which set out obligations on how personal data must be handled (collection, quality, use, disclosure, storage, access, correction, etc.). The Office of the Australian Information Commissioner (OAIC) enforces the Act, investigates complaints, manages data breaches, gives guidance, etc.

### 第二阶段改革是什么？/ What are the Tranche 2 Reforms?

中文：

"第二阶段"是指澳大利亚联邦隐私法的第二组改革。政府已经通过或正在实施"第一阶段"改革；第二阶段将涵盖《隐私法审查》中建议的其余更改。这些改革旨在更新和加强澳大利亚的隐私保护框架，以应对新兴的隐私威胁和技术发展。

English:

"Tranche 2" refers to the second set of reforms to Australia's federal privacy laws. The government has already passed or is implementing "Tranche 1" reforms; Tranche 2 will cover the rest of the changes recommended in the Privacy Act Review. These reforms aim to update and strengthen Australia's privacy protection framework to address emerging privacy threats and technological developments.

### 去识别化技术 / De-Identification Techniques

中文：

去识别化有多种技术，对非结构化数据的去识别化很困难，我们将讨论结构化数据。用于测试去识别化的方法包括K-匿名性和差分隐私。每种技术都有其自身的优势和劣势。如果你想使用K-匿名性测试，你更倾向于使用抑制和泛化。而差分隐私偏好数据扰动，例如添加噪声。

English:

De-identification has multiple techniques. It is difficult to de-identify unstructured data; we will talk about structured data. Testing for de-identification includes K-anonymity and Differential Privacy. Each technique has its own strengths and weaknesses. If you want to test using K-anonymity, you prefer to use suppression and generalization. While DP prefer data perturbation, such as adding noise.

### K-匿名性 / K-Anonymity

中文：

K-匿名性查看数据集中的唯一性。每个成员在数据集中代表一次。K=4意味着4个人共享相同的标识符和属性，你无法区分这4个人。K=1意味着数据集中只有一个人拥有特定的数据组合（单独处理）。K值越高，重新识别风险越低。互联网上的开放发布数据理想情况下应为k=11，澳大利亚统计学家设定k=3，新加坡K=5。

English:

K-anonymity looks for the uniqueness in the dataset. Each member is represented once in the dataset. K=4 means that 4 people sharing same identifiers and attributes and you can't differentiate among those 4. K=1 means there is only one person in the dataset who have particular combination of data (Single out). Higher value of K means lower the re-identification risks. Open release of data over Internet should be k=11 ideally, Australian statition k=3, Singapore K=5.

### 重新识别测试 / Testing for Re-Identification

中文：

重新识别测试需要考虑以下因素：数据如何被处理、使用了哪种去识别化技术、使用或披露的环境或背景。应用被称为"有动力入侵者测试"的方法。

有动力入侵者测试（MIT）是数据保护和隐私中使用的一种方法，用于评估一个没有特殊技能但有足够动力的个人是否能够成功地重新识别去识别化（匿名化）数据集中的个人。

English:

Testing for Re-Identification needs to consider: How the data has been treated, which de-identification technique used, environment or context in which it will be used or disclose. Apply what known as Motivated Intruder Test.

A Motivated Intruder Test (MIT) is a method used in data protection and privacy to assess whether an individual with no special skills but with sufficient motivation could successfully re-identify individuals in a dataset that has been de-identified (anonymized).

### 有动力入侵者测试的基本原理 / Motivated Intruder Test Rationale

中文：

有动力入侵者测试的理念是：即使直接标识符（如姓名、地址、ID）被删除，仍然存在风险，某人可能会将数据集与公开可用的信息（例如社交媒体、选民名册、公司注册）结合起来，以找出个人的身份。该测试假设入侵者拥有合理的资源和毅力，但没有专业的黑客或法医技能。

English:

The idea is: even if direct identifiers (like name, address, ID) are removed, there's a risk that someone could combine the dataset with publicly available information (e.g., social media, electoral roll, company registers) to work out the identity of individuals. The test assumes the intruder has reasonable resources and persistence, but not specialist hacking or forensic skills.

### 有动力入侵者测试的步骤 / Steps in a Motivated Intruder Test

中文：

进行有动力入侵者测试的步骤包括：将数据集提供给评估人员（充当"有动力入侵者"）；评估人员尝试使用仅公开信息重新识别个人，且不违反法律；记录重新识别是否可能、部分可能或不可能；使用结果加强匿名化方法。

English:

Steps in a Motivated Intruder Test include: Provide the dataset to an assessor (acting as the "motivated intruder"); The assessor tries to re-identify individuals using only public information and without breaking the law; Document whether re-identification was possible, partially possible, or not possible; Use the results to strengthen anonymization methods.

### 有动力入侵者测试示例 / Example - Motivated Intruder Test

中文：

一所大学发布了一个毕业生数据集，删除了姓名和学生ID，但保留了年龄、性别、毕业年份和课程。

测试方法：一个有动力的入侵者可能会在LinkedIn或大学通讯中搜索，毕业生在其中列出他们的学位、年份和年龄。如果他们找到"John Smith，22岁，2024年计算机科学毕业生"，他们可以在数据集中重新识别他。

结果：测试显示匿名化不足，可能需要更多泛化（例如，给出年龄范围或课程类别）。

English:

A university releases a dataset of graduates, removing names and student IDs but keeping: Age, gender, graduation year, and program.

Test: A motivated intruder might search LinkedIn or university newsletters where graduates list their degree, year, and age. If they find "John Smith, 22 years old, Computer Science graduate in 2024," they can re-identify him in the dataset.

Outcome: The test shows the anonymization was insufficient, and more generalization (e.g., giving age ranges or program categories) may be required.

### 背景环境 / Context/Environment

中文：

在评估去识别化有效性时，需要考虑背景和环境的多个方面：

安全数据：使用强大的去识别化技术来最小化风险。

安全的人员：拥有访问权限的受信任员工。

安全的设置：未授权访问的设置。

安全的项目：数据的类型和项目的性质。

安全的输出：来自身份披露的输出保护。

English:

When assessing the effectiveness of de-identification, multiple aspects of context and environment need to be considered:

Safe Data: using robust de-identification technique to minimize the risk

Safe People: Trusted staff with access

Safe Setting: Unauthorize access

Safe Project: Kind of project Data

Safe Output: from identity disclosure

### 隐私风险 / Privacy Risks

中文：

隐私风险包括多种类型：

身份披露：识别一个人的身份，例如识别Alice。

属性披露：即使不知道某人的身份，仍然可以推断出他们的敏感属性。例如，作为教师，通过使用名字，你可以找到他关于考试成绩的属性。

个体化：你发现了一个人的特征集合，但不是他们的身份。例如，在线广告针对显示特定兴趣的人。

English:

Privacy risks include several types:

Identity disclosure: Identify a person named Alice

Attribute disclosure: You are the teacher; by using name you can find his attribute about exam results

Individuation: You find out set of characteristics about a person but not their identity e.g. online adds go to a person who shows a specific interest

### 结构化数据集中的数据类型 / Types of Data in a Structured Dataset

中文：

直接标识符：姓名、号码、患者号码、税务号码、驾驶执照号码和地址等。这些可以直接识别一个人。

间接标识符（准标识符）：间接标识符是不能单独直接识别一个人，但在与其他数据结合时可以揭示身份的信息片段。它们在隐私和去识别化中至关重要，因为即使直接标识符（如姓名、电话号码、ID）被删除，间接标识符仍然可能使重新识别成为可能。

English:

Direct Identifiers: Name, number, patient number, tax file number, driver license number and address etc.

Indirect Identifiers (also called quasi-identifiers): are pieces of information that do not directly identify a person on their own but can reveal identity when combined with other data. They are critical in privacy and de-identification because even if direct identifiers (like name, phone number, ID) are removed, indirect identifiers can still make re-identification possible.

### 间接标识符的示例 / Examples of Indirect Identifiers

中文：

出生日期：单独来看，它不能识别某人。但与邮政编码+性别结合时，它可以唯一识别很大比例的人。

邮政编码/ZIP代码：一个邮政编码可能仅覆盖一个小地区（例如一条街道）。当与年龄或职业配对时，它可以指向一个个人。

职业："悉尼儿童医院的外科医生"在公开数据集中可能很容易导致重新识别。

种族或国籍：单独来看不是唯一的，但与年龄和位置结合时，它可以缩小身份范围。

罕见医学病状：即使删除名字，患有特定地区罕见疾病的某人也可能被识别。

English:

Date of Birth: Alone, it doesn't identify someone. But combined with postcode + gender, it can uniquely identify a large proportion of people.

Postcode / ZIP code: A single postcode may cover only a small area (e.g., one street). When paired with age or occupation, it can point to an individual.

Occupation: "Surgeon at Sydney Children's Hospital" could make re-identification easy in public datasets.

Ethnicity or Nationality: Not unique on its own, but when combined with age and location, it can narrow down identities.

Rare Medical Condition: Even if names are removed, someone with a rare disease in a specific region could be identified.

### 结构化数据集中的数据类型 - 实际示例 / Types of Data in a Structured Dataset - Practical Example

中文：

一家医院发布了一个去识别化的数据集，包含：年龄：46、性别：女性、郊区：Paddington、诊断：BP（血压/某种医学诊断）。

这看起来是匿名的，但是：一篇当地新闻文章报道："来自Paddington的46岁女性，被诊断为BP，为治疗筹款。"一个有动力的入侵者可以匹配该记录并重新识别患者。

English:

A hospital publishes a de-identified dataset with: Age: 46, Gender: Female, Suburb: Paddington, Diagnosis: BP. This seems anonymous, but: A local news article reports: "46-year-old woman from Paddington diagnosed with BP fundraises for treatment." A motivated intruder can match the record and re-identify the patient.

### 结构化数据集中的属性 / Attributes in a Structured Dataset

中文：

属性是关于每个个人的行政或操作数据。例如，医院数据库包含关于患者的临床数据，或学生管理系统包含关于学生的教育记录。这些属性虽然本身可能不是标识符，但在与其他数据结合时可能会导致隐私风险。

English:

Attributes: Administrative or operational data about each individual e.g. hospital database contains clinical data about patient or student management system contain educational records about students.

### 去识别化技术 / De-identification Techniques

中文：

主要的去识别化技术包括：

- 聚合：将个人记录合并为摘要统计信息以隐藏特定身份。

- 抑制：从数据集中删除敏感或罕见值。

- 泛化：用更宽泛的类别替换精确值。

- 假名化：用人工代码或假名替换直接标识符。

- 扰动：轻微改变数据（添加噪声或修改值）以掩盖确切的细节。

每种技术都有其自身的优势和劣势。

English:

De-identification techniques include:

- Aggregation: Combines individual records into summary statistics to hide specific identities.

- Suppression: Removes sensitive or rare values from the dataset.

- Generalisation: Replaces precise values with broader categories.

- Pseudonymisation: Replaces direct identifiers with artificial codes or pseudonyms.

- Perturbation: Alters data slightly (adds noise or modifies values) to mask exact details.

Each technique has its own strengths and weaknesses.

### 去识别化技术对比表 / De-identification Techniques Comparison

中文：

| 技术 | 定义 | 示例 | 局限性 |
| --- | --- | --- | --- |
| 聚合 | 将个人记录合并为摘要统计以隐藏特定身份 | 不显示每个学生的分数，发布每班平均分 | 有用的细节丧失；极值仍可能暗示个人 |
| 抑制 | 从数据集中删除敏感或罕见值 | 删除确切的出生日期，仅保留年份 | 过度抑制会减少数据的分析价值 |
| 泛化 | 用更宽泛的类别替换精确值 | 用"Smithfield, NSW"替换"45 Red St, Smithfield" | 精度降低，可能影响研究准确性 |
| 假名化 | 用人工代码或假名替换直接标识符 | 用"User123"替换"John Smith" | 如果映射密钥被破坏，可以反转 |
| 扰动 | 轻微改变数据（添加噪声或修改值）以掩盖确切细节 | 年龄从29改为28或30 | 噪声过多会损害准确性；过少提供弱保护 |

English:

| Technique | Definition | Example | Limitation |
| --- | --- | --- | --- |
| Aggregation | Combines individual records into summary statistics to hide specific identities. | Instead of showing each student's mark, publish the average mark per class. | Useful detail is lost; extreme values may still hint at individuals. |
| Suppression | Removes sensitive or rare values from the dataset. | Remove exact date of birth and keep only the year. | Too much suppression reduces the analytical value of the data. |
| Generalisation | Replaces precise values with broader categories. | Replace "45 Red St, Smithfield" with "Smithfield, NSW". | Precision is reduced, which may affect research accuracy. |
| Pseudonymisation | Replaces direct identifiers with artificial codes or pseudonyms. | Replace "John Smith" with "User123". | Can be reversed if the mapping key is compromised. |
| Perturbation | Alters data slightly (adds noise or modifies values) to mask exact details. | Change age from 29 to 28 or 30. | Too much noise harms accuracy; too little offers weak protection. |

### 聚合示例 / Example - Aggregation

中文：

在一个有12名学生参加西班牙语考试的班级中，平均分数是70%。

但学校校长对西班牙语老师说："好吧，从这个统计数据来看，我无法判断你对科目的教学情况如何，因为我知道来自马德里的Maria在你的班级中。如果你从你的分析中排除Maria，然后告诉我平均分数。"

当Maria被排除时，平均分数下降到68%。Maria的分数是多少？答案选项：100%、70%、92%、88%。

通过这个例子，我们可以看到即使进行了聚合，仍然可能通过额外的信息和计算来推导出个人的数据。

English:

In a class of 12 students who sat a Spanish exam, the average score is 70%. But the school principal says to the Spanish teacher: "Well, from this statistic I can't judge how well you are teaching the subject, because I know that Maria from Madrid is in your class. Exclude Maria from your analysis, and then tell me the average score."

When Maria is excluded from the analysis, the average score drops to 68%. What was Maria's score? Answer options: 100%, 70%, 92%, 88%.

Through this example, we can see that even with aggregation, it is still possible to derive individual data through additional information and calculations.

### 抑制和泛化测验 / Suppression and Generalization Quiz

中文：

考虑以下数据集：

| 姓名 | 性别 | 年龄 | 宗教 | 科学成绩 |
| --- | --- | --- | --- | --- |
| Alice | 女 | 15 | 犹太教 | 75% |
| Maria | 女 | 15 | 天主教 | 82% |
| David | 男 | 15 | 天主教 | 35% |
| Emma | 女 | 16 | 圣公会 | 65% |
| Michael | 男 | 16 | 圣公会 | 59% |
| Jacob | 男 | 15 | 犹太教 | 61% |
| Sarah | 女 | 15 | 天主教 | 77% |
| Lisa | 女 | 15 | 圣公会 | 85% |
| Jessica | 女 | 16 | 圣公会 | 38% |
| Lauren | 女 | 15 | 圣公会 | 89% |
| Rebecca | 女 | 15 | 犹太教 | 79% |

问题：

- Alice庆祝了她的哥哥Bar Mitzvah，猜他在科学中的成绩？

- Maria说她在科学中不及格，猜她的成绩？

- 猜K值是多少？1、3、5、7

English:

Consider the following dataset with: Name, Sex, Age, Religion, Science marks.

Questions:

- Alice celebrated his brother Barmitzvah, guess his marks in Science?

- Maria tells that she failed the Science, guess her marks?

- Guess the value of K? 1, 3, 5, 7

### 假名化 / Pseudonymisation

中文：

假名化用于数据链接目的，因为抑制和泛化将不适用，如果你想匹配两个具有公共标识符的不同数据集。直接标识符被替换为假名。假名可以是加密的、哈希的、随机数或统计链接密钥（SLK）。

English:

Use for data linking purpose as suppression and generalization will not work if you want to match two different dataset having a common identifier. Direct identifiers are replaced with Pseudonyms. Encrypted, hashed, random number or Statistical Linkage Key (SLK).

### 统计链接密钥 / Statistical Linkage Key

中文：

统计链接密钥（SLK）是一种在卫生、教育和政府数据集中使用的假名化技术。与其存储完整个人标识符（姓名、出生日期、性别等）不同，SLK从这些标识符的部分生成代码。这允许属于同一人的记录（跨越不同数据集或时期）被链接，而不会泄露其完整身份。

在隐私术语中，SLK是假名，而不是匿名化——如果知道编码方案和源标识符，重新识别是可能的。

English:

An SLK is a type of pseudonymisation technique used in health, education, and government datasets. Instead of storing full personal identifiers (name, DOB, sex, etc.), an SLK generates a code from parts of those identifiers. This allows records belonging to the same person (across different datasets or time periods) to be linked without revealing their full identity.

In privacy terms, SLK is a pseudonym, not anonymisation — re-identification is possible if the coding scheme and source identifiers are known.

### 什么是SLK-581？/ What is SLK-581?

中文：

SLK-581是澳大利亚最广泛使用的格式（用于AIHW数据集、卫生服务等）。该代码长14个字符，由以下部分组成：

- 姓氏 – 第2、3、5个字母（或"2"、"3"、"5"）→ 3个字符

- 名字 – 第2、3个字母 → 2个字符

- 出生日期 – DDMMYYYY格式 → 8位数字

- 性别 – 1位数字（1=男性，2=女性，9=其他/未知）

总计 = 14个字符 → SLK-581

English:

SLK-581 is the most widely used format in Australia (used in AIHW datasets, health services, etc.). The code is 14 characters long and made up of:

- Family Name – 2nd, 3rd, and 5th letters (or "2", "3", "5") → 3 chars

- Given Name – 2nd and 3rd letters → 2 chars

- Date of Birth – in DDMMYYYY format → 8 digits

- Sex – 1 digit (1=Male, 2=Female, 9=Other/Unknown)

Total = 14 characters → SLK-581

### SLK-581示例 / Example of SLK-581

中文：

假设有一个人：

- 姓名：John Smith

- 出生日期：2000年8月14日 → 14082000

- 性别：男性 → 1

步骤：

提取姓氏字母：

- "Smith" → 第2个 = M、第3个 = I、第5个 = H → MIH

提取名字字母：

- "John" → 第2个 = O、第3个 = H → OH

与出生日期和性别结合：

- 代码 = MIHOH140820001

English:

Example:

- Name: John Smith

- DOB: 14 August 2000 → 14082000

- Sex: Male → 1

Step 1: Extract surname letters

- "Smith" → 2nd = M, 3rd = I, 5th = H → MIH

Step 2: Extract given name letters

- "John" → 2nd = O, 3rd = H → OH

Step 3: Combine with DOB and Sex

- Code = MIHOH140820001

### SLK-581测验 / SLK-581 Quiz

中文：

给定以下数据集（使用SLK-581和相应的地址与科学成绩）：

| SLK-581 | 地址 | 科学成绩 |
| --- | --- | --- |
| RONLI120320002 | — | 85 |
| TOERI050719991 | — | 73 |
| IN2HA231120011 | — | 92 |
| VASIA150620002 | — | 68 |
| LAKTH300920011 | — | 79 |

问题：

- Brian的科学成绩是多少？

- Diana的出生日期是多少？

English:

Given the following dataset with SLK-581 codes, Address, and Science Marks:

Questions:

- What's the Brian score in Science?

- What's Diana DOB?

### 哈希及其失败原因 / Hashing and Why it fails?

中文：

什么是哈希？

哈希是一种密码学技术，将输入数据（例如姓名、ID或密码）转换为固定长度的字符串（哈希值）。

示例：Alice123 → SHA-256 → 7c222fb2927d828af22f592134e8932480637c0d…

特性：

- 确定性 → 相同的输入始终产生相同的输出。

- 单向性 → 你不能"反向"哈希来获得输入。

- 小的输入变化 → 产生非常不同的输出。

哈希经常用于假名化，用编码值替换标识符。

English:

What is Hashing?

Hashing is a cryptographic technique that converts input data (e.g., a name, ID, or password) into a fixed-length string of characters (the hash).

Example: Alice123 → SHA-256 → 7c222fb2927d828af22f592134e8932480637c0d…

Properties:

- Deterministic → same input always gives same output.

- One-way → you can't "reverse" a hash to get the input.

- Small changes in input → produce very different outputs.

Hashing is often used in pseudonymisation to replace identifiers with coded values.

### 假名化中哈希的使用 / How Hashing is Used in Pseudonymisation

中文：

用哈希值替换个人标识符来"隐藏"原始值。

示例：

- 姓名：Alice Brown → 哈希：1f3870be274f6c49b3e31a0c6728957f

- 出生日期：12032000 → 哈希：6a204bd89f3c8348afd5c77c717a097a

数据集仅存储哈希而不是原始值。

English:

Replace personal identifiers with their hash values to "hide" the original.

Example:

- Name: Alice Brown → Hash: 1f3870be274f6c49b3e31a0c6728957f

- DOB: 12032000 → Hash: 6a204bd89f3c8348afd5c77c717a097a

The dataset stores only the hashes instead of raw values.

### 隐私中哈希失败的原因 / Why Hashing Fails in Privacy

中文：

确定性 = 可链接性

相同值总是产生相同的哈希。如果"Alice Brown"出现在多个数据集中，哈希将匹配，允许记录被链接（重新识别风险）。

字典攻击

攻击者可以预先为常见的姓名、出生日期或邮政编码生成哈希。然后与数据集哈希比较以重新识别个人。示例：可以使用预计算表猜测"Smith1980"的哈希。

小域问题

某些标识符（例如性别 = M/F，或出生日期 = 365天×有限年份）的范围非常有限。攻击者可以轻松地强制所有可能的值。

没有真正的匿名性

哈希是假名化，而不是匿名化，因为如果攻击者有映射或可以强制破解它，链接到原始数据的联系可以被恢复。

English:

Deterministic = Linkability

The same value always produces the same hash. If "Alice Brown" appears in multiple datasets, the hash will match, allowing records to be linked (re-identification risk).

Dictionary Attacks

Attackers can generate hashes for common names, DOBs, or postcodes in advance. Then compare with dataset hashes to re-identify individuals.

Small Domain Problem

Some identifiers (e.g., sex = M/F, or DOB = 365 days × limited years) have a very limited range. Attackers can brute-force all possible values easily.

No True Anonymity

Hashing is pseudonymisation, not anonymisation, because the link to the original data can be restored if the attacker has the mapping or can brute-force it.

### 隐私失败的示例 / Example of Privacy Failure

中文：

一家医院发布了一个去识别化数据集，其中患者姓名和出生日期被替换为SHA-256哈希。

攻击者知道一个患者是John Smith，出生于1980年6月15日。

他们对JohnSmith15061980进行哈希 → 结果与数据集条目匹配。

现在攻击者可以看到John Smith有敏感诊断（HIV）。

因此，仅哈希不足以提供隐私保护。

English:

A hospital releases a de-identified dataset where patient names and DOBs are replaced with SHA-256 hashes.

Attacker knows one patient is John Smith, born 15/06/1980.

They hash JohnSmith15061980 → result matches a dataset entry.

Now the attacker can see that John Smith had a sensitive diagnosis (HIV).

Thus, hashing alone is not sufficient for privacy protection.

### 扰动 / Perturbation

中文：

扰动是一种去识别化技术，其中你轻微修改数据（添加噪声、交换值、四舍五入数字等），以便原始信息无法直接链接回个人。目标是在掩盖敏感值的同时仍允许有用的分析。

如何在隐私中使用扰动：

随机噪声添加：向薪资或年龄添加小的随机数。示例：年龄34 → 33或36。

数据交换：交换记录之间的某些属性值。示例：在两名患者之间交换邮政编码。

四舍五入/上限编码：用近似值替换精确值。示例：任何超过$200,000的收入 → 报告为"$200,000+"。

扰动也是差分隐私（DP）的基础，其中噪声被添加到查询结果（而不是原始数据），以使输出足够不确定以隐藏任何单个人的存在/缺失。

English:

Perturbation is a de-identification technique where you modify data slightly (add noise, swap values, round numbers, etc.) so the original information cannot be directly linked back to an individual. The goal is to mask sensitive values while still allowing useful analysis.

How Perturbation is Used in Privacy:

Random Noise Addition: Add small random numbers to salaries or ages. Example: Age 34 → 33 or 36.

Data Swapping: Swap some attribute values between records. Example: Exchange postcodes between two patients.

Rounding/Top-coding: Replace exact values with approximate ones. Example: Any income above $200,000 → report as "$200,000+".

Perturbation is also the foundation of Differential Privacy (DP) where noise is added to query results (not raw data) so the output is uncertain enough to hide the presence/absence of any single person.

### 扰动失败的原因 / Why Perturbation Fails

中文：

噪声过少 = 隐私风险

如果扰动很小，攻击者仍可能推断真实值。示例：薪资$51,002扰动到$51,100仍然很容易猜测。

噪声过多 = 效用损失

如果添加过多噪声，数据对分析变得无用。示例：扰动考试成绩使得平均班级表现无意义。

统计攻击（与DP一起使用时）

即使有差分隐私，重复查询或相关数据集也可以"平均"噪声。示例：对同一DP保护数据库进行相同查询1000次 → 噪声抵消，真实值推断。

小域问题

如果属性空间很小（例如性别、邮政编码），攻击者可以通过强制扰动后的可能值。示例：邮政编码只有几百个可能值。

与外部数据的链接

扰动数据通常仍然可以与外部数据集匹配。示例：轻微噪声的医疗记录仍然可以链接到公开注册表。

English:

Too Little Noise = Privacy Risk

If the perturbation is small, attackers may still infer the real value. Example: Salary $51,002 perturbed to $51,100 is still easy to guess.

Too Much Noise = Utility Loss

If you add too much noise, the data becomes useless for analysis. Example: Perturbing exam scores so heavily that average class performance is meaningless.

Statistical Attacks (when used with DP)

Even with differential privacy, repeated queries or correlated datasets can "average out" the noise. Example: Ask the same DP-protected database the same query 1000 times → noise cancels, true value inferred.

Small Domain Problem

If the attribute space is small (e.g., gender, postcode), attackers can brute-force possible values even after perturbation. Example: Postcode has only a few hundred possible values.

Linkage with External Data

Perturbed data can often still be matched with external datasets. Example: Slightly noised medical records can still be linked to public registries.

### 扰动示例：医院数据发布 / Example - Hospital Data Release

中文：

场景：一家医院发布一个"去识别化"的数据集，患者年龄通过添加±2年的随机噪声进行扰动。

发布的数据集（扰动）：

| 患者ID | 年龄（扰动） | 诊断 |
| --- | --- | --- |
| P01 | 47 | 糖尿病 |
| P02 | 33 | HIV |
| P03 | 51 | 心脏病 |

攻击（身份披露）

一个攻击者从新闻文章知道Smith先生现年49岁，最近被送入这家医院。扰动数据集有P03 = 51岁。由于扰动仅为±2年，真实年龄可能在49–53岁之间。Smith先生（49）在这个范围内。攻击者推断P03 = Smith先生，从而了解他患有心脏病。

为什么发生披露？

扰动保留了过多的准确性。即使有噪声，独特个人仍然可以通过交叉引用外部知识（如新闻、社交媒体或选民名册）被重新识别。

English:

Scenario: Hospital Data Release

A hospital publishes a "de-identified" dataset with patient ages perturbed by adding random noise of ±2 years.

Released Dataset (perturbed):

| Patient ID | Age (perturbed) | Diagnosis |
| --- | --- | --- |
| P01 | 47 | Diabetes |
| P02 | 33 | HIV |
| P03 | 51 | Heart Disease |

Attack (Identity Disclosure)

An attacker knows from a news article that Mr. Smith, aged 49, was recently admitted to this hospital. Perturbed dataset has P03 = 51 years old. Since perturbation is only ±2 years, the true age could be anywhere from 49–53. Mr. Smith (49) fits within this range. The attacker infers that P03 = Mr. Smith, thus learning he has Heart Disease.

Why Did Disclosure Happen?

Perturbation preserved too much accuracy. Even with noise, unique individuals can still be re-identified by cross-referencing external knowledge (like news, social media, or voter rolls).

## Lecture 9: Privacy Impact Assessment 隐私影响评估

### 你将学到什么 / What you will learn

中文：

本讲座将涵盖隐私影响评估（PIA）的关键概念和应用。你将学到什么是PIA、临界值评估的作用、何时以及为什么需要进行PIA、PIA的好处，以及如何进行PIA。通过本讲座，你将能够理解PIA在隐私保护中的重要性，并能够应用这些概念在实际项目中。

English:

This lecture will cover key concepts and applications of Privacy Impact Assessment (PIA). You will learn what a PIA is, the role of threshold assessments, when and why a PIA is necessary, the benefits of PIA, and how to conduct a PIA. Through this lecture, you will be able to understand the importance of PIA in privacy protection and apply these concepts in real-world projects.

### 什么是隐私影响评估？/ What is a Privacy Impact Assessment (PIA)?

中文：

隐私影响评估（PIA）是一种系统的评估方法，用来识别项目可能对个人隐私产生的影响，并提出管理、最小化或消除这种影响的建议。

PIA可以帮助确保符合性、促进隐私设计方法，并识别最佳实践。PIA表明了对负责任和透明隐私实践的承诺，并为机构的项目和政策建立公众信任和信心。法律认可了这一价值，要求机构对所有高隐私风险项目进行PIA。

重要的是，并非所有PIA都需要冗长或复杂。相反，PIA中采取的方法应与风险水平成比例。PIA旨在成为一种灵活且可扩展的工具，可以根据项目的规模、复杂性和风险水平进行调整。

English:

A Privacy Impact Assessment (PIA) is a systematic assessment that identifies the impact that a project might have on the privacy of individuals, and sets out recommendations for managing, minimising, or eliminating that impact.

PIAs can help ensure compliance, facilitate a privacy-by-design approach and identify better practice. PIAs demonstrate a commitment to accountable and transparent privacy practices and build public trust and confidence in an agency's programs and policies. The Code recognises this value by requiring agencies to conduct a PIA for all high privacy risk projects.

Importantly, not all PIAs need to be long or complex. Instead, the approach taken in a PIA should be proportionate to the level of risk. A PIA is intended to be a flexible and scalable tool, which can be adapted based on the size, complexity and risk level of your project.

### PIA的诊断和处方角色 / PIA as Diagnosis and Prescription

中文：

诊断工具：PIA用于识别未来项目的隐私影响。

处方工具：PIA用于识别最小化负面影响并最大化正面影响的方法。

重要的是要理解PIA不是：

- 不是解决问题的"药物"（解决方案本身）

- 不是探索性手术（审计）

- 不是尸检（评估）

PIA的目的是通过系统性识别和评估来帮助改进项目，而不是提供最终的解决方案或已经完成的事后审查。

English:

A diagnosis: a tool to identify the privacy impacts of a future project

And a prescription: a tool to identify ways to minimise the negatives and maximise the positives

It is important to understand that a PIA is NOT:

- Not the medicine (the solution itself)

- Nor is it exploratory surgery (audit) or an autopsy (evaluation)

The purpose of PIA is to help improve projects through systematic identification and assessment, rather than provide final solutions or post-hoc reviews of completed work.

### 什么是临界值评估？/ What is a Threshold Assessment?

中文：

临界值评估是一种初步评估，用于帮助确定项目的潜在隐私影响，并了解风险水平，包括它是否可能是需要根据法律进行PIA的"高隐私风险项目"。

如果你的项目涉及处理个人信息的新方式或改变的方式，你应该进行临界值评估。临界值评估的目的不是建立实际风险水平——那是PIA更详细地评估的工作。相反，其目的是筛选指向高隐私风险潜力的因素，这将需要根据法律进行PIA。

并非每个项目都需要PIA。临界值评估将快速轻松地识别没有或最少信息隐私影响的项目。

无论你是否继续进行PIA，你都应该保留临界值评估的记录。虽然法律不要求你发布临界值评估的记录，但发布可能会带来透明度优势。

English:

A threshold assessment is a preliminary assessment to help you determine your project's potential privacy impacts and give you a sense of the risk level, including whether it could be a 'high privacy risk project' requiring a PIA under the Code.

You should undertake a threshold assessment if your project involves new or changed ways of handling personal information. A threshold assessment is not intended to establish the actual level of risk – that is the job of the PIA to assess in more detail. Instead, the purpose is to screen for factors that point to the potential for a high privacy risk, which will require a PIA to be conducted under the Code.

Not every project will need a PIA. A threshold assessment will quickly and easily identify projects with no, or minimal, information privacy implications. Regardless of whether you proceed to a PIA, you should keep a record of the threshold assessment.

### 如何使用临界值评估模板 / How to use the Threshold Assessment Template

中文：

临界值评估模板的设计目的是帮助你：

1. 确定你的项目是否涉及处理个人信息的新方式或改变的方式

1. 筛选可能指向高隐私风险项目潜力的因素

如果你的项目可能存在高隐私风险，你将需要完成PIA以更详细地考虑风险（包括潜在风险的可能性和严重性）。

模板包括多个部分，每个部分都有具体的指导说明。

English:

The template is designed to help you:

- Identify whether your project involves new or changed ways of handling personal information, and

- Screen for factors that may point to the potential for a high privacy risk project.

If your project is potentially high privacy risk, you will need to complete a PIA to consider the risk in more detail (including the likelihood and severity of potential risk).

### 临界值评估模板 - 第1部分 / Threshold Assessment Template - Part 1

中文：

第1部分：项目或举措是否涉及处理个人信息的新方式或改变的方式？

模板的第1部分要求你确定和记录一个项目是否涉及处理个人信息的新方式或改变的方式。这个问题需要彻底理解项目的所有方面。

什么是"项目"？

"项目"一词涵盖机构可能具有隐私影响的全方位活动和举措。这可能包括：

- 新的政策提议

- 新的或修订的立法或委任立法

- 新的或改变的项目或活动

- 实施IT系统或数据库或增加这些系统的用户数量

- 服务提供或信息处理的新的或改变的方法或程序

- 实施人工智能技术，包括自动决策过程

- 重组或对日常业务活动的改变

English:

Part 1 of the template requires you to determine and record whether a project involves new or changed ways of handling personal information.

What is a 'project'?

The term 'project' covers the full range of activities and initiatives undertaken by agencies that may have privacy implications. This could include:

- New policy proposals

- New or amended legislation or delegated legislation

- New or changed programs or activities

- Implementing IT systems or databases or increasing the number of users of those systems

- New or changed methods or procedures for service delivery or information handling

- Implementing artificial intelligence technologies, including automated decision-making processes

- Restructures or changes to business-as-usual activities

### 什么是"个人信息"？/ What is 'Personal Information'?

中文：

"个人信息"是信息或意见，无论真假与否，无论是否以有形方式记录，关于已识别个人或合理可识别个人的信息（《隐私法》第6(1)条）。"个人信息"一词涵盖机构持有的可能识别个人的广泛信息范围，包括员工信息。

你可以使用OAIC的《什么是个人信息？》资源中的检查表来评估这个定义是否适用于你计划在项目中处理的信息。

English:

'Personal information' is information or an opinion, whether true or not, and whether recorded in a material form or not, about an identified individual, or an individual who is reasonably identifiable (s 6(1) of the Privacy Act). The term 'personal information' encompasses a broad range of information held by your agency that could identify an individual, including employee information.

You can use the checklist in the OAIC's What is personal information? resource to assess whether this definition applies to the information you plan to handle in a project.

### 什么是"处理个人信息的新方式或改变的方式"？/ What is a 'New or Changed Way of Handling Personal Information'?

中文：

这应该被广泛解释，符合其自然含义。"处理"是指你的机构在信息生命周期的所有阶段如何管理个人信息，包括收集、使用、披露、存储、销毁和去识别化。

在决定你的项目不涉及处理个人信息的新方式或改变方式之前，你需要确保项目中的任何信息处理在性质、范围、背景、目的和风险方面与现有实践相似。

如果你的项目涉及收集、使用、披露、存储、销毁或去识别化个人信息的新方式或改变方式，你需要考虑你的项目是否可能是高隐私风险项目。

English:

This should be interpreted broadly and in accordance with its natural meaning. 'Handling' refers to how your agency manages personal information throughout all stages of the information lifecycle, and includes collection, use, disclosure, storage, destruction and de-identification.

You will need to be certain that any information handling in the project is similar to an existing practice in terms of nature, scope, context, purpose and risk before deciding that your project does not involve a new or changed way of handling personal information.

If your project involves a new or changed way of collecting, using, disclosing, storing, destroying or de-identifying personal information, you will need to consider whether your project has the potential to be a high privacy risk project.

### 临界值评估模板 - 第2部分 / Threshold Assessment Template - Part 2

中文：

确定是否存在高隐私风险项目的潜力

模板的第2部分将帮助你筛选指向高隐私风险项目潜力的因素。

什么是"高隐私风险项目"？

法律规定，如果机构合理认为项目涉及处理个人信息的任何新方式或改变方式，这些方式"可能对个人隐私产生重大影响"，那么该项目可能是高隐私风险项目。

你还需要筛选隐私风险，如果你正在开发新的立法以修改一项或多项澳大利亚隐私原则（APPs）的运作，例如，授权为了法律要求或授权例外到APPs而进行的指定收集、使用或披露个人信息的立法。

类似地，即使存在处理个人信息的新方式或改变方式的法律权威，你也需要筛选隐私风险，因为个人仍可能受到不利影响。这可能包括寻求依赖APPs例外的项目。

English:

Part 2 of the template will help you to screen for factors that point to the potential for a high privacy risk project.

What is a 'high privacy risk project'?

The Code provides that a project may be a high privacy risk project if an agency reasonably considers that the project involves any new or changed ways of handling personal information that are 'likely to have a significant impact on the privacy of individuals'.

You will also need to screen for privacy risks if you are developing new legislation to modify the operation of one or more Australian Privacy Principles (APPs), for example, legislation authorising a specified collection, use or disclosure of personal information for the purposes of the required or authorised by law exception to the APPs.

Similarly, you need to screen for privacy risks even where there is legal authority for the new or changed way of handling personal information as individuals may still be adversely impacted.

### 什么是"重大影响"？/ What is a 'Significant Impact'?

中文：

在这个背景下，隐私影响是任何可能对个人信息隐私产生不利影响的事情。影响包括干扰，例如收集新的或额外类型的个人信息，或当个人信息的处理导致个人失去对其个人信息的控制。

隐私对个人的影响将是"重大的"，如果影响的后果是相当的，考虑到它们的性质和严重性。

隐私影响的后果对一个人或一组人可能很重大，例如对身心健康的负面影响、公共服务获取减少、歧视、财务损失或身份盗窃。一组个人潜在隐私影响的后果可能因其个人情况而异，所以你应该考虑某些人可能受到更严重影响的可能性。

有时项目可能对社会产生重大的集体影响，而不是对人们个体产生影响。这些集体影响可能导致广泛的公众关注，例如增加的监视和监测活动，或建立敏感个人信息在英联邦和其他实体之间的共享安排。

给定每个项目的性质、范围、背景和目的不同，没有明确的门槛来确定什么时候影响是"重大的"。因此，建议机构筛选可能提高项目风险概况的因素。模板第2部分中的表格旨在协助这个过程。

English:

A privacy impact in this context is anything that could adversely affect individuals' information privacy. Impacts include interferences, such as the collection of new or additional types of personal information, or when the handling of personal information results in an individual losing control over their personal information.

An impact on the privacy of individuals will be 'significant' if the consequences of the impact are considerable, taking into account their nature and severity.

The consequences of a privacy impact could be significant for one individual or a group of individuals, for example, negative impacts on physical and mental wellbeing, reduced access to public services, discrimination, financial loss or identity theft. The consequences of the potential privacy impacts for a group of individuals may vary based on their individual circumstances, so you should consider whether some individuals may be more significantly impacted than others.

Sometimes projects can have a significant collective impact on society, rather than impacting on people individually. These collective impacts are likely to lead to broad public concern, for example, increased surveillance and monitoring activities, or the establishment of sensitive personal information sharing arrangements between the Commonwealth and other entities.

There is no definitive threshold to determine when an impact is 'significant' given each project will differ in nature, scope, context and purpose. Accordingly, agencies are advised to screen for factors that may raise a project's risk profile.

### 筛选指向高隐私风险的因素 / Screening for Factors that Point to a High Privacy Risk

中文：

如上所述，临界值评估的目的不是确定项目（或其任何特性）实际上是"高隐私风险"——那是PIA的工作。相反，临界值评估将筛选指向高隐私风险潜力的因素，而不是进行全面的风险和影响分析。

模板的第2部分包括一份非详尽的通用和基于活动的风险因素列表，这些因素可能指向高隐私风险项目的潜力。模板要求你考虑你的项目是否将涉及：

通用因素：

- 处理大量个人信息

- 处理敏感信息

- 项目将在其中运作的背景的敏感性

- 处理具有特殊需求的个人的个人信息

- 处理个人信息的方式可能对个人或一组个人产生严重后果

基于活动的风险因素：

- 使用或披露个人信息用于二次目的

- 在你的机构外披露个人信息

- 使用或披露个人信息用于分析或行为预测

- 使用个人信息进行自动决策

- 系统的个人监视或追踪

- 收集个人信息而不通知或征得个人同意

- 数据匹配（链接不相关的个人信息）或数据链接

- 开发立法以参与APPs的"法律要求或授权"例外

English:

As mentioned above, a threshold assessment is not intended to establish that a project (or any feature of it) is actually 'high privacy risk' – that is the job of the PIA to assess in detail. Instead, a threshold assessment will screen for factors that point to the potential for a high privacy risk.

Part 2 of the template includes a non-exhaustive list of general and activity-based risk factors which may point to the potential for a high privacy risk project. The template asks you to consider whether your project will involve:

General factors:

- Handling large amounts of personal information

- Handling sensitive information

- Sensitivities of the context in which the project will operate

- Handling personal information of individuals with particular needs

- Handling personal information in a way that could have a serious consequence for an individual or a group of individuals

Activity-based risk factors:

- Using or disclosing personal information for secondary purposes

- Disclosing personal information outside your agency

- Using or disclosing personal information for profiling or behavioural predictions

- Using personal information for automated decision-making

- Systematic monitoring or tracking of individuals

- Collecting personal information without notification to, or consent of, the individual

- Data matching (linking unconnected personal information) or data linkage

- Developing legislation which seeks to engage the required or authorised by law exception to the APPs

### 考虑风险因素 / Considering Risk Factors

中文：

你应该在项目的背景下考虑这些因素，或模板中未列出的任何其他相关因素。这些因素并不总是意味着一个项目是高风险的，或者风险不能被减轻，只是存在项目可能是高风险的潜力，因此可能需要PIA来更详细地评估风险水平。

你的项目是否有可能是高隐私风险项目是一个基于你的机构情况的背景评估。每个机构有责任能够证明为什么处理个人信息的新方式或改变方式没有可能是高隐私风险。

考虑到这些因素和背景元素，如果你确实认为存在你的项目是高隐私风险项目的潜力，你应该进行PIA。

重要的是要注意，这并不意味着你的项目不能进行。相反，PIA将帮助确保识别和减轻可能与项目相关的隐私风险和影响。

PIA还将帮助你考虑限制隐私权的任何限制是否合理、必要且与你的目标成比例。这可能有助于为立法项目开发人权兼容性声明。

English:

You should consider these factors, or any other relevant factors not listed in the template, in the context of your project. These factors do not always mean that a project is high risk, or that the risk cannot be mitigated, just that there is the potential that the project may be high risk and so a PIA is likely to be required to assess the level of risk in more detail.

Whether your project has the potential to be a high privacy risk project is a contextual assessment based on your agency's circumstances. It is the responsibility of each agency to be able to justify why a new or changed way of handling personal information does not have the potential to be high privacy risk.

Taking these factors and contextual elements into account, if you do consider that there is the potential that your project is a high privacy risk project, you should undertake a PIA.

It is important to note that this does not mean that your project cannot proceed. Rather, a PIA will help to ensure that privacy risks and impacts that may be associated with your project are identified and mitigated.

A PIA will also help you consider whether any limitation on the right to privacy is reasonable, necessary and proportionate to your objective. This may assist with the development of Human Rights Compatibility Statements for legislative projects.

### 接下来是什么？/ What Next?

中文：

如果你在模板第2部分的任何问题上回答"是"，存在你的项目是高隐私风险项目的潜力，可能需要PIA。

如果你不确定是否存在高隐私风险的潜力，你应该咨询你的机构隐私官员和其他相关利益相关者。如果你仍然不确定，你应该谨慎行事并进行PIA。

如果你不认为你的项目有可能是高隐私风险项目，你应该在模板第3部分中记录你决定的原因，并将模板存储在今后可以参考的地方。

OAIC强烈鼓励机构进行PIA作为常规做法，对于涉及处理个人信息的任何新方式或改变方式的项目，无论其潜在的风险概况如何。

English:

If you answer 'yes' to any of the questions in Part 2 of the template, there is the potential that your project is a high privacy risk project and a PIA is likely to be required.

If you are uncertain whether there is the potential for a high privacy risk, you should consult your agency's privacy officer and other relevant stakeholders where necessary. If you are still unsure, you should err on the side of caution and conduct a PIA.

If you do not consider that your project has the potential to be a high privacy risk project, you should record the reasons for your decision in Part 3 of the template and store the template where it can be referred to in the future.

The OAIC strongly encourages agencies to conduct PIAs as a matter of course for projects that involve any new or changed ways of handling personal information, regardless of their potential risk profile.

### 如何进行PIA？/ How to Conduct a PIA?

中文：

OAIC的角色

《隐私法》赋予信息专员（由隐私专员行使）一项权力，可以指示一个机构向OAIC提供PIA，如果专员认为该机构的提议活动或功能可能对个人隐私产生重大影响。这包括当机构提议时：

- 参与新活动或功能，或

- 实质上改变现有活动或功能。这包括对提供现有功能或活动的系统的实质性改变。

可能考虑行使这项权力的两个主要情况：

当OAIC在向机构就提议的机构活动或功能提供政策建议的过程中，认为该活动或功能可能对个人隐私产生重大影响，并建议进行PIA，但机构没有进行

当OAIC以其他方式获悉机构的提议活动或功能（例如，通过媒体报道）时，认为它可能对个人隐私产生重大影响，而机构没有进行PIA

被指示向OAIC提供PIA的机构被要求准备一份书面评估，该评估：

- 识别活动或功能可能对个人隐私产生的影响，并

- 列出管理、最小化或消除该影响的建议

有关OAIC何时以及如何可能行使指示机构提供PIA的权力的更多信息，请参阅OAIC的隐私监管行动政策和OAIC隐私监管行动指南。

但是，OAIC期望机构认识到进行PIA的好处，一般不需要PIA指导。虽然OAIC在没有由OAIC指导的PIA的开发、认可或批准中没有正式角色，但它可能根据可用资源，能够在PIA过程中协助机构提供建议。

English:

Role of the OAIC

The Privacy Act gives the Information Commissioner a power (that is exercisable by the Privacy Commissioner) to direct an agency to provide a PIA to the OAIC, if the Commissioner considers that a proposed activity or function of the agency might have a significant impact on the privacy of individuals. This includes when the agency proposes to:

- Engage in a new activity or function, or

- Substantively change an existing activity or function. This includes a substantive change to the system that delivers an existing function or activity.

There are two main circumstances in which consideration is likely to be given to exercising this power:

When the OAIC, in the course of providing policy advice to an agency on a proposed agency activity or function, considers that the activity or function might have a significant impact on the privacy of individuals and recommends a PIA be conducted and the agency does not conduct one

When the OAIC otherwise becomes aware of an agency's proposed activity or function (for example, through a media report) and considers that it might have a significant impact on the privacy of individuals and the agency has not conducted a PIA.

Agencies who are directed to give the OAIC a PIA are required to prepare a written assessment that:

- Identifies the impact that the activity or function might have on the privacy of individuals, and

- Sets out recommendations for managing, minimising or eliminating that impact.

Further information on when and how the OAIC might exercise the power to direct agencies to provide a PIA is available in the OAIC's Privacy regulatory action policy and Guide to the OAIC's privacy regulatory action. However, the OAIC expects agencies would recognise the benefits of conducting a PIA and that a PIA direction would not generally be required. While the OAIC has no formal role in the development, endorsement or approval of PIAs that have not been directed by the OAIC, it may, subject to available resources, be able to assist agencies with advice during the PIA process.

### 案例研究 / Case Study

中文：

本部分原文未提供具体的案例研究内容，但在实际的PIA过程中，机构通常会使用真实的项目案例来演示如何应用上述原则和框架进行隐私影响评估。案例研究通常会展示：

- 项目的背景和目的

- 涉及的个人信息类型

- 识别的隐私风险和影响

- 提出的缓解措施

- PIA的最终建议

English:

The original document does not provide specific case study content in this section. However, in practical PIA processes, agencies typically use real-world project examples to demonstrate how to apply the principles and framework discussed above for privacy impact assessments. Case studies typically showcase:

- Project context and objectives

- Types of personal information involved

- Identified privacy risks and impacts

- Proposed mitigation measures

- Final PIA recommendations

### 总结 / Summary

中文：

隐私影响评估是现代隐私管理的关键工具，帮助组织在项目实施前系统地识别和评估隐私风险。通过临界值评估和全面的PIA，机构可以确保遵守隐私法律，实施隐私设计原则，并建立公众对其隐私实践的信任。

重要的是，PIA不是一次性的合规活动，而是持续的隐私管理过程的一部分，需要定期审查和更新。通过有效地进行PIA，组织可以更好地保护个人隐私，同时实现其业务目标。

English:

Privacy Impact Assessment is a critical tool in modern privacy management that helps organizations systematically identify and assess privacy risks before project implementation. Through threshold assessments and comprehensive PIAs, agencies can ensure compliance with privacy laws, implement privacy-by-design principles, and build public trust in their privacy practices.

It is important to note that PIA is not a one-time compliance activity but part of an ongoing privacy management process that requires regular review and updates. By conducting PIAs effectively, organizations can better protect personal privacy while achieving their business objectives.

## Lecture 10: How to Identify Privacy Risks 如何识别隐私风险

### 隐私评估类型 / Types of Privacy Assessments

中文：

隐私评估是评估组织在处理个人信息时可能面临的风险的系统性方法。隐私评估涉及检查组织如何收集、存储、使用和披露个人信息，以及识别可能违反隐私法律或损害个人隐私的潜在问题。

本讲座重点关注如何在项目中识别隐私风险，以及如何将隐私原则与信息生命周期联系起来，以有效管理这些风险。

English:

Privacy assessments are systematic approaches to evaluate the risks an organization may face when handling personal information. Privacy assessments involve examining how an organization collects, stores, uses, and discloses personal information, and identifying potential issues that could violate privacy laws or harm individual privacy.

This lecture focuses on how to identify privacy risks in projects and how to connect privacy principles with the information lifecycle to effectively manage these risks.

### 项目中的隐私风险 / Privacy Risks in Projects

中文：

什么是隐私风险？

隐私风险是指组织可能面临的法律、运营或声誉风险。这些风险可能出现在项目中，如果项目：

- 不遵守隐私法律

- 不符合客户期望

- 存在未减轻/不必要的负面隐私影响

隐私风险的范围很广，因为任何涉及个人信息处理方式变化的项目都应该考虑隐私风险。 这意味着任何可能改变组织如何收集、存储、使用或披露客户数据，或关于员工或其他利益相关者的信息的项目。

在评估项目是否可能让组织面临隐私风险时，你应该考虑"隐私原则"和"信息生命周期"。需要记住的是，哪些隐私原则适用取决于你所在的司法管辖区。

English:

What is Privacy Risk?

Privacy risk means the legal, operational or reputational risk for your organisation. These risks may arise if the project does not comply with privacy laws, does not meet client expectations, or has unmitigated/unnecessary negative privacy impacts.

Privacy risks have a broad scope, because any project that might impact how your organisation handles 'personal information' should have the privacy risks considered. This means any project which might change how your organisation collects, stores, uses or discloses client data, or information about staff or other stakeholders.

You should consider the 'privacy principles' and the 'information life cycle' when assessing whether a project could expose your organisation to privacy risks. Remember that which privacy principles apply will depend on what jurisdiction you are in.

### 需要考虑隐私风险的项目 / Which Projects are Relevant to Consider Privacy Risks

中文：

任何处理个人信息的项目，无论规模、主题、资金或范围如何，都应该进行测试，看它是否可能为组织创建隐私风险。

涉及新技术或对现有技术进行更改的项目

例如，从客户调查收集数据，或对客户数据库进行更改。

使用或呈现数据集的项目

例如，商业智能系统、客户仪表板或大数据项目。

实施涉及信息共享、标识符或数据链接的新政策或法律的项目

例如，与其他公司或政府机构共享数据的项目。

English:

Any project which handles personal information, no matter the size, topic, funding or scope should be tested to see if it could create privacy risks for your organisation.

Projects where you are introducing new technology or deploying changes to existing technology.

For example – collecting data from client surveys, or making changes to a client database.

Projects where you are using or presenting data sets.

For example – Business Intelligence systems, client dashboards or Big Data projects.

Projects to implement a new policy or law involving information-sharing, identifiers or data linking.

For example – a project to share data with other companies or government agencies.

### 信息生命周期 / Information Life Cycle

中文：

信息生命周期的概念

法律中列出的隐私原则与个人信息在你的组织或项目中实际流动的方式相一致。

组织可能直接从客户那里收集个人信息，从其他来源获得信息，或在内部创建信息。当你的组织持有信息时，它有责任适当地存储、更新、使用、披露、保护和共享信息。

一旦信息过时或不再需要用于组织或项目，应根据隐私要求安全地处理它。

信息生命周期的阶段包括：

1. Collection（收集） - 获取个人信息

1. Data Security（数据安全） - 保护已收集的信息

1. Access and Correction（访问和更正） - 允许个人访问和更正他们的信息

1. Accuracy（准确性） - 确保信息准确、完整和最新

1. Use（使用） - 使用收集的信息

1. Disclosure（披露） - 与他人共享或披露信息

1. Disposal（处理） - 安全处理不再需要的信息

English:

The Concept of Information Life Cycle

The privacy principles outlined in legislation align with how personal information flows through your organisation or project in practice.

Organisations may collect personal information directly from clients, obtain it from other sources, or create it internally. When your organisation holds information, it is responsible for storing, updating, using, disclosing, securing, and sharing it appropriately.

Once the information becomes outdated or is no longer required for your organisation or project, it should be securely disposed of in accordance with privacy requirements.

The stages of the information lifecycle include:

1. Collection - Acquiring personal information

1. Data Security - Protecting collected information

1. Access and Correction - Allowing individuals to access and correct their information

1. Accuracy - Ensuring information is accurate, complete and current

1. Use - Using collected information

1. Disclosure - Sharing or disclosing information with others

1. Disposal - Securely disposing of information no longer needed

### 澳大利亚隐私原则（APPs）概览 / Overview of Australian Privacy Principles (APPs)

中文：

澳大利亚有13项官方隐私原则，规范组织如何处理个人信息。以下是每项原则的概述及其含义：

| 编号 | 隐私原则 | 含义/要求 |
| --- | --- | --- |
| APP 1 | 个人信息的开放和透明管理 | 组织必须有明确的隐私管理政策和程序。隐私政策应说明收集的数据、收集原因、存储方式以及人们如何投诉或请求访问。 |
| APP 2 | 匿名性和假名性 | 在可能的情况下，个人应有选择匿名或假名处理的选项。 |
| APP 3 | 征求的个人信息的收集 | 仅收集合法功能所必需的信息，并公平合法地收集。 |
| APP 4 | 处理未征求的个人信息 | 如果无意中收到个人信息，应确定是否需要；否则销毁或去识别化。 |
| APP 5 | 个人信息收集的通知 | 通知个人正在收集其信息、原因以及与谁共享。 |
| APP 6 | 个人信息的使用或披露 | 仅为原始目的使用数据（主要目的），除非给予同意或适用例外。 |
| APP 7 | 直接营销 | 没有明确同意，不能使用健康或敏感数据进行营销。 |
| APP 8 | 个人信息的跨境披露 | 如果信息转移到海外，组织必须确保接收方提供同等的隐私保护。 |
| APP 9 | 采用、使用或披露政府相关标识符 | 组织不能将政府标识符用作自己的标识符。 |
| APP 10 | 个人信息的质量 | 确保数据准确、完整和最新。 |
| APP 11 | 个人信息的安全性 | 采取合理步骤保护数据免受误用、丢失或未授权访问。 |
| APP 12 | 访问个人信息 | 根据请求给予个人访问其数据的权利。 |
| APP 13 | 更正个人信息 | 如果信息不准确或不完整，允许个人请求更正。 |

English:

Australia has 13 official privacy principles that govern how organizations handle personal information. Below is an overview of each principle and its meaning:

| No. | Privacy Principle | Meaning / Requirement |
| --- | --- | --- |
| APP 1 | Open and Transparent Management of Personal Information | Organisations must have clear privacy management policies and procedures. Privacy policies should state what data is collected, why, how it's stored, and how people can complain or request access. |
| APP 2 | Anonymity and Pseudonymity | Individuals should have the option to deal anonymously or pseudonymously where possible. |
| APP 3 | Collection of Solicited Personal Information | Collect only the information necessary for legitimate functions, and collect it fairly and lawfully. |
| APP 4 | Dealing with Unsolicited Personal Information | If you receive personal information unintentionally, determine if it's needed; otherwise destroy or de-identify it. |
| APP 5 | Notification of the Collection of Personal Information | Inform individuals that their information is being collected, the reason, and who it will be shared with. |
| APP 6 | Use or Disclosure of Personal Information | Use data only for the original purpose (primary purpose) unless consent is given or an exception applies. |
| APP 7 | Direct Marketing | Health or sensitive data can't be used for marketing without explicit consent. |
| APP 8 | Cross-Border Disclosure of Personal Information | If information is transferred overseas, the organisation must ensure that the recipient provides equivalent privacy protection. |
| APP 9 | Adoption, Use or Disclosure of Government-Related Identifiers | Organisations can't use identifiers like government IDs as their own identifiers. |
| APP 10 | Quality of Personal Information | Ensure that data is accurate, complete, and up to date before use or disclosure. |
| APP 11 | Security of Personal Information | Take reasonable steps to protect data from misuse, loss, or unauthorised access. |
| APP 12 | Access to Personal Information | Give individuals the right to access their data on request. |
| APP 13 | Correction of Personal Information | Allow individuals to request corrections if information is inaccurate or incomplete. |

### 信息生命周期与澳大利亚隐私原则的映射 / Mapping Information Life Cycle with Australian Privacy Principles (APP)

中文：

为了有效管理隐私风险，需要理解信息生命周期的每个阶段如何与具体的隐私原则相关联。以下是详细的映射：

| 生命周期阶段 | 关键隐私关注 | 相关的澳大利亚隐私原则（APPs） |
| --- | --- | --- |
| Collection（收集） | 收集是否合法、最少、透明？ | APP 3：征求的个人信息的收集（必须是必要和合法的）；APP 5：个人信息收集的通知（必须通知个人收集了什么、为什么、谁等）；APP 4：处理未征求的个人信息（如果数据未经请求而给出）；APP 1：个人信息的开放和透明管理（治理、政策） |
| Data Security（数据安全/保护） | 防止误用、干扰、丢失；防止未授权访问 | APP 11：个人信息的安全性（必须采取合理步骤保护持有的数据）；APP 1：个人信息的开放和透明管理（要求隐私治理、政策、问责） |
| Access and Correction（访问和更正） | 个人的访问和更正其数据的权利 | APP 12：访问个人信息（必须向个人提供访问其数据的权利）；APP 13：更正个人信息（必须纠正或允许在必要时更正） |
| Accuracy（准确性） | 确保持有或使用的数据准确、当前、相关 | APP 10：个人信息的质量（必须采取步骤确保准确性、完整性） |
| Use（使用） | 仅为收集信息的目的使用数据（或允许的二次使用） | APP 6：个人信息的使用或披露（必须仅为原始目的使用，除非适用例外）；APP 7：直接营销（营销使用的特殊规则） |
| Disclosure（披露） | 向他人披露或与他人或跨境共享数据 | APP 8：个人信息的跨境披露（跨越海外传送时的特殊规则）；APP 6：（重新）使用和披露规则也适用于披露；APP 9：采用、使用或披露政府相关标识符（如果适用） |
| Disposal（处理） | 当数据不再需要时——销毁、去识别化 | APP 11：个人信息的安全性包括不再需要时的销毁或去识别化 |

English:

To effectively manage privacy risks, it is important to understand how each stage of the information lifecycle relates to specific privacy principles. Below is a detailed mapping:

| Life Cycle Stage | Key Privacy Concerns | Relevant Australian Privacy Principles (APPs) |
| --- | --- | --- |
| Collection | Is the collection lawful, minimal, transparent? | APP 3: Collection of solicited personal information (must be necessary & lawful); APP 5: Notification of collection (must inform individuals about what is collected, why, who, etc.); APP 4: Dealing with unsolicited personal information (if data is given without request); APP 1: Open and transparent management (governance, policies) |
| Data Security (Holding/Protecting) | Protecting from misuse, interference, loss; preventing unauthorized access | APP 11: Security of personal information (must take reasonable steps to protect held data); APP 1: Open and transparent management (requires privacy governance, policies, accountability) |
| Access and Correction | Individuals' rights to access and correct their data | APP 12: Access to personal information (must provide individuals with access to their data); APP 13: Correction of personal information (must correct or allow correction where necessary) |
| Accuracy | Ensuring the data you hold or use is accurate, current, relevant | APP 10: Quality of personal information (must take steps to ensure accuracy, completeness) |
| Use | Using data only for the purpose for which it was collected (or permitted secondary uses) | APP 6: Use or disclosure of personal information (must only use for original purpose unless exceptions apply); APP 7: Direct marketing (special rules for marketing uses) |
| Disclosure | Disclosing or sharing data with others or across borders | APP 8: Cross-border disclosure of personal information (special rules when sending overseas); APP 6: (again) Use and disclosure rules apply to disclosure too; APP 9: Adoption, use or disclosure of government related identifiers (if applicable) |
| Disposal | When data is no longer needed — destruction, de-identification | APP 11: Security of personal information includes destruction or de-identification when no longer needed |

### 收集阶段的隐私风险 / Collection Stage - Privacy Risks

中文：

唯一标识符的收集

仅当法律要求或个人明确同意时，才收集人的唯一标识符，如驾驶执照或医疗保险号码。

敏感信息必须不被收集，除非对合法的组织功能合理必要，且个人已提供同意，或合法豁免允许收集。

尽可能允许匿名。

收集通知

在收集个人信息时向个人提供收集通知。清楚地解释正在收集的数据、如何使用以及是否可能与你的组织外的任何人共享。

收集通知不是同意请求；它仅通知个人正在收集其个人信息并解释其预期使用或披露。这种透明性有助于防止未来出现任何意外或不受欢迎的惊喜。

必要性原则

你收集的信息必须对于明确定义的合法目的合理必要，该目的与你的组织的核心活动或功能直接相关。

示例： 如果你经营园艺服务，就没有理由收集不相关的数据，如客户的饮食偏好或税收细节。仅收集真正需要的信息来提供你的服务。

信息质量

仅收集最近、完整和最新的信息。尽可能直接从个人那里收集个人信息，除非他们已授予你从其他地方获得信息的许可或你被法律授权从另一来源收集信息。

所有信息必须使用合法和公平的方法收集，确保透明度和对个人隐私权的尊重。

English:

Collection of Unique Identifiers

Collect a person's unique identifiers such as a driver's licence or Medicare number, only when it is legally required or when the individual has provided explicit consent.

Sensitive information must not be collected unless it is reasonably necessary for a legitimate organisational function and the individual has provided their consent, or a lawful exemption permits the collection.

Allow anonymity when possible.

Collection Notice

Provide individuals with a collection notice at the time their information is collected. Clearly explain what data is being gathered, how it will be used, and whether it may be shared with anyone outside your organisation.

A collection notice is not a request for consent; it simply informs individuals that their personal information is being collected and explains its intended use or disclosure. This transparency helps prevent any unexpected or unwelcome surprises in the future.

Necessity Principle

The information you collect must be reasonably necessary for a lawful and clearly defined purpose that is directly connected to your organisation's core activities or functions.

Example: If you operate a gardening service, there's no justification for collecting unrelated data such as a client's dietary preferences or tax details. Only gather what is truly needed to deliver your service.

Information Quality

Only collect recent, complete, and up-to-date information. Collect personal information directly from the individual whenever possible, unless they have granted permission for you to obtain it elsewhere or you are legally authorised to collect it from another source.

All information must be gathered using lawful and fair methods, ensuring transparency and respect for individuals' privacy rights.

### 数据安全阶段的隐私风险 / Data Security Stage - Privacy Risks

中文：

数据安全的重要性

收集数据后，必须采用安全措施来保护信息免受丢失、未授权访问、误用、篡改或披露。你的组织的信息安全政策和程序概述了你必须遵循的具体步骤来确保数据保护。

你实施的安全保障应与个人信息的敏感性和与之相关的风险水平相对应。这些保障可以包括：

- 技术控制 - 例如使用密码或加密来保护文件

- 物理控制 - 例如小心不要混淆邮寄信件时的客户对应关系

- 管理控制 - 例如开发和实施有效的员工政策和程序

数据安全和加密

你必须采取主动步骤防止数据泄露，例如丢失、未授权访问或个人信息的披露。所有便携式存储设备，包括USB驱动器和笔记本电脑，应使用密码或加密来保护，以确保数据保护。

计算机、数据库和软件

对数字系统的访问应始终受密码保护。只有具有合法需要的个人才应根据其工作角色和工作性质访问个人信息。这有助于降低未授权数据访问或误用的风险。

密码存储

安全地存储密码，永远不要将它们写在便签纸上或留在工作站附近的可见位置。密码必须保密，无论任何人的职位或权限如何，都永远不应与任何人共享。

桌面和文件柜

避免在桌子上留下个人或机密信息可见，特别是在开放式办公室环境中，他人可能会看到。不使用时，始终保持抽屉和文件柜上锁，以防止对敏感记录的未授权访问。

文件

如果你需要将物理文件带出工作场所，采取额外的预防措施以保证其安全。确保在办公室外运输或使用的任何文件始终安全存储，不要无人看管。

处理和废物管理

不要超过其预期目的所必需的时间保留信息。安全地处理过时或不必要的记录。例如：避免将旧纸质文件保留在存储中"以防万一"。确保已丢弃的硬盘和电子设备在处理前完全擦除。

English:

Importance of Data Security

After collecting data, it's essential to apply security measures that protect information from loss, unauthorized access, misuse, alteration, or disclosure. Your organization's information security policies and procedures outline the specific steps you must follow to ensure data protection.

The security safeguards you implement should correspond to the sensitivity of the personal information and the level of risk associated with it. These safeguards can include:

- Technical controls – such as using passwords or encryption to protect files.

- Physical controls – for example, taking care not to mix up customer correspondence when mailing letters.

- Administrative controls – like developing and enforcing effective staff policies and procedures.

Data Security and Encryption

You must take proactive steps to prevent data breaches such as loss, unauthorized access, or disclosure of personal information. All portable storage devices including USB drives and laptops should be secured using passwords or encryption to ensure data protection.

Computers, Databases, and Software

Access to digital systems should always be password-protected. Only individuals with a legitimate need should have access to personal information, based on their job role and the nature of their work. This helps reduce the risk of unauthorized data access or misuse.

Password Storage

Store passwords securely never write them down on sticky notes or leave them visible near your workstation. Passwords must be kept confidential and should never be shared with anyone, regardless of their position or authority.

Desktops and Filing Cabinets

Avoid leaving personal or confidential information visible on your desk, particularly in open office environments where others may see it. Always keep drawers and filing cabinets locked when not in use to prevent unauthorized access to sensitive records.

Files

If you need to take physical files out of the workplace, apply extra precautions to keep them safe. Ensure that any documents transported or used outside the office are stored securely at all times and not left unattended.

Disposal and Waste Management

Do not retain information longer than necessary for its intended purpose. Dispose of outdated or unnecessary records safely and securely. For example: Avoid keeping old paper files in storage "just in case." Ensure that discarded hard drives and electronic devices are completely wiped before disposal.

### 保护个人信息 / Protecting Personal Information

中文：

备份

在比主生产环境更不安全的位置存储数据库备份副本会增加数据丢失或未授权访问的可能性。备份必须始终保留在同样安全或加密的存储位置，以保护个人信息。

设计

在设计系统或用户界面时，必须限制屏幕上的数据显示仅限于每个用户角色所需的信息。允许不必要的访问或对个人数据的可见性会增加数据误用或意外暴露的机会。

虚拟数据

在开发或测试阶段使用真实的客户数据会将敏感信息暴露给未授权的人员。开发人员应始终使用虚拟或匿名数据来防止隐私泄露并保护个人信息。

English:

Backups

Storing backup copies of databases in locations that are less secure than the main production environment increases the likelihood of data loss or unauthorized access. Backups must always be kept in equally secure or encrypted storage locations to protect personal information.

Design

When designing systems or user interfaces, it's essential to restrict on-screen data display to only the information required for each user's role. Allowing unnecessary access or visibility to personal data heightens the chance of data misuse or accidental exposure.

Dummy Data

Using real customer data during development or testing phases exposes sensitive information to unauthorized personnel. Developers should always work with dummy or anonymized data to prevent privacy breaches and protect personal information.

### 使用或披露阶段的隐私风险 / Use or Disclosure Stage - Privacy Risks

中文：

使用或披露的条件

仅在以下条件下使用或共享个人信息：

- 当它用于收集信息的具体目的时

- 当它用于与个人合理期望相一致的直接相关的二次目的时

- 当你拥有个人的同意时

- 当由法律授权或由有效的豁免涵盖时

示例：

如果你为紧急联系目的收集了某人的紧急联系人详情，不要将该信息传递给营销公司。

但是，某些相关的目的，如账单、管理逾期账户或处理客户投诉可能是可以接受的。

English:

Conditions for Use or Disclosure

Only use or share personal information under these conditions:

- When it's for the specific purpose the information was collected.

- When it's for a directly related secondary purpose that aligns with the person's reasonable expectations.

- When you have the person's consent.

- When authorised by law or covered by a valid exemption.

Example:

If you collected someone's next-of-kin details for emergency contact purposes, do not pass that information to a marketing company.

However, certain related purposes like billing, managing overdue accounts, or handling customer complaints may be acceptable.

### 准确性阶段的隐私风险 / Accuracy Stage - Privacy Risks

中文：

在使用或披露任何个人信息之前，你必须采取合理步骤确保它：

- 与任务或目的相关

- 准确且没有错误

- 最新的

- 完整的

这确保了你处理的信息是可靠的且适合使用或披露。

English:

Before using or disclosing any personal information, you must take reasonable steps to ensure it is:

- Relevant to the task or purpose,

- Accurate and free of errors,

- Up to date, and

- Complete.

This ensures the information you handle is reliable and appropriate for use or disclosure.

### 特殊规则 / Special Rules

中文：

在某些情况下，使用或披露信息时适用特殊规则。例如，如果你的组织：

- 打算使用或披露政府颁发的标识符（如护照或驾驶执照号码）

- 计划为直接营销目的使用或共享数据

- 在新南威尔士州或维多利亚州运营，并想要在州之间或海外转移健康信息

这些情况可能很复杂，最好在继续之前寻求专家或法律建议。

English:

There are certain situations where special rules apply to the use or disclosure of information. For instance, if your organisation:

- Intends to use or disclose a government-issued identifier (like a passport or driver's licence number),

- Plans to use or share data for direct marketing purposes, or

- Operates in NSW or Victoria and wants to transfer health information across states or overseas.

These cases can be complex, so it's best to seek expert or legal advice before proceeding.

### 常见的隐私风险 / Common Privacy Risks

中文：

在组织管理个人信息的过程中，存在几种常见的隐私风险需要特别关注：

数据匹配（Data Matching）

数据匹配是指组织将来自不同来源的个人信息链接或组合在一起的过程。这可能导致隐私风险，因为：

- 个人可能没有意识到他们的信息来自多个来源

- 链接的数据可能被用于原始目的之外的目的

- 被链接的信息可能被用于分析或决策，影响个人

用于不同目的的数据（Data Used for a Different Purpose）

当收集的个人信息被用于与原始收集目的不同的目的时，这是一个重大的隐私风险。例如：

- 为客户服务目的收集的信息不应被用于营销

- 为人力资源目的收集的信息不应被用于执法

- 政府机构收集的信息不应被转移用于商业目的

数据发布/共享（未去识别化）（Data Publishing/sharing - without de-identification）

发布或共享包含个人信息的数据而不去识别化会对个人隐私造成风险。例如：

- 发布包含个人姓名和联系信息的客户列表

- 共享包含个人标识信息的数据集，即使未进行隐式链接

- 在互联网上发布可能识别个人的敏感信息

这些风险可以通过适当的去识别化、匿名化或数据聚合技术来缓解。

English:

There are several common privacy risks that organizations need to pay special attention to when managing personal information:

Data Matching

Data matching refers to the process where an organization links or combines personal information from different sources. This may create privacy risks because:

- Individuals may not be aware that their information comes from multiple sources

- Linked data may be used for purposes beyond the original purpose

- Linked information may be used for analysis or decision-making that impacts individuals

Data Used for a Different Purpose

When collected personal information is used for a purpose different from the original collection purpose, this is a significant privacy risk. For example:

- Information collected for customer service purposes should not be used for marketing

- Information collected for HR purposes should not be used for law enforcement

- Information collected by government agencies should not be transferred for commercial purposes

Data Publishing/Sharing (without de-identification)

Publishing or sharing data containing personal information without de-identification poses risks to individual privacy. For example:

- Publishing customer lists containing personal names and contact information

- Sharing data sets with personal identifiers, even without explicit linking

- Publishing sensitive information online that may identify individuals

These risks can be mitigated through appropriate de-identification, anonymization, or data aggregation techniques.

### 总结：识别隐私风险的关键步骤 / Summary: Key Steps to Identify Privacy Risks

中文：

识别隐私风险是保护个人信息和遵守隐私法律的关键步骤。以下是识别隐私风险的关键步骤总结：

1. 了解信息生命周期 - 理解个人信息在你的组织中如何流动，从收集到处理

1. 应用澳大利亚隐私原则 - 了解13项隐私原则如何应用于你的项目和操作

1. 评估每个生命周期阶段 - 在每个阶段（收集、安全、访问、准确性、使用、披露、处理）考虑隐私风险

1. 识别常见风险 - 关注数据匹配、数据误用和不适当的数据共享等常见隐私风险

1. 实施保护措施 - 采取技术、物理和管理措施来保护个人信息

1. 定期审查 - 定期审查你的隐私实践，确保它们仍然符合法律和组织要求

通过遵循这些步骤，组织可以有效地识别和管理隐私风险，保护个人信息，并维护公众信任。

English:

Identifying privacy risks is a critical step in protecting personal information and ensuring compliance with privacy laws. Here is a summary of the key steps to identify privacy risks:

1. Understand the Information Lifecycle - Understand how personal information flows through your organization, from collection to disposal

1. Apply Australian Privacy Principles - Learn how the 13 privacy principles apply to your projects and operations

1. Assess Each Lifecycle Stage - Consider privacy risks at each stage (collection, security, access, accuracy, use, disclosure, disposal)

1. Identify Common Risks - Watch for common privacy risks such as data matching, data misuse, and inappropriate data sharing

1. Implement Protective Measures - Take technical, physical, and administrative measures to protect personal information

1. Review Regularly - Regularly review your privacy practices to ensure they remain compliant with laws and organizational requirements

By following these steps, organizations can effectively identify and manage privacy risks, protect personal information, and maintain public trust.

## Lecture 11: Guidance on Privacy and Developing and Training Generative AI Models

生成式AI模型的隐私指导

### 简介 / Introduction

中文：

随着生成式人工智能（AI）技术的快速发展，隐私保护成为开发者和组织必须认真考虑的关键问题。本讲座基于澳大利亚信息专员办公室（OAIC）的官方指导，阐述了在开发和训练生成式AI模型时必须遵守的隐私原则和法律要求。

生成式AI模型，如ChatGPT、DALL-E等，能够从大量训练数据中学习，生成与训练数据具有相似特性的内容。然而，这些模型通常需要处理大量个人信息，这可能会产生严重的隐私风险。

澳大利亚的《隐私法》（Privacy Act 1988）和《澳大利亚隐私原则》（APPs）适用于所有涉及个人信息的AI使用，包括用于训练、测试或使用AI系统的信息。开发者必须理解他们在开发生成式AI模型时的隐私义务。

English:

With the rapid development of generative artificial intelligence (AI) technology, privacy protection has become a critical issue that developers and organizations must carefully consider. This lecture is based on official guidance from the Australian Information Commissioner's Office (OAIC) and outlines the privacy principles and legal requirements that must be complied with when developing and training generative AI models.

Generative AI models, such as ChatGPT and DALL-E, can learn from large amounts of training data to generate content with similar properties to the training data. However, these models typically need to handle large amounts of personal information, which may create serious privacy risks.

Australia's Privacy Act 1988 and Australian Privacy Principles (APPs) apply to all uses of AI involving personal information, including information used to train, test or use AI systems. Developers must understand their privacy obligations when developing generative AI models.

### 五大关键要点 / Five Key Takeaways

#### 1. 开发者必须采取合理步骤确保生成式AI模型的准确性

Developers must take reasonable steps to ensure accuracy in generative AI models

中文：

根据澳大利亚隐私原则第10条（APP 10——个人信息的质量），澳大利亚信息专员办公室（OAIC）要求任何处理个人信息的组织都必须采取合理步骤，确保其收集、使用或披露的信息准确、最新和完整。

当应用于生成式AI时，这意味着开发者必须积极验证其AI系统产生的数据和输出，特别是当这些输出可能包含个人信息或可能影响人们的声誉、权利或隐私时。

健康信息聊天机器人（高风险示例）

一家医院开发了一个生成式AI聊天机器人，为患者提供手术后恢复建议。该模型已使用经过验证的医学指南和一些在线来源进行训练。

如果AI产生不准确的医疗建议幻觉或误引用患者的医疗记录，医院可能违反APP 10，因为它没有采取合理步骤确保信息的准确性。

合理步骤包括：

- 仅使用经过验证的医学数据集

- 要求人工审查AI生成的患者通信

- 定期审计AI输出的事实准确性

财务建议生成器（合规示例）

一家金融科技初创公司部署了一个生成式AI系统，使用客户财务数据提供自动化投资建议。如果AI误解了客户的收入水平或风险概况，并推荐了一项风险投资，这在OAIC和澳大利亚证券和投资委员会（ASIC）的指导下可能是不准确和误导性的。

合理步骤包括：

- 使用经过验证、最新的财务数据集

- 定期测试AI输出的准确性与真实财务数据

- 在输出发送给客户之前强制进行人工批准

English:

Under the Australian Privacy Principle 10 (APP 10 – Quality of Personal Information), the Office of the Australian Information Commissioner (OAIC) requires that any organization handling personal information must take reasonable steps to ensure that the information it collects, uses, or discloses is accurate, up-to-date, and complete.

When applied to generative AI, this means that developers must actively verify the data and outputs their AI systems produce, especially if those outputs might include personal information or could affect people's reputations, rights, or privacy.

Health Information Chatbot (High-Risk Example)

A hospital develops a generative AI chatbot to provide patients with post-surgery recovery advice. The model has been trained on both verified medical guidelines and some online sources.

If the AI hallucinates inaccurate medical advice or misquotes a patient's medical record, the hospital could be in breach of APP 10 for not taking reasonable steps to ensure the information's accuracy.

Reasonable steps include:

- Using only verified medical datasets

- Requiring human review for AI-generated patient communications

- Periodically auditing AI outputs for factual accuracy

Financial Advice Generator (Compliance Example)

A fintech startup deploys a generative AI system that provides automated investment tips using customer financial data. If the AI misinterprets the customer's income level or risk profile, and recommends a risky investment, this could be inaccurate and misleading under both OAIC and ASIC guidance.

Reasonable steps include:

- Using verified, up-to-date financial datasets

- Regularly testing AI output accuracy against real financial data

- Enforcing human-in-the-loop approval before outputs are sent to clients.

#### 2. 公开可获取的数据不能任意用于训练生成式AI模型

Just because data is publicly available or otherwise accessible does not mean it can legally be used to train or fine-tune generative AI models

中文：

根据《隐私法》（Privacy Act 1988）和第3条隐私原则（APP 3——个人信息的收集），组织必须仅通过合法和公平的手段收集个人信息，且仅在对其功能合理必要的情况下进行。即使个人数据是公开可获得的——例如来自社交媒体资料、在线论坛或网站——这也不会自动使其免除隐私义务。

换句话说，公开可获得性 ≠ AI训练的开放许可证。开发者必须评估数据是如何发布的、为什么它被公开的，以及用于AI训练是否会违反个人对隐私的期望。

社交媒体数据用于AI训练（示例）

一家公司使用Twitter和Facebook的公开帖子训练生成式AI聊天机器人。一些帖子包含可识别的信息——名称、照片、位置——关于普通人。

虽然这些帖子是公开可见的，但用户没有同意将其数据用于训练AI模型。

根据OAIC指导，如果这种收集不公平、不透明或与公司的业务功能无直接关系，可能是非法的。

需要采取的合理步骤：

- 获得明确的同意或删除个人标识符

- 进行隐私影响评估（PIA）

- 使用合成或匿名数据集

English:

Under the Privacy Act 1988 (Cth) and APP 3 (Collection of Personal Information), organizations must only collect personal information by lawful and fair means, and only if it is reasonably necessary for their functions. Even if personal data is publicly available — for example, from social media profiles, online forums, or websites — this does not automatically make it exempt from privacy obligations.

In other words, public availability ≠ open licence for AI training. Developers must assess how the data was published, why it was made public, and whether using it for AI training would breach individuals' expectations of privacy.

Social Media Data for AI Training (Example)

A company trains a generative AI chatbot using public Twitter and Facebook posts. Some posts include identifiable information — names, photos, locations — about ordinary people.

Even though these posts are publicly visible, the users did not consent for their data to be used to train an AI model.

Under OAIC guidance, this collection may be unlawful if it's not fair, transparent, or directly related to the company's business function.

Reasonable steps required:

- Obtain explicit consent or remove personal identifiers

- Conduct a Privacy Impact Assessment (PIA)

- Use synthetic or anonymised datasets instead.

#### 3. 开发者必须特别谨慎处理敏感信息

Developers must take particular care with sensitive information, which generally requires consent to be collected

中文：

根据《隐私法》（Privacy Act 1988）和澳大利亚隐私原则第3条（APP 3），敏感信息是一种特殊的个人数据类别，包括（但不限于）：

- 健康数据

- 生物识别和遗传信息

- 种族或民族出身

- 政治观点

- 宗教或哲学信仰

- 性取向

- 犯罪记录

由于这类数据可能使个人面临歧视、伤害或不公平对待的风险，OAIC要求组织在收集或使用它之前获得个人的明确同意——包括用于AI训练或微调。

对于生成式AI开发者来说，这意味着即使敏感信息出现在数据集中（例如从在线来源、社交媒体或开放数据集中抓取），他们也不能在没有有效同意或明确合法基础的情况下使用它。

健康记录在AI训练中（示例）

一家健康科技初创公司使用包含患者姓名、年龄、诊断和检测结果的医院出院总结训练生成式AI诊断助手。

即使这些文件被部分去识别化，某些记录可能仍然允许重新识别（例如，小镇上的罕见疾病）。

开发者必须采取的措施：

- 从其信息被使用的患者获得明确的同意

- 在模型训练前完全去识别或汇总健康数据

- 进行隐私影响评估（PIA）以评估重新识别的风险

English:

Under the Privacy Act 1988 (Cth) and Australian Privacy Principle 3 (APP 3), sensitive information is a special category of personal data that includes (but isn't limited to):

- Health data

- Biometric and genetic information

- Racial or ethnic origin

- Political opinions

- Religious or philosophical beliefs

- Sexual orientation

- Criminal records

Because this type of data can expose individuals to discrimination, harm, or unfair treatment, the OAIC requires that organizations obtain the individual's explicit consent before collecting or using it — including for AI training or fine-tuning.

For generative AI developers, this means that even if sensitive information appears in datasets (for example scraped from online sources, social media, or open datasets), they must not use it without valid consent or a clear lawful basis.

Health Records in AI Training (Example)

A health-tech startup trains a generative AI diagnostic assistant using hospital discharge summaries that include patient names, ages, diagnoses, and test results.

Even if these documents were de-identified partially, some records might still allow re-identification (e.g., rare diseases in small towns).

What developers must do:

- Obtain explicit consent from patients whose information is used.

- Fully de-identify or aggregate health data before model training.

- Conduct a Privacy Impact Assessment (PIA) to assess re-identification risks.

#### 4. 重新使用已有的个人信息用于AI训练需谨慎

Where developers are seeking to use personal information that they already hold for the purpose of training an AI model, and this was not a primary purpose of collection, they need to carefully consider their privacy obligations

中文：

本原则基于澳大利亚隐私原则第6条（APP 6——个人信息的使用或披露），该原则限制了个人信息如何被重新使用或共享。

当组织或开发者收集个人信息时，他们必须仅将其用于最初收集它的"主要目的"，除非：

- 个人已为二次使用（例如，AI训练）给予同意，或

- 二次使用与主要目的相关，且个人合理期望

因此，如果公司最初为一个原因收集了数据——比如说，提供客户服务或医疗护理——它不能在之后自动重新使用该数据来训练AI模型而不获得同意或合法例外。

简而言之：拥有个人数据 ≠ 有权重新使用它进行AI训练

银行聊天机器人训练（示例）

一家银行为账户管理而持有客户的交易和财务历史数据。之后，开发者决定使用这些客户记录来训练一个生成式AI模型，以帮助自动化财务建议响应。

即使银行已经持有这些数据，原始目的（账户管理）也不同于新目的（AI模型训练）。如果客户没有为这种重新使用给予同意，可能违反APP 6，因为新目的不是他们合理期望的。

合理步骤包括：

- 在使用个人数据之前寻求客户的新同意

- 在训练之前匿名化或汇总数据

- 进行隐私影响评估（PIA）以评估公平性和透明性

理由： APP 6规定个人数据只能用于原始目的，或个人合理期望的相关目的。AI训练通常不在该期望范围内。

English:

This principle is based on Australian Privacy Principle 6 (Use or Disclosure of Personal Information), which restricts how personal information can be reused or shared.

When an organization or developer collects personal information, they must use it only for the "primary purpose" for which it was originally collected unless:

- The person has given consent for a secondary use (e.g., AI training), or

- The secondary use is related to the primary purpose and it is reasonably expected by the individual.

Therefore, if a company initially collected data for one reason — say, providing customer service or medical care — it cannot automatically reuse that data later to train an AI model without consent or a lawful exception.

In short: Possessing personal data ≠ permission to reuse it for AI training.

Banking Chatbot Training (Example)

A bank holds customers' transaction and financial history data for account management. Later, developers decide to use these customer records to train a generative AI model that helps automate financial advice responses.

Even though the bank already holds this data, the original purpose (account management) is different from the new purpose (AI model training). If the customers did not consent to this reuse, it may breach APP 6, as the new purpose is not one they would reasonably expect.

Reasonable steps include:

- Seeking fresh consent from customers before using their personal data

- Anonymising or aggregating data before training

- Conducting a Privacy Impact Assessment (PIA) to assess fairness and transparency

Justification: APP 6 states that personal data can only be used for the original purpose, or a related one that the individual would reasonably expect. AI training is often not within that expectation.

#### 5. 无法确立二次使用时需征求同意或提供选择退出

Where a developer cannot clearly establish that a secondary use for an AI-related purpose was within reasonable expectations, they should seek consent or offer opt-out

中文：

根据APP 6和OAIC指导，当开发者希望使用现有的个人数据来训练或改进AI系统，但不能有信心地表明这一新目的是合理期望或与原始目的直接相关的，他们必须：

- 寻求明确、知情的同意，或

- 为个人提供明确且易于访问的选择退出机制

这保护了个人的隐私权，并使开发者避免了监管风险，包括澳大利亚信息专员办公室（OAIC）的投诉或执法。

客户服务数据用于AI训练（示例）

一家电信公司收集了客户通话记录，用于解决服务问题。

之后，开发者提议使用这些记录来训练一个生成式AI模型，以自动化未来的通话响应。

- 主要目的是客户服务

- 二次目的（AI模型训练）是相关的，但客户不会合理期望——特别是如果他们的语音数据、投诉或联系详情被重新使用

符合OAIC的行动：

- 通知客户其交互可能被用于训练AI工具

- 寻求明确的选择加入同意

- 提供简单的选择退出选项（例如，通过隐私仪表板）

理由： 在没有明确同意或选择退出的情况下，这种二次使用可能违反APP 6，因为客户可能没有期望他们的个人交互会成为AI训练数据。

English:

Under APP 6 and OAIC guidance, when developers wish to use existing personal data to train or improve AI systems, but can't confidently show that this new purpose was reasonably expected or directly related to the original purpose, they must either:

- Seek explicit, informed consent, or

- Offer a clear and accessible opt-out mechanism to individuals.

This protects individuals' privacy rights and shields the developer from regulatory risk, including complaints or enforcement by the Office of the Australian Information Commissioner (OAIC).

Customer Service Data Used for AI Training (Example)

A telecommunications company collected customer call transcripts to resolve service issues.

Later, the developers propose to use those transcripts to train a generative AI model that automates future call responses.

- The primary purpose was customer service

- The secondary purpose (AI model training) is related but not reasonably expected by customers — especially if their voice data, complaints, or contact details are reused

OAIC-compliant actions:

- Notify customers that their interactions may be used to train AI tools

- Seek explicit opt-in consent

- Provide a simple opt-out option (e.g., via privacy dashboard)

Justification: Without clear consent or opt-out, this secondary use could breach APP 6 because customers likely did not expect their personal interactions to become AI training data.

### AI基本术语理解 / Introductory Terms: AI Understanding

中文：

本指导涉及生成式AI模型或系统。虽然AI没有单一的公认定义，但在本指导中，AI指的是"一个基于机器的系统，为了明确或隐含的目标，从其接收的输入推断如何生成输出，如预测、内容、建议或决策，这些可以影响物理或虚拟环境。不同的AI系统在部署后的自主性和适应性水平不同。"

AI模型是"通常是AI应用程序'引擎'的原始数学本质"，例如GPT-4，而AI系统是"多个组件的集合，包括一个或多个AI模型，设计得特别对人类有用"，例如ChatGPT应用程序。

生成式AI的定义

存在许多不同类型的AI。本指导侧重于生成式AI，它指的是"一个AI模型，具有学习生成内容（如图像、文本和其他媒体）的能力，其特性与其训练数据相似"，以及基于此类模型构建的系统。开发生成式AI模型是一项高隐私风险活动，当它依赖大量个人信息时。

大型语言模型（LLMs）

大型语言模型（LLMs）和多模态基础模型（MFMs）都是生成式AI的例子。LLM是"一种专门用于生成类似人类文本的生成式AI"。包含LLM的产品或服务的一些例子是Meta AI Assistant、ChatGPT、Microsoft Copilot和HuggingChat。

多模态基础模型（MFMs）

MFM是"一种可以处理和输出多种数据类型（如文本、图像、音频）的生成式AI"。包含MFM的产品或服务（图像或视频生成器）的一些例子包括DALL-E 3、Firefly、Jasper Art、Synthesia、Midjourney和Stable Diffusion。包含MFM的产品或服务（音频生成器）的一些例子包括Riffusion、Suno、Lyria和AudioCraft。

生成式AI模型的工作原理

生成式AI模型在输入之间的关系上训练，使用这种关系来识别它用于生成响应的数据之间的概率关系。这可能对其准确性有影响。

English:

This guidance is about generative AI models or systems. While there is no single agreed definition of AI, in this guidance AI refers to 'a machine-based system that, for explicit or implicit objectives, infers, from the input it receives, how to generate outputs such as predictions, content, recommendations, or decisions that can influence physical or virtual environments. Different AI systems vary in their levels of autonomy and adaptiveness after deployment.'

An AI model is the 'raw, mathematical essence that is often the 'engine' of AI applications' such as GPT-4, while an AI system is 'the ensemble of several components, including one or more AI models, that is designed to be particularly useful to humans in some way' such as the ChatGPT app.

Definition of Generative AI

There are many different kinds of AI. This guidance focuses on generative AI, which refers to 'an AI model with the capability of learning to generate content such as images, text, and other media with similar properties to its training data' and systems built on such models. Developing a generative AI model is a high privacy risk activity when it relies on large quantities of personal information.

Large Language Models (LLMs)

Large Language Models (LLMs) and multimodal foundation models (MFMs) are both examples of generative AI. An LLM is 'a type of generative AI that specialises in the generation of human-like text'. Some examples of products or services incorporating LLMs are Meta AI Assistant, ChatGPT, Microsoft Copilot and HuggingChat.

Multimodal Foundation Models (MFMs)

An MFM is 'a type of generative AI that can process and output multiple data types (e.g. text, images, audio)'. Some examples of products or services incorporating MFMs that are image or video generators include DALL-E 3, Firefly, Jasper Art, Synthesia, Midjourney and Stable Diffusion. Some examples of products or services incorporating MFMs that are audio generators include Riffusion, Suno, Lyria and AudioCraft.

How Generative AI Models Work

Generative AI models are trained on the relationship between inputs, using this to identify probabilistic relationships between data that they use to generate responses. This can have implications for their accuracy.

### 人工智能与隐私 / Artificial Intelligence and Privacy

中文：

人工智能（AI）有潜力通过提高各种部门的效率和生产力以及提高消费者商品和服务的质量来造福澳大利亚经济和社会。然而，AI技术的数据驱动特性——依赖于通常包含个人信息的大型数据集——也可能产生新的特定隐私风险、放大现有风险并导致严重伤害。

《隐私法》1988年和《澳大利亚隐私原则》适用于所有涉及个人信息的AI使用，包括用于训练、测试或使用AI系统的信息。APP实体需要理解他们在开发生成式AI模型时根据APPs的义务。这包括意识到在开发生成式AI模型时可能收集、使用和披露个人信息的不同方式。

English:

Artificial intelligence (AI) has the potential to benefit the Australian economy and society, by improving efficiency and productivity across a wide range of sectors and enhancing the quality of goods and services for consumers. However, the data-driven nature of AI technologies, which rely on large datasets that often include personal information, can also create new specific privacy risks, amplify existing risks and lead to serious harms.

The Privacy Act 1988 and the Australian Privacy Principles (APPs) apply to all uses of AI involving personal information, including where information is used to train, test or use an AI system. APP entities need to understand their obligations under the APPs when developing generative AI models. This includes being aware of the different ways that they may be collecting, using and disclosing personal information when developing a generative AI model.

### 隐私法何时适用 / When Does the Privacy Act Apply?

中文：

《隐私法》适用于澳大利亚政府机构、年营业额超过300万澳元的组织，以及其他一些组织。重要的是，《隐私法》适用于在澳大利亚以外进行的行为或做法，由具有澳大利亚关联的组织进行，例如在澳大利亚成立或在澳大利亚开展业务的组织。

开发者是否在澳大利亚开展业务可以通过识别构成或支持业务的交易以及询问这些交易或与之相关的交易是否在澳大利亚发生来确定。例如，其业务是向澳大利亚人提供数字平台服务的开发者通常会在澳大利亚开展业务。

English:

The Privacy Act applies to Australian Government agencies, organisations with an annual turnover of more than $3 million, and some other organisations. Importantly, the Privacy Act applies to acts or practices engaged in outside Australia by organisations with an Australian link, such as where they are incorporated in Australia or they carry on business in Australia.

Whether a developer carries on business in Australia can be determined by identifying what transactions make up or support the business and asking whether those transactions or the transactions ancillary to them occur in Australia. By way of example, developers whose business is providing digital platform services to Australians will generally be carrying on business in Australia.

### 隐私设计方法 / Privacy by Design (APP 1)

中文：

受《隐私法》约束的开发者必须采取合理步骤来实施实践、程序和系统，以确保他们遵守APPs和任何具有约束力的注册APP代码，并能够处理相关的询问和投诉。

在开发或微调生成式AI模型时，开发者应该通过"隐私设计"方法在规划和设计阶段考虑潜在风险。

隐私设计的定义

隐私设计是一个将良好隐私实践嵌入技术、业务实践和物理基础设施的设计规范的过程。

隐私影响评估（PIA）

为了减轻风险，开发者首先需要理解它们。隐私影响评估（PIA）是这样做隐私风险的一种方式。它是一个项目的系统性评估，识别项目可能对个人隐私产生的影响，并提出管理、最小化或消除该影响的建议。

虽然PIA评估项目是否违反隐私立法的风险，但最佳实践方法考虑超越合规的更广泛的隐私含义和风险，包括计划使用个人信息是否可以接受社区。

实践提示——隐私设计

- 在规划过程的早期采取隐私设计方法

- 进行PIA以识别项目可能对个人隐私产生的影响，然后采取步骤来管理、最小化或消除该影响

English:

Developers subject to the Privacy Act must take reasonable steps to implement practices, procedures and systems that will ensure they comply with the APPs and any binding registered APP code, and are able to deal with related inquiries and complaints. When developing or fine-tuning a generative AI model, developers should consider the potential risks at the planning and design stage through a 'privacy by design' approach.

Definition of Privacy by Design

Privacy by design is a process for embedding good privacy practices into the design specifications of technologies, business practices and physical infrastructures.

Privacy Impact Assessment (PIA)

To mitigate risks, developers first need to understand them. A privacy impact assessment (PIA) is one way to do this for privacy risks. It is a systematic assessment of a project that identifies the impact that the project might have on the privacy of individuals, and sets out recommendations for managing, minimising or eliminating that impact.

While PIAs assess a project's risk of non-compliance with privacy legislation, a best practice approach considers the broader privacy implications and risks beyond compliance, including whether a planned use of personal information will be acceptable to the community.

Practical Tips – Privacy by Design

- Take a privacy-by-design approach early in the planning process

- Conduct a PIA to identify the impact that the project might have on the privacy of individuals and then take steps to manage, minimise or eliminate that impact

### 生成式AI背景下的隐私风险 / Privacy Risks in the Context of Generative AI

中文：

在生成式AI背景下可能相关的隐私风险包括以下内容：

1. 个人失去对其个人信息的控制

诸如生成式AI之类的技术在大量公共数据上训练，包括个人的个人信息，这可能会在没有他们的知识和同意的情况下被收集。个人很难识别他们的个人信息何时被用于AI系统以及如何请求更正或删除这些信息。

2. 偏见和歧视

由于AI系统从可能包含内在偏见的源数据中学习，这种偏见可能会通过基于性别、种族或年龄的推断在其输出中被复制，并产生歧视性影响。AI输出通常看起来很可信，即使它们产生错误或虚假信息。

3. 其他不准确性

与训练数据的准确性或质量有关的问题（包括由于数据中毒造成的结果）和生成式AI模型的预测性质可能导致输出不准确但看起来很可信。反馈循环可能导致AI模型的准确性和可靠性随着时间的推移而降低。输出中的不准确性可能具有流动效应，具体取决于背景，包括声誉伤害、错误信息或不公平的决定。

4. 缺乏透明度

AI可能使实体更难以开放和透明的方式管理个人信息，因为实体很难理解和解释个人信息如何被使用以及AI系统如何做出决定。

5. 重新识别

使用从多个数据集中提取的聚合数据也引起了个人通过使用AI可能被重新识别的问题，并且可能很难首先对信息进行去识别化。

6. 生成式AI系统的误用

生成式AI模型的能力可能被恶意参与者滥用，通过为不当目的构建AI系统或AI模型或AI系统的最终用户滥用它们，对个人隐私或更广泛的负面后果可能产生的影响，包括通过：

- 大规模生成虚假信息，如深度伪造

- 诈骗和身份盗窃

- 生成有害或非法内容，如基于图像的虐待，这可能通过意外或无意地收集和使用有害或非法材料（如儿童性虐待材料）来训练AI系统来促进

- 生成可在网络攻击或其他犯罪活动中使用的有害或恶意代码

7. 通过数据泄露或对模型的攻击披露个人信息的风险

生成式AI收集和存储的大量数据可能会增加与数据泄露相关的风险，特别是当个人在与生成式AI聊天机器人的对话中披露特别敏感的数据时，因为他们没有意识到它被保留或纳入训练数据集。这可能是通过对训练数据集的未授权访问或通过旨在使模型重新吐出其训练数据集的攻击进行的。

对儿童和易受伤害人群的特殊影响

生成式AI的影响对儿童和经历脆弱性的人可能特别严重。例如，有广为人知的由AI系统中的算法偏见造成的对个人的歧视例子。弱势群体，包括第一民族人民，往往在反映历史偏见或没有足够数据的数据集中没有得到适当代表。

English:

Some privacy risks that may be relevant in the context of generative AI include the following:

1. Individuals losing control over their personal information

Technologies such as generative AI are trained on large amounts of public data, including the personal information of individuals, which is likely to be collected without their knowledge and consent. It can be difficult for individuals to identify when their personal information is used in AI systems and to request the correction or deletion of this information.

2. Bias and discrimination

As AI systems learn from source data which may contain inherent bias, this bias may be replicated in their outputs through inferences made based on gender, race or age and have discriminatory effects. AI outputs can often appear credible even when they produce errors or false information.

3. Other inaccuracies

Issues in relation to accuracy or quality of the training data (including as a result of data poisoning) and the predictive nature of generative AI models can lead to outputs that are inaccurate but appear credible. Feedback loops can cause the accuracy and reliability of an AI model to degrade over time. Inaccuracies in output can have flow on consequences that depend on the context, including reputational harm, misinformation or unfair decisions.

4. Lack of transparency

AI can make it harder for entities to manage personal information in an open and transparent way, as it can be difficult for entities to understand and explain how personal information is used and how decisions made by AI systems are reached.

5. Re-identification

The use of aggregated data drawn from multiple datasets also raises questions about the potential for individuals to be re-identified through the use of AI and can make it difficult to de-identify information in the first place.

6. Misuse of generative AI systems

The capabilities of generative AI models can be misused through malicious actors building AI systems for improper purposes, or the AI model or end users of AI systems misusing them, with potential impacts on individual privacy or broader negative consequences including through:

- Generating disinformation at scale, such as through deepfakes

- Scams and identity theft

- Generating harmful or illegal content, such as image-based abuse, which can be facilitated through the accidental or unintended collection and use of harmful or illegal material, such as child sexual abuse material, to train AI systems

- Generating harmful or malicious code that can be used in cyber attacks or other criminal activity

7. Risk of disclosure of personal information through data breach or attack on the model

The vast amounts of data collected and stored by generative AI may increase the risks related to data breaches, especially when individuals disclose particularly sensitive data in their conversations with generative AI chatbots because they are not aware it is being retained or incorporated into a training dataset. This could be through unauthorised access to the training dataset or through attacks designed to make a model regurgitate its training dataset.

Particular impacts on children and people experiencing vulnerability

The impacts of generative AI may be particularly acute for children and people experiencing vulnerability. For example, there are well-publicised examples of discrimination against individuals as a result of algorithmic bias in AI systems. Vulnerable groups, including First Nations people, will often not be properly represented in datasets which reflect historical biases or do not include sufficient data.

### 训练AI模型的准确性风险 / Accuracy Risks for Generative AI Models (APP 10)

中文：

生成式AI模型因以下因素而具有固有的准确性风险：

1. 大量互联网数据的使用

它们通常在从整个互联网采集的大量数据上训练，这很可能包含不准确性并受到无根据偏见的影响。这些模型可能会在其输出中重复和放大这些偏见。

2. 概率性质和幻觉

生成式AI的概率性质（其中下一个单词、子单词、像素或其他媒体基于可能性预测）以及它如何标记输入可能生成幻觉。例如，没有保护措施，被问及"香蕉"中有多少个"b"的LLM通常会声称香蕉中有两个或三个"b"，因为训练数据被加权了许多人询问"香蕉"中有多少个"a"或"n"的实例，而且由于它如何标记单词而不是字母。

合规的实践步骤

当开发者或向开发者提供个人信息的组织不能明确确立使用他们持有的个人信息来训练生成式AI模型是在合理期望内并与主要目的相关的时，他们应该为那个使用寻求同意和/或为个人提供选择退出这种使用的选项。选择退出机制必须伴随充分的信息，以通知个人有意使用他们的个人信息，并提供足够的时间来行使选择退出。

English:

Generative AI models carry inherent risks as to their accuracy due to the following factors:

1. Use of vast amounts of internet data

They are often trained on huge amounts of data sourced from across the internet, which is highly likely to include inaccuracies and be impacted by unfounded biases. The models can then perpetuate and amplify those biases in their outputs.

2. Probabilistic nature and hallucinations

The probabilistic nature of generative AI (in which the next word, sub-word, pixel or other medium is predicted based on likelihood) and the way it tokenises input can generate hallucinations. For example, without protective measures an LLM asked how many 'b's are in banana will generally state there are two or three 'b's in banana as the training data is weighted with instances of people asking how many 'a's or 'n's are in banana and because of the way it tokenises words not letters.

Practical Steps for Compliance

Where a developer or an organisation providing personal information to a developer cannot clearly establish that using the personal information they hold to train a generative AI model is within reasonable expectations and related to the primary purpose, they should seek consent for that use and/or offer individuals the option of opting-out of such a use. The opt-out mechanism must be accompanied by sufficient information to inform the individual about the intended use of their personal information and sufficient time to exercise the opt-out.

### 组织的五大关键要点 / Top Five Takeaways for Organizations

中文：

1. 隐私义务适用于输入AI系统的任何个人信息，以及AI生成的输出数据（其中包含个人信息）

这包括确保任何面向公众的AI工具（如聊天机器人）对外部用户（如客户）清楚地识别为此类工具。他们应该为AI系统的使用建立政策和程序，以促进透明度并确保良好的隐私治理。

2. 企业应该用清晰透明的关于其AI使用的信息更新其隐私政策和通知

这包括确保任何面向公众的AI工具（如聊天机器人）对外部用户（如客户）清楚地识别为此类工具。他们应该为AI系统的使用建立政策和程序，以促进透明度并确保良好的隐私治理。

3. 如果AI系统被用于生成或推断个人信息，包括图像，这是个人信息的收集，必须遵守APP 3

实体必须确保AI生成的个人信息对其功能或活动是合理必要的，并且只能通过合法和公平的手段进行。由AI模型产生的推断的、不正确的或人工生成的信息（如幻觉和深度伪造），如果关于一个可识别或合理可识别的个人，构成个人信息，必须根据APPs进行处理。

4. 如果个人信息被输入到AI系统中，APP 6要求实体仅为收集信息的主要目的使用或披露信息，除非他们有同意或可以确立个人会合理期望的二次使用，并且与主要目的相关（或直接相关，对于敏感信息）

二次使用可能在个人的合理期望内，如果它在收集时在通知中明确概述，并在您的企业的隐私政策中。

5. 作为最佳实践，OAIC建议组织不要将个人信息，特别是敏感信息，输入到公开可获得的生成式AI工具中，由于所涉及的重大和复杂的隐私风险

English:

1. Privacy obligations will apply to any personal information input into an AI system, as well as the output data generated by AI (where it contains personal information)

This includes ensuring that any public facing AI tools (such as chatbots) are clearly identified as such to external users such as customers. They should establish policies and procedures for the use of AI systems to facilitate transparency and ensure good privacy governance.

2. Businesses should update their privacy policies and notifications with clear and transparent information about their use of AI

This includes ensuring that any public facing AI tools (such as chatbots) are clearly identified as such to external users such as customers. They should establish policies and procedures for the use of AI systems to facilitate transparency and ensure good privacy governance.

3. If AI systems are used to generate or infer personal information, including images, this is a collection of personal information and must comply with APP 3

Entities must ensure that the generation of personal information by AI is reasonably necessary for their functions or activities and is only done by lawful and fair means. Inferred, incorrect or artificially generated information produced by AI models (such as hallucinations and deepfakes), where it is about an identified or reasonably identifiable individual, constitutes personal information and must be handled in accordance with the APPs.

4. If personal information is being input into an AI system, APP 6 requires entities to only use or disclose the information for the primary purpose for which it was collected, unless they have consent or can establish the secondary use would be reasonably expected by the individual, and is related (or directly related, for sensitive information) to the primary purpose

A secondary use may be within an individual's reasonable expectations if it was expressly outlined in a notice at the time of collection and in your business's privacy policy.

5. As a matter of best practice, the OAIC recommends that organisations do not enter personal information, and particularly sensitive information, into publicly available generative AI tools, due to the significant and complex privacy risks involved

### 何时可以开发者使用个人信息来开发生成式AI模型？

Can developers use personal information to develop a generative AI model?

中文：

开发者是否可以使用个人信息来开发生成式AI模型，是否会违反《隐私法》取决于具体情况，例如个人信息如何被收集、为什么目的被收集，以及它是否包含敏感信息。

开发者应该考虑本指南中列出的义务和考虑因素，以确定他们使用个人信息来开发生成式AI模型的使用是否根据《隐私法》是允许的。

English:

Whether the use of personal information to develop a generative AI model will contravene the Privacy Act depends on the circumstances, such as how the personal information was collected, for what purpose it was collected and whether it includes sensitive information. Developers should consider the obligations and considerations set out in this Guide to determine whether their use of personal information to develop a generative AI model is permitted under the Privacy Act.

### 总结：生成式AI开发中的隐私合规关键步骤

Summary: Key Steps for Privacy Compliance in Generative AI Development

中文：

在开发生成式AI模型时确保隐私合规需要开发者和组织采取多项关键步骤：

规划阶段

- 进行全面的隐私影响评估（PIA）

- 识别涉及的个人信息类型

- 特别关注敏感信息的处理

数据收集

- 确保所有数据收集是合法和公平的

- 获得必要的同意，特别是对于敏感信息

- 不要依赖"公开可获得"作为合法使用的借口

数据使用

- 仅将数据用于原始收集目的或相关的二次目的

- 如果是新目的，获取新的同意或提供选择退出选项

- 确保二次使用符合个人的合理期望

准确性和质量

- 使用高质量的数据集

- 进行广泛的测试以确保输出准确性

- 对高风险应用实施人工审查

透明性

- 更新隐私政策以反映AI使用

- 清楚地告知用户他们与AI系统的互动

- 解释AI如何生成和使用个人信息

持续监督

- 定期审查AI系统的隐私实践

- 监控偏见和歧视的迹象

- 保持与最新的隐私法律和指导的一致性

通过遵循这些步骤，开发者和组织可以开发和部署生成式AI系统，同时保护个人隐私权并避免监管风险。

English:

Ensuring privacy compliance when developing generative AI models requires developers and organizations to take several key steps:

Planning Phase

- Conduct comprehensive Privacy Impact Assessment (PIA)

- Identify types of personal information involved

- Pay special attention to handling of sensitive information

Data Collection

- Ensure all data collection is lawful and fair

- Obtain necessary consent, especially for sensitive information

- Do not rely on "publicly available" as an excuse for lawful use

Data Use

- Use data only for the original collection purpose or related secondary purposes

- If new purpose, obtain fresh consent or provide opt-out option

- Ensure secondary use aligns with individual's reasonable expectations

Accuracy and Quality

- Use high-quality datasets

- Conduct extensive testing to ensure output accuracy

- Implement human review for high-risk applications

Transparency

- Update privacy policies to reflect AI use

- Clearly inform users about their interactions with AI systems

- Explain how AI generates and uses personal information

Ongoing Supervision

- Regularly review privacy practices of AI systems

- Monitor for signs of bias and discrimination

- Maintain alignment with latest privacy laws and guidance

By following these steps, developers and organizations can develop and deploy generative AI systems while protecting individual privacy rights and avoiding regulatory risk.

我来帮您整理这份期末考试练习题文档：

## **INFO5992 理解IT创新 - 期末考试练习题**

#### **练习题1：差分隐私（医院健康数据）**

场景： 医院准备与医学研究机构共享匿名化患者健康数据，包含：年龄、静息心率、每日运动时间和胆固醇水平。

| 患者ID | 年龄 | 静息心率(bpm) | 每日运动(分钟) | 胆固醇(mg/dL) |
| --- | --- | --- | --- | --- |
| P101 | 45 | 78 | 30 | 190 |
| P102 | 52 | 85 | 20 | 210 |
| P103 | 37 | 90 | 45 | 195 |
| P104 | 60 | 76 | 15 | 230 |

##### **问题与答案：**

A. 差分隐私如何确保包含或排除特定患者不会显著改变分析结果？（2分）

- 差分隐私确保统计输出不会因P102的包含或删除而明显改变

- 防止攻击者确定P102的数据是否在数据集中

- 保护个人健康隐私

B. 向年龄列添加噪声的影响（2分）

- 隐私保护： 模糊确切值，防止在小人口统计中识别老年个体

- 研究影响： 可能削弱年龄对心脏健康和健身水平影响的研究

- 年龄分布变得不太准确

C. 胆固醇列的差分隐私应用（2分）

- 噪声类型： 拉普拉斯或高斯噪声

- 平衡： 通过掩盖精确健康测量保护隐私

- 可能轻微扭曲健康风险建模或临床阈值解释

D. ε值大小对静息心率数据的影响（2分）

- 小ε： 强隐私保护，但噪声多 → 心率分析准确性降低

- 大ε： 更高准确性，但隐私保护较弱

E. 仅删除患者ID为何不足？（2分）

- 年龄、胆固醇和运动时间的组合可能唯一识别个体（重新识别攻击）

- 需要差分隐私防止通过辅助数据链接

#### **练习题2：差分隐私（工作场所生产力数据）**

场景： 科技公司与工作效率研究实验室共享匿名化生产力数据。

| 员工ID | 工作经验(年) | 每周工作时间 | 每日休息时间(分钟) | 绩效分数 |
| --- | --- | --- | --- | --- |
| E011 | 1 | 38 | 45 | 72 |
| E012 | 4 | 50 | 30 | 88 |
| E013 | 3 | 42 | 35 | 80 |
| E014 | 7 | 48 | 25 | 90 |

##### **关键答案要点：**

A. DP如何保护员工身份（2分）

- 确保聚合模式保持相似，无论是否包含任何个人员工数据

- 即使知道员工工作时间长，也无法推断确切数据

B. 工作经验噪声的影响（2分）

- 隐私： 防止识别具有独特经验水平的员工

- 研究： 可能扭曲经验与生产力相关性的趋势

C. 绩效分数的隐私-效用权衡（2分）

- 添加小随机噪声保护员工不被单独识别

- 可能降低比较绩效趋势或评估政策有效性的精度

D. ε值对每周工作时间的影响（2分）

- 小ε： 强隐私，数据可用性差（噪声大）

- 大ε： 研究更准确，隐私保护较弱

E. 删除员工ID不足的原因（2分）

- 工作时间+休息模式可唯一识别员工（尤其在小部门）

- 需要DP掩盖属性可链接性

#### **练习题3：加密计算（医疗伦理委员会投票）**

场景： 全国医疗联盟使用加密计算进行保密医疗伦理委员会投票。

| 成员ID | 加密选票 | 医院区域 | 处理时间(ms) |
| --- | --- | --- | --- |
| M101 | a71d9f43bc219 | 东部 | 10,450 |
| M102 | c93f7a21da882 | 西部 | 10,620 |
| M103 | b62e8c30ef541 | 南部 | 10,590 |
| M104 | d84a1c77bf332 | 北部 | 10,730 |
| M105 | e14d3a65ca997 | 中部 | 10,810 |

##### **关键概念解答：**

A. 加密计算如何确保投票保密性（2分）

- 每张选票在离开投票者设备前加密

- 中央服务器仅处理加密数据，不访问明文投票

- 系统管理员无法看到任何个人投票方式

B. 同态加密的作用（2分）

- 允许对加密数据执行数学运算（如投票相加）

- 系统在所有选票保持加密状态下计算总数

- 仅最终计票被解密，单个投票从不暴露

C. 防止未授权修改（2分）

- 篡改加密选票会不可预测地改变密文

- 任何未授权更改会导致解密失败或产生无效结果

- 立即暴露操纵企图

D. 运营挑战（2分）

- 处理大量加密选票的高计算开销

- 医院系统间的网络延迟

- 需要同步密钥管理

- 协调多个分布式选举事件的可扩展性问题

E. 加密元数据的必要性（2分）

- 元数据可能揭示投票模式（如某地区仅一人投票）

- 加密医院区域和处理时间防止相关性攻击

- 防止从上下文模式推断身份或投票选择

#### **练习题4&5：联邦学习**

##### **练习题4：肺癌图像分类（放射中心合作）**

数据示例：

| 扫描ID | 年龄 | 吸烟史(年) | 结节大小(mm) | 结果(1=癌症) |
| --- | --- | --- | --- | --- |
| L101 | 62 | 25 | 15 | 1 |
| L102 | 45 | 5 | 8 | 0 |
| L103 | 70 | 40 | 22 | 1 |

核心答案：

A. 联邦学习如何保护隐私（2分）

- CT扫描图像从不离开放射中心

- 仅共享模型权重更新

- 防止敏感图像和医疗历史数据暴露

B. 对放射学的益处（2分）

- 协作提高诊断准确性，无需汇集医疗图像

- 避免重大隐私、法律和伦理风险

C. 设备差异的影响（2分）

- 扫描仪分辨率和成像协议的变化可能导致全局模型误解特征

- 降低泛化性能

D. 数据分布不均的挑战（2分）

- 某些中心癌症患者更多可能导致模型偏见

- 训练不稳定或预测癌症过于频繁

E. 合规性支持（2分）

- 保持个人和医疗数据本地化

- 避免集中传输或存储可识别健康数据

- 支持GDPR/HIPAA合规

#### **练习题6：去识别技术（布里斯班医院呼吸疾病研究）**

原始数据集：

| 患者代码 | 全名 | 出生日期 | 地址 | 年龄 | 肺活量 | 诊断 | 结果 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R001 | Mia Watson | 05/01/1981 | 14 River St, Brisbane | 43 | 320 | 哮喘 | 稳定 |
| R002 | David Chan | 29/06/1970 | 210 Oak St, Brisbane | 54 | 280 | COPD | 恶化 |

##### **三种技术应用：**

1. 聚合技术（2分）

- 方法： 转换为汇总统计（如每种诊断的平均肺活量）

- 隐私优势： 删除直接标识符，降低重新识别风险

- 权衡： 失去个体级别差异分析能力

2. 抑制技术（2分）

- 必要性： 罕见疾病使患者易被识别

- 方法： 抑制出生日期和地址

- 限制： 削弱区域分析如热点检测

3. 泛化技术（2分）

- 年龄范围： 将出生日期替换为年龄段（20-30、30-40）

- 地址级别： 从街道级泛化到邮编级

- 平衡： 5-10年范围通常平衡隐私和分析有用性

#### **练习题7：SLK-581、哈希和差分隐私（悉尼大学毕业生就业研究）**

数据集示例：

| 学生代码 | 全名 | 出生日期 | 性别 | GPA | 专业 | 就业状态 |
| --- | --- | --- | --- | --- | --- | --- |
| U101 | James Wilson | 04/03/2000 | M | 3.5 | 软件工程 | 已就业 |
| U102 | Sara Kim | 19/12/1999 | F | 3.9 | 商业分析 | 求职中 |

##### **技术实施：**

1. SLK-581计算（3分）

James Wilson的SLK-581：

- 姓氏(Wilson)：第2、3、5位字母 → I、L、O

- 名字(James)：第2、3位字母 → A、M

- 出生日期：04032000

- 性别代码：1（男性）

- 结果：ILOAM040320001

用途： 允许跨部门记录链接而不暴露真实姓名

2. SLK-581优势与风险（2分）

| 优势 | 风险 |
| --- | --- |
| 跨院系跟踪GPA/就业情况 | 小组中单个学生可能被唯一识别 |
| 隐藏姓名的同时实现研究 | 小群体或罕见专业重新识别风险 |

- SLK-581是伪匿名化，因为可以使用参考文件恢复原始身份

- 不是真正的匿名化（重新识别不可能）

3. 哈希=伪匿名化（2分）

- 哈希用固定编码值替换姓名

- 攻击者可用公开毕业名单进行字典攻击

- 实践中可逆，因此不是匿名化

4. 盐的重要性（2分）

Hash("Sara Kim" + Salt1) → XJF82…

Hash("Sara Kim" + Salt2) → PQ9AA…

- 盐防止攻击者预计算哈希表

- 必须安全存储盐——如果被盗，姓名仍可逆转

5. 差分隐私中的ε（2分）

- 小ε： 更多噪声 → 强隐私但准确性差

- 大ε： 更少噪声 → 结果更有用但隐私较弱

- ε太小使GPA比较误导 → 不利于政策决策

6. 拉普拉斯噪声与小组（2分）

- 噪声隐藏特定学生是否贡献计数

- 小专业（如心理学）中，噪声可能显著改变总数

- 降低可靠性

#### **考试准备重点总结**

基于这些练习题，建议重点掌握：

##### **1. 隐私保护技术**

- 差分隐私： ε参数、噪声添加、隐私-效用权衡

- 删除为什么是不够的？如何影响重识别？

- 加密计算： 同态加密、数据完整性保护

- 联邦学习： 本地训练、模型更新共享、数据不移动

##### **2. 去识别方法**

- 聚合： 汇总统计、失去个体级分析

- 抑制： 删除识别符、影响地理分析

- 泛化： 范围替换、平衡隐私与效用

##### **3. 伪匿名化技术**

- SLK-581： 标准链接密钥构建规则

- 哈希： 单向函数、字典攻击风险

- 加盐： 防止预计算攻击

- 所有的技术都加好处坏处！what why how when where  和法规的关系

- **4. 实际应用考虑**

- 合规性： GDPR、HIPAA、澳大利亚隐私法

- 数据质量： 设备差异、数据分布不均

- 运营挑战： 计算开销、网络延迟、密钥管理

##### **5. 答题技巧**

- 解释概念时提供具体例子

- 讨论权衡时明确说明优势和局限

- 涉及技术实施时说明具体步骤

- 考虑实际应用场景和挑战
