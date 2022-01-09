FROM debian:stable-slim
RUN apt update && apt install -y curl && apt clean
WORKDIR /root
RUN curl -LO https://github.com/oniony/TMSU/releases/download/v0.7.5/tmsu-x86_64-0.7.5.tgz && tar xzvf tmsu-x86_64-0.7.5.tgz

FROM debian:stable-slim
COPY --from=0 /root/tmsu-x86_64-0.7.5/bin/* /usr/local/bin/
RUN apt update && apt install -y fuse && apt clean

