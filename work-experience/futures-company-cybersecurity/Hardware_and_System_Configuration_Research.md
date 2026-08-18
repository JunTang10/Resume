---
title: "硬件与系统配置研究"
subtitle: "Hardware & System Configuration"
status: "研究笔记整理稿"
---

# 硬件与系统配置研究

## Hardware & System Configuration

## 摘要

本文以个人在机房环境中的观察和 Seagate One Touch 5TB 外置机械硬盘的实际使用经历为线索，对硬件组成、跨平台存储配置及故障排查方法进行阶段性整理。研究首先说明个人对服务器、CPU、GPU、散热及系统配置产生兴趣的工作背景，随后记录外置硬盘的选购、文件系统选择和目录规划，并重点分析该硬盘在 Windows 中能够正常使用、但在 macOS Sequoia 15.7.3 中无法稳定被识别为磁盘设备的问题。

排查过程采用分层方法，从 Finder、Disk Utility 等图形界面逐步深入到 `diskutil`、`system_profiler`、`ioreg` 和系统日志。已有证据表明，问题并非单纯的 Finder 显示设置、exFAT 文件系统或手动挂载问题，而更可能发生在 USB 设备枚举与磁盘设备创建之间，涉及 One Touch w/PW 安全控制器、USB Bridge、设备固件或 macOS 兼容性。本文同时保留尚未完成的硬件与服务器配置研究栏目，供后续结合工作经历和实验记录继续补充。

**关键词：** 计算机硬件；外置硬盘；Seagate One Touch；macOS；USB Mass Storage；文件系统；故障排查；服务器配置

## 研究范围与方法

本文以个人实际接触和操作过的设备为主要研究对象，不以完整介绍所有计算机硬件知识为目标。现阶段材料主要来自以下三类经验：

1. 在工作中进入机房并观察服务器及相关设备；
2. 购买和配置 Seagate One Touch 5TB HDD；
3. 对该硬盘在 macOS 中无法识别的问题进行分层排查，并使用 Windows 进行对照测试。

研究方法包括现场观察、跨平台对照、图形界面检查、命令行诊断和日志分析。对于原始材料中尚无充分记录的主题，本文仅保留栏目，不补写未经个人验证的内容。

---

# 第一部分：硬件研究

## Part I: Hardware Research

## 1. 为什么开始研究硬件

### 1.1 工作中第一次接触机房

个人对计算机硬件的兴趣始于工作期间的一次机房经历。在宝山机房中，第一次集中看到大量服务器和相关设备，机柜、设备数量以及持续运行的环境给人带来了明显的视觉和听觉冲击。这次经历使“服务器”从抽象的软件运行载体转变为可以直接观察的物理系统。

![HPE 数据中心服务器机柜](https://www.hpe.com/content/dam/hpe/newsroom/2025/04/phoenixnap-advances-cloud-services-using-hpe-disaggregated-data-center-modular-hardware-system-servers-with-intel-xeon-6.jpg)

*图 HPE-A　采用 HPE 基础设施的数据中心服务器机柜。来源：Hewlett Packard Enterprise（HPE）Newsroom，2025。[^hpe-datacenter]*

### 1.2 看到不同的服务器和设备

机房中并非只有单一类型的服务器，而是存在多种承担不同功能的设备。原始记录表明，当时还看到同事使用工具对服务器和系统进行配置。这使研究兴趣从“设备是什么”进一步延伸到“硬件如何与操作系统、网络和业务软件共同工作”。

![HPE 数据中心技术人员检查服务器机柜](https://www.hpe.com/content/dam/hpe/shared-publishing/images-norend/0xx/05/0512052-4-3.jpg)

*图 HPE-B　技术人员在 HPE 数据中心环境中检查服务器机柜。来源：Hewlett Packard Enterprise（HPE），Direct Liquid Cooling Solutions。[^hpe-cooling]*

> 待补充：设备型号、用途、所在机柜、连接方式以及当时参与的具体操作。

### 1.3 不同机器运行时声音不同

现场观察到，不同设备在运行时产生的声音并不相同。部分机器的风扇声更明显，部分设备在不同负载下会表现出不同的噪声水平。工作交流中了解到，这些差异可能与 CPU、GPU、硬盘、风扇转速、设备功耗以及实时工作负载有关。

### 1.4 因 CPU、GPU 和散热产生兴趣

上述观察促使研究逐步扩展到 CPU、GPU、服务器散热和设备负载之间的关系。个人研究路径可以概括为：

```text
机房观察
  → 购买个人硬盘
  → 自主配置与故障排查
  → 理解存储和操作系统底层机制
  → 回到服务器、机房与系统配置研究
```

这一研究路径的特点是从具体设备和实际问题出发，再逐步建立对计算机系统的整体理解。

## 2. 我自己买的 Seagate 5TB HDD

### 2.1 为什么买这块硬盘

购买外置硬盘既有存储需求，也带有实践学习目的。在选购过程中曾比较 Samsung、Western Digital 和 Seagate 等品牌。Samsung 产品价格相对较高，在比较容量、价格和使用需求后，最终选择了 Seagate One Touch 5TB HDD。

研究对象如下：

| 项目 | 内容 |
|---|---|
| 产品 | Seagate One Touch Portable HDD |
| 容量 | 5TB |
| 类型 | 外置机械硬盘 |
| 特征 | One Touch w/PW，带密码或安全控制功能 |
| 主要用途 | 文件归档、跨平台存储和硬件配置实验 |

![Seagate One Touch 5TB HDD 相关资料](Hardware_and_System_Configuration_Research_assets/image-20260703020942644.png)

*图 3　Seagate One Touch 5TB HDD 的产品或兼容性资料截图*

### 2.2 HDD 的基本结构

> 待补充：盘片、主轴电机、磁头、执行器、缓存、控制电路板和外置硬盘盒结构。建议结合实物型号或可靠资料撰写。

### 2.3 HDD 和 SSD 的区别

> 待补充：工作原理、速度、容量、价格、抗震性、噪声、功耗和适用场景的对比。

### 2.4 硬盘如何连接电脑

本研究中的 Seagate 外置硬盘通过 USB 接口连接计算机。在 MacBook Air 环境中，硬盘需要经过 Apple 原装 USB-C 转接头接入；在 Windows 环境中则通过相应 USB 接口连接。一次完整的识别过程至少涉及以下层次：

```text
外置硬盘
  → USB 数据线
  → 转接头或主机接口
  → USB 控制器
  → USB Mass Storage 驱动
  → 操作系统磁盘设备
  → 分区与文件系统
  → Finder 或文件资源管理器
```

该分层结构也是后续故障定位的基础。

## 3. 电脑和服务器里的硬件

### 3.1 CPU 和 GPU

> 待补充。

### 3.2 内存

> 待补充。

### 3.3 HDD 与 SSD

> 待补充。

![HPE ProLiant DL380 Gen10 内部结构](https://assets.ext.hpe.com/is/image/hpedam/s00002894?%24zoom%24=)

*图 HPE-C　HPE ProLiant DL380 Gen10 的内部硬件布局，可用于后续标注 CPU、内存、存储设备及风扇位置。来源：Hewlett Packard Enterprise（HPE）。[^hpe-dl380]*

### 3.4 网卡

> 待补充。

### 3.5 电源

> 待补充。

## 4. 我在机房看到的硬件

### 4.1 服务器

原始材料确认个人曾在宝山机房看到大量服务器，但尚未记录具体型号、配置及承担的业务功能。

![HPE ProLiant DL380 Gen10 机架式服务器](https://assets.ext.hpe.com/is/image/hpedam/s00006498?%24zoom%24=)

*图 HPE-D　HPE ProLiant DL380 Gen10 机架式服务器。来源：Hewlett Packard Enterprise（HPE）官方产品页面。[^hpe-dl380]*

> 待补充：服务器品牌、型号、机架高度、CPU、内存、硬盘、网卡及业务用途。

### 4.2 交换机、路由器与防火墙

> 待补充。

### 4.3 存储设备

> 待补充。

### 4.4 UPS

> 待补充。

### 4.5 机柜

机柜用于将服务器、交换机、存储设备及配电单元等设备进行标准化安装和集中管理。原始材料尚未记录现场机柜的规格和设备布局，后续可结合实际工作记录补充。

![HPE G2 Advanced Series 服务器机柜](https://assets.ext.hpe.com/is/image/hpedam/s00005666?%24zoom%24=)

*图 HPE-E　HPE G2 Advanced Series 服务器机柜。来源：Hewlett Packard Enterprise（HPE）官方产品页面。[^hpe-racks]*

## 5. 散热和布线

### 5.1 CPU、GPU 与发热

> 待补充。

### 5.2 风扇和服务器散热

原始观察表明，不同设备的运行声音存在差异，并由此产生了对设备负载、风扇转速和散热结构的兴趣。

> 待补充：服务器风道、风扇布局、温度与转速关系，以及实际观察到的设备差异。

### 5.3 机房散热

> 待补充。

### 5.4 网线与光纤

> 待补充。

### 5.5 电源布线

> 待补充。

### 5.6 机柜布线

机柜布线需要同时考虑网络连接、光纤路径、电源线路、维护空间和散热风道。规范的结构化布线能够减少线路交叉，便于设备识别、故障排查和后续变更。

![HPE 机房布线与服务器环境](https://www.hpe.com/content/dam/hpe/shared-publishing/images-norend/0xx/03/0301045-16-9.jpg)

*图 HPE-F　包含服务器机柜、结构化布线和基础设施的机房环境。来源：Hewlett Packard Enterprise（HPE），Direct Liquid Cooling Solutions。[^hpe-cooling]*

---

# 第二部分：配置系统研究

## Part II: System Configuration

## 6. 我怎么配置自己的 Seagate 硬盘

### 6.1 Windows 和 macOS 如何识别硬盘

Windows 能够正常识别、格式化并读写该硬盘。macOS Sequoia 15.7.3 的表现不同：Finder 和 Disk Utility 均不显示硬盘，`diskutil list external` 也未返回相应的外置磁盘设备。该差异说明，同一硬件在不同操作系统中的设备枚举、驱动绑定和磁盘管理过程可能产生不同结果。

### 6.2 磁盘、分区和文件系统

外置存储的正常使用需要区分三个层次：

| 层次 | 含义 |
|---|---|
| 磁盘设备 | 操作系统识别到的物理或逻辑存储设备，例如 `/dev/disk4` |
| 分区 | 在磁盘空间中划分出的逻辑区域 |
| 文件系统 | 组织和读写文件的数据结构，例如 NTFS、APFS 或 exFAT |

本次故障发生时，macOS 没有稳定创建 `/dev/diskN`，因此问题尚未进入分区或文件系统处理阶段。

### 6.3 NTFS、APFS 与 exFAT

原始材料仅完整记录了最终选择 exFAT 的原因：该文件系统通常可被 Windows 和 macOS 同时读写，适合作为跨平台移动存储和文件归档方案。

> 待补充：NTFS、APFS 与 exFAT 在兼容性、权限、日志功能、单文件限制和适用场景方面的系统比较。

### 6.4 在 Windows 上格式化硬盘

由于 Windows 可以稳定识别该设备，后续使用 Windows 对 Seagate 5TB HDD 进行格式化，并将文件系统设置为 exFAT。

![Windows 中的硬盘配置界面](Hardware_and_System_Configuration_Research_assets/image-20260703021119340.png)

*图 4　Windows 环境中的硬盘识别或配置界面（一）*

![Windows 中的目录或磁盘结果](Hardware_and_System_Configuration_Research_assets/image-20260703021233672.png)

*图 5　Windows 环境中的硬盘识别或配置界面（二）*

> 待补充：Windows 磁盘管理或格式化工具中的具体步骤、分区表类型、卷标和分配单元大小。

### 6.5 为什么选择 exFAT

选择 exFAT 的主要原因是跨平台兼容性。该硬盘计划同时承担 Windows 文件归档及后续可能的 macOS 数据交换任务，因此需要避免只能在单一平台完整读写的文件系统。

需要注意的是，文件系统选择并不能解决本次 macOS 故障。若只是 exFAT 损坏或无法挂载，macOS 通常仍应识别到物理磁盘；本案例中系统没有生成磁盘设备标识，因此根因位于更底层。

### 6.6 Seagate Toolkit

原始材料将 Seagate Toolkit 和固件检查列为后续方案，但尚未记录实际配置过程。

> 待补充：软件版本、安装过程、硬盘识别情况、安全功能及固件更新结果。

### 6.7 文件同步与 Mirror

> 待补充。

### 6.8 目录和存储方式

为提高归档数据的可管理性，原稿设计了以下目录结构：

```text
Jun-Archive-01
├── 01-Archive
├── 02-WeChat
├── 03-Photos
├── 04-Videos
├── 05-Datasets
├── 06-Software
└── 99-Temporary
```

该结构使用数字前缀固定排序，并将长期归档、社交软件数据、媒体文件、数据集、软件和临时文件分开管理。

## 7. 我怎么排查硬盘问题

### 7.1 问题现象与测试环境

研究对象为 Seagate One Touch 5TB HDD，测试环境为配备 16GB 内存和 512GB 内置 SSD 的 MacBook Air，操作系统为 macOS Sequoia 15.7.3。连接时使用 Apple 原装 USB-C 转接头。

主要现象如下：

- Finder 不显示外置硬盘；
- Disk Utility 不显示该设备；
- `diskutil list external` 没有返回相应磁盘；
- 系统没有生成 `/dev/diskN`；
- 系统曾短暂显示 `One Touch w/PW`，但识别状态不稳定；
- 同一硬盘在 Windows 中能够正常识别、格式化和读写。

### 7.2 Finder 和 Disk Utility

首先检查 Finder 设置中的“外置硬盘”显示选项，并确认“系统设置 → 隐私与安全性 → 允许配件连接”已允许该设备接入。Finder 的相关选项已经开启，插入硬盘时也曾出现配件连接提示。

随后在 Disk Utility 中选择“显示所有设备”，但仍未看到 Seagate 外置硬盘。这一步排除了单纯的 Finder 显示问题，并表明故障位于文件浏览器以下的系统层次。

![Finder 外置磁盘显示设置](Hardware_and_System_Configuration_Research_assets/image-20260702224401244.png)

*图 6　Finder 中的外置磁盘显示设置*

![macOS 配件连接权限设置一](Hardware_and_System_Configuration_Research_assets/image-20260702224638692.png)

*图 7　macOS 配件连接权限检查（一）*

![macOS 配件连接权限设置二](Hardware_and_System_Configuration_Research_assets/image-20260702224714314.png)

*图 8　macOS 配件连接权限检查（二）*

![macOS 识别提示](Hardware_and_System_Configuration_Research_assets/image-20260702230355719.png)

*图 9　硬盘连接时出现的系统提示或短暂识别现象*

![Disk Utility 检查结果](Hardware_and_System_Configuration_Research_assets/image-20260702232755520.png)

*图 10　Disk Utility 中未显示 Seagate 外置磁盘*

![System Information 检查结果一](Hardware_and_System_Configuration_Research_assets/image-20260702224238929.png)

![System Information 检查结果二](Hardware_and_System_Configuration_Research_assets/image-20260702222838745.png)

*图 11—12　System Information 中的 USB 设备检查结果*

### 7.3 使用 `diskutil` 检查磁盘层

使用以下命令检查系统是否创建了外置磁盘设备：

```bash
diskutil list
diskutil list external
diskutil list external physical
diskutil activity
```

检查结果未显示 Seagate external disk，也没有产生可供操作的 `/dev/diskN` 标识。因此：

- `diskutil mount` 没有可以挂载的对象；
- `diskutil eraseDisk` 没有可以指定的目标；
- 故障不能通过反复手动挂载或格式化解决。

![diskutil list external 结果一](Hardware_and_System_Configuration_Research_assets/image-20260702230955833.png)

![diskutil list external 结果二](Hardware_and_System_Configuration_Research_assets/image-20260702231052223.png)

*图 13—14　`diskutil` 未返回目标外置磁盘*

![ioreg 初步检查结果](Hardware_and_System_Configuration_Research_assets/image-20260702231543147.png)

*图 15　磁盘层或 USB 层初步命令检查结果*

![磁盘标识检查](Hardware_and_System_Configuration_Research_assets/image-20260702223301087.png)

*图 16　系统中存在的磁盘标识及手动挂载条件检查*

![system_profiler 命令结果](Hardware_and_System_Configuration_Research_assets/image-20260702230105359.png)

*图 17　命令行中的外置设备检查结果*

### 7.4 USB 与 Mass Storage 层检查

为了确认问题是否发生在 USB 设备枚举阶段，使用了以下命令：

```bash
system_profiler SPUSBDataType
ioreg -p IOUSB
ioreg -p IOUSB -w0
ioreg -p IOUSB -l | grep -i "One Touch"
ioreg -p IOUSB -l | grep -i "Seagate"
ioreg -p IOUSB -l | grep -i "0bc2"
```

系统曾短暂识别到 `One Touch w/PW`，并出现过 `IOUSBMassStorageDriver` 相关信息，但当前检查不能稳定找到 Seagate、One Touch 或厂商标识 `0bc2`。这说明 Mac 并非从未看到该设备，而是在 USB 通信或驱动绑定过程中未能保持稳定状态。

![USB 设备曾被识别](Hardware_and_System_Configuration_Research_assets/image-20260702230647885.png)

*图 18　macOS 曾在 USB 层识别到相关设备*

![ioreg 设备状态](Hardware_and_System_Configuration_Research_assets/image-20260702231953031.png)

*图 19　`ioreg` 检查中设备短暂出现或初始化失败的证据*

![diskutil activity 检查](Hardware_and_System_Configuration_Research_assets/image-20260702232033387.png)

*图 20　`diskutil activity` 未观察到外置磁盘创建事件*

![用户权限检查](Hardware_and_System_Configuration_Research_assets/image-20260702232506153.png)

*图 21　用户权限及相关命令检查结果*

![USB 设备树检查一](Hardware_and_System_Configuration_Research_assets/image-20260702233148182.png)

![USB 设备树检查二](Hardware_and_System_Configuration_Research_assets/image-20260702233239276.png)

![USB 设备树检查三](Hardware_and_System_Configuration_Research_assets/image-20260702233319588.png)

![USB 与磁盘层对比](Hardware_and_System_Configuration_Research_assets/image-20260702233350962.png)

*图 22—25　USB 设备树、Mass Storage 驱动与磁盘层对比检查*

![APFS 或磁盘结构检查](Hardware_and_System_Configuration_Research_assets/image-20260702233732701.png)

*图 26　进一步确认文件系统或磁盘结构并非当前故障入口*

![设备活动状态检查](Hardware_and_System_Configuration_Research_assets/image-20260702234527895.png)

![Mass Storage 驱动检查](Hardware_and_System_Configuration_Research_assets/image-20260702234826010.png)

*图 27—28　USB 活动和 Mass Storage 驱动检查结果*

### 7.5 日志检查

原始记录使用 macOS 日志进一步观察设备插入和 USB 驱动行为：

```bash
log stream --predicate 'subsystem == "com.apple.usb"' --style compact
```

历史日志中曾出现以下关键信息：

- `One Touch w/PW`；
- `0x0bc2/ab6b/0100`；
- `IOUSBMassStorageDriver`；
- `timeout`；
- `usb reset`；
- `failed to create device`。

这些信息支持如下故障路径：macOS 一度完成了初步 USB 枚举，并尝试按 Mass Storage 设备加载驱动，但在通信过程中出现超时和重置，最终未能稳定创建磁盘设备节点。

![USB 日志检查](Hardware_and_System_Configuration_Research_assets/image-20260702234923502.png)

*图 29　USB 日志或设备插入事件检查*

![完整设备信息检查](Hardware_and_System_Configuration_Research_assets/image-20260702235203485.png)

*图 30　未经过筛选的设备信息检查结果*

![导出 USB 信息](Hardware_and_System_Configuration_Research_assets/image-20260702235313225.png)

*图 31　将 `system_profiler` 输出保存为文件以便分析*

![最终命令检查结果](Hardware_and_System_Configuration_Research_assets/image-20260703000151162.png)

*图 32　最终阶段的 USB 或 Mass Storage 检查结果*

### 7.6 Windows 对照测试

Windows 能够正常识别、格式化和读写该硬盘。该结果说明：

1. 硬盘盘体并非完全失效；
2. 数据线、接口和外置硬盘控制器至少能在 Windows 环境中完成工作；
3. 故障更可能与 macOS 下的设备枚举、USB Bridge、固件或安全控制层兼容性有关。

Windows 对照测试不能单独证明硬件完全正常，但显著缩小了问题范围。

### 7.7 最后的故障定位

根据现有证据，可以排除或降低以下原因的可能性：

- **不是单纯的 Finder 设置问题。** Finder 只能显示已挂载的卷；当前系统未创建磁盘设备。
- **不是普通的 exFAT 文件系统问题。** 即使文件系统损坏，系统通常仍能识别到物理磁盘。
- **不是常规手动挂载问题。** 没有 `/dev/diskN`，因此不存在可挂载对象。
- **不是应当直接执行 `eraseDisk` 的问题。** 该命令需要明确的磁盘标识，贸然执行还可能破坏其他磁盘数据。

现阶段更可能的原因包括：

1. One Touch w/PW 安全控制器没有在 macOS 中稳定暴露 Mass Storage 接口；
2. USB Bridge 或设备固件与 macOS Sequoia 存在兼容问题；
3. USB 设备枚举过程不稳定，导致驱动超时、设备重置并最终创建失败。

因此，本问题应定位为 USB 设备枚举到磁盘设备创建之间的底层兼容性故障，而非用户配置错误。

### 7.8 后续处理建议

当前不建议继续反复修改 Finder 设置、执行手动挂载或尝试 `eraseDisk`。后续可以进行以下验证：

- 使用另一台 Mac 对照测试；
- 更换具备可靠数据传输能力的线缆；
- 使用带独立供电的 USB Hub；
- 在 Windows 中检查 Seagate Toolkit 和固件版本；
- 将日志与设备信息提交给 Seagate 或 Apple 技术支持。

在兼容性问题解决前，最稳妥的方案是将该硬盘作为 Windows 归档盘使用。

## 8. 工作中学习服务器配置

### 8.1 服务器硬盘配置

> 待补充。

### 8.2 RAID 与存储控制器

HPE 官方配置文档给出了一条典型的服务器阵列配置路径：

```text
System Configuration
  → Controller
  → Array Configuration
  → Create Array
```

该路径表明，服务器 RAID 配置通常由 UEFI System Utilities 中的存储控制器配置工具完成。后续应结合实际服务器型号，补充阵列级别、物理磁盘选择、热备盘、缓存策略及初始化验证过程。[^hpe-array]

### 8.3 BIOS 与 UEFI

> 待补充。

### 8.4 操作系统安装与初始化

> 待补充。

### 8.5 磁盘和文件系统配置

> 待补充。

### 8.6 IP 和网络配置

> 待补充。

### 8.7 用户和权限配置

> 待补充。

### 8.8 软件和服务配置

原始材料提到，工作期间曾看到同事使用工具配置服务器，并由此产生对系统配置流程的兴趣。

> 待补充：软件名称、安装方式、服务用途、启动方式和验证方法。

### 8.9 日志和基本检查

> 待补充。

---

# 结论

本阶段研究从机房观察和个人外置硬盘实践出发，初步建立了“硬件连接—驱动识别—磁盘设备—分区—文件系统—用户界面”的分层认识。Seagate One Touch 5TB HDD 的排查案例表明，终端用户看到的“不显示”现象并不等同于 Finder 或文件系统故障；只有逐层检查图形界面、磁盘管理、USB 枚举、驱动状态和系统日志，才能准确判断问题边界。

当前材料已经较完整地记录了外置硬盘的配置和故障定位过程，但关于 CPU、GPU、服务器组件、机房设备、散热布线以及生产环境服务器配置的内容仍需结合个人工作记录继续补充。后续研究应优先记录真实设备型号、操作步骤、配置参数、日志证据和验证结果，以保持文章的实践性和可验证性。

## 后续补充清单

- [ ] 补充 Seagate 5TB HDD 的实物照片、接口和产品规格；
- [ ] 补充 HDD 内部结构及 HDD/SSD 对比；
- [ ] 补充机房服务器和网络设备的实际型号与用途；
- [ ] 补充 CPU、GPU、风扇和机房散热观察；
- [ ] 补充网线、光纤、电源及机柜布线记录；
- [ ] 补充 Windows 格式化、Seagate Toolkit 和 Mirror 的实际步骤；
- [ ] 补充 RAID、BIOS/UEFI 和服务器初始化经验；
- [ ] 补充生产服务器网络、用户权限、服务及日志检查流程。

## 图片与资料来源

[^hpe-datacenter]: Hewlett Packard Enterprise, “phoenixNAP advances cloud services using HPE disaggregated Data Center Modular Hardware System Servers with Intel Xeon 6,” HPE Newsroom, 2025. <https://www.hpe.com/us/en/newsroom/press-release/2025/04/phoenixnap-advances-cloud-services-using-hpe-disaggregated-data-center-modular-hardware-system-servers-with-intel-xeon-6.html>

[^hpe-cooling]: Hewlett Packard Enterprise, “Direct Liquid Cooling Solutions.” <https://www.hpe.com/us/en/solutions/direct-liquid-cooling.html>

[^hpe-dl380]: Hewlett Packard Enterprise, “HPE ProLiant DL380 Gen10 Server.” <https://buy.hpe.com/us/en/compute/rack-servers/proliant-dl300-servers/hpe-proliant-dl380-gen10-server/p/1010026818>

[^hpe-racks]: Hewlett Packard Enterprise, “HPE G2 Advanced Series Racks.” <https://buy.hpe.com/au/en/rack-power-infrastructure-products/racks/server-racks/hpe-g2-advanced-series-racks/p/1009694916>

[^hpe-array]: Hewlett Packard Enterprise Support, “Creating an array using UEFI System Utilities.” <https://support.hpe.com/hpesc/public/docDisplay?docId=a00106490en_us&docLocale=en_US&page=GUID-4F61AF5F-5EC1-49C7-A660-DDF267890B9F.html>
