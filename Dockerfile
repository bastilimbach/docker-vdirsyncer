FROM python:3.6-alpine

ENV VDIRSYNCER_CONFIG="/src/config" \
    CRON="* * * * *"

RUN pip install vdirsyncer

COPY ./src /src
RUN chmod +x /src/sync
RUN chmod +x /src/docker-entrypoint.sh

RUN ls /src

ENTRYPOINT ["sh", "/src/docker-entrypoint.sh"]
