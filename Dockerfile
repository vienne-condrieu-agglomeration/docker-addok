FROM debian:stretch
MAINTAINER Fabien ALLAMANCHE / docker-addok

RUN apt-get -y update && apt-get -y install curl wget unzip vim sudo redis-server python3.5 python3.5-dev python-pip python-virtualenv \
    && apt-get clean \
    && rm -r /var/lib/apt/lists/*
	
RUN useradd igeo --create-home && \
    adduser igeo sudo && \
    echo "igeo ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers && \
    mkdir -p /home/igeo
	
#RUN mkdir -p /home/igeo/addok && chmod -Rf 777 /home/igeo/addok

RUN cd /home/igeo && virtualenv addok --python=/usr/bin/python3.5
RUN cd /home/igeo/addok && pwd && ls -l

#WORKDIR /home/igeo/addok
RUN source /home/igeo/addok/bin/activate

RUN pip install addok

#EXPOSE 80 443