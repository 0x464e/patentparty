ARG VARIANT=dj
ARG IMAGE_TAG=latest

FROM ghcr.io/9001/copyparty-${VARIANT}:${IMAGE_TAG}

ARG VARIANT

# Remove the H265- and non-LC-AAC-stripped FFmpeg and reinstall a normal, full-featured FFmpeg
# For iv/dj, also reinstall vips-heif
# For dj, keyfinder-cli is removed and then reinstalled because it depends on FFmpeg
RUN set -eux; \
    if [ "$VARIANT" = "dj" ]; then \
        apk del --no-network keyfinder-cli ffmpeg 'ffmpeg-*'; \
        apk add --no-cache ffmpeg keyfinder-cli vips-heif; \
    elif [ "$VARIANT" = "iv" ]; then \
        apk del --no-network ffmpeg 'ffmpeg-*'; \
        apk add --no-cache ffmpeg vips-heif; \
    elif [ "$VARIANT" = "ac" ]; then \
        apk del --no-network ffmpeg 'ffmpeg-*'; \
        apk add --no-cache ffmpeg; \
    else \
        echo "Only dj/iv/ac variants have FFmpeg, no need to build anything else"; \
        exit 1; \
    fi; \
    # ensure the newly installed FFmpeg indeed has H265 support
    ffmpeg -hide_banner -decoders | grep -qiE '^[[:space:]]*V.*[[:space:]]hevc[[:space:]]'
