FROM ubuntu:xenial
LABEL Author='Ryan Bernardino <r.bernardino17@gmail.com>'

# Prevent dpkg errors
ENV TERM=xterm-256color

# Set mirrors to local archive for faster package installation time
RUN sed -i "s/http:\/\/archive./http:\/\/ph.archive./g" /etc/apt/sources.list

# Install Python Runtime
RUN apt-get update && \
    apt-get install -y \
    -o APT::Install-Recommend=false -o APT::Install-Suggests=false \
    python python-virtualenv libpython2.7

# Create the virtual environment
# Upgrade PIP in virtual environment to latest version
RUN virtualenv /appenv && \
    . /appenv/bin/activate && \
    pip install pip --upgrade

# Add entrypoint script
ADD scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]