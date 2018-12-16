FROM siwatinc/debian-base-image
RUN wget -O- http://downloads.3cx.com/downloads/3cxpbx/public.key | apt-key add -
RUN echo "deb http://downloads.3cx.com/downloads/debian stretch main" | tee /etc/apt/sources.list.d/3cx.list
RUN apt-get -y update
RUN apt-get -y install libcurl3 gnupg2
RUN apt-get -y install net-tools
RUN apt-get -y install $(apt-cache depends 3cxpbx | grep Depends | sed "s/.*ends:\ //" | tr '\n' ' ')
RUN apt-get -y install 3cxpbx
CMD "/lib/systemd/systemd"
