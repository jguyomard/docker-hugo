# Hugo Docker Image

[Hugo](https://gohugo.io/) is a fast and flexible static site generator, written in Go. 
Hugo flexibly works with many formats and is ideal for blogs, docs, portfolios and much more. 
Hugo’s speed fosters creativity and makes building a website fun again.

This Lightweight Docker Image is based on Alpine, and comes with rsync for Continuous Deployment.

## Running

To print Hugo Help:

```bash
docker run --rm -it jguyomard/hugo-builder hugo help
```

To create a new Hugo managed website:

```bash
docker run --rm -it -v $PWD:/src jguyomard/hugo-builder hugo new site mysite
cd mysite
```

To build your site:
 
```bash
docker run --rm -it -v $PWD:/src jguyomard/hugo-builder hugo 
```

To serve your site locally:

```bash
docker run --rm -it -v $PWD:/src -p 1313:1313 jguyomard/hugo-builder hugo server -w --bind=0.0.0.0 
```

Then open [`http://localhost:1313/`](http://localhost:1313/) in your browser.

## Bash Alias

For ease of use, you can create a bash alias:

```bash
alias hugo='docker run --rm -it -v $PWD:/src jguyomard/hugo-builder hugo'
alias hugo-server='docker run --rm -it -v $PWD:/src -p 1313:1313 jguyomard/hugo-builder hugo server --bind 0.0.0.0'
```

Now, you can use `hugo help`, `hugo new foo/bar.md`, `hugo-server -w`, etc.


## Supported tags

* [`latest`](https://github.com/jguyomard/docker-hugo/blob/master/Dockerfile).


## Continuous Deployment

I use this Docker image for Continuous Deployment. You can find some CI config examples on `ci-deploy` directory.

This Docker image also comes with:

- rsync
- openssh-client
- [minify](https://github.com/tdewolff/minify)


## Issues

If you have any problems with or questions about this docker image, please contact me through a [GitHub issue](https://github.com/jguyomard/docker-hugo/issues). 
If the issue is related to Hugo itself, please leave an issue on the [Hugo official repository](https://github.com/spf13/hugo).


## Contributing

You are invited to contribute new features, fixes or updates to this container, through a [Github Pull Request](https://github.com/jguyomard/docker-hugo/pulls).
