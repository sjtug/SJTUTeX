# SJTUTeX

SJTUTeX 是 [SJTUThesis](https://github.com/sjtug/SJTUThesis) 项目使用的宏包。
对于 LaTeX 模版的更改，都应该在这个 repo 中进行，而后把编译后的结果同步到 SJTUThesis。

## 欢迎使用上海交通大学论文模板

这是为撰写上海交通大学学士、硕士、博士学位论文以及课程论文而准备的（非官方）LaTeX 模板。

本模板目前仅支持 XeTeX 引擎，字符编码仅支持 UTF-8。

## 反馈问题 / 贡献代码

SJTUTeX 和 SJTUThesis 项目共享讨论区与社区写作模式。如遇问题，请在 [SJTUThesis](https://github.com/sjtug/SJTUThesis) 中反馈。

## 致谢

* 感谢 [CTeX](http://www.ctex.org/HomePage) 提供了 LaTeX 的中文支持
* 感谢那位最先制作出博士学位论文 LaTeX 模板的交大物理系同学
* 感谢 William Wang 同学对模板移植做出的巨大贡献
* 感谢 [@weijianwen](https://github.com/weijianwen) 学长一直以来的开发和维护工作
* 感谢 [@sjtug](https://github.com/sjtug) 以及 [@dyweb](https://github.com/dyweb) 对 0.9.5 之后版本的开发和维护工作
* 感谢所有为模板贡献过代码的[同学们](https://github.com/sjtug/SJTUThesis/graphs/contributors)，以及所有测试和使用模板的各位同学

## 使用方法

`sjtuthesis.dtx` 可以生成 SJTUThesis 项目所需要的 TeX 文件，以及一个 pdf 格式的说明文档。

```bash
cd source && make build
```

在您提交 PR 时，GitHub Action 会自动构建文档 pdf。

## 软件许可证

上海交通大学校徽图片(`sjtu-vi-logo-blue.pdf` 等)的版权归上海交通大学所有。

其他部分使用 [LPPL](LICENSE) 授权。
