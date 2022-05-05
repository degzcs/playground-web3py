#
# Ganage
#

FROM node:16-bullseye-slim as ganache
#FROM nikolaik/python-nodejs:latest as ganache

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        build-essential \
        python3 && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /etc/apt/sources.list.d/*

RUN npm install --global --quiet npm ganache-cli
RUN mkdir -p /home
WORKDIR /home
EXPOSE 8545

CMD ["ganache-cli", "-h", "0.0.0.0", "-d"]
#, "--host 0.0.0.0"]

#
# WEB3 Python
#

FROM nikolaik/python-nodejs:latest as web3py

# Set up code directory
RUN mkdir -p /home/pn/app
WORKDIR /home/pn/app

# Install Linux dependencies
RUN apt-get update && apt-get install -y libssl-dev

# Copy over requirements
COPY requirements-dev.txt .

# Install python dependencies
RUN pip install -r requirements-dev.txt
RUN set -o vi

USER pn
WORKDIR /home/pn/code
