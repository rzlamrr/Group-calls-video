FROM debian:latest
RUN apt update && apt upgrade -y
RUN apt-get install wget -y
RUN apt install git curl python3-pip ffmpeg -y
RUN curl -sL https://deb.nodesource.com/setup_15.x | bash -
RUN apt-get install -y nodejs
RUN npm i -g npm
RUN pip3 install -U pip
COPY . /dir
WORKDIR /dir
RUN pip install -U -r requirements.txt
CMD python3 -m lib
