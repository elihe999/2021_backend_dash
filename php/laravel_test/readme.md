# Laravel

## Laravel Sail

<https://learnku.com/docs/laravel/8.x/sail>

```bash
curl -s https://laravel.build/my-inspiring-app | bash
```
## Laradock

### Laradock 还是 Homestead

最后，我们绕不开的话题是作为开发环境，选择 Docker（Laradock） 还是 Vagrant（Homestead），Mac 系统上官方还提供了 Valet，尝鲜的话、做Demo或者快速学习为目的当然 Valet 还是不二之选，因为它最小巧、最轻量级，上手最快，天下武功，唯快不破。

至于 Laradock 还是 Homestead，就是见仁见智了，就功能而言，两者不分伯仲。Laradock 相对 Homestead 而言更加轻量级，因为正如前面所言，Homestead 是 VM 级别的虚拟化解决方案，依赖一个完整的操作系统，虽然功能很全，但是很重，而 Laradock 是容器，只依赖那些它必需的软件，更加灵活，更加高效。

还有一点需要提及的是 Docker 可以用于本地也可以用于线上，所谓 same environment everywhere，而 Vagrant 部署的 Homestead 开发环境只能用于本地，这一点也可以作为重要考量因素。

## Laragon

<https://udomain.dl.sourceforge.net/project/laragon/releases/4.0/laragon-full.exe>

https://laragon.org/