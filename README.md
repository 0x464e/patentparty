# patentparty
### copyparty with patent-restricted features added back in

patentparty is a drop-in replacement for the official Docker image of copyparty.  
It adds back in H265/HEVC, HEIF and non-LC AAC support.  
These features were [removed](https://github.com/9001/copyparty/commit/1bec91d11ca2f35313053c2a8d9bc6415ed38128) from copyparty 
due to [wanting to avoid patent issues](https://github.com/9001/copyparty/blob/hovudstraum/docs/bad-codecs.md).

All credits for the copyparty application go to the original author, [ed, "9001"](https://github.com/9001).


# Docker Images
This repo only builds docker images (since it's the only real affected platform)  
The docker images are found on [Docker hub](https://hub.docker.com/r/0x464e/patentparty).  

The build pipeline polls for new upstream copyparty releases every hour.  
So, in the worst case it may take up to about 2 hours for a patentparty image to
appear on Docker hub after a new copyparty release.

The image's tagging scheme is as follows: `0x464e/patentparty:variant-version`  
So, the available images are:

### ac
- `0x464e/patentparty:ac-1.20.10` - version tagged
- `0x464e/patentparty:ac-latest` - latest ac version
- `0x464e/patentparty` - the default untagged is same as `ac-latest`

### iv 
- `0x464e/patentparty:iv-1.20.10` - version tagged
- `0x464e/patentparty:iv-latest` - latest iv version

### dj
- `0x464e/patentparty:dj-1.20.10` - version tagged
- `0x464e/patentparty:dj-latest` - latest dj version

# Compatibility

patentparty is used exactly like the official copyparty Docker images.  
Any and every config option, feature, etc. works exactly the same as with the official image.  
Refer to the official copyparty documentation for usage.

# Building
If you want to build the images yourself instead of using the images my pipeline pushes to Docker hub,
you can easily do so by cloning this repo (or by just downloading the Dockerfile(https://github.com/0x464e/patentparty/blob/master/Dockerfile))
and then building the variant (ac, iv or dj) of your choice by running:

```sh
docker build -t patentparty-dj --build-arg VARIANT=dj .
```

If you want to build a version other than the latest,
you can add build arg: `--build-arg IMAGE_TAG=1.20.10` 
