# Hugo Docker Image

[![Docker Automated build](https://img.shields.io/docker/automated/jguyomard/hugo-builder.svg)](https://store.docker.com/community/images/jguyomard/hugo-builder)
[![Docker Build Status](https://img.shields.io/docker/build/jguyomard/hugo-builder.svg)](https://store.docker.com/community/images/jguyomard/hugo-builder/builds)
[![Docker Pulls](https://img.shields.io/docker/pulls/jguyomard/hugo-builder.svg)](https://store.docker.com/community/images/jguyomard/hugo-builder)
[![Image Info](https://images.microbadger.com/badges/image/jguyomard/hugo-builder.svg)](https://microbadger.com/images/jguyomard/hugo-builder)

[Hugo](https://gohugo.io/) is a fast and flexible static site generator, written in Go.
Hugo flexibly works with many formats and is ideal for blogs, docs, portfolios and much more.
Hugo’s speed fosters creativity and makes building a website fun again.

This Lightweight Docker Image is based on Alpine, and comes with rsync for Continuous Deployment.

## Get Started

Print Hugo Help:

```bash
docker run --rm -it jguyomard/hugo-builder hugo help
```

Create a new Hugo managed website:

```bash
docker run --rm -it -v $PWD:/src -u hugo jguyomard/hugo-builder hugo new site mysite
cd mysite

# Now, you probably want to add a theme (see https://themes.gohugo.io/):
git init
git submodule add https://github.com/budparr/gohugo-theme-ananke.git themes/ananke;
echo 'theme = "ananke"' >> config.toml
```

Add some content:

```bash
docker run --rm -it -v $PWD:/src -u hugo jguyomard/hugo-builder hugo new posts/my-first-post.md

# Now, you can edit this post, add your content and remove "draft" flag:
xdg-open content/posts/my-first-post.md
```

Build your site:

```bash
docker run --rm -it -v $PWD:/src -u hugo jguyomard/hugo-builder hugo
```

Serve your site locally:

```bash
docker run --rm -it -v $PWD:/src -p 1313:1313 -u hugo jguyomard/hugo-builder hugo server -w --bind=0.0.0.0
```

Then open [`http://localhost:1313/`](http://localhost:1313/) in your browser.

To go further, read the [Hugo documentation](https://gohugo.io/documentation/).

## Bash Alias

For ease of use, you can create a bash alias:

```bash
alias hugo='docker run --rm -it -v $PWD:/src -u hugo jguyomard/hugo-builder hugo'
alias hugo-server='docker run --rm -it -v $PWD:/src -p 1313:1313 -u hugo jguyomard/hugo-builder hugo server --bind 0.0.0.0'
```

Now, you can use `hugo help`, `hugo new foo/bar.md`, `hugo-server -w`, etc.

## Supported tags

The latest builds are:

- [`latest`](https://github.com/jguyomard/docker-hugo/blob/master/Dockerfile)
- [`extras`](https://github.com/jguyomard/docker-hugo/blob/master/extras/Dockerfile)
- [`0.53`](https://github.com/jguyomard/docker-hugo/blob/v0.53/Dockerfile)
- [`0.53-extras`](https://github.com/jguyomard/docker-hugo/blob/v0.53/extras/Dockerfile)

A complete list of available tags can be found on the [docker store page](https://store.docker.com/community/images/jguyomard/hugo-builder/tags).

## Users

By default, this docker image run as the root user. This makes it easy to use as base image for other Dockerfiles (switching back and forth adds extra layers and is against the current [best practices](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#user) advised by Docker). Most (all official?) base images leave the default user as root.

However, this docker image also define a non-root user `hugo` (UID 1000, GID 1000) which can be switched on at run time using the `--user` flag to `docker run`.

```bash
docker run --rm -it -v $PWD:/src --user hugo jguyomard/hugo-builder hugo
```

You can also change this according your needs, by setting another UID/GID. For instance, to run hugo with user `www-data:www-data` (UID 33, GID 33) :

```bash
docker run --rm -it -v $PWD:/src -u 33:33 jguyomard/hugo-builder hugo
```

## Extras

The [`extras`](https://github.com/jguyomard/docker-hugo/blob/master/extras/Dockerfile) tag adds additional tools and packages:

- py-pygments

To use this version:

```bash
docker run --rm -it -v $PWD:/src -u hugo jguyomard/hugo-builder:extras hugo
```

## Continuous Deployment

I use this Docker image for Continuous Deployment. You can find some CI config examples in the [`ci-deploy`](https://github.com/jguyomard/docker-hugo/tree/master/ci-deploy) directory.

This Docker image also comes with:

- rsync
- git
- openssh-client
- [minify](https://github.com/tdewolff/minify)

## Issues

If you have any problems with or questions about this docker image, please contact me through a [GitHub issue](https://github.com/jguyomard/docker-hugo/issues).
If the issue is related to Hugo itself, please leave an issue on the [Hugo official repository](https://github.com/spf13/hugo).

## Contributing

You are invited to contribute new features, fixes or updates to this container, through a [Github Pull Request](https://github.com/jguyomard/docker-hugo/pulls).
