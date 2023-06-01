[![Docker Pulls](https://badgen.net/docker/pulls/d3fk/tailwindcss?icon=docker&label=pulls)](https://hub.docker.com/r/d3fk/tailwindcss/tags) [![Docker Image Size](https://badgen.net/docker/size/d3fk/tailwindcss/latest?icon=docker&label=image%20size)](https://hub.docker.com/r/d3fk/tailwindcss/tags) [![Docker build](https://img.shields.io/docker/cloud/automated/d3fk/tailwindcss?label=build&logo=docker)](https://hub.docker.com/r/d3fk/tailwindcss/tags) [![Build status](https://img.shields.io/docker/cloud/build/d3fk/tailwindcss?label=build%20status&logo=docker)](https://hub.docker.com/r/d3fk/tailwindcss/builds) [![Docker Stars](https://badgen.net/docker/stars/d3fk/tailwindcss?icon=docker&label=stars&color=green)](https://hub.docker.com/r/d3fk/tailwindcss) [![Github Stars](https://img.shields.io/github/stars/Angatar/tailwindcss?label=stars&logo=github&color=green)](https://github.com/Angatar/tailwindcss) [![Github forks](https://img.shields.io/github/forks/Angatar/tailwindcss?logo=github)](https://github.com/Angatar/tailwindcss/fork) [![Github open issues](https://img.shields.io/github/issues-raw/Angatar/tailwindcss?logo=github&color=yellow)](https://github.com/Angatar/tailwindcss/issues) [![Github closed issues](https://img.shields.io/github/issues-closed-raw/Angatar/tailwindcss?logo=github&color=green)](https://github.com/Angatar/tailwindcss/issues?q=is%3Aissue+is%3Aclosed) [![GitHub license](https://img.shields.io/github/license/Angatar/tailwindcss)](https://github.com/Angatar/tailwindcss/blob/master/LICENSE)

# Tailwind CSS (Angatar> d3fk/tailwindcss)
Tiny container image that only contains Tailwind CSS CLI official binaries (downloaded from github official repository in an Alpine container and poured into SCRATCH).
The d3fk/tailwindcss containers will help any project to make use of the Tailwind CSS Framework without requiring Node.js nor npm


## Docker image

Pre-build as multi-arch image from Docker hub with "automated build" option on the source repository.

- image name: **d3fk/tailwindcss**

`docker pull d3fk/tailwindcss`

Docker hub repository: https://hub.docker.com/r/d3fk/tailwindcss/

[![DockerHub Badge](https://lucky-red-wombat.cyclic.app/image/d3fk/tailwindcss?)](https://hub.docker.com/r/d3fk/tailwindcss)


### Image TAGS

***"d3fk/tailwindcss:latest" and "d3fk/tailwindcss:stable" are both provided as multi-arch images.***

*These multi-arch images will fit with the following architectures:*

- *linux/amd64*
- *linux/arm/v6*
- *linux/arm/v7*
- *linux/arm64/v8*

#### --- Latest ---

- **d3fk/tailwindcss:latest** tag provides you with the last version of tailwindcss available: this container image is rebuilt on a regular basis.

#### --- Stable ---

- **d3fk/tailwindcss:stable** tag provides you with a fixed version of tailwind CSS (v3.3.2): this container:stable image won't be rebuilt to **avoid any possible change** in its behaviour.

## Basic usage

```sh
docker run --rm -v $(pwd)/YOUR_PROJECT_DIR:/project \
       d3fk/tailwindcss \
       -i SRC_PATH/tailwind-input.css \
       -o CSS_PATH/tailwind-output.css
```

The container has `/project` for default `WORKDIR` so that the `SRC_PATH`(for your Tailwind CSS input file) and `CSS_PATH`(for your Tailwind CSS build output file) have to be relative to the `/project` directory which corresponds, here, to your local `YOUR_PROJECT_DIR` directory.

## Make it watch for changes

As the files of the project are mounted into the container the `--poll` option has to be used in combination with the `--watch` option to make the container watch properly (by polling instead of using filesystem events) for any change in your source files that would require the output of your tailwind css file to be rebuilt.

```sh
docker run --rm -d --name tailwindcss-builder -v $(pwd)/YOUR_PROJECT_DIR:/project \
       d3fk/tailwindcss \
       -i SRC_PATH/tailwind-input.css \
       -o CSS_PATH/tailwind-output.css \
       --poll --watch
```

Note: we are suggesting to use `docker run -d` to let it watch in background so that you can still use your current console and watch the build processes with `docker logs tailwindcss-builder` .You can then stop & remove (`--rm`) the container with `docker stop tailwindcss-builder`


## Optimizing for Production

You can minify your output CSS by using the `--minify` flag
```sh
docker run --rm -v $(pwd)/YOUR_PROJECT_DIR:/project \
       d3fk/tailwindcss \
       -i SRC_PATH/tailwind-input.css \
       -o CSS_PATH/tailwind-output.css \
       --minify
```

## Documentation

For full documentation, visit [tailwindcss.com](https://tailwindcss.com/).

## Upgrading Tailwind CSS to its last version

Simply pulling the latest tag again will get you our latest build of the d3fk/tailwindcss container image:

`docker pull d3fk/tailwindcss:latest`

In case you need an updated version ahead of our next update you can still rebuild your own image from the Dockerfile.

## License

The content of this [GitHub code repository](https://github.com/Angatar/tailwindcss) is provided under **MIT** licence
[![GitHub license](https://img.shields.io/github/license/Angatar/tailwindcss)](https://github.com/Angatar/tailwindcss/blob/master/LICENSE), as well as the embedded **tailwindcss CLI**, as stated in the Tailwind CSS official repository https://github.com/tailwindlabs/tailwindcss
