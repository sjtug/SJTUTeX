# SJTUTeX

## 简介

SJTUTeX 是 [SJTUThesis](https://github.com/sjtug/SJTUThesis) 项目使用的宏集，
包含上海交通大学（非官方）学位论文文档类 `sjtuthesis`，课程报告文档类 `sjtureport`，课程文稿文档类 `sjtuarticle`。
对于 LaTeX 模版的更改，都应该在这个 repo 中进行，而后把解包后的结果同步到 SJTUThesis。

本文档类集基于 LaTeX3 编写，使用说明详见 [发布区](https://github.com/sjtug/SJTUTeX/releases) 文档。

SJTUTeX 和 SJTUThesis 项目共享讨论区与社区写作模式。如遇问题，请在 [SJTUThesis](https://github.com/sjtug/SJTUThesis) 中反馈。

## 开发指南

文档类主要代码在 `sjtutex.dtx` 中，需要解包之后才能够使用。

```bash
cd sjtutex
l3build unpack  # 解包
l3build doc     # 编译全部示例及文档
l3build ctan    # 生成发布包
```

文档类还含有多个示例（比如 `sample-thesis-zh`），主要存放于 `doc` 文件夹中（支持文件存放于 `support` 文件夹），编译单个示例  `<sample>` 可使用

```bash
l3build doc <sample>
```

仅编译文档类文档可以使用

```bash
l3build doc sjtutex
```

在您提交 PR 时，GitHub Action 会自动构建文档 PDF。

## 软件许可证

上海交通大学校徽图片（`sjtu-vi-logo-blue.pdf` 等）的版权归上海交通大学所有。

其他部分使用 [LPPL](LICENSE) 授权。
