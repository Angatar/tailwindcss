[![Docker Pulls](https://badgen.net/docker/pulls/d3fk/tailwindcss?icon=docker&label=pulls&cache=600)](https://hub.docker.com/r/d3fk/tailwindcss/tags) [![Docker Image Size](https://badgen.net/docker/size/d3fk/tailwindcss/latest?icon=docker&label=image%20size&cache=600)](https://hub.docker.com/r/d3fk/tailwindcss/tags) [![Docker build](https://img.shields.io/badge/automated-automated?style=flat&logo=docker&logoColor=blue&label=build&color=green&cacheSeconds=600)](https://hub.docker.com/r/d3fk/tailwindcss/tags) [![Docker Stars](https://badgen.net/docker/stars/d3fk/tailwindcss?icon=docker&label=stars&color=green&cache=600)](https://hub.docker.com/r/d3fk/tailwindcss) [![Github Stars](https://img.shields.io/github/stars/Angatar/tailwindcss?label=stars&logo=github&color=green&style=flat&cacheSeconds=600)](https://github.com/Angatar/tailwindcss) [![Github forks](https://img.shields.io/github/forks/Angatar/tailwindcss?logo=github&style=flat&cacheSeconds=600)](https://github.com/Angatar/tailwindcss/fork) [![Github open issues](https://img.shields.io/github/issues-raw/Angatar/tailwindcss?logo=github&color=yellow&cacheSeconds=600)](https://github.com/Angatar/tailwindcss/issues) [![Github closed issues](https://img.shields.io/github/issues-closed-raw/Angatar/tailwindcss?logo=github&color=green&cacheSeconds=600)](https://github.com/Angatar/tailwindcss/issues?q=is%3Aissue+is%3Aclosed) [![GitHub license](https://img.shields.io/github/license/Angatar/tailwindcss)](https://github.com/Angatar/tailwindcss/blob/master/LICENSE)

# Tailwind CSS (Angatar> d3fk/tailwindcss)
Tiny container image that only contains Tailwind CSS CLI official binaries (downloaded from Github official repository during the multistage build and poured into SCRATCH).
The d3fk/tailwindcss containers will help any project to make use of the Tailwind CSS Framework without requiring Node.js nor npm


## Docker image

Pre-build as multi-arch image from Docker hub with "automated build" option on the source repository.

- image name: **d3fk/tailwindcss**

`docker pull d3fk/tailwindcss`

Docker hub repository: https://hub.docker.com/r/d3fk/tailwindcss/

[![DockerHub Badge](https://dockeri.co/image/d3fk/tailwindcss)](https://hub.docker.com/r/d3fk/tailwindcss)


### Image TAGS

***"d3fk/tailwindcss" images are provided as multi-arch images.***

*These multi-arch images will fit with the following architectures:*

- *linux/amd64*
- *linux/arm/v6*
- *linux/arm/v7*
- *linux/arm64/v8*

#### --- Latest ---

- **d3fk/tailwindcss:latest** tag provides you with the latest version of tailwindcss available: this container image is rebuilt on a regular basis.


* This image tag is provided for the following architectures:*
- *linux/amd64*
- *linux/arm64/v8*

#### --- v4.x.x ---
Tailwind css v4 is the current version and we will provide some stable versions across history to **prevent any possible change** that can occur in behaviours with version upgrading.
The following stable tags are available, the name of the tag correspond to the Tailwind CSS version as a fixed version and won't be rebuild:

- **d3fk/tailwindcss:v4.0.9** tag provides you with a stable version of the tailwind CSS v4.0.9
  
* These image tags are provided for the following architectures:*
- *linux/amd64*
- *linux/arm64/v8*
- 
#### --- v3---
- **d3fk/tailwindcss:v3** tag provides you with a stable version of the last tailwind CSS v3 (3.4.17) before v4 release: this container:stable image exists to avoid breaking changes and won't be rebuilt to **avoid any possible change** in its behaviour.
*This multi-arch image will fit with the following architectures:*
- *linux/amd64*
- *linux/arm/v6*
- *linux/arm/v7*
- *linux/arm64/v8*

#### --- Stable ---

- **d3fk/tailwindcss:stable** tag provides you with our historical stable version having a fixed version of tailwind CSS (v3.3.2): this container:stable image exists to avoid breaking changes and won't be rebuilt to **avoid any possible change** in its behaviour.

*This image tag is provided for the following architectures:*
- *linux/amd64*
- *linux/arm/v6*
- *linux/arm/v7*
- *linux/arm64/v8*

## Breaking Changes from v3 to v4

- **Tailwind CSS v4** introduces several breaking changes, including updates in configuration and renaming of utilities.
- Ensure to review the [official migration guide](https://tailwindcss.com/docs/upgrading-to-v4) for detailed instructions on how to upgrade from v3 to v4.

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
docker run --rm -id --name tailwindcss-builder -v $(pwd)/YOUR_PROJECT_DIR:/project \
       d3fk/tailwindcss \
       -i SRC_PATH/tailwind-input.css \
       -o CSS_PATH/tailwind-output.css \
       --poll --watch
```

Note: we are suggesting to use `docker run -id` to let it watch in background (the -i option makes it hanging to stdout and -d is detaching the container) so that you can still use your current console and watch the build processes with `docker logs tailwindcss-builder` .You can then stop & remove (`--rm`) the container with `docker stop tailwindcss-builder`


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
