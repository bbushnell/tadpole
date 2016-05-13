FROM debian:jessie
MAINTAINER Brian Bushnell, bbushnell@lbl.gov

RUN apt-get update -y
RUN apt-get install -y default-jre

ADD https://sourceforge.net/projects/bbmap/files/BBMap_35.92.tar.gz /tmp/
RUN tar xzf https://sourceforge.net/projects/bbmap/files/BBMap_35.92.tar.gz
WORKDIR /bbmap
RUN mv bin/* /usr/local/bin/
RUN mv share/* /usr/local/share/

ADD run /usr/local/bin/
ADD Procfile /
WORKDIR /

ENTRYPOINT ["/usr/local/bin/run"]
