FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .

RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends ffmpeg curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install -U pip \
    && pip3 install -U -r requirements.txt \
    && pip3 install -U yt-dlp

COPY . .

CMD ["bash", "start"]
