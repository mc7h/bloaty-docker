FROM ubuntu:latest
RUN apt-get update -y && apt-get install -y \
    git \
    build-essential \
    cmake \
    ninja-build \
    cmake \
    libz-dev \
    && rm -rf /var/lib/apt/lists/*

RUN git clone --recurse-submodules https://github.com/google/bloaty.git /tmp/bloaty
WORKDIR /tmp/bloaty
RUN git submodule update --init --recursive && \
    cmake -B build -G Ninja -S . && \
    cmake --build build && \
    cmake --build build --target install && \
    cd / && \
    rm -rf /tmp/bloaty
WORKDIR /root
ENTRYPOINT ["bloaty"]
CMD ["--help"]