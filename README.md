# Harmony_wechat

![GitHub repo size](https://img.shields.io/github/repo-size/yourusername/Harmony_wechat)
![GitHub stars](https://img.shields.io/github/stars/yourusername/Harmony_wechat?style=social)
![GitHub forks](https://img.shields.io/github/forks/yourusername/Harmony_wechat?style=social)

## 项目概述
`Harmony_wechat` 是一个使用鸿蒙技术仿写微信界面的项目。此项目可作为学习鸿蒙开发的示例，帮助开发者了解如何运用鸿蒙技术实现类似微信的界面设计。

## 目录结构
```
Harmony_wechat/
├── .gitignore             # 全局Git忽略文件
├── hvigorfile.ts          # 项目的Hvigor配置文件
├── AppScope/              # 应用范围相关资源目录
│   └── resources/         # 资源目录
│       └── base/          # 基础资源目录
│           ├── element/   # 元素资源目录
│           │   └── string.json # 包含应用名称等字符串资源
│           └── media/     # 媒体资源目录
│               └── layered_image.json # 分层图像配置文件
├── entry/                 # 应用入口模块目录
│   ├── .gitignore         # 入口模块的Git忽略文件
│   ├── hvigorfile.ts      # 入口模块的Hvigor配置文件
│   ├── obfuscation-rules.txt # 代码混淆规则文件
│   └── src/               # 源代码目录
│       └── main/          # 主代码目录
│           └── resources/ # 资源目录
│               ├── base/  # 基础资源目录
│               │   ├── element/ # 元素资源目录
│               │   │   ├── float.json # 包含浮点型资源，如字体大小
│               │   │   ├── string.json # 包含模块描述等字符串资源
│               │   │   └── color.json  # 包含颜色资源，如启动窗口背景颜色
│               │   ├── media/ # 媒体资源目录
│               │   │   └── layered_image.json # 分层图像配置文件
│               │   └── profile/ # 配置文件目录
│               │       ├── main_pages.json # 主页面配置文件
│               │       └── backup_config.json # 备份配置文件
│               └── dark/  # 深色模式资源目录
│                   └── element/ # 元素资源目录
│                       └── color.json # 深色模式下的颜色资源
```

## 安装与运行

### 环境要求
- 安装 DevEco Studio
- 配置鸿蒙开发环境

### 克隆项目
```bash
git clone https://github.com/yourusername/Harmony_wechat.git
cd Harmony_wechat
```

### 构建与运行
1. 打开 DevEco Studio，选择 `File` -> `Open`，然后选择项目目录 `Harmony_wechat`。
2. 等待项目同步完成。
3. 选择合适的模拟器或真机设备。
4. 点击运行按钮，启动项目。

## 代码混淆
项目中使用了代码混淆来保护代码，混淆规则定义在 `entry/obfuscation-rules.txt` 文件中：
```plaintext
# Define project specific obfuscation rules here.
# You can include the obfuscation configuration files in the current module's build-profile.json5.
#
# For more details, see
#   https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/source-obfuscation-V5

# Obfuscation options:
# -disable-obfuscation: disable all obfuscations
# -enable-property-obfuscation: obfuscate the property names
# -enable-toplevel-obfuscation: obfuscate the names in the global scope
# -compact: remove unnecessary blank spaces and all line feeds
# -remove-log: remove all console.* statements
# -print-namecache: print the name cache that contains the mapping from the old names to new names
# -apply-namecache: reuse the given cache file

# Keep options:
# -keep-property-name: specifies property names that you want to keep
# -keep-global-name: specifies names that you want to keep in the global scope

-enable-property-obfuscation
-enable-toplevel-obfuscation
-enable-filename-obfuscation
-enable-export-obfuscation
```

## 贡献
如果你想为这个项目做出贡献，请遵循以下步骤：
1. Fork 这个仓库。
2. 创建一个新的分支：`git checkout -b your-feature-branch`。
3. 提交你的更改：`git commit -m 'Add some feature'`。
4. 推送到分支：`git push origin your-feature-branch`。
5. 提交一个 Pull Request。

## 许可证
本项目采用 [具体许可证名称] 许可证。请查看 `LICENSE` 文件以获取更多信息。

## 联系信息
如果你有任何问题或建议，请通过以下方式联系：
- 邮箱：your_email@example.com
- GitHub Issues：[提交问题](https://github.com/yourusername/Harmony_wechat/issues)

请将 `yourusername` 和 `your_email@example.com` 替换为你自己的 GitHub 用户名和邮箱地址。同时，将 `[具体许可证名称]` 替换为项目实际使用的许可证名称。 