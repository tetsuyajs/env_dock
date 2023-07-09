FROM ubuntu:20.04

ENV TZ=Asia/Tokyo
ENV LANG C.UTF-8
ENV LANGUAGE en_US
ENV TERM xterm-256color

RUN set -e \
    && ln -sf bash /bin/sh

RUN set -e \
    && apt -y update \
    && apt -y dist-upgrade \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && apt -y install --no-install-recommends --no-install-suggests \
        ca-certificates \
        ffmpeg \
        gosu \
        python3-dev \
        sudo \
        wget \
    && apt -y autoremove \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

RUN set -e \
    && ln -s python3 /usr/bin/python \
    && wget https://bootstrap.pypa.io/get-pip.py \
    && python get-pip.py \
    && rm get-pip.py \
    && pip install -U --no-cache-dir pip \
    && pip install --no-cache-dir \
        ffmpeg-python \
        yt-dlp 

WORKDIR /out

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
#COPY download.py /usr/local/bin/download.py
RUN chmod +x /usr/local/bin/entrypoint.sh
#RUN chmod +x /usr/local/bin/download.py
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]


