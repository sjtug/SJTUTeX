
# Changelog

此处记载了 SJTUTeX 中所有值得留意的改动，格式参照[《如何维护更新日志》](https://keepachangelog.com/zh-CN/1.1.0/)。

点击版本号即可在 GitHub 上查看相邻版本间的代码变动。

## [Unreleased]

### Added

- 新增 `\SetInfoEntry` 命令设置 `sjtu/info` 键。
- 新增 `preset` 文档选项，分离非必要设置；同时支持载入用户预设，方便自定义模板。

### Removed

- 移除 `info/<lang>/custom` 键。

### Fixed

- 修复浮动体环境中 `cases` 环境中的字体问题，在浮动体中将 `\SJTU@style@equation@font` 置空（[#77](https://github.com/sjtug/SJTUTeX/pull/77)）。

## [v2.2.1] - 2025-03-28

### Added

- 新增本科新版原创性声明变体（[#72](https://github.com/sjtug/SJTUTeX/pull/72)）。
- 新增语言设置钩子（[#75](https://github.com/sjtug/SJTUTeX/pull/75)）。

### Removed

- 不再自动载入 `xcolor` 宏包（[#73](https://github.com/sjtug/SJTUTeX/pull/73)）。

### Fixed

- `subject` 初始化时不再完全展开，避免使用 pdfTeX 时德语模板标题页生成错误的问题（[#74](https://github.com/sjtug/SJTUTeX/pull/74)）。
- 修正插入外置版权页的 PDF 书签。

## [v2.2] - 2025-02-12

### Added

- 新增 `info/<lang>/custom` 键，可自定义标题页信息。
- `style/page-number` 支持设置总页码数。
- 新增 `hanyi` CJK 字体选项。

### Changed

- 同步 LaTeX 2024-06-01，无需显式调用 `xtemplate` 宏包，内部实现使用 e 型展开替代 x 型展开。
- 取消对标准文档选项的包装，未知选项将转递给标准文档类。
- 简化 CJK 字体配置文件，pdfLaTeX 下直接使用 `ctex` 的默认设置。
- 内置文档命令与环境修改为使用键值对参数，废弃对应的带星号版本。
- 移除 `bibliolist` 环境的使用限制，修改为默认重置计数，新增 `resume` 选项设置连续编号。
- 视觉形象系统文件重命名。

## [v2.1.5] - 2024-11-06

### Fixed

- 修复了 `array` 更新造成的标题页生成失败的问题（[#68](https://github.com/sjtug/SJTUTeX/pull/68)）。

## [v2.1.4] - 2024-10-20

### Changed

- 标题页信息栏允许手动换行（[#66](https://github.com/sjtug/SJTUTeX/pull/66)）。

## [v2.1.3] - 2024-06-29

### Changed

- 更新目录样式。

## [v2.1.2] - 2024-04-05

### Changed

- 改用 `titletoc` 设置目录格式，不再使用原 `tocloft` 包（[#62](https://github.com/sjtug/SJTUTeX/pull/62)）。

## [v2.1.1] - 2024-03-23

### Added

- 新增 `style/theorem-header-font`、`style/theorem-body-font` 选项，支持修改预设数学环境字体。
- 兼容 `thmtools` 包，使用 `tocloft` 包设置 `\listoftheorems` 的样式（[#57](https://github.com/sjtug/SJTUTeX/issues/57)、[#60](https://github.com/sjtug/SJTUTeX/pull/60)）。

### Changed

- 预定义的数学环境声明移至导言区末尾，且不会覆盖重名的已定义环境。

## [v2.1] - 2024-02-18

### Added

- 新增 `style/equation-font` 选项：行间数学公式的字体设置。
- 新增 `style/indent-first` 选项：章节标题后首段是否缩进（[#51](https://github.com/sjtug/SJTUTeX/pull/51)）。
- 新增 `style/keywords-format` 选项：设置关键词格式为普通段落或悬挂格式。
- 新增 `style/num-sep` 选项及子选项 `style/float-num-sep`, `style/equation-num-sep` 和 `style/theorem-num-sep` 来定义编号中的分隔符。
- 添加 `baselineskip` 文档类选项，替换原 `lineskip` 选项。

### Changed

- `abstract` 环境添加目录条目，`abstract*` 环境对应修改为不添加目录条目。
- `\tableofcontents` 添加目录条目，`\tableofcontents*` 对应修改为不添加目录条目。
- 同步 LaTeX 2020/10/01，无需显式调用 `expl3` 和 `xparse` 宏包。
- 更新题注格式。
- 标题页信息栏改用表格实现。

## [v2.0.3] - 2023-09-25

### Added

- 新增 `libertinus` 西文字体设置（[#44](https://github.com/sjtug/SJTUTeX/pull/44)）。
- 添加 `siunitx` 宏包的本地化支持。

### Changed

- 更新学位论文初始英文主题。

### Removed

- 移除文档类内的 `listings` 宏包预设，相关预设移至主文档中。

### Fixed

- 页面统一纵向顶部对齐。

## [v2.0.2] - 2023-04-01

### Changed

- 标题页日期底部增加空白。

### Fixed

- 修复使用 `unicode-math` 字体配置时，`math-style` 设置不生效的问题。

## [v2.0.1] - 2023-03-31

### Changed

- 取消索引条目的缩进。
- 调整索引编号宽度，`thesis` 和 `report` 分章编号的加长编号宽度 2.3em -> 2.8em，`article` 默认不分节编号的减小宽度 2.3em -> 1.8em。

### Fixed

- 修复表格索引中编号宽度不正确的问题。

## [v2.0] - 2023-03-29

### Added

- 对 `sjtuthesis` 文档类：`sjtu/info` 域现在使用 `<lang>/<key>` 接口（比如 `zh/title`），`abstract` 和 `digest` 现在接受一个可选语言参数，移除 `running-title`；对 `sjtureport` 和 `sjtuarticle` 文档类：添加 `\keywords` 和 `\subject` 命令，推荐使用标准文档类接口，`sjtureport` 恢复标准文档类默认封面（[#36](https://github.com/sjtug/SJTUTeX/pull/36)）。
- 新增日语模板（[#37](https://github.com/sjtug/SJTUTeX/pull/37)）。
- 新增德语模板（[#38](https://github.com/sjtug/SJTUTeX/pull/38)）。
- 新增 `sjtu/style/fnmark-style` 选项以支持脚注在带圈数字（`lang=zh` 和 `lang=ja` 时默认）和普通数字（`lang=en` 和 `lang=de` 时默认）间做切换；`sjtu/style/fnmark-font` 可以使用 `haranoaji` 预设（[#39](https://github.com/sjtug/SJTUTeX/pull/39)）。

### Changed

- `sjtu/name` 域中的 `abbr`, `nom`, `ack`, `achv` 键仍然兼容旧接口，但请尽快更新为新用法。
- `abbreviation`、`nomenclature`、`acknowledgements`、`achievements`、`resume` 现在支持使用可选参数变更标题。
- 每个 `achievements` 环境将重置 `bibliolist` 和 `bibliolist*` 环境内部文献条目的计数器，而且 `bibliolist` 和 `bibliolist*` 现在只允许在 `achievements` 环境中使用。
- `abbreviation`、`nomenclature` 现在是带编号的章节（[#34](https://github.com/sjtug/SJTUTeX/pull/34)）。

### Removed

- 移除 `summary` 环境。

### Fixed

- 统一西文无衬线字体缩放。
- 修复 `review` 文档类选项的行为。
- 在 `math-font=none` 时 `\QED` 可用。

## [v2.0-beta] - 2023-02-05

### Changed

- 更新 `math-style` 文档类选项，默认值由 `TeX` 改为 `ISO`；废弃 `nointlimits`, `intlimits`, `upint`, `slint` 文档类选项，改为 `integral-limits=true/false` 和 `integral=slanted/upright`；添加文档类选项 `uppercase-greek=slanted/upright`（[#23](https://github.com/sjtug/SJTUTeX/pull/23)）。

### Deprecated

- 文档类选项 `fontset` 已过时。

### Fixed

- 修复 `\copyrightpage` 使用可选参数时不换页的错误。

## [v2.0-alpha] - 2022-12-28

SJTUTeX 使用 LaTeX3 进行了重构，并对学校新毕业设计模版的要求做了适配。与此同时，新增了 `sjtuarticle` 和 `sjtureport` 文档类，可以用在实验报告等短文中。欢迎使用！


[Unreleased]: https://github.com/sjtug/SJTUTeX/compare/v2.2.1...HEAD
[v2.2.1]:     https://github.com/sjtug/SJTUTeX/compare/v2.2...v2.2.1
[v2.2]:       https://github.com/sjtug/SJTUTeX/compare/v2.1.5...v2.2
[v2.1.5]:     https://github.com/sjtug/SJTUTeX/compare/v2.1.4...v2.1.5
[v2.1.4]:     https://github.com/sjtug/SJTUTeX/compare/v2.1.3...v2.1.4
[v2.1.3]:     https://github.com/sjtug/SJTUTeX/compare/v2.1.2...v2.1.3
[v2.1.2]:     https://github.com/sjtug/SJTUTeX/compare/v2.1.1...v2.1.2
[v2.1.1]:     https://github.com/sjtug/SJTUTeX/compare/v2.1...v2.1.1
[v2.1]:       https://github.com/sjtug/SJTUTeX/compare/v2.0.3...v2.1
[v2.0.3]:     https://github.com/sjtug/SJTUTeX/compare/v2.0.2...v2.0.3
[v2.0.2]:     https://github.com/sjtug/SJTUTeX/compare/v2.0.1...v2.0.2
[v2.0.1]:     https://github.com/sjtug/SJTUTeX/compare/v2.0...v2.0.1
[v2.0]:       https://github.com/sjtug/SJTUTeX/compare/v2.0-beta...v2.0
[v2.0-beta]:  https://github.com/sjtug/SJTUTeX/compare/v2.0-alpha...v2.0-beta
[v2.0-alpha]: https://github.com/sjtug/SJTUTeX/releases/tag/v2.0-alpha
