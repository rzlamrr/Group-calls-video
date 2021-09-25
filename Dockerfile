FROM python:3.9.0

COPY . /IU
WORKDIR /IU

RUN apt update -qqy \
    && apt install --no-install-recommends git curl ffmpeg -qqy \
    && curl -sL https://deb.nodesource.com/setup_15.x | bash - \
    && apt-get install -y nodejs \
    && npm i -g npm \
    && git clone https://github.com/Imszy17/addon-telegram-vc lib/etc \
    && pip install -U -r requirements.txt \
    && rm -rf /var/lib/apt/lists/*

CMD python -m lib
