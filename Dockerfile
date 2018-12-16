FROM siwatinc/debian-base-image
ENV DEBIAN_FRONTEND noninteractive
RUN wget -O- http://downloads.3cx.com/downloads/3cxpbx/public.key | apt-key add -
RUN echo "deb http://downloads.3cx.com/downloads/debian stretch main" | tee /etc/apt/sources.list.d/3cx.list
RUN apt-get -y update
RUN apt-get -y install libcurl3 gnupg2
RUN apt-get -y install 3cxpbx
CMD "/lib/systemd/systemd"
