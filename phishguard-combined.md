# PhishGuard Combined Notes


## phish-guard-juntang-v1.md

### **Real-Time Email and Message Data Acquisition and Analysis**

***\*Process:\**** The app acquires and analyses real-time email and SMS content. For email, it uses a ***\*Gmail App Password\**** to access the mailbox, poll the latest emails, fill the email header and body into the analysis page, and return a risk score.

For SMS, it uses the ***\*SMS Filter Extension\****. After users enable permission in ***\*Settings → Apps → Messages\****, the system can analyse new messages from unknown senders.

![image-20260701024614552](/Users/tangjun/Library/Application Support/typora-user-images/image-20260701024614552.png)

Figure 1.6. Real-Time Email and SMS Acquisition Setup

***\*Achievements:\**** For email analysis, the app reads the latest email, fills it into the ***\*Analyze\**** page, generates a risk score, and saves the result in ***\*History\****.

For SMS analysis, message capture is simulated with a button due to developer plan limitations. The main app can then read, analyse, display, and record the SMS content, with console logs confirming the process.

![image-20260701024243489](/Users/tangjun/Library/Application Support/typora-user-images/image-20260701024243489.png)

### 1.1.2. **Other Analysis Interfaces**

***\*Process\*******\*:\**** To support the main analysis workflow, the app also provides additional interaction and record management features that connect different functional requirements together.

***\*Achievements:\**** 

***\*1. Whitelist and Blacklist Management\****

After analysis, the app prompts the user to add the detected sender to the whitelist or blacklist. Whitelisted senders are saved as trusted contacts, while blacklisted senders are marked as high risk. Both lists are automatically updated in ***\*Settings\****, and entries can be removed manually.



![image-20260701025009673](/Users/tangjun/Library/Application Support/typora-user-images/image-20260701025009673.png)



Figure 1.8. Automatic Addition and Manual Removal

In future analyses, whitelisted senders are scored as ***\*0.0\**** and marked as trusted, while blacklisted senders are scored as ***\*10.0\**** and marked as blocked.

  

Figure 1.9. Whitelist / Blacklist Score Override

The Analysis page shows whether the sender is already trusted or risky. Users can also manage senders from History, Settings, or the whitelist/blacklist screen. The Voice page supports selecting phone numbers from contacts for records or list management.





Figure 1.10. Sender Status Alert and Manual Management

***\*2. History Management\****

When similar content is analysed again, the system adjusts the score based on previous history records. If the original content was dangerous, the risk score will be further increased;



Figure 2.1. Similar Content Handling for Risky History

if it was safe, the risk score will be further reduced. This forms a cumulative judgement mechanism.



Figure 2.2. Similar Content Handling for Safe History

 

Clear All Function deletes all history records. Deleted records will no longer be used in future score calculations.



Figure 2.3. Clear All Function in History

History Details View allows users to view detailed information, including email content, voice/video transcription results, analysis time, risk score at that time, and scoring reasons.



Figure 2.4. History Details View

***\*3. Monitor Page\****

The ***\*Monitor\**** page displays the latest analysis result, classifies the risk score using predefined labels, and shows the detection pipeline status and current session statistics. The session statistics are linked with the ***\*Clear All\**** button.



Figure 2.5. Monitor Risk Score and Pipeline Status

The Analysis page loads the latest real-time content when monitoring is enabled. If monitoring is off, the system prompts the user to enable it. Manual input or uploaded files will not be overwritten.











my-contribution.md
├── Multimodal input 多模态输入
│   ├── Manual text input
│   ├── Voice input
│   └── Apple Speech transcription
│
├── Monitoring and history 监控与历史记录
│   ├── Detection result history
│   ├── Risk level display
│   └── Detection layer tracking
│
├── Result presentation 检测结果展示
│   ├── Risk score
│   ├── Verdict
│   ├── Reason explanation
│   └── Escalation path
│
└── iOS system limitations research
    ├── Apple Speech
    ├── ReplayKit
    ├── CallKit limitation
    ├── APNs limitation
    └── WebSocket / polling workaround











Figure 2.6. Monitoring Enablement Prompt and Input Protection

## **1.1.** ***\*External Server Analysis\****

By clicking the external analysis button, the app can call the server-side analysis function. The Monitor page also displays the external server connection status.



Figure 2.7. External Server Analysis and Detection Tier Display

---

## phishguard-literature-final.md

# **1.** ***\*Related Literature\****

According to the 2025 Data Breach Investigations Report, phishing attacks remain one of the primary initial access vectors in data breach incidents (Verizon, 2025). At the same time, the widespread adoption of LLMs has further lowered the barrier to generating convincing phishing content, making the threat landscape increasingly severe (Hazell, 2023).

Although existing studies have advanced phishing detection technologies, important limitations still remain in real-time deployment, mobile platform adaptation, and multimodal coverage. These challenges are also the main design goals of PhishGuard. Therefore, a systematic literature review is necessary to identify the rationale behind the technical choices, recognise current research gaps, and justify the architectural decisions of the system.

This project primarily focuses on academic papers that are directly related to PhishGuard’s core technical approach, published in peer-reviewed conferences or journals, and able to provide empirical support for specific architectural decisions. In addition, the discussion of iOS platform constraints also references official Apple technical documentation, including the sandbox mechanism, permission model, ReplayKit, CallKit, and the app lifecycle (Apple Developer Documentation, 2024), to ensure that the architectural decisions remain consistent with actual platform limitations.

## ***\*2.1\**** ***\*Phishing Detection Techniques\****

​      This section first outlines how phishing detection techniques have evolved and how this evolution informs the design of PhishGuard.

 Figure 21 Evolution of Phishing Detection Techniques in the Literature![img](file:////Users/tangjun/Library/Containers/com.kingsoft.wpsoffice.mac.global/Data/tmp/wps-tangjun/ksohtml//wps1.jpg)

​     Although deep learning and LLMs have improved the semantic understanding capabilities of phishing detection, their high computational cost still makes them difficult to directly adapt to real-time deployment on mobile devices (Li et al., 2019). To address this issue, PhishGuard adopts a lightweight DistilBERT model as the first-stage on-device classifier. This type of small language model (SLM) is designed for resource-constrained environments (Sanh et al., 2019), while more complete semantic reasoning is handled by a server-side LLM + RAG pipeline (Lewis et al., 2020).

## **1.1** ***\*Multimodal Phishing Detection\****

At the same time, although rule-based methods have limited generalisation ability, their lightweight and interpretable nature still provides practical value (Garera et al., 2007). Therefore, this project preserves them in the form of whitelists, and history records, giving users a degree of autonomous control.

Traditional phishing detection mainly focused on analysing textual content, particularly email bodies and URL features (Garera et al., 2007). However, as attack techniques have evolved, phishing is no longer limited to a single text-based medium. Instead, it has gradually developed into a multimodal form that combines visual deception and voice-based social engineering attacks (Hazell, 2023). As a result, single-modality approaches show clear limitations when dealing with such attacks.

To address this issue, researchers have increasingly explored multimodal detection approaches. (Lee et al. 2024) demonstrated the effectiveness of GPT-4 and Gemini in multimodal phishing webpage detection, while PhishAgent further improved robustness by combining URL and screenshot analysis (Cao et al., 2024). Similarly, KnowPhish showed that integrating textual and visual cues can improve the robustness of reference-based phishing detection (Li et al., 2024). Notably, PhishSnap proposed a purely visual perceptual hashing approach that performs local inference to preserve privacy, demonstrating the technical feasibility of on-device multimodal detection (Minhaz et al., 2025).

However, most existing approaches still rely heavily on server-side inference, which introduces network latency, bandwidth overhead, and privacy exposure risks (Wang et al., 2017). These issues become even more significant in real-time mobile scenarios. Consequently, increasing attention has shifted toward edge computing and on-device inference solutions (Li et al., 2019).

Based on these findings, PhishGuard preprocesses multimodal inputs such as voice, video, and images into a unified textual representation on the mobile device before passing them into a shared detection pipeline. This design maintains multimodal coverage while reducing server dependency, network latency, and privacy exposure risks.

## **1.2** ***\*iOS Platform Constraints and Mobile Deployment\****

The technical limitations of the iOS platform are a fundamental consideration in system design. Unlike Android or desktop platforms, iOS enforces strict sandbox isolation for third-party applications. Although this mechanism effectively prevents malicious applications from accessing other apps, it also fundamentally restricts the monitoring capabilities of security applications (Apple Developer Documentation, 2024).

![img](file:////Users/tangjun/Library/Containers/com.kingsoft.wpsoffice.mac.global/Data/tmp/wps-tangjun/ksohtml//wps2.jpg)Figure 22 Mapping from iOS Platform Constraints to PhishGuard Design Decisions

These limitations shape the design direction of PhishGuard: to collect suspicious content as much as possible within the boundaries allowed by iOS, while guiding users to actively submit suspicious information through a clear and user-friendly interface.

## **1.3** ***\*Layered AI Architecture and Intelligent Agents\****

LLMs possess strong semantic reasoning capabilities and are able to identify social engineering intent, contextual meaning, and brand impersonation. However, the cost of each model invocation remains relatively high. ChatSpamDetector proposed by Koide et al. (2024) achieved a phishing email detection accuracy of 99.7% using GPT-4, demonstrating the potential of LLMs for this task. Nevertheless, relying solely on LLMs also introduces clear limitations, including high API costs and unstable performance in real-world email scenarios. Heiding et al. (2024) found that the accuracy dropped from 100% to around 75%, accompanied by relatively high false positive rates.

To address these issues, PhishGuard incorporates Retrieval-Augmented Generation (RAG) as a complementary mechanism. RAG enhances contextual understanding by retrieving similar historical cases to support LLM reasoning, thereby reducing hallucinations and lowering false positive rates (Lewis et al., 2020). In addition, inspired by the agentic step-by-step decision-making approach proposed by Trad and Chehab (2024), the server side adopts a LangGraph-based agent architecture to further improve reasoning accuracy in uncertain scenarios. Together, these components form the core reasoning mechanism of the PhishGuard server-side architecture.

## **1.4** ***\*System Construction and Summary\****

Taken together, the reviewed literature suggests that layered architectures better balance real-time performance, accuracy, and privacy. Meanwhile, Agentic AI further improves autonomous decision-making capabilities. This perspective is directly supported by the three-layer Cognitive Edge Computing framework (Cloud/Edge/Device) proposed by Wang et al. (2025).

From the perspective of layered inference, the early exit mechanism proposed by Teerapittayanon et al. (2016) provides the foundation for PhishGuard’s confidence-threshold escalation strategy. When the confidence score of the on-device classifier does not reach a predefined threshold, the input is selectively escalated to the server side for deeper reasoning, rather than forcing a decision on the device itself.

From the perspective of intelligent agents, frameworks such as LangGraph enable the system to dynamically select different analysis paths based on input complexity. The agentic step-by-step decision-making approach proposed by Trad and Chehab (2024) also provides direct guidance for the design of the server-side agent architecture.

# References

Ahad, A., Meem, Zannatul Zahan, & Hossain, M. S. (2025). **PhishSnap: Image-Based Phishing Detection Using Perceptual Hashing**. ArXiv.org. https://arxiv.org/abs/2512.02243

Apple. (2019). **Apple Developer Documentation**. Apple.com. https://developer.apple.com/documentation/

Arcila, C. (2025, April 23). **Verizon’s 2025 Data Breach Investigations Report: Alarming surge in cyberattacks through third-parties**. Verizon. https://www.verizon.com/about/news/2025-data-breach-investigations-report

Cao, T., Huang, C., Li, Y., Wang, H., He, A., Oo, N., & Hooi, B. (2025). **PhishAgent: A robust multimodal agent for phishing webpage detection**.

Devlin, J., Chang, M.-W., Lee, K., & Toutanova, K. (2019). **BERT: Pre-training of deep bidirectional transformers for language understanding**. 4171–4186.

Garera, S., Provos, N., Chew, M., & Rubin, A. D. (2007). A framework for detection and measurement of phishing attacks. **Proceedings of the 2007 ACM Workshop on Recurring Malcode - WORM ’07**. https://doi.org/10.1145/1314389.1314391

Hazell, J. (2023). Spear phishing with large language models. In **arXiv preprint arXiv:2305.06972**.

Heiding, F., Lermen, S., Kao, A., Schneier, B., & Vishwanath, A. (2024). Devising and detecting phishing emails using large language models. **IEEE Access**, **12**, 232241–232258. https://doi.org/10.1109/ACCESS.2024.3375882

Irhimefe Otuburun. (2025). Real-Time Fraud Detection Using Large Language Models: A Context-Aware System for Mitigating Social Engineering Threats. **World Journal of Advanced Research and Reviews**, **26**(3), 2811–2821. https://doi.org/10.30574/wjarr.2025.26.3.2491

Koide, T., Fukushi, N., Nakano, H., & Chiba, D. (2024). **ChatSpamDetector: Leveraging Large Language Models for Effective Phishing Email Detection**. ArXiv.org. https://arxiv.org/abs/2402.18093

Lane, N. D., & Georgiev, P. (2015). **Can deep learning revolutionize mobile sensing?**

Lee, J., Lim, P., Hooi, B., & Mon, D. D. (2024). Multimodal large language models for phishing webpage detection and identification. In **arXiv preprint arXiv:2408.05941**.

Lewis, P., Perez, E., Piktus, A., Petroni, F., Karpukhin, V., Goyal, N., Küttler, H., Lewis, M., Yih, W., Rocktäschel, T., Riedel, S., & Kiela, D. (2021, April 12). **Retrieval-Augmented Generation for Knowledge-Intensive NLP Tasks**. ArXiv.org. https://doi.org/10.48550/arXiv.2005.11401

Li, E., Zeng, L., Zhou, Z., & Chen, X. (2019). Edge AI: On-Demand Accelerating Deep Neural Network Inference via Edge Computing. **ArXiv:1910.05316 [Cs]**. https://arxiv.org/abs/1910.05316

Li, Y., Huang, C., Deng, S., Lock, M. L., Cao, T., Oo, N., Lim, H. W., & Hooi, B. (2024). **KnowPhish: Large language models meet multimodal knowledge graphs for enhancing reference-based phishing detection**.

Ma, J., Saul, L. K., Savage, S., & Voelker, G. M. (2009). **Beyond blacklists: Learning to detect malicious web sites from suspicious URLs**. 1245–1254. https://doi.org/10.1145/1557019.1557153

Sahingoz, O. K., Buber, E., Demir, O., & Diri, B. (2019). Machine learning based phishing detection from URLs. **Expert Systems with Applications**, **117**, 345–357. https://doi.org/10.1016/j.eswa.2018.09.029

Sanh, V., Debut, L., Chaumond, J., & Wolf, T. (2019). DistilBERT, a distilled version of BERT: Smaller, faster, cheaper and lighter. In **arXiv preprint arXiv:1910.01108**.

Teerapittayanon, S., McDanel, B., & Kung, H. T. (2017). BranchyNet: Fast Inference via Early Exiting from Deep Neural Networks. **ArXiv:1709.01686 [Cs]**. https://arxiv.org/abs/1709.01686

Trad, F., & Chehab, A. (2024). **Large Multimodal Agents for Accurate Phishing Detection with Enhanced Token Optimization and Cost Reduction**. ArXiv.org. https://arxiv.org/abs/2412.02301

Wang, S., Zhang, X., Zhang, Y., Wang, L., Yang, J., & Wang, W. (2017). A survey on mobile edge computing: The communication perspective. **IEEE Communications Surveys and Tutorials**, **19**, 4.

Xiang, G., Hong, J., Rose, C. P., & Cranor, L. (2011). CANTINA+: A feature-rich machine learning framework for detecting phishing web sites. **ACM Transactions on Information and System Security**, **14**, 2. https://doi.org/10.1145/2019599.2019606

---

## phishguard-testing-log.md

我的测试问题包括下面的一些部分，我们的局限在于

---

## phishgurad- groupmember improve.md

(empty)

---

## phishgurad-literature-Proposal.md

## 1.1 **Phishing Detection Techniques** 

### 1.1.1 **Traditional Phishing Detection Methods**

Early phishing detection technology mainly relied on rule-based methods. For example, some studies suggest that phishing websites can be identified through key  word analysis of URLs (Garera et al., 2007). However, these methods tend to have limited generalizability when dealing with novel attacks (Li et al., 2024).

Subsequently, machine learning-based methods improve detection performance by introducing physically engineered features. Studies have shown that applying classification algorithms to phishing detection can achieve higher accuracy than traditional rule-based methods (Ma et al., 2009). In addition, some studies further improve detection performance by combining multi-dimensional features (Xiang et al., 2011). However, these methods are highly dependent on feature engineering. So, they lack a deep understanding of semantic information.

### 1.1.2 **Deep Learning Detection**

With the development of technology, phishing detection has gradually shifted from feature-based methods to semantic analysis. Studies have proposed models based on deep learning, combining natural language processing techniques with neural networks to detect phishing URLs and messages (Sahingoz et al., 2019). In addition, Transformer-based models (such as BERT) have been applied to phishing email detection and have achieved advanced performance (Devlin et al., 2019). 

Furthermore, large-scale language models (LLMs) can more effectively identify complex social engineering attack patterns by capturing the contextual semantics of texts and inferring potential intentions (Otuburun, 2025). However, such models usually have high computational overhead and are not suitable for real-time deployment on mobile devices with limited resources.

### 1.1.3 **Overview**

 

![img](file:////Users/tangjun/Library/Containers/com.kingsoft.wpsoffice.mac.global/Data/tmp/wps-tangjun/ksohtml//wps3.jpg) 

Figure  2.1  Key Developments in Real-Time Phishing Detection for iOS (2007–2024)

The figure 2.1 clarifies the development history of phishing detection from 2007 to 2024, which can be roughly divided into the following four stages.(i) Early machine learning breakthroughs in the field of phishing mail/URL classification, (ii) browser scale deployment results, (iii) representation learning and visual similarity models in the DL era, and (iv) the rise of LLM/visual language models in phishing analysis in 2023–2024.

## 1.2 **Multimodal Detection Constraints**

Traditional phishing detection mainly focuses on text content analysis, especially the identification of email content and URL characteristics (Garera et al., 2007). With the evolution of attack technology, phishing is no longer limited to a single text medium, but gradually extends to a more contextual and deceptive form of attack (Hazell, 2023). Therefore, the research began to focus on multimodal detection methods to improve the identification ability of complex phishing attacks by combining text, visual clues and page content (Abdelnabi et al., 2020).

Although the multimodal method can improve detection coverage, its actual deployment still faces obvious challenges, especially in terms of computing overhead and system complexity (Abdelnabi et al., 2020). It is more difficult to achieve real-time detection on mobile devices, because mobile deep learning reasoning itself is limited by resources and energy consumption (Lane et al., 2016). For the iOS platform, this problem is more prominent because Apple's runtime security mechanism relies on sandboxes and permission control, restricting system-level access and continuous monitoring of applications (Apple, 2024).

## 1.3 **Tiered Detection Architectures**

In order to achieve a balance between detection performance and computing efficiency, research has proposed a hierarchical artificial intelligence architecture in recent years to assign tasks to different computing levels to optimize resource utilization (Satyanarayanan, 2017). Relevant studies point out that by collaboratively distributing computing tasks between edge devices and cloud servers, latency can be effectively reduced and the overall efficiency of the system can be improved (Shi et al., 2016). On this basis, the concept of intelligent artificial intelligence (agent AI) further enhances the architecture, which realizes dynamic adjustment in the process of task execution through autonomous decision-making mechanisms (Wooldridge, 2009). At the same time, such systems can optimize the adaptive analysis process according to environmental changes, thus improving the detection ability under complex scenarios (Russell & Norvig, 2021).

Existing research shows that such solutions usually adopt hierarchical reasoning strategies: using lightweight models (SLM) for preliminary screening on local devices to reduce response delay (Lane et al., 2016); and for tasks with higher computational complexity, they are unloaded to edge services. Device or cloud processing (Satyanarayanan, 2017). In addition, by building a multi-layer architecture, the detection accuracy can be improved while ensuring real-time, so as to achieve more efficient security protection in resource-limited environments (Shi et al., 2016).

In short, phishing detection has evolved from an early rule- -based to artificial intelligence-driven method. In recent years, deep learning, Transformer models, and large-scale language models have significantly improved detection accuracy. However, existing solutions still face many limitations in real-time processing, mobile deployment, and multimodal integration. These challenges are particularly pronounced in the iOS environment. Strict system permissions, limited computing resources, and low latency requirements make it difficult to directly deploy complex detection models.

Based on the evaluated literature and the actual limitations of the project, this project aims to develop an AI-based phishing detection app for iOS.





## **References**

Abdelhamid, N., Ayesh, A., & Thabtah, F. (2014). Phishing detection based associative classification data mining. Expert Systems with Applications, 41(13), 5948–5959.

Abdelnabi, S., Krombholz, K., & Fritz, M. (2020). *VisualPhishNet: Zero-day phishing website detection by visual similarity*. In *Proceedings of the 2020 ACM SIGSAC Conference on Computer and Communications Security* (pp. 1681–1698). ACM. https://doi.org/10.1145/3372297.3417233 

Apple. (2024, December 19). *Security of runtime process in iOS, iPadOS and visionOS*. Apple Support. https://support.apple.com/guide/security/sec15bfe098e/web 

Devlin, J., Chang, M.-W., Lee, K., & Toutanova, K. (2019). BERT: Pre-training of deep bidirectional transformers for language understanding. Proceedings of NAACL-HLT.

Garera, S., Provos, N., Chew, M., & Rubin, A. D. (2007). A framework for detection and measurement of phishing attacks. In Proceedings of the 2007 ACM workshop on Recurring malcode (pp. 1–8). ACM. https://doi.org/10.1145/1314389.1314391

Hazell, J. (2023). Spear phishing with large language models. arXiv. https://doi.org/10.48550/arXiv.2305.06972

Lane, N. D., Bhattacharya, S., Georgiev, P., Forlivesi, C., & Kawsar, F. (2016). *DeepX: A software accelerator for low-power deep learning inference on mobile devices*. In *Proceedings of the 15th ACM/IEEE International Conference on Information Processing in Sensor Networks (IPSN)* (pp. 1–12). IEEE. https://doi.org/10.1109/IPSN.2016.7460664 

Li, W., Manickam, S., Chong, Y.-W., Leng, W., & Nanda, P. (2024). A state-of-the-art review on phishing website detection techniques. IEEE Access, 12, 187976–188012. https://doi.org/10.1109/ACCESS.2024.3514972

Ma, J., Saul, L. K., Savage, S., & Voelker, G. M. (2009). Beyond blacklists: Learning to detect malicious web sites from suspicious URLs. Proceedings of the 15th ACM SIGKDD International Conference on Knowledge Discovery and Data Mining, 1245–1254.

Verizon. (2025). 2025 data breach investigations report. Verizon. https://www.verizon.com/business/resources/reports/dbir/

Otuburun, I. (2025). Real-time fraud detection using large language models: A context-aware system for mitigating social engineering threats. World Journal of Advanced Research and Reviews, 26(3), 2811–2821. https://doi.org/10.30574/wjarr.2025.26.3.2491

Russell, S., & Norvig, P. (2021). *Artificial intelligence: A modern approach* (4th ed.). Pearson. 

Sahingoz, O. K., Buber, E., Demir, O., & Diri, B. (2019). Machine learning based phishing detection from URLs. Expert Systems with Applications, 117, 345–357.

Satyanarayanan, M. (2017). The emergence of edge computing. *Computer, 50*(1), 30–39. 

Shi, W., Cao, J., Zhang, Q., Li, Y., & Xu, L. (2016). Edge computing: Vision and challenges. *IEEE Internet of Things Journal, 3*(5), 637–646. 

Wooldridge, M. (2009). *An introduction to multiagent systems* (2nd ed.). Wiley. 

Xiang, G., Hong, J., Rose, C. P., & Cranor, L. F. (2011). CANTINA+: A feature-rich machine learning framework for detecting phishing web sites. Proceedings of the 20th International World Wide Web Conference (WWW), 639–64

---
