<img width="602" height="312" alt="image" src="https://github.com/user-attachments/assets/50f9f141-0bd0-4916-85c5-7c607fb6154c" />https://tishandavid.dev/
https://tishandavid.com/

###  🌸他的电脑里面装了什么？

1. Editor & AI / 编辑器和 AI

Claude Code：主要用来重构代码、代码审查、MCP 工作。
VS Code：代码编辑器，开启 Vim 快捷键，扩展装得很少。
Claude Desktop：用来测试 MCP server。

2. Language & Runtime / 编程语言和运行环境

TypeScript：默认语言，严格模式。
Node.js：运行 JavaScript/TypeScript 的环境。
Go / Rust：适合做命令行工具，运行快，可以编译成单个二进制文件。

网站和应用主要用 TypeScript / Node.js，性能工具可能用 Go 或 Rust。

3. Framework & UI / 框架和界面

Next.js：React 框架，这个网站可能就是用它做的。
Angular：另一个网站 tishandavid.com 用 Angular SSR。
Tailwind CSS：写样式。
Radix UI：做可访问性更好的 UI 组件。

他做前端页面主要用 Next.js、Tailwind、Radix UI。

4. Infra & Hosting / 基础设施和部署

Dokku：类似轻量版 Heroku，可以把代码 push 到服务器自动部署。
Cloudflare：负责 DNS、代理、SSL、安全和缓存。
Docker：打包运行环境。
GitHub Actions：自动化部署，也就是 CI/CD。

他用 Docker + GitHub Actions + Cloudflare + VPS 来部署网站。


##🌸 他的经历是什么
前端/后端开发 → 基础设施 → 容器化 → CI/CD → 可观测性 → 平台工程 → MCP / AI 工具链 → 技术负责人

2025 — now

Xero｜Senior Platform Engineer / Tech Lead

多区域容灾 → 平台变更 RFC → 带 4 人团队 → 内部 MCP 落地 → 自出版 MCP 架构指南 → 为悉尼 startup 做容器化和部署流水线咨询

2023 — 2025

Xero｜Senior Software Engineer

平台现代化 → 前端迁移 Angular → 后端重构 NestJS → 认证/计费/分析模块拆分 → 容器化 → git-push 部署流水线 → 部署时间 20 分钟降到 3 分钟内 → OpenTelemetry/Grafana 监控 → 内部 AI 工作流引入 MCP → 开源工具 1.4k+ stars → Sydney meetup 演讲

2020 — 2023

Afterpay｜Software Engineer → Mid-Level

交付 6+ 客户产品 → 接触生产基础设施 → 应用容器化 → 自动化部署 → Sentry/Datadog 监控 → API p95 延迟降低 42% → Redis 缓存 → 指导 2 名 junior → 引入 PR 模板和 lint 规范

2019 — 2020

Canva｜Junior Software Engineer

jQuery/PHP 旧系统迁移 → TypeScript 技术栈 → 内部 dashboard → 40+ 运营人员使用 → GitHub Actions CI → EC2/RDS → CloudWatch 日志

2019

UTS｜BSc Computer Science

计算机科学本科 → 关注开发者效率 → 开始开源贡献 → ts-config-boilerplate → node-heap-dump-analyzer → Sydney JS meetup 首次演讲
 
### 🌸 他开源了什么？ https://tishandavid.com/packages?


utm_source=tishandavid.dev&utm_medium=intralink&utm_campaign=cross-domain
| 类型               | 项目                                            | 用途                 |
| ---------------- | --------------------------------------------- | ------------------ |
| TypeScript 项目脚手架 | `ts-cli-scaffold`, `ts-config-boilerplate`    | 快速搭建 TypeScript 项目 |
| 配置与调试工具          | `config-validator`, `node-heap-dump-analyzer` | 检查配置、分析内存问题        |
| AI / MCP 工具      | `mcp-toolkit`, `mcp-inspector-cli`            | 开发和测试 MCP server   |

1. ts-cli-scaffold

生成一个基础结构。如果做一个能在 Terminal 里运行的工具，它先帮我把项目文件夹结构、配置、参数解析、测试这些基础框架搭好。

2. config-validator

在 App 真正启动前，先检查配置有没有问题。像是一个门禁，检查环境和配置文件。规则固定，结果固定

3. ts-config-boilerplate

告诉它“我要做 Node 项目 / Next.js 项目 / npm 库”，它给你一份对应的 tsconfig.json


4. node-heap-dump-analyzer

作用：分析 Node.js 内存泄漏。
Node.js 程序越跑越占内存时，用它找问题。
比如服务器运行久了内存从 200MB 涨到 2GB，就可以用这个分析。

5. mcp-toolkit

作用：帮助开发 MCP Server（ 让 Claude 或 ChatGPT 调用你自己的工具）。

MCP 是 Model Context Protocol，可以理解成：

让 AI 工具连接外部工具、文件、数据库、API 的协议。

这个项目提供一些轻量工具，比如：

schema validation 检查 AI 传进来的参数格式对不对。
transport boilerplate AI 怎么和 MCP Server 说话。帮你准备好 MCP Server 和 AI 通信的基础代码
test harness  测试框架 / 测试环境。你不用真的打开 Claude，也可以测试 MCP Server 能不能正常工作。


6. mcp-inspector-cli

作用：在终端里测试 MCP Server。
列出 MCP server 提供的工具，
用 JSON 参数调用工具，
保存返回结果，
做回归测试：测试就功能看原来的代码有没有坏掉

## 🌸 the MCP handbook。统一 AI 和外部工具/数据源的接口    Model Context Protocol


1. 为什么需要 MCP

AI 模型本身被训练数据限制，不能自动知道你私有系统里的内容。以前每接一个系统都要写一个单独 connector，比如：

Claude 接 GitHub 写一个
Claude 接数据库写一个
另一个 AI 接 GitHub 又写一个
另一个 AI 接数据库又写一个

这样会变成很多重复集成。MCP 的目标是把这种 N × M 的混乱连接，变成统一协议下的 N + M。
 
为什么要使用，协议的运作方式
如何把服务器连接到主机上，如何利用别人的开发工具来获取实际的价值
如何编写自己的服务器
<img width="581" height="299" alt="image" src="https://github.com/user-attachments/assets/3389ed4f-2892-4509-829a-45e55c918e46" />


4. 怎么实际使用 MCP

第二部分讲如何在 Claude Desktop 里配置和使用 MCP Server，也会讲 MCP 生态系统里已有的服务器，以及使用时的安全问题。

5. 怎么自己构建 MCP Server

第三部分是开发者实战，讲：

写第一个 MCP Server
用 TypeScript 构建 Server
高级 Server 模式
构建 Client 和 Host
调试和排错

也就是说，这本书不是纯概念书，而是偏工程实践。

6. MCP 和 Agent 的关系

最后一部分讲 MCP 如何变成 AI Agent 的基础设施，尤其是：

Claude Code
autonomous agents
orchestration
agent 工作流
未来的 context 生态

意思是：MCP 可以让 Agent 不只是聊天，而是能调用真实系统完成多步任务。

### Anthropic 发现了问题
数据与模型有隔离问题  碎片化问题每个数据来源需要相应的定制实现方式   统一的标准



### 统一接口类比type-c
<img width="514" height="297" alt="image" src="https://github.com/user-attachments/assets/b8523353-c545-4a47-a8b5-bc774df48515" />

### 类比LSP = Language Server Protocol
<img width="1012" height="492" alt="image" src="https://github.com/user-attachments/assets/d447d0db-1da2-4317-bc25-4655c4f8c43f" />

历史：
1. Introducing the Model Context Protocol
Anthropic 公司在 2024 年 11 月 25 日发布了《Model Context Protocol》它还包括了完整的开发包：规范文档、用于 Python 和 TypeScript 的软件开发工具包、对 Claude 桌面应用中的本地 MCP 服务器的支持，以及用于常见系统测试的参考服务器的开源仓库。
https://www.anthropic.com/news/model-context-protocol
2. MCP documentation: Get Started launch 后的入门文档
<img width="638" height="266" alt="image" src="https://github.com/user-attachments/assets/e119cad8-5e33-4547-9141-41cd99c5d543" />

3. Specification — versioning
解释 MCP specification 为什么用 YYYY-MM-DD 这种日期版本，以及 client/server 怎么做版本协商。当前协议版本显示为 2025-11-25
https://modelcontextprotocol.io/docs/getting-started/intro
4. The first year of MCP
https://blog.modelcontextprotocol.io/posts/2025-11-25-first-mcp-anniversary/
Date: 25 Nov 2025
Role: MCP 一周年回顾，同时发布 2025 年 11 月版本的 specification。官方博客说 MCP 从实验性开源协议发展成连接 LLM 与数据/应用的事实标准之一。

<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/ba244609-5293-499e-8b6a-35a8314a1f8a" width="230"></td>
    <td><img src="https://github.com/user-attachments/assets/d857c8f7-1cd8-4c0c-b1f6-ab87e39a0176" width="230"></td>
    <td><img src="https://github.com/user-attachments/assets/3efb383e-740a-4340-9a96-25dad31126a5" width="230"></td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/03ea6a8c-e272-4fe0-a108-2e00034ad3d4" width="230"></td>
    <td><img src="https://github.com/user-attachments/assets/b61c676b-f15a-44fc-b2bd-2949de80a49c" width="230"></td>
    <td><img src="https://github.com/user-attachments/assets/b20a50ca-8b16-492e-879e-36f7ef1b47ff" width="230"></td>
  </tr>
</table>
Notion构建了一个 MCP 服务器，以帮助您管理笔记。https://github.com/makenotion/notion-mcp-server
Stripe拥有相当全面的MCP服务器，可以管理各种支付工作流程。https://docs.stripe.com/mcp#tools
GitHub构建了自己的 MCP 服务器，以帮助开发人员实现工程流程自动化。https://github.com/github/github-mcp-server<img width="109" height="105" alt="image" src="https://github.com/user-attachments/assets/bfacf15e-3b83-4836-8135-c68c4d4dd1c5" />
Hugging Face创建了一个 MCP 服务器，使模型管理和数据集搜索变得轻而易举。 https://github.com/huggingface/hf-mcp-server
Postman构建了 MCP 服务器，以帮助自动化 API 测试工作流程。 https://github.com/postmanlabs/postman-mcp-server
5. MCP joins the Agentic AI Foundation
https://blog.modelcontextprotocol.io/posts/2025-12-09-mcp-joins-agentic-ai-foundation
Date: 9 Dec 2025
Role: Anthropic 将 MCP 捐给 Linux Foundation 旗下的 Agentic AI Foundation，让 MCP 进入更中立的开源治理阶段。


2. MCP 怎么工作

它不是一个普通插件，而是一个 wire protocol 通信协议。

书里重点解释三个角色：

角色	意思
Host	用户真正使用的 AI 应用，比如 Claude Desktop、Claude Code、IDE
Client	Host 里面负责连接 MCP Server 的连接器
Server	暴露工具、资源、提示词的程序，比如文件系统、数据库、GitHub 服务


### 客户服务器和主机

<img width="494" height="295" alt="image" src="https://github.com/user-attachments/assets/ff174ad1-f11f-430d-9e0f-5d10b62b0763" />


### 数据层级和传输层级

<img width="592" height="271" alt="image" src="https://github.com/user-attachments/assets/a0c44495-04db-4409-91a6-e61f7472d5f9" />

### 连接生命周期

<img width="588" height="413" alt="image" src="https://github.com/user-attachments/assets/343be851-152d-47e5-aed1-eaf9fac49e7c" />


### 谁控制

<img width="609" height="374" alt="image" src="https://github.com/user-attachments/assets/04eadd65-edde-4962-8f2b-c7105cb9ceba" />
角色	意思
Host	用户真正使用的 AI 应用，比如 Claude Desktop、Claude Code、IDE
Client	Host 里面负责连接 MCP Server 的连接器
Server	暴露工具、资源、提示词的程序，比如文件系统、数据库、GitHub 服务

3. MCP 的三种核心能力

书里说 MCP Server 主要暴露三类东西：

MCP primitive	中文理解
Tools	可调用的动作，比如查天气、查数据库、运行命令
Resources	可读取的数据，比如文件、文档、表格、API 返回内容
Prompts	可复用的提示词模板
## 🔧工具就是模型做的行为
<img width="592" height="355" alt="image" src="https://github.com/user-attachments/assets/f45eac7f-7c27-490a-a9bc-c07d7e8f4afa" />



<img width="598" height="203" alt="image" src="https://github.com/user-attachments/assets/5cbac4d8-eadb-4046-98e9-b4b655257f35" />



## 采样：什么时候服务器需要思考
主要的提供功能的还是服务器，但是客户也可以像读物起提供功能，具体来说是采样功能。
但是客户不可能有api。所以用户应该可以批准和审查采样，并且拒绝或者接受服务器的采样请求。

<img width="458" height="249" alt="image" src="https://github.com/user-attachments/assets/38b47d44-956b-4b10-a924-9239f104daa5" />


## elicition 服务器需要用户提供一些特定的信息，就是给用户一个表单
<img width="602" height="312" alt="image" src="https://github.com/user-attachments/assets/d158e5c6-d731-46d9-bf40-8fa47118371b" />



## 第一次http传输，为什么改变 HTTP+SSE
<img width="656" height="370" alt="image" src="https://github.com/user-attachments/assets/0ab4d969-a7b1-4f2d-bc07-1228a5d25163" />

依赖长期连接 → 连接断了就丢消息 → 云部署和负载均衡不友好
旧版 MCP 的 SSE 通信方式虽然能实现双向通信，但因为依赖长期保持的 GET 连接和额外的 POST 端点，

部署会出问题：无法恢复连接，客户端断开连接期间，服务器尝试发送给的任何消息都会丢失

基础设施兼容性；每个会话都要时刻保持连接。一个 SSE 流在整个生命周期内都是开放的，即使服务器只需要偶尔响应一些请求。但这种方式在大规模应用中成本较高，而且容易因超时而受到影响。

难以扩展：这种双端点长连接设计不适合现代云部署，因为它容易被负载均衡、无服务器架构和实例切换机制破坏。

<img width="602" height="313" alt="image" src="https://github.com/user-attachments/assets/2006cccb-7c8e-4d82-b559-19e960e9a860" />



## 选择一种传输  可流式传输的 HTTP 内容。实时通道 + 恢复机制 + session 标识。我们的capstone的phishgguard和这个的思想很像

① 一个端点：所有 MCP 消息都走 /mcp。
② 普通请求：POST 后直接返回 JSON，不长期占连接。
③ 需要流式输出：才临时返回 text/event-stream。
④ 断线恢复：用 Last-Event-ID 告诉服务器从哪里继续。
⑤ 会话状态：用 Mcp-Session-Id 识别同一个 session。
⑥ 云部署更友好：减少长连接依赖，更适合负载均衡和 Serverless。

<img width="665" height="284" alt="image" src="https://github.com/user-attachments/assets/e2b54715-1408-4936-b1f7-8c2ea91d35c9" />



