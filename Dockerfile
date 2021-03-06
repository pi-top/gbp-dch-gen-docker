FROM debian:buster-backports

# Root of source code to build
VOLUME /src

# Default script
COPY bump-changelog.sh /bump-changelog
ENTRYPOINT ["/bump-changelog"]

# Install packages via script, to minimise size:
# https://pythonspeed.com/articles/system-packages-docker/

# Install dev packages
COPY  install-dev-packages.sh /.install-dev-packages
RUN /.install-dev-packages

# Snapshot or release mode?
ENV RELEASE 0
