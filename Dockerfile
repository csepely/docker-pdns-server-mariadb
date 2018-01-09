FROM csepely/syslog-ng:latest
RUN apt-get update &&\
  apt-get upgrade -y &&\
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends pdns-server pdns-recursor pdns-backend-mysql &&\
  rm -rf /var/lib/apt/lists/*
RUN ln -rs /docker.init/modules.available/pdns.sh /docker.init/modules.enabled/001-pdns.sh
EXPOSE 53/tcp 53/udp

