FROM node:20
WORKDIR /opt/server     # it creates this directory and automatically moves to that path. no need to do cd.
COPY package.json .
COPY *.js .
RUN npm install
ENV MONGO="TRUE" \
    MONGO_URL="mongodb://mongodb:27017/catalogue"
CMD ["node", "server.js"] # to start the container