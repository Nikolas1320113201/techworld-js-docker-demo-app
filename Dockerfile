FROM node:13-alpine
FROM jenkins/jenkins

USER root

ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

RUN mkdir -p /home/app

COPY ./app /home/app

# set default dir so that next commands executes in /home/app dir
WORKDIR /home/app

# will execute npm install in /home/app because of WORKDIR
RUN npm install

# no need for /home/app/server.js because of WORKDIR
CMD ["node", "server.js"]

RUN apt-get update && apt-get install -y apt-transport-https \ 
ca-certificates curl gnupg2 \ software-properties-common

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

RUN add-apt-repository \ 
"deb [arch=amd64] https://download.docker.com/linux/debian \ $(lsb_release -cs) stable"
RUN apt-get update && apt-get install -y docker-ce-cli

USER Jenkins
RUN Jenkins-plugin-sli

