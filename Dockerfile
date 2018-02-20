FROM arm32v7/debian:stretch

LABEL maintaner="akshmakov@gmail.com"

WORKDIR  /workspace

COPY ./install.sh /workspace/install.sh

RUN 	export http_proxy=$http_proxy && \
	apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y python3 \
							python3-pip \
							build-essential \
							wget \
							qt5-default \
							qt5-qmake \
							qtbase5-dev-tools \
							&&\
	./install.sh && \
	rm -rf /workspace  && \
	apt-get autoremove -y && \
	rm -rf /var/lib/apt/lists/* && \
	unset http_proxy







