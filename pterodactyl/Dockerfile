FROM        registry.gitlab.steamos.cloud/steamrt/sniper/platform:latest-container-runtime-depot
LABEL       author="SkuZZi" maintainer="contact@skuzzi.ro"
LABEL       org.opencontainers.image.description SteamRT3 Docker Image with GDB, FFmpeg, and yt-dlp.
LABEL       org.opencontainers.image.source="https://github.com/swiftly-solution/docker-images"

RUN         mkdir -p /etc/sudoers.d && echo "%sudo ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/flatdeb && chmod 0440 /etc/sudoers.d/flatdeb
ENV         DEBIAN_FRONTEND=noninteractive

RUN         apt update && apt install -y iproute2 gdb git build-essential yasm cmake libx264-dev libx265-dev libvpx-dev libfdk-aac-dev pkg-config nasm python3 python3-pip ffmpeg && apt-get clean

RUN git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg && \
    cd ffmpeg && \
    ./configure --enable-gpl --enable-nonfree --enable-libx264 --enable-libx265 --enable-libvpx --enable-libfdk-aac && \
    make -j$(nproc) && \
    make install && \
    cd .. && rm -rf ffmpeg

RUN pip3 install yt-dlp

RUN         git clone https://github.com/peadar/pstack; cd pstack; mkdir build; cd build; cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo ..; make -j4; make install; cd ../..; rm -rf pstack

WORKDIR     /home/container
COPY        ./entrypoint.sh /entrypoint.sh

# Drop to non-root user dynamically in entrypoint if needed
CMD         [ "/bin/bash", "/entrypoint.sh" ]
