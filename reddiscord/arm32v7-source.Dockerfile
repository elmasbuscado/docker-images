FROM resin/armv7hf-debian:buster

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

LABEL maintainer="Sandro Jäckel <sandro.jaeckel@gmail.com>" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="Red-Discord Bot" \
      org.label-schema.description="A multifunction Discord bot" \
      org.label-schema.url="https://github.com/Cog-Creators/Red-DiscordBot/tree/V3/develop" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/SuperSandro2000/docker-images" \
      org.label-schema.vendor="SuperSandro2000" \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0"

RUN [ "cross-build-start" ]

WORKDIR /app

COPY ["config.json", "/root/.config/Red-DiscordBot/"]
COPY ["libconnector.so", "/files/"]
COPY ["run.sh", "/files/"]

RUN apt-get update \
  && apt-get -qq install --no-install-recommends -y build-essential default-jre-headless git jq libffi-dev libssl-dev python3-aiohttp \
  python3-dev python3-levenshtein python3-pip python3-setuptools python3-yaml unzip zip \
  && pip3 install -Uq --process-dependency-links --no-cache-dir https://github.com/Cog-Creators/Red-DiscordBot/archive/V3/develop.tar.gz#egg=Red-DiscordBot[voice] \
  && curl -Lso Lavalink.jar "$(curl -s https://api.github.com/repos/Cog-Creators/Red-DiscordBot/releases | jq -r '.[0].assets | .[0].browser_download_url')" \
  && mkdir -p natives/linux-arm/ \
  && mv /files/libconnector.so natives/linux-arm/ \
  && zip Lavalink.jar natives/linux-arm/libconnector.so \
  && mv Lavalink.jar /files/ \
  && rm -r natives/ \
  && rm ~/.cache/pip -rf \
  && apt-get -qq remove -y --purge build-essential jq unzip zip \
  && apt-get -qq autoremove -y --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && chmod +x /files/run.sh

RUN [ "cross-build-end" ]

CMD [ "/files/run.sh" ]
