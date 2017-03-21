FROM node:latest

RUN apt update
RUN apt install -y build-essential apt-utils
RUN apt-get install mysql-client -y

# Copy run script #
COPY run.sh /root/run.sh
RUN chmod 777 /root/run.sh

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY ./data/ /usr/src/app/

# Install app dependencies
RUN npm install
RUN npm install -g loopback-cli
RUN npm install loopback-connector-mysql --save

# Bundle app source
COPY ./data/ /usr/src/app

EXPOSE 3000 8080 80
CMD [ "/root/run.sh" ]
