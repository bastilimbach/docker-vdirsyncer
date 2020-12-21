FROM python:3.6-alpine

ENV VDIRSYNCER_CONFIG="/src/config" \
    CRON="* * * * *" \
    UID="1001" \
    GID="2000"

RUN pip install vdirsyncer

COPY ./src /src
RUN chmod +x /src/sync
RUN chmod +x /src/docker-entrypoint.sh
RUN addgroup -g "$GID" cronuser
RUN adduser -D -u "$UID" -G cronuser cronuser
RUN addgroup cronuser tty
RUN chown cronuser /src
RUN chmod 777 /dev/stdout

ENTRYPOINT ["sh", "/src/docker-entrypoint.sh"]
