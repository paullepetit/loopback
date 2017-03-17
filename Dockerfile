FROM node:latest

RUN apt update
RUN apt install -y build-essential

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/

RUN npm install
RUN npm install -g loopback-cli
# Bundle app source
COPY . /usr/src/app

EXPOSE 3000 8080 80
CMD [ "npm", "start" ]
