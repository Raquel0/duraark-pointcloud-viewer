FROM ubuntu:14.04

RUN apt-get clean && apt-get update && apt-get install git curl -y
RUN curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -
RUN apt-get -y install nodejs -y

RUN npm install -g nodemon
RUN mkdir /opt/duraark-pointcloud-viewer

COPY ./src /opt/duraark-pointcloud-viewer
WORKDIR /opt/duraark-pointcloud-viewer

EXPOSE 5016

RUN npm install

VOLUME /var/lib/docker

CMD ["npm start"]
