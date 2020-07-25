FROM alpine:3.6

ARG user=icecast
ARG group=icecast
# ARG uid=1000
# ARG gid=1000

RUN apk -q update \
    && apk -q --no-progress add icecast \
    && rm -rf /var/cache/apk/*

COPY docker-entrypoint.sh /usr/local/bin/
COPY silence.ogg /usr/share/icecast/silence.ogg
COPY icecast.xml.template /usr/share/icecast/icecast.xml.template

RUN mkdir -p /var/log/icecast \
    && chown -R ${user}:${group} /usr/share/icecast \
    && chown -R ${user}:${group} /var/log/icecast

EXPOSE 8000

USER ${user}

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["icecast", "-c", "/usr/share/icecast/icecast.xml"]
