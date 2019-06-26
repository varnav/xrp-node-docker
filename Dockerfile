FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LANGUAGE=C.UTF-8
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

RUN apt-get install --no-install-recommends yum-utils alien ssh openssl wget ca-certificates -y && \
    cd /tmp && \
    wget https://mirrors.ripple.com/ripple-repo-el7.rpm && \
    rpm -Uvh ripple-repo-el7.rpm && \
    yumdownloader --enablerepo=ripple-stable --releasever=el7 rippled && \
    wget -q https://mirrors.ripple.com/rpm/RPM-GPG-KEY-ripple-release && \
    rpm --import RPM-GPG-KEY-ripple-release && rm RPM-GPG-KEY-ripple-release && rpm -K rippled*.rpm && \
    alien -i --scripts rippled*.rpm && rm rippled*.rpm && \
    rm -rf /var/lib/apt/lists/* && \
    export PATH=$PATH:/opt/ripple/bin/ && \
    ln -s /opt/ripple/bin/rippled /usr/bin/rippled

COPY ./bin /usr/local/bin
COPY ./config_samples /config_samples

VOLUME /var/lib/rippled/

EXPOSE 5005 5006 6006 51235

ENTRYPOINT ["entrypoint.sh"]