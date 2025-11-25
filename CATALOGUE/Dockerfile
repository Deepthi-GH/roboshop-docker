FROM node:20.19.5-alpine3.22 as build 
WORKDIR /opt/server    
COPY package.json .
COPY *.js .
# this may add extra cache memory
RUN npm install 


FROM node:20.19.5-alpine3.22
WORKDIR /opt/server 
copy --from=build /opt/server /opt/server
ENV MONGO="TRUE" \
    MONGO_URL="mongodb://mongodb:27017/catalogue"
 # to start the container    
CMD ["node", "server.js"]

# FROM node:20
#  # it creates this directory and automatically moves to that path. no need to do cd.
# WORKDIR /opt/server    
# COPY package.json .
# COPY *.js .
# RUN npm install
# ENV MONGO="TRUE" \
#     MONGO_URL="mongodb://mongodb:27017/catalogue"
#  # to start the container    
# CMD ["node", "server.js"]