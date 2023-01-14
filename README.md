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
l3build doc     # 编译示例及文档
l3build ctan    # 生成发布包
```

在您提交 PR 时，GitHub Action 会自动构建文档 PDF。

## 致谢

* 感谢 [CTeX-kit](https://github.com/CTeX-org/ctex-kit) 提供了 LaTeX 的中文支持
* 感谢那位最先制作出博士学位论文 LaTeX 模板的交大物理系同学
* 感谢 William Wang 同学对模板移植做出的巨大贡献
* 感谢 [@weijianwen](https://github.com/weijianwen) 学长一直以来的开发和维护工作
* 感谢 [@sjtug](https://github.com/sjtug) 以及 [@dyweb](https://github.com/dyweb) 对 0.9.5 之后版本的开发和维护工作
* 感谢所有为模板贡献过代码的[同学们](https://github.com/sjtug/SJTUThesis/graphs/contributors)，以及所有测试和使用模板的各位同学

## 软件许可证

上海交通大学校徽图片（`sjtu-vi-logo-blue.pdf` 等）的版权归上海交通大学所有。

其他部分使用 [LPPL](LICENSE) 授权。
