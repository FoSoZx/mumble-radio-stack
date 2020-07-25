FROM debian:buster

ENV DEBIAN_FRONTEND noninteractive

RUN \
	apt-get update && \
	apt-get install -y \
	liquidsoap libasound2 alsa-utils && \
        usermod -a -G audio liquidsoap

#COPY stream.liq /etc/liquidsoap/stream.liq
#COPY asoundrc ${HOME}/.asoundrc
#COPY asoundrc /etc/asound.conf
COPY test.mp3 /home/liquidsoap/test.mp3

USER liquidsoap

#VOLUME ["/etc/liquidsoap/stream.liq"]

CMD ["/usr/bin/liquidsoap", "--verbose", "/etc/liquidsoap/stream.liq"]
