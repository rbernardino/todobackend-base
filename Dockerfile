FROM ubuntu:xenial
LABEL Author='Ryan Bernardino <r.bernardino17@gmail.com>'

# Prevent dpkg errors
ENV TERM=xterm-256color

# Set mirrors to local archive for faster package installation time
RUN sed -i "s/http:\/\/archive./http:\/\/ph.archive./g" /etc/apt/sources.list