FROM python:3@sha256:a23efa04a7f7a881151fe5d473770588ef639c08fd5f0dcc6987dbe13705c829

LABEL org.opencontainers.image.source=https://github.com/TEAM-AAAAAAAAAAAAAAAA/InfraCyberDefenseEpitech

RUN pip install jwt flask

COPY . .

CMD [ "python", "server.py" ]