FROM --platform=$BUILDPLATFORM alpine:latest AS downloader
RUN apk add --no-cache jq
ARG TARGETPLATFORM
RUN wget -O tailwindcss https://github.com/tailwindlabs/tailwindcss/releases/download/$(wget -q -O - https://api.github.com/repos/tailwindlabs/tailwindcss/releases/latest | jq -r ".tag_name")/tailwindcss-$(echo $TARGETPLATFORM|sed 's/linux\//linux-/'|sed 's/arm\/v[-,7,6]/armv7/'|sed 's/amd64/x64/') \
    && chmod u+x tailwindcss

FROM scratch
LABEL org.opencontainers.image.authors="d3fk"
COPY --from=downloader tailwindcss tailwindcss
ENTRYPOINT [ "/tailwindcss" ]
WORKDIR /project
