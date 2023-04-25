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
        autoconf \ 
        automake \
        ca-certificates \
        curl \
        default-jdk \
        g++ \
        gcc \
        git \
        gosu \
        less \
        make \
        openssh-server \
        perl \
        python3-dev \
        sudo \
        unzip \
        vim \
        wget \
    && apt -y autoremove \
    && apt clean \
    && rm -rf /var/lib/apt/lists/* \
    && sed -i 's/^#Port 22$/Port 22/' /etc/ssh/sshd_config \
    && sed -i 's/^#AddressFamily any$/AddressFamily any/' /etc/ssh/sshd_config \
    && sed -i 's/^#ListenAddress 0.0.0.0$/ListenAddress 0.0.0.0/' /etc/ssh/sshd_config \
    && sed -i 's/^#PasswordAuthentication yes$/PasswordAuthentication yes/' /etc/ssh/sshd_config

RUN set -e \
    && ln -s python3 /usr/bin/python \
    && wget https://bootstrap.pypa.io/get-pip.py \
    && python get-pip.py \
    && rm get-pip.py \
    && pip install -U --no-cache-dir pip \
    && pip install --no-cache-dir \
        biopython \
        jupyterlab \
        matplotlib \
        numpy \
        opencv-python \
        openpyxl \
        pandas \
        pillow \
        seaborn \
        scikit-learn \
        scipy \
        tqdm \
        xlrd


COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
EXPOSE 8888 
EXPOSE 22


