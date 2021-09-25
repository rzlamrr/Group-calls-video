# Python Based Docker
FROM python:latest

COPY . /Worker
WORKDIR /Worker

# Installing Packages
RUN apt update && apt upgrade -y
RUN apt install git curl python3-pip ffmpeg -y

# Updating Pip Packages
RUN pip3 install -U pip

# Installing NodeJS
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    npm i -g npm

# requirements
RUN pip intall -r requirements.txt

# Running Video Player Bot
CMD python -m lib
