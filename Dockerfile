#FROM ubuntu
# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/baseimage:0.9.16
MAINTAINER Dominic Böttger

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:rwky/nodejs
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ trusty universe" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y nodejs ssh git build-essential python
RUN apt-get install -y catdoc poppler-utils tesseract-ocr unzip libvips-dev
RUN mkdir /var/node

ADD ssh_config /etc/ssh/ssh_config

RUN npm install -g bower

ADD run.sh /
RUN chmod +x /run.sh
EXPOSE 3000
EXPOSE 3443
CMD ["/run.sh"]
