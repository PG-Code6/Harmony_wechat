# Harmony_wechat

## 项目简介
本项目 `Harmony_wechat` 是使用鸿蒙技术仿写的微信界面。通过该项目，可以深入了解鸿蒙开发的相关技术和流程，同时实现一个类似微信的界面。

## 项目结构
以下是项目的主要目录结构及其说明：
```
Harmony_wechat/
├── .gitignore             # 全局Git忽略文件，指定不需要纳入版本控制的文件和目录
├── hvigorfile.ts          # 项目的Hvigor配置文件，用于构建和管理项目
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

## 代码混淆配置
在 `entry/obfuscation-rules.txt` 文件中，定义了项目的代码混淆规则，包括启用属性混淆、顶级名称混淆、文件名混淆和导出混淆等。具体规则如下：
```
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

## 构建和运行
### 依赖安装
确保已经安装了鸿蒙开发所需的环境和工具，如 DevEco Studio 等。

### 构建项目
在项目根目录下，可以使用 Hvigor 进行项目构建。具体命令可以参考 Hvigor 的相关文档。

### 运行项目
将项目导入到 DevEco Studio 中，选择合适的模拟器或真机进行运行。

## 注意事项
- 在进行代码混淆时，需要根据项目的实际情况调整混淆规则，避免影响项目的正常运行。
- 项目中的资源文件，如字符串、颜色、图像等，需要根据实际需求进行修改和扩展。

## 贡献
欢迎对本项目进行贡献，如提交 Bug 报告、提出改进建议或提交代码合并请求等。

## 许可证
本项目遵循 [具体许可证名称] 许可证。请查看 `LICENSE` 文件以获取更多信息。