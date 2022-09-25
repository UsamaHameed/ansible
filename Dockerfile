FROM ubuntu:focal AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt install -y sudo && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

FROM base AS bon
ARG TAGS
RUN addgroup --gid 1000 usama
RUN adduser --disabled-password --gecos '' usama --uid 1000 --gid 1000 
USER usama
WORKDIR /home/usama

FROM bon
COPY . .
CMD ["sh", "-c", "ansible-playbook local.yml"]

