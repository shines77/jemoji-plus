# jemoji-plus

[![Gem Version](https://badge.fury.io/rb/jemoji.svg)](http://badge.fury.io/rb/jemoji)
[![Build Status](https://travis-ci.org/jekyll/jemoji.svg?branch=master)](https://travis-ci.org/jekyll/jemoji)

**[[中文说明](https://github.com/shines77/jemoji-plus/blob/master/README-zhCN.md)] | [[Change Log](https://github.com/shines77/jemoji-plus/blob/master/ChangeLog.md)]**

Highly customized version emoji plugin for Jekyll.

This plugin is fork and modify base `jemoji v0.10.2` ([https://github.com/github/jemoji](https://github.com/github/jemoji)).

## Usage

Add the following to your site's `Gemfile`

```
gem 'jemoji-plus'
```

And add the following to your site's `_config.yml`

```yml
plugins:
  - jemoji-plus
```

💡 If you are using a Jekyll version less than `3.5.0`, use the `gems` key instead of `plugins`, like this:

```yml
gems:
  - jemoji-plus
```

In any page or post, use emoji as you would normally, e.g.

```markdown
I give this plugin two :+1:!
```

Effect preview:

`I give this plugin two :+1:!`

## Emoji images

For GitHub Pages sites built on GitHub.com, emoji images are served from the GitHub.com CDN, with a base URL of `https://github.githubassets.com`, which results in emoji image URLs like `https://github.githubassets.com/images/icons/emoji/unicode/1f604.png`.

On GitHub Enterprise installs, page builds receive the `ASSET_HOST_URL` environment variable, which contain a value like `https://assets.ghe.my-company.com`. This results in emoji images for GitHub Pages sites built on a GitHub Enterprise install being served at URLs like `https://assets.ghe.my-company.com/images/icons/emoji/unicode/1f604.png`.

## Customizing

If you'd like to serve emoji images locally, or use a custom emoji source, you can specify so in your `_config.yml` file:

```yml
emoji_plus:
  # The emoji's image host url, 'https://github.githubassets.com' (default).
  # The trailing can't end with '/', and it's can be setting to '' (empty string).
  host: 'https://github.githubassets.com'
  
  # The emoji's image path of above host url, '/images/icons/' (default).
  # If it must start with '/' character, and it's can not be a empty string.
  path: '/images/icons/'

  image:
    class: 'emoji'    # The emoji's css class name. 'emoji' (default)
    ext_name: 'png'   # The emoji's image file extension. 'png' (default), 'jpg', 'jpeg', 'svg'
    width: 20         # The emoji's image width. 20 (default)
    height: 20        # The emoji's image height. 20 (default)

  format:
    #
    # [image-baseurl]: The emoji's image base URL, value = '[jemoji_plus.host][jemoji_plus.path]'
    # [image-filename]: The emoji's image file name, like: '1f371'
    # [image-extname]: The emoji's image file extension, like: 'png'
    #
    # Example:
    #
    #   https://github.githubassets.com/images/icons/emoji/unicode/1f371.png?v8
    #
    image_src: '[image-baseurl]emoji/unicode/[image-filename].[image-extname]?v8'

    #
    # [emoji-class]: The emoji's css class name, value = [jemoji_plus.image.class]
    # [emoji-name]: The emoji's alias name.
    # [emoji-image-src]: The emoji's image source url, value = [jemoji_plus.format.image_src]
    #
    # Example:
    #
    #   <img class="github-emoji" title="bento" alt="bento" src="https://github.githubassets.com/images/icons/emoji/unicode/1f371.png?v8" width="20" height="20" />
    #
    emoji_html: '<img class="[emoji-class]" title="[emoji-name]" alt="[emoji-name]" src="[emoji-image-src]" width="[emoji-width]" height="[emoji-height] />'
```

See the [Gemoji](https://github.com/github/gemoji) documentation for generating image files.
