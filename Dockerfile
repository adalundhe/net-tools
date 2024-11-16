ARG DISTRIBUTION=bookworm

FROM debian:${DISTRIBUTION}-slim

ARG USERNAME=netuser
ARG USER_UID=5000
ARG USER_GID=$USER_UID

RUN apt update -y && apt install -y \
    iproute2 \
    iputils-ping \
    net-tools \
    traceroute \
    dnsutils \
    curl \
    iptables \
    netcat-traditional \
    wrk \
    sudo

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

USER netuser

CMD [ "sleep", "infinity" ]