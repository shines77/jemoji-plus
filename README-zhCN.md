# jekyll-emoji

[![Gem Version](https://badge.fury.io/rb/jemoji.svg)](http://badge.fury.io/rb/jemoji)
[![Build Status](https://travis-ci.org/jekyll/jemoji.svg?branch=master)](https://travis-ci.org/jekyll/jemoji)

**[English ReadMe](https://github.com/shines77/jekyll-emoji/blob/master/README.md) | [Change Log](https://github.com/shines77/jekyll-emoji/blob/master/CHANGELOG.md)**

这是一个用于 `Jekyll` 的高度定制的 `emoji` 插件。

这个 `Jekyll` 插件是基于 `jemoji v0.10.2` ([https://github.com/github/jemoji](https://github.com/github/jemoji)) 修改的。

## 用法

在你的 `Jekyll` 网站的 `Gemfile` 文件中添加如下内容：

```
gem 'jekyll-emoji'
```

在你的 `Jekyll` 网站的 `_config.yml` 文件中添加如下内容：

```yml
plugins:
  - jekyll-emoji
```

💡 如果你的 `Jekyll` 版本低于 `3.5.0`, 则用 `gems` 代替 `plugins`, 像这样：

```yml
gems:
  - jekyll-emoji
```

在任何页面或帖子中，像平常一样使用表情符号，例如：

```markdown
I give this plugin two :+1:!
```

效果预览:

`I give this plugin two :+1:!`

## Emoji 图片

For GitHub Pages sites built on GitHub.com, emoji images are served from the GitHub.com CDN, with a base URL of `https://github.githubassets.com`, which results in emoji image URLs like `https://github.githubassets.com/images/icons/emoji/unicode/1f604.png`.

On GitHub Enterprise installs, page builds receive the `ASSET_HOST_URL` environment variable, which contain a value like `https://assets.ghe.my-company.com`. This results in emoji images for GitHub Pages sites built on a GitHub Enterprise install being served at URLs like `https://assets.ghe.my-company.com/images/icons/emoji/unicode/1f604.png`.

## 定制化

如果您想在本地提供 `emoji` 符号图像，或使用自定义 `emoji` 符号源，您可以在 `_config.yml` 文件中指定：

```yml
jekyll-emoji:
  host: 'https://github.githubassets.com'   # The emoji's image host url, the trailing can't end with '/', but it's can be setting to '' (empty string).
  path: '/images/icons'                     # The emoji's image path of above host url, must start with '/' character, but it's can be setting to '' (empty string).

  image:
    class: 'emoji'    # The emoji's css class name.
    format: 'png'     # The emoji's image filename format.
    width: 20         # The emoji's image width.
    height: 20        # The emoji's image height.

  format:
    #
    # [image-baseurl]: The emoji's image base URL, value = '[jekyll-emoji.host][jekyll-emoji.path]'
    # [image-filename]: The emoji's image filename, like: '1f371'
    # [image-format]: The emoji's image filename format, like: 'png'
    #
    # Example:
    #
    #   https://github.githubassets.com/images/icons/emoji/unicode/1f371.png?v8
    #
    image-src: '[image-baseurl]/emoji/unicode/[image-filename].[image-format]?v8'

    #
    # [emoji-class]: The emoji's css class name, value = [jekyll-emoji.image.class]
    # [emoji-name]: The emoji's alias name.
    # [emoji-image-src]: The emoji's image source url, value = [jekyll-emoji.format.image-src]
    #
    # Example:
    #
    #   <img class="github-emoji" title="bento" alt="bento" src="https://github.githubassets.com/images/icons/emoji/unicode/1f371.png?v8" height="20" width="20" />
    #
    emoji-html: '<img class="[emoji-class]" title="[emoji-name]" alt="[emoji-name]" src="[emoji-image-src]" width="[emoji-width]" height="[emoji-height] />'
```

See the [Gemoji](https://github.com/github/gemoji) documentation for generating image files.
