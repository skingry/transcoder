FROM ubuntu:latest
MAINTAINER Seth Kingry <sjkingry@gmail.com>

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

# Add the ffmpeg repository
RUN apt-add-repository ppa:jonathonf/ffmpeg-4

# Update the package repos again
RUN apt-get -q update

# Install ffmpeg
RUN apt-get install -y ffmpeg

# Install ffmpeg-normalize
RUN pip3 install ffmpeg-normalize

# Install scripts
COPY src/check_resolution /bin/check_resolution
COPY src/common_functions /common_functions
COPY src/make_dvd /bin/make_dvd
COPY src/process /bin/process
COPY src/queue /bin/queue

CMD [ "process" ]
