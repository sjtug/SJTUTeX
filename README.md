# SJTUTeX

## 简介

SJTUTeX 是 [SJTUThesis](https://github.com/sjtug/SJTUThesis) 项目使用的宏集，
包含上海交通大学（非官方）学位论文文档类 `sjtuthesis`，课程报告文档类 `sjtureport`，课程文稿文档类 `sjtuarticle`。
对于 LaTeX 模版的更改，都应该在这个 repo 中进行，而后把解包后的结果同步到 SJTUThesis。

本文档类集基于 LaTeX3 编写，使用说明详见 [发布区](https://github.com/sjtug/SJTUTeX/releases) 文档。

SJTUTeX 和 SJTUThesis 项目共享讨论区与社区写作模式。如遇问题，请在 [SJTUThesis](https://github.com/sjtug/SJTUThesis) 中反馈。

## 安装至发行版

如果你正在使用 TeX Live 或 MacTeX，可以在终端输入下面的命令安装至本地发行版中。

```bash
cd sjtutex
l3build install
```

也可以将[发布区](https://github.com/sjtug/SJTUTeX/releases/latest)的 `sjtutex.tds.zip` 手动解压到发行版的 TDS 目录下。

## 开发指南

文档类主要代码在 `sjtutex.dtx` 中，需要解包之后才能够使用。

```bash
cd sjtutex
l3build unpack  # 解包
l3build doc     # 文档
l3build check   # 测试
l3build ctan    # 生成发布包
```

### 解包

解包 `source/sjtutex.dtx` 使用
```
l3build unpack
```
解包结果将置于 `build/unpacked` 和 `build/local` 文件夹下。

### 文档

编译文档类文档可以使用

```
l3build doc
```

生成结果将置于 `doc/sjtutex.pdf`。

> 请注意文档类文档 `sjtutex.pdf` 的正确编译需要使用 Noto CJK 字体（即 `ctex` 字体配置中的 `fontset=ubuntu`）。

### 测试

文档类还含有多个测试用例（比如 `sample-thesis-zh`），主要存放于 `testfiles` 文件夹中（支持文件存放于 `testfiles/support` 文件夹）。

测试全部示例使用
```
l3build check
```

上面的过程默认隐藏编译细节。为了查看单个测试用例 `<sample>` 的编译细节，可以使用

```
l3build check <sample>
```

请使用尽可能新版本的 [l3build](https://github.com/latex3/l3build)，更多细节请参见 [l3build 文档](https://mirrors.sjtug.sjtu.edu.cn/CTAN/macros/latex/contrib/l3build/l3build.pdf)（`texdoc l3build`）。

## 软件许可证

上海交通大学校徽图片（`sjtu-vi-logo-blue.pdf` 等）的版权归上海交通大学所有。

其他部分使用 [LPPL](LICENSE) 授权。
