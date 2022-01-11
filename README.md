[logo]: https://github.com/authelia/authelia/raw/master/docs/images/authelia-title.png "Authelia"
[![alt text][logo]](https://www.authelia.com/)

# authelia/debpackager
[![Docker Pulls](https://img.shields.io/docker/pulls/authelia/debpackager.svg)](https://hub.docker.com/r/authelia/debpackager/) [![Docker Stars](https://img.shields.io/docker/stars/authelia/debpackager.svg)](https://hub.docker.com/r/authelia/debpackager/)

This custom image is based on the `{arm32v7|arm64v8}/ubuntu:latest` to provide an Ubuntu Build System to support the continuous deployment function for Authelia's deb packages.
The image will be re-built if any updates are made to the base images.

## Usage

Here are some example snippets to help you get started utilising this container.

### docker

```
docker run \
  --rm \
  --name=debpackager \
  -v <path to data>:/build \
  --platform linux/arm/v7 \ 
  authelia/debpackager \
  bash -c "cd /build && makedeb"
```

```
docker run \
  --rm \
  --name=debpackager \
  -v <path to data>:/build \
  --platform linux/arm64 \
  authelia/debpackager \
  bash -c "cd /build && makedeb"
```

## Version
- **16/09/2021:** Update for buildx usage
- **11/09/2021:** Replace makedeb-alpha with makedeb and add Buildkite configuration
- **24/06/2021:** Initial release