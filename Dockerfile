FROM python:3.6-alpine

ENV VDIRSYNCER_CONFIG="/src/config" \
    CRON="* * * * *" \
    UID="1001" \
    GID="1001" \
    VERBOSITY=""

RUN pip install vdirsyncer

COPY ./src /src
RUN chmod +x /src/sync
RUN chmod +x /src/docker-entrypoint.sh
RUN chmod 777 /dev/stdout

ENTRYPOINT ["sh", "/src/docker-entrypoint.sh"]
