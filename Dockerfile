FROM debian:12.1
RUN apt update
RUN apt -y install libxml2-utils=2.9.14+dfsg-1.3~deb12u1
RUN useradd -u 1000 docker_user
USER docker_user

