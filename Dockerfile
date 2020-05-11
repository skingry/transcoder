FROM ubuntu
MAINTAINER Seth Kingry <sjkingry@gmail.com>

ARG DEBIAN_FRONTEND=noninteractive

# Update package repos
RUN apt-get -q update

# Install the prerequisites
RUN apt-get install -y software-properties-common \
                       dvdauthor \
                       genisoimage \
                       growisofs \
                       jq \
                       sqlite3 \
                       python3-pip

# Install ffmpeg
RUN apt-get install -y ffmpeg

# Install ffmpeg-normalize
RUN pip3 install ffmpeg-normalize

# Install scripts
COPY check_resolution /bin/check_resolution
COPY common_functions /common_functions
COPY make_dvd /bin/make_dvd
COPY process /bin/process
COPY queue /bin/queue

CMD [ "process" ]
