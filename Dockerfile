FROM python:3
USER root

LABEL maintainer yoshi <yoshitaka_8an9drums@msn.com>
RUN add-apt-repository ppa:fish-shell/release-2 -y
RUN add-apt-repository ppa:mosquitto-dev/mosquitto-ppa -y
RUN apt-get update
RUN apt-get -y install locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

wget http://repo.mosquitto.org/debian/mosquitto-repo.gpg.key
apt-key add mosquitto-repo.gpg.key
wget http://repo.mosquitto.org/debian/mosquitto-jessie.list -O /etc/apt/sources.list.d/mosquitto-jessie.list
mosquitto : Depends: libssl1.0.0 (>= 1.0.0) but it is not installable
             Depends: libwebsockets3 (>= 1.2) but it is not installable
E: Unable to correct problems, you have held broken packages.

RUN apt-get install -y vim less fish mosquitto
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN apt-get install -y wget
RUN wget -P ~/ https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh
RUN bash ~/Anaconda*.sh -b -p $HOME/anaconda
RUN eval "$(~/anaconda/bin/conda shell.bash hook)"

RUN apt-get -y install nginx
ENTRYPOINT /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
RUN sed -i -e "/^http/a \ \ \ \ server \{\n\tlocation \/ \{\n\t\troot \/var\/www\;\n\t\}\n\n\ \ \ \ \}" /etc/nginx/nginx.conf

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/var/log/nginx", "/var/www"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["nginx"]

# Expose ports.
EXPOSE 80
EXPOSE 443
