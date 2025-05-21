# Build stage
FROM debian:bookworm AS build
RUN apt-get update -y && apt-get install -y \
  git build-essential cmake ninja-build libz-dev \
  && rm -rf /var/lib/apt/lists/*

RUN git clone --depth=1 --recurse-submodules https://github.com/google/bloaty.git /tmp/bloaty
WORKDIR /tmp/bloaty

RUN git submodule update --init --recursive \
  && cmake -B build -G Ninja -S . \
  && cmake --build build --target install

# Final image
FROM debian:bookworm-slim
COPY --from=build /usr/local/bin/bloaty /usr/local/bin/bloaty
ENTRYPOINT ["bloaty"]
CMD ["--help"]
