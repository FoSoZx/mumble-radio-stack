FROM debian:buster

ENV UNAME pymumble
ENV HOME /home/${UNAME}
ENV DEBIAN_FRONTEND noninteractive

RUN \
	adduser --disabled-password --disabled-login --gecos "" ${UNAME} && \
	usermod -a -G audio ${UNAME} && \
	apt-get update && \
	apt-get -y install libasound2 alsa-utils portaudio19-dev libopus0 python3-pip && \
	pip3 install pymumble pyaudio


COPY pymumble.py ${HOME}/pymumble.py
#COPY asoundrc ${HOME}/.asoundrc
#COPY asoundrc /etc/asound.conf

RUN \
	chown -R ${UNAME}:${UNAME} ${HOME} && \
	chmod +x ${HOME}/pymumble.py

USER ${UNAME}

ENTRYPOINT ["/home/pymumble/pymumble.py"]
#ENTRYPOINT ["/bin/sleep","10000"]
